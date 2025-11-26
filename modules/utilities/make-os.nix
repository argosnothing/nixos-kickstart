{
  inputs,
  config,
  lib,
  ...
}: let
  mkNixos = system: cls: name:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        config.flake.modules.nixos.base
        config.flake.modules.nixos.${cls}
        config.flake.modules.nixos.${name}
        {
          my.hostname = name;
          networking.hostName = lib.mkDefault name;
          nixpkgs.hostPlatform = lib.mkDefault system;
          nixpkgs.config = {
            allowUnfree = true;
            showAliases = true;
          };
          system.stateVersion = "25.05";
        }
      ];
    };

  mkIso = system: cls: name:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
        config.flake.modules.nixos.base
        config.flake.modules.nixos.iso
        config.flake.modules.nixos.${cls}
        config.flake.modules.nixos.${name}
        {
          my.hostname = name;
          networking.hostName = lib.mkDefault name;
          nixpkgs.hostPlatform = lib.mkDefault system;
          nixpkgs.config = {
            allowUnfree = true;
            showAliases = true;
          };
          isoImage.squashfsCompression = "gzip -Xcompression-level 1";
        }
      ];
    };

  linux = mkNixos "x86_64-linux" "nixos";
  isoLinux = mkIso "x86_64-linux" "nixos";
in {
  flake.lib.mk-os = {
    inherit mkNixos mkIso;
    inherit linux isoLinux;
  };
}

{
  inputs,
  config,
  lib,
  ...
}: let
  inherit (config) flake;
  mkNixos = system: host:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        flake.modules.nixos.base
        flake.modules.nixos.${host}
        {
          my.hostname = host;
          networking.hostName = lib.mkDefault host;
          nixpkgs.hostPlatform = lib.mkDefault system;
          nixpkgs.config = {
            allowUnfree = true;
            showAliases = true;
          };
          system.stateVersion = "25.05";
        }
      ];
    };

  mkIso = system:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
        flake.modules.nixos.base
        flake.modules.nixos.iso
        flake.modules.nixos.kickstart
        {
          my.hostname = "kickstart";
          networking.hostName = lib.mkDefault "kickstart";
          nixpkgs.hostPlatform = lib.mkDefault system;
          nixpkgs.config = {
            allowUnfree = true;
            showAliases = true;
          };
          isoImage.squashfsCompression = "gzip -Xcompression-level 1";
        }
      ];
    };

  linux = mkNixos "x86_64-linux";
  isoLinux = mkIso "x86_64-linux";
in {
  flake.lib.mk-os = {
    inherit mkNixos mkIso;
    inherit linux isoLinux;
  };
}

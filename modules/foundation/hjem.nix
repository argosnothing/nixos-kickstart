{
  inputs,
  config,
  lib,
  ...
}: let
  inherit (config) flake;
in {
  flake.modules.nixos.base = {pkgs, ...}: {
    imports = [
      inputs.hjem.nixosModules.default
      (lib.mkAliasOptionModule ["hj"] ["hjem" "users" flake.settings.username])
    ];
    hjem.linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
    hj = {
      enable = true;
      user = flake.settings.username;
      directory = "/home/${flake.settings.username}";
    };
  };
}

{config, ...}: let
  inherit (config.flake.lib.mk-os) isoLinux;
  isoSystem = isoLinux "nixos";
in {
  flake.packages.x86_64-linux.iso = isoSystem.config.system.build.isoImage;
}

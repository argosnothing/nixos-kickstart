{config, ...}: let
  inherit (config.flake.lib.mk-os) isoLinux;
in {
  flake.packages.x86_64-linux.iso = isoLinux.config.system.build.isoImage;
  flake.modules.nixos.iso = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.gh
      pkgs.tmux
      pkgs.vim
      (pkgs.writeScriptBin "kickstart" (builtins.readFile ../kickstart.sh))
    ];
  };
}

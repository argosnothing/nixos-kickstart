{config, ...}: let
  inherit (config.flake.lib.mk-os) isoLinux;
  isoSystem = isoLinux "nixos";
in {
  flake.packages.x86_64-linux.iso = isoSystem.config.system.build.isoImage;

  flake.modules.nixos.iso = {pkgs, ...}: {
    environment.systemPackages = [
      gh
      tmux
      vim
      (pkgs.writeScriptBin "nixos-kickstart-install" (builtins.readFile ../install.sh))
    ];
  };
}

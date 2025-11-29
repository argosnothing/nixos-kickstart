{config, ...}: let
  inherit (config) flake;
in {
  flake = {
    modules = {
      nixos = {pkgs, ...}:{
        ## replace starter with your hostname
        starter = {
          imports = with flake.modules.nixos; [
            grub # or uefi
            xfce
          ];
          environment.systemPackages = with pkgs; [
            firefox
          ];
        };
        vm = {
          my.host.is-vm = true;
          imports = with flake.modules.nixos; [nixos];
        };

        # This is the iso
        kickstart = {
        };
      };
    };
  };
}

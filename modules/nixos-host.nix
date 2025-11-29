{config, ...}: let
  inherit (config) flake;
in {
  flake = {
    modules = {
      nixos = {
        ## replace starter with your hostname
        starter = {pkgs, ...}: {
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
          # 
          imports = with flake.modules.nixos; [starter];
        };

        # This is the iso
        kickstart = {
        };
      };
    };
  };
}

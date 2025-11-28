{config, ...}: let
  inherit (config) flake;
in {
  flake = {
    modules = {
      nixos = {
        nixos = {
          imports = with flake.modules.nixos; [
            grub # or uefi
            xfce
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

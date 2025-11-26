{config, ...}: let
  inherit (config.flake.lib.mk-os) linux;
in {
  flake.nixosConfigurations = {
    # host  arch  host
    nixos = linux "nixos";
  };
}

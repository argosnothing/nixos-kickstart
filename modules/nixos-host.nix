{config, ...}: let
  inherit (config) flake;
in {
  # a host is just another module, only difference is
  # is that it is the module that acts as the entry point
  # and how you differentiate computers.
  # If you want a module under all hosts, you can do things in
  # flake.modules.nixos.base = {} and that'll get ran for every host
  # this example is for nixos, defined here as the last property below.
  flake.modules.nixos.nixos = {
    imports = with config.flake.modules.nixos; [
      base
      # Choose `grub` or `uefi` module for firmware
      xfce # Here is a simple module to get you started with making your own!
    ];
  };
}

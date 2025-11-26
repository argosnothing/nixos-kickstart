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
    # You can also do any system-level configuration in here if you don't want to rely on modules

    imports = with flake.modules.nixos; [
      # In here add other modules you've created under flake.modules.nixos.modulename as `modulename`
      # Choose `grub` or `uefi` module for firmware
      # grub
      xfce # Here is a simple module to get you started with making your own!
    ];
  };
  flake.modules.nixos.vm = {config, ...}: let
    inherit (config.my) host;
  in {
    my.host.is-vm = true;
    # for now just do whatever the base host does
    imports = with flake.modules.nixos; [nixos];
  };
}

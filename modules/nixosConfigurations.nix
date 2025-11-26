{config, ...}: let
  inherit (config.flake.lib.mk-os) linux;
in {
  flake.nixosConfigurations = {
    # first word is the actual property name in nixosConfigurations, linux is simply a function that takes in
    # a module name (in this case nixos) and returns a configured nixos system based on the name.
    # for this example look at nixos-host.nix to see what this actually imports, and how to import
    # your own stuff.
    # `utilities/make-os.nix` includes the boilerplate for things like package creation, base module, etc.
    # You should need to edit `make-os.nix` but it could give you better context if you stumble somewhere
    nixos = linux "nixos";
    vm = linux "vm";
  };
}

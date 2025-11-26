{lib, ...}: {
  # This will let you add new attributes that you can stuff with functions for stuff like utilities.
  # Take a look at make-os.nix if you want to see an example.
  options.flake.lib = lib.mkOption {
    type = lib.types.attrsOf lib.types.unspecified;
    default = {};
  };
}

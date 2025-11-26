{lib, ...}: let
  inherit (lib) mkOption;
  inherit (lib.types) str;
in {
  flake.modules.nixos.base = {
    options.my = {
      hostname = mkOption {type = str;};
    };
  };
}

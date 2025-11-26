{lib, ...}: let
  inherit (lib) mkOption;
  inherit (lib.types) str;
in {
  flake.modules.nixos.base = {
    hostname = mkOption {type = str;};
  };
}

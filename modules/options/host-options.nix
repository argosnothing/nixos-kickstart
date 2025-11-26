{lib, ...}: let
  inherit (lib) mkOption;
  inherit (lib.types) str mkDefaultOption;
in {
  flake.modules.nixos.base = {
    options.my = {
      hostname = mkOption {type = str;};
    };
    options.my.host.is-vm = mkDefaultOption "Used for zfs dev node selection";
  };
}

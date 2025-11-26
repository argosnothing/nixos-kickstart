{lib, ...}: let
  inherit (lib) mkOption mkEnableOption;
  inherit (lib.types) str;
in {
  flake.modules.nixos.base = {
    options.my = {
      hostname = mkOption {type = str;};
    };
    options.my.host.is-vm = mkEnableOption "Used for zfs dev node selection";
  };
}

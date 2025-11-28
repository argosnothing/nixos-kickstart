{
  lib,
  config,
  ...
}: let
  inherit (config) flake;
  inherit (lib) mkOption;
  inherit (lib.types) str;
in {
  # These are flake level options that NEED to be set by either a preset or a host.
  options.flake.settings = {
    username = mkOption {
      description = "It's me!";
      type = str;
    };
    flakedir = mkOption {
      description = "Absolute path to where flake is, don't change.";
      type = str;
      default = "/home/${config.flake.settings.username}/${flake.settings.configname}";
    };
    networking.hostId = mkOption {
      description = "Host Id";
      type = str;
      default = "AB12CD34";
    };
  };
}

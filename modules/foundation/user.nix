{config, ...}: let
  inherit (config.flake.settings) username;
in {
  flake.modules.nixos = {
    user = {
      lib,
      pkgs,
      ...
    }: let
      inherit (lib) types mkOption;
      inherit (types) str;
    in {
      options.user = {
        name = mkOption {
          type = str;
          default = username;
        };
      };
      config = {
        programs.fish.enable = true;
        users = {
          users.${username} = {
            isNormalUser = true;
            extraGroups = ["networkmanager" "wheel" "input" "plugdev" "dialout" "seat"];
          };
          defaultUserShell = pkgs.bash;
        };
      };
    };
  };
}

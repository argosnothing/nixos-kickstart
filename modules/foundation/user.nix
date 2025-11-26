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
          # It's up to you to figure out how you want to secure your system
          # For now, enjoy. 
          mutableUsers = false;
          root.initialPassword = "password";
          users.${username} = {
            initialPassword = "password";
            isNormalUser = true;
            extraGroups = ["networkmanager" "wheel" "input" "plugdev" "dialout" "seat"];
          };
          defaultUserShell = pkgs.bash;
        };
      };
    };
  };
}

{config, ...}: let
  inherit (config.flake.settings) username;
in {
  flake.modules.nixos.base = {
    pkgs,
    lib,
    ...
  }: let
    inherit (lib) filter hasInfix mkForce mkMerge mkOption;
  in {
    # https://github.com/iynaix/dotfiles/blob/978cc85a40fc298ac9163d893a4cf37725bf45de/modules/users.nix#L4
    # silence warning about setting multiple user password options
    # https://github.com/NixOS/nixpkgs/pull/287506#issuecomment-1950958990
    options = {
      warnings = mkOption {
        apply = filter (w: !(hasInfix "If multiple of these password options are set at the same time" w));
      };
    };
    config = {
      programs.fish.enable = true;
      users = {
        # It's up to you to figure out how you want to secure your system
        # For now, enjoy.
        mutableUsers = false;
        users.root.initialPassword = "password";
        users.${username} = {
          group = "users";
          initialPassword = "password";
          isNormalUser = true;
          extraGroups = ["networkmanager" "wheel" "input" "plugdev" "dialout" "seat"];
        };
        defaultUserShell = pkgs.bash;
      };
    };
  };
}

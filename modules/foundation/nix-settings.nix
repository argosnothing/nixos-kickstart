{inputs, ...}: {
  flake.modules.nixos.critical = {pkgs, ...}: {
    nix = {
      settings = {
        trusted-users = ["root" "@wheel"];
        experimental-features = ["nix-command" "pipe-operators" "flakes"];
        download-buffer-size = 268435456;
        substituters = [
          "https://cache.nixos.org/"
        ];
        trusted-public-keys = [
        ];
      };
      package = pkgs.nixVersions.latest;
      nixPath = ["nixpkgs=${inputs.nixpkgs}"];
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
  };
}

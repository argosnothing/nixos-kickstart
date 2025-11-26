{
  description = "KICKSTART!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    hjem = {
      url = "github:/feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree = {
      url = "github:vic/import-tree";
    };
    oxwm = {
      url = "github:tonybanters/oxwm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;}
    (inputs.import-tree ./modules);
}

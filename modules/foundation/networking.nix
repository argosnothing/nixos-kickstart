{
  flake.modules.nixos.base = {
    networking = {
      networkmanager.enable = true;
      wireless.enable = true;
    };
  };
}

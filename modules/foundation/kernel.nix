{
  flake.modules.nixos.base = {pkgs, ...}: {
    hardware = {
      enableAllFirmware = true;
      firmware = [pkgs.linux-firmware];
    };
  };
}

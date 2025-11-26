{
  flake.modules.nixos.xfce = {
    services.xserver = {
      enable = true;
      displayManager = {
        lightdm.enable = true;
        defaultSession = "xfce";
      };
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
    };
  };
}

{
  flake.modules.nixos.xfce = {pkgs, ...}: {
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

    fonts = {
      packages = with pkgs; [
        pkgs.cascadia-code
        pkgs.google-fonts
        nerd-fonts.noto
        nerd-fonts.symbols-only
        font-awesome
      ];
      fontconfig = {
        defaultFonts = {
          serif = ["Alegreya Serif"];
          sansSerif = ["Noto Serif"];
          monospace = ["Cascadia Code"];
        };
      };
    };
  };
}

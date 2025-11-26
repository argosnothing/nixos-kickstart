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
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        liberation_ttf
        dejavu_fonts
      ];
      fontconfig = {
        defaultFonts = {
          serif = ["Noto Serif"];
          sansSerif = ["Noto Sans"];
          monospace = ["DejaVu Sans Mono"];
        };
      };
    };
  };
}

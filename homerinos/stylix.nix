{pkgs, ...}: let
  getTheme = name: "${pkgs.base16-schemes}/share/themes/${name}.yaml";
in {
  stylix = rec {
    #theme
    enable = true;
    base16Scheme = getTheme "darcula";
    polarity = "dark";

    # pape
    image = ../wallpapers/imagem2.jpg;
    #fonts
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.caskaydia-cove;
        name = "CaskaydiaCove Nerd Font";
      };
      sansSerif = fonts.monospace;
    };
    cursor = {
      package = pkgs.banana-cursor;
      name = "Banana";
      size = 24;
    };
    #icons
    icons = {
      enable = false;
    };

    #
    targets = {
      rofi.enable = false;
      kde.enable = true;
      gtk.enable = false;
      qt.enable = false;
      zen-browser.enable = false;
      sway.enable = true;
    };
  };
}

{pkgs, ...}: let
  getTheme = name: "${pkgs.base16-schemes}/share/themes/${name}.yaml";
in {
  stylix = rec {
    #theme
    enable = true;
    base16Scheme = getTheme "darcula";
    polarity = "dark";

    # pape
    image = ../wallpapers/imagem3.png;
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
      kde.enable = true;
      gtk.enable = false;
      qt.enable = false;
      zen-browser.enable = false;
      sway.enable = true;
    };
  };
}

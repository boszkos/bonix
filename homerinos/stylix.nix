{pkgs, ...}: let
  getTheme = name: "${pkgs.base16-schemes}/share/themes/${name}.yaml";
in {
  stylix = rec {
    #theme
    enable = true;
    # base16Scheme = getTheme "darcula";
    base16Scheme = {
      base00 = "322d29";
      base01 = "3f3a37";
      base02 = "5b534d";
      base03 = "6a5f58";
      base04 = "796b63";
      base05 = "b5a9a1";
      base06 = "dfb99f";
      base07 = "fff3eb";
      base08 = "816d5f";
      base09 = "e6b84d";
      base0A = "fcc440";
      base0B = "d9b154";
      base0C = "967e6e";
      base0D = "88786d";
      base0E = "cda956";
      base0F = "9c8349";
    };
    polarity = "dark";

    # pape
    image = ../wallpapers/imagem4-luna.jpg;
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

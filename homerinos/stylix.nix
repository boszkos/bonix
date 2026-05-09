{pkgs, ...}: let
  getTheme = name: "${pkgs.base16-schemes}/share/themes/${name}.yaml";
in {
  stylix = rec {
    #theme
    enable = true;
    base16Scheme = getTheme "ayu-dark";
    polarity = "dark";
    #fonts
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.caskaydia-cove;
        name = "CaskaydiaCove Nerd Font";
      };
      sansSerif = fonts.monospace;
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    #icons
    # icons = {
    #   enable = true;
    # package = pkgs.breeze-icons;
    # dark = "Breeze-Dark";
    # light = "Breeze-Light";
    # };

    #
    targets = {
      # kde.decorationTheme = "kwin4_decoration_qml_plastik";
      kde.enable = false;
      # gtk.extraCss = "* { border-radius: 0px; }";
      gtk.enable = false;
    };
  };
}

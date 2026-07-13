{pkgs, ...}: let
  getTheme = name: "${pkgs.base16-schemes}/share/themes/${name}.yaml";
in {
  stylix = rec {
    #theme
    enable = true;
    base16Scheme = getTheme "chalk";
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
    icons = {
      enable = false;
    };

    #
    targets = {
      kde.enable = true;
      gtk.enable = false;
      qt.enable = false;
    };
  };
}

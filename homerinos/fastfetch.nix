{pkgs, ...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "NixOS2";
        padding = {
          "left" = 2;
          "right" = 2;
        };
        color = {
          "1" = "yellow";
          "2" = "white";
        };
      };
      display = {
        separator = "-";
      };
      modules = [
        "title"
        "separator"
        "os"
        "break"
        "kernel"
        "break"
        "shell"
        "break"
        "wm"
        "break"
        "font"
        "break"
        "terminal"
        "break"
        "colors"
      ];
    };
  };
}

{pkgs, ...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "NixOS2";
      };
      display = {
        separator = "";
      };
      modules = [
        "title"
        "separator"
        "os"
        "kernel"
        "shell"
        "de"
        "wm"
        "font"
        "terminal"
        "colors"
      ];
    };
  };
}

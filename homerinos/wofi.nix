{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.wofi = {
    enable = true;
    settings = {
      width = 500;
      height = 600;
      location = "center";
      show = "drun";
      allow_images = true;
    };
  };
}

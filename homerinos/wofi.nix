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
      height = 300;
      location = "center";
      show = "drun";
      prompt = "Run:";
      filter_rate = 100;
      allow_images = true;
    };
  };
}

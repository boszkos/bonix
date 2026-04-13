{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "ao";
      editor = {
        line-number = "relative";
        soft-wrap.enable = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.alejandra}/bin/alejandra";
      }
    ];
  };
}

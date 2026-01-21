{
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "ao";
      editor = {
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        line-number = "relative";
      };
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
        }
      ];
    };
  };
}

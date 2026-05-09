{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.helix = {
    enable = true;
    settings = {
      #magia do márcio para abrir yazi no helix
      keys.normal = {
        space.e = let
          unique-file = "/tmp/unique-file";
        in [
          ":sh rm -f ${unique-file}"
          ":insert-output yazi \"%{buffer_name}\" --chooser-file=${unique-file}"
          ":sh printf \"\\x1b[?1049h\\x1b[?2004h\" > /dev/tty"
          ":open %sh{cat ${unique-file}}"
          ":redraw"
          ":set-option mouse false"
          ":set-option mouse true"
        ];
      };
      # theme = "ao";
      editor = {
        bufferline = "multiple";
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

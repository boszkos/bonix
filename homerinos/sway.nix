{
  pkgs,
  config,
  lib,
  ...
}: {
  #iniciar modulo!!
  home.sessionVariables = {
    SWAY_UNSUPPORTED_GPU = "1";
  };

  #habilitar sway
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps

    # configuração (~/.config/sway)
    config = rec {
      modifier = "Mod4";

      #input de teclado
      input = {
        "*" = {
          xkb_layout = "br";
          xkb_variant = "abnt2";
        };
      };

      # tela
      output = {
        "DP-1" = {
          mode = "1920x1080@165hz";
        };
      };

      # Use kitty as default terminal
      terminal = "kitty";

      #startup applications
      startup = [
        {command = "discord";}
        {command = "beta-zen";}
        {command = "steam";}
      ];

      #barra
      bars = [
        {
          workspaceNumbers = false;
          workspaceButtons = false;
        }
      ];

      # Configuração Keys
      keybindings = lib.mkOptionDefault {
        "${modifier}+Shift+m" = "reload";
        "${modifier}+Shift+k" = "kill";
        "${modifier}+Q" = "exec kitty"; #non declarativo! se trocar o terminal fica como? faz o L
      };
    };
  };
}

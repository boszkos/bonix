{
  pkgs,
  config,
  lib,
  ...
}: let
  wallpaper = ../wallpapers/imagem2.jpg;
in {
  #iniciar modulo!!!
  imports = [
    ./wofi.nix
  ];
  #habilitar sway
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    # configuração (~/.config/sway)
    config = rec {
      modifier = "Mod4";

      # border edge color sla o noem (i couldnt figure out how to get this to work myself by looking at config for sway so i asked ai awa ;w; sorryyyy)
      colors = lib.mkForce {
        focused = {
          border = "#D28E3D";
          background = "#D28E3D";
          text = "#FFFFFF";
          indicator = "#D24B4B";
          childBorder = "#D28E3D";
        };
        focusedInactive = {
          border = "#504945";
          background = "#504945";
          text = "#888888";
          indicator = "#504945";
          childBorder = "#504945";
        };
        unfocused = {
          border = "#504945";
          background = "#504945";
          text = "#888888";
          indicator = "#504945";
          childBorder = "#504945";
        };
        urgent = {
          border = "#D24B4B";
          background = "#151515";
          text = "#FFFFFF";
          indicator = "#D28E3D";
          childBorder = "#D24B4B";
        };
        placeholder = {
          border = "#504945";
          background = "#504945";
          text = "#888888";
          indicator = "#504945";
          childBorder = "#504945";
        };
        background = "#151515";
      };

      #input de teclado e mouse!
      input = {
        "*" = {
          xkb_layout = "br";
          xkb_variant = "abnt2";
          accel_profile = "adaptive";
          pointer_accel = "0.5";
        };
      };

      # tela
      output = {
        "DP-1" = {
          mode = "1920x1080@165hz";
        };
      };

      gaps = {
        inner = 4;
        outer = 4;
      };
      # Use kitty as default terminal
      terminal = "kitty";

      #startup applications
      startup = [
        {command = "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP";} #sugestão ia pra reslver stream
        {command = "${pkgs.swaybg}/bin/swaybg -i ${wallpaper} -m fill";}
        {command = "sleep 2 && discord";}
        {command = "sleep 6 && beta-zen";}
        {command = "sleep 4 && steam";}
        {command = "waybar";}
      ];

      #barra
      bars = [];

      # Configuração Keys
      keybindings = lib.mkOptionDefault {
        "${modifier}+Shift+m" = "reload";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+q" = "exec ${terminal}"; #non declarativo! se trocar o terminal fica como? faz o L
        "${modifier}+p" = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | ${pkgs.wl-clipboard}/bin/wl-copy"; #this sounds complicated! não sei porque mas o código do márcio nao funcionou ent acabei pedindo pra ia fazer. não sei se tem um método mais fácil do que abrir uma shell dentro pra fazer isso.
        "${modifier}+d" = "exec wofi --show drun";
      };
    };
  };
}

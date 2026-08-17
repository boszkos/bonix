{
  pkgs,
  config,
  lib,
  ...
}: let
  wallpaper = ../wallpapers/imagem1.jpg;
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
        inner = 2;
        outer = 2;
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

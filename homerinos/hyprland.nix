{
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    package = null;
    portalPackage = null;
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind =
        [
          "$mod, F, exec, firefox"
          "Print, exec, grimblast copy area"
          "$mod, D, exec, wofi"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (
              i: let
                ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
      exec-once = [
        "waybar"
      ];
      monitor = [
        "DP-1, 1920x1080@165, 0x0, 1"
      ];
      input = {
        kb_layout = "br";
      };
    };
  };
}

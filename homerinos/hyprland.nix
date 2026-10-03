{..., lib, config}:{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      
      inputs = {
        kb_layout = "br";
      };

      monitor = [
        "eDP-1, 1920x1080@165, 0x0, 1"
      ];

      
      general = {
        gaps_in = 3;
        gaps_out = 3;
        border_size = 0;
        layout = "dwindle";
      };

      env = [
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
      ];
      
      decoration = {
        rounding = 0;
        blur.enabled = "true";
      };

      animations.enabled = "yes";
     
      exec-once = [
        "waybar"
        "bash -c 'dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP && systemctl --user restart xdg-desktop-portal.service'"
        "systemctl --user start hyprpolkitagent"
      ];
    };
  };
}

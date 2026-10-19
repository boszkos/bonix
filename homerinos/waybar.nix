{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      main = {
        layer = "top";
        position = "top";
        height = 35;
        fixed-center = true;
        spacing = 10;
        modules-left = [
          "custom/menu"
          "sway/workspaces"
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "tray"
          "network"
          "pulseaudio"
        ];

        "custom/menu" = {
          format = "󱄅";
          on-click = "wofi";
          tooltip = false;
        };

        "sway/workspaces" = {
          disable-scroll = true;
          format = "{name}";
        };

        "clock" = {
          interval = 1;
          format = "{:%A, %d %b %H:%M:%S}";
        };

        "tray" = {
          icon-size = 21;
          spacing = 10;
        };

        "network" = {
          format-wifi = "  {essid} ({signalValue}%)";
          format-ethernet = "  Connected";
          format-linked = "  {ifname} (No IP)";
          format-disconnected = "  Disconnected";
          tooltip-format = "{ifname} via {gwaddr}";
        };

        "pulseaudio" = {
          format = "{volume}% {icon}";
          format-muted = "Muted";
          format-icons = {
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: CaskaydiaCove Nerd Font;
        color: white;
      }
      #custom-menu {
      font-size: 30px;
      padding-left: 10px;
      padding-right: 12px;
      }
    '';
  };
}

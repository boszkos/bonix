{
  lib,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    extraConfig = ''
      local terminal    = "kitty"
      local fileManager = "dolphin"
      local menu        = "wofi"
      local mainMod = "SUPER"

      hl.monitor({
        output = "",
        mode = " preferred ",
        position = " auto ",
        scale = 1.07,
      })

      hl.input({
        kb_layout = " br ",
        kb_variant = " abnt2 ",
      })

      hl.on("hyprland.start", function ()
        hl.exec_cmd(hyprpaper)
        hl.exec_cmd(waybar)
        hl.exec_cmd()
      end)

      hl.config ({
        general = {
          gaps_out = 10,
          gaps_in = 5,
          border_size = 1,
          col = {
            active_border = "rgba(aaaaaaaa)",
            inactive_border = "rgba(676767aa)",
          },
        },
      })
    '';
  };
}

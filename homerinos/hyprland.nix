{
  lib,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    # usar o hyprland/portal do modulo NixOS (flake), não um segundo do nixpkgs
    package = null;
    portalPackage = null;
    configType = "lua";

    extraConfig = ''
      -- DEFAULTS --
      local terminal    = "kitty"
      local fileManager = "dolphin"
      local menu        = "wofi"
      local mainMod     = "SUPER"

      -- MONITOR --
      hl.monitor({
        output = "",
        mode = "1920x1080@165",
        position = "auto",
        scale = 1,
      })

      -- AUTOSTART --
      hl.on("hyprland.start", function ()
        hl.exec_cmd("hyprpaper")
        hl.exec_cmd("waybar")
        hl.exec_cmd("systemctl --user start hyprpolkitagent")
      end)

      -- CONFIG GERAL --
      hl.config({
        input = {
          kb_layout = "br",
          kb_variant = "abnt2",
        },
        general = {
          gaps_out = 10,
          gaps_in = 5,
          border_size = 1,

          -- CORES --
          ["col.active_border"] = "rgba(aaaaaaaa)",
          ["col.inactive_border"] = "rgba(676767aa)",

          resize_on_border = false,
          allow_tearing = true,
          layout = "dwindle",
        },

        -- DECORAÇÃO --
        decoration = {
          rounding = 0,

          active_opacity = 1.0,
          inactive_opacity = 0.75,

          shadow = {
            enabled = false
          },
          blur = {
            enabled = false,
          },
        },

        -- ANIMAÇÃO --
        animations = {
          enabled = true,
        },

        -- LAYOUTS & MISC CONFIGS --
        dwindle = {
          preserve_split = true,
        },
        master = {
          new_status = "master",
        },
        misc = {
          force_default_wallpaper = -1,
          disable_hyprland_logo   = false,
        },
        render = {
          direct_scanout = 2, -- só pra jogos fullscreen
        },
      })

      -- CURVES & ANIMATIONS SETUP (Wiki-verified schema) --
      hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
      hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
      hl.curve("linear",         { type = "bezier", points = { {0, 0},        {1, 1}       } })
      hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},    {0.75, 1}    } })
      hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
      hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, damping = 24.21279333 })

      hl.animation({ leaf = "global",        enabled = true,  speed = 10,    bezier = "linear" })
      hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
      hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
      hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",     style = "popin 87%" })
      hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",     style = "popin 87%" })
      hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
      hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
      hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
      hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
      hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
      hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
      hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
      hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
      hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
      hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
      hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
      hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


      ---------------------
      ---- KEYBINDINGS ----
      ---------------------

      hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
      hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
      hl.bind(mainMod .. " + SHIFT + M", function()
        hl.dispatch(hl.dsp.exit())
      end)
      hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
      hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
      hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
      hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

      -- Move focus with mainMod + arrow keys
      hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
      hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
      hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
      hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

      -- I DID THIS
      hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left"}))
      hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right"}))
      hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up"}))
      hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down"}))
      hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
      hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
      hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())


      -- Switch workspaces with mainMod + [0-9]
      for i = 1, 10 do
          local key = i % 10
          hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
          hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
      end

      -- Example special workspace (scratchpad)
      -- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
      -- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

      -- Scroll through existing workspaces with mainMod + scroll
      hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
      hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

      -- Move/resize windows with mainMod + LMB/RMB and dragging
      hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),    { mouse = true })
      hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

      -- Laptop multimedia keys
      hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
      hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
      hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),      { locked = true, repeating = true })
      hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
      hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
      hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

      hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),        { locked = true })
      hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
      hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
      hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),    { locked = true })


      --------------------------------
      ---- WINDOWS AND WORKSPACES ----
      --------------------------------

      hl.window_rule({
          name  = "suppress-maximize-events",
          match = { class = ".*" },
          suppress_event = "maximize",
      })

      hl.window_rule({
          name  = "fix-xwayland-drags",
          match = {
              class     = "^$",
              title     = "^$",
              xwayland   = true,
              float     = true,
              fullscreen = false,
              pin       = false,
          },
          no_focus = true,
      })

      hl.window_rule({
          name  = "move-hyprland-run",
          match = { class = "hyprland-run" },
          move  = "20 monitor_h-120",
          float = true,
      })
    '';
  };
}

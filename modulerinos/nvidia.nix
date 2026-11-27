{config, ...}: {
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true; # recomendado pela NVIDIA pra Turing+ (3070 Ti)
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  environment.sessionVariables = {
    GBM_BACKEND = "nvidia-drm"; # Required for GPU acceleration
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };

  # não deixar o hyprland segurar VRAM que devia ir pros jogos
  environment.etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json".text = builtins.toJSON {
    rules = [
      {
        pattern = {
          feature = "procname";
          matches = "Hyprland";
        };
        profile = "Limit Free Buffer Pool On Wayland Compositors";
      }
    ];
    profiles = [
      {
        name = "Limit Free Buffer Pool On Wayland Compositors";
        settings = [
          {
            key = "GLVidHeapReuseRatio";
            value = 0;
          }
        ];
      }
    ];
  };
}

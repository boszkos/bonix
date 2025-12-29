{config, pkgs, lib, ...}: 
{
	hardware.graphics = {
		enable = true;
		extraPackages = with pkgs; [
			libvdpau-va-gl
		];
	};
	services.xserver.videoDrivers = ["nvidia"];
	hardware.nvidia = {
		powerManagement.enable = false;
		powerManagement.finegrained = false;
		open = false;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
	};
	environment.sessionVariables = {
	GBM_BACKEND = "nvidia-drm"; # Required for GPU acceleration
   	LBVA_DRIVER_NAME = "nvidia";
   	__GLX_VENDOR_LIBRARY_NAME = "nvidia";
  	VDPAU_DRIVER = "va_gl";
	};
}

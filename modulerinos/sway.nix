{
  pkgs,
  lib,
  config,
  ...
}: {
  #this is all following the nixos wiki! i don't know what im doing!
  environment.systemPackages = with pkgs; [
    wl-clipboard
    mako
  ];
  #no clue what his is
  services.gnome.gnome-keyring.enable = true;
  #enables sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [swaybg brightnessctl grim pulseaudio swayidle swaylock wmenu];
    extraOptions = [
      "--unsupported-gpu"
    ];
    extraSessionCommands = ''
      export SWAY_UNSUPPORTED_GPU=1
      export XDG_CURRENT_DESKTOP=sway
      export XDG_SESSION_TYPE=wayland'';
  };
}

{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  home.username = "boszko";
  home.homeDirectory = "/home/boszko";
  home.stateVersion = "25.11";

  imports = [
    ./homerinos/nixcord.nix
    ./homerinos/githuberinos.nix
    ./homerinos/kitty.nix
    ./homerinos/fish.nix
    ./homerinos/helix.nix
    ./homerinos/wofi.nix
    ./homerinos/waybar.nix
    ./homerinos/hyprland.nix
    ./homerinos/stylix.nix
  ];

  home.packages = with pkgs; [
    calibre
    fastfetch
    vlc
    obsidian
    btop
    gimp
    tidal-hifi
    cbonsai
    libreoffice-qt
    shotcut
    pomodoro
    neo
    ace-of-penguins #solitaire
    rar
    gpu-screen-recorder-gtk
    prismlauncher #minecraft
    grimblast
    element-desktop
    krita
  ];
  #enable zen
  programs.zen-browser.enable = true;
}

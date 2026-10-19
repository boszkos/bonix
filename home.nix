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
    ./homerinos/stylix.nix
    ./homerinos/hyprland.nix
    ./homerinos/waybar.nix
    ./homerinos/wofi.nix
  ];

  home.packages = with pkgs; [
    yazi #idk margic
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
    prismlauncher #minecraft
    element-desktop
    kdePackages.kolourpaint
    wl-clicker
    r2modman #gerenciador de mods
    protontricks

    #screenshjot on hypr
    wl-clipboard
    grim
    slurp
  ];
  #enable zen
  programs.zen-browser.enable = true;
}

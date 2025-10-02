{ config, pkgs, ... }:

{
  home.username = "boszko";
  home.homeDirectory = "/home/boszko";
  home.stateVersion = "25.11";

  imports = [
    ./homerinos/nixcord.nix
    ./homerinos/githuberinos.nix
    ./homerinos/kitty.nix
    ./homerinos/fish.nix
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
   ace-of-penguins
   waybar
];


}

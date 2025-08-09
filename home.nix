{ config, pkgs, ... }:

{
  home.username = "boszko";
  home.homeDirectory = "/home/boszko";
  home.stateVersion = "25.11";

  imports = [
    ./homerinos/nixcord.nix
    ./homerinos/githuberinos.nix
  ];
   home.packages = with pkgs; [
   fastfetch
   ];
}

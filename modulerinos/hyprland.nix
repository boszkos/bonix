{
  pkgs,
  inputs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  hypr = inputs.hyprland.packages.${system};
  pkgs-hyprland = inputs.hyprland.inputs.nixpkgs.legacyPackages.${system};
in {
  # enable hyprland
  programs.hyprland = {
    enable = true;
    package = hypr.hyprland;
    portalPackage = hypr.xdg-desktop-portal-hyprland;
  };

  # cachix do hyprland
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # mesa igual ao do hyprland (senão dá lag em jogo)
  hardware.graphics = {
    package = pkgs-hyprland.mesa;
    package32 = pkgs-hyprland.pkgsi686Linux.mesa;
  };

  # seletor de arquivos
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  # qt no wayland
  environment.systemPackages = with pkgs; [
    kdePackages.qtwayland
    libsForQt5.qtwayland
  ];
}

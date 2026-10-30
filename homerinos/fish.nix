{pkgs, ...}: {
  home.packages = with pkgs; [
    fishPlugins.tide
  ];
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];
    interactiveShellInit = "
      fastfetch --logo NixOS2
      set -g tide_character_icon '$'
      set -g tide_character_vi_icon_default '$'
      ";

    shellAliases = {
      neofetch = "fastfetch";
      update = "nix flake update --flake /home/boszko/bonix /home/boszko/bonix/flake.nix && sudo nixos-rebuild switch --flake /home/boszko/bonix#boszko";
      hyprland = "start-hyprland";
      plasma = "startplasma-wayland";
      kde = "startplasma-wayland";
      "NOW!!!" = "now";
    };
  };
}

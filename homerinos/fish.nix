{pkgs, ...}: {
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];
    interactiveShellInit = ''
      fastfetch
      set -g tide_character_icon '$'
      set -g tide_character_vi_icon_default '$'
    '';

    shellAliases = {
      neofetch = "fastfetch";
      update = "nix flake update --flake /home/boszko/bonix && sudo nixos-rebuild switch --flake /home/boszko/bonix#boszko";
      hyprland = "start-hyprland";
      "NOW!!!" = "now";
    };
  };
}

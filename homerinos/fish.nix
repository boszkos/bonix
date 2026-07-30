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
      set -g tide_character_icon '$'
      set -g tide_character_vi_icon_default '$'
      ";
    shellAliases = {
      neofetch = "fastfetch";
      update = "sudo nix flake update /home/boszko/bonix && sudo nixos-rebuild switch --flake /home/boszko/bonix#boszko";
      "NOW!!!" = "now";
    };
  };
}

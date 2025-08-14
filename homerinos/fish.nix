{pkgs, ...} : {
home.packages = with pkgs; [
	fishPlugins.tide
];

  programs.fish.enable = true;
  shellAliases = {
      neofetch = "fastfetch";
  };
  plugins = [
  	{
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
	}
  ];
}

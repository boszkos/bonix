{pkgs, ...} : {
home.packages = with pkgs; [
	fishPlugins.tide
];
  programs.fish.enable = true;


  fish.plugins = [
  	{
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
	}
  ];

  shellAlises = {
  neofetch = "fastfetch";

  };
}

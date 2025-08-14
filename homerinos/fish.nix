{pkgs, ...} : {
home.manager = with pkgs; [
fishplugins.tide
];

home-manager.users.boszko = {
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
};
}

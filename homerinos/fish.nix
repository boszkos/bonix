{pkgs, ...} : {
home.manager = with pkgs; [
fishplugins.tide
];

home-manager.users.boszko = {
  programs.fish.enable = true;
  plugins = [
  	{
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
	}
  ];
};
}

{
  description = "A simple NixOS flake";
  inputs = {
    #Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # discord/nixcord
    nixcord.url = "github:kaylorben/nixcord";
    #hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    #stylix
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #zen-browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    zen-browser,
    hyprland,
    stylix,
    ...
  } @ inputs: {
    nixosConfigurations = {
      # ---- COMPUTADOR ---- #
      boszko = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          hyprland.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.boszko = import ./home.nix;
            home-manager.sharedModules = [
              inputs.nixcord.homeModules.nixcord
              stylix.homeModules.stylix
              zen-browser.homeModules.beta
            ];
          }
        ];
      };
    };
  };
}

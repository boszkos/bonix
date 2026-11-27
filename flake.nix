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
    #hyprland (sem follows, pra usar o cachix)
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
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = {
      # ---- COMPUTADOR ---- #
      boszko = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = {inherit inputs;};
              useGlobalPkgs = false; # stylix precisa de overlays próprios
              useUserPackages = true;
              backupFileExtension = "backup";
              users.boszko = import ./home.nix;
              sharedModules = [
                inputs.nixcord.homeModules.nixcord
                inputs.stylix.homeModules.stylix
                inputs.zen-browser.homeModules.beta
              ];
            };
          }
        ];
      };
    };
  };
}

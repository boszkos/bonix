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
    # discord
    nixcord.url = "github:kaylorben/nixcord";
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #hyprland
    hyprland.url = "github:hyprwm/Hyprland";

    #zen-browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      auto-cpufreq,
      zen-browser,
      hyprland,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        boszko = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            hyprland.nixosModules.default
            ./puter/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.boszko = import ./home.nix;
              home-manager.sharedModules = [
                inputs.nixcord.homeModules.nixcord
                zen-browser.homeModules.beta
              ];
            }
          ];
        };
        boszkotop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./plaptop/configuration.nix
            auto-cpufreq.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.boszko = import ./home.nix;
              home-manager.sharedModules = [
                inputs.nixcord.homeModules.nixcord
                zen-browser.homeModules.beta
              ];
            }
          ];
        };
      };
    };
}

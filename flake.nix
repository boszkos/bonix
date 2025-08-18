{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord.url = "github:kaylorben/nixcord";
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #hyprland
    inputs.hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, auto-cpufreq, ... }@inputs: {
    nixosConfigurations = {
      boszko = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./puter/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.boszko = import ./home.nix;
            home-manager.sharedModules = [
              inputs.nixcord.homeModules.nixcord
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
                  home-manager.extraSpecialArgs = {inherit inputs;};
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;

                  home-manager.users.boszko = import ./home.nix;
                  home-manager.sharedModules = [
                    inputs.nixcord.homeModules.nixcord
            ];
          }
        ];
      };
    };
  };
}

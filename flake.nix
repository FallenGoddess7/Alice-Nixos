#############################################################
#      _    _ _          _       _   _ _____  _____  ____   
#     / \  | (_) ___ ___( )___  | \ | |_ _\ \/ / _ \/ ___|  
#    / _ \ | | |/ __/ _ \// __| |  \| || | \  / | | \___ \
#   / ___ \| | | (_|  __/ \__ \ | |\  || | /  \ |_| |___) |
#  /_/   \_\_|_|\___\___| |___/ |_| \_|___/_/\_\___/|____/
#############################################################
{
  description = "Alice's System Configuration";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        wonderland = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            home-manager.nixosModules.home-manager
            ./system/wonderland/configuration.nix
          ];
        };
      };
    };
}

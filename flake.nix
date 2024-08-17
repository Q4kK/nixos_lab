{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let system = "x86_64-linux";

  in {
    nixosConfigurations.work = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./work/configuration.nix
      ];
    };
    nixosConfigurations.home = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./pers/configuration.nix
      ];
    };
  };
}

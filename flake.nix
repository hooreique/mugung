{
  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";
  inputs.determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
  inputs.determinate.inputs.nixpkgs.follows = "nixpkgs";
  inputs.lisle.url = "github:hooreique/lisle";
  outputs = inputs: {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        inputs.determinate.nixosModules.default
        inputs.lisle.nixosModules.default
        ./configuration.nix
      ];
    };
  };
}

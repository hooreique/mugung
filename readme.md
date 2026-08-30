## Install [Determinate Nix](https://docs.determinate.systems/guides/advanced-installation/#nixos) on NixOS

```shell
nix flake init --template "https://flakehub.com/f/DeterminateSystems/flake-templates/0#nixos"
```

```nix
{
  inputs.determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";

  outputs = { determinate, nixpkgs, ... }: {
    nixosConfigurations.my-workstation = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        determinate.nixosModules.default
      ];
    };
  };
}
```

```shell
sudo nixos-rebuild \
  --option extra-substituters https://install.determinate.systems \
  --option extra-trusted-public-keys cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM= \
  --flake ... \
  switch
```

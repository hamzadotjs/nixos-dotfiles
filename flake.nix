{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    helium.url = "github:FKouhai/helium2nix/main";
  };

  outputs = { self, nixpkgs, ... }@inputs: {  # ← inputs now exists
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };     # ← NOW works
      modules = [ ./configuration.nix ];
    };
  };
}


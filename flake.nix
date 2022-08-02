{
    description = "NixOS Flake Configuration for Workstations";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
    };

    outputs = { self, nixpkgs, home-manager, ...}@inputs:
      let
          system = "x86_64-linux";
          pkgs = inputs.nixpkgs.legacyPackges.${system};
      in
      {
          lib = import ./lib inputs;

          nixosConfigurations = import ./hosts inputs;

          #packages.${system} = import ./packages inputs;

          apps = inputs.nixinate.nixinate.${system} self;

          formatter.${system} = pkgs.nixpkgs-fmt;
      };
}


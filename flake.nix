{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    inputs@{
      self,
      flake-parts,
      nixpkgs,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      perSystem = _: {
        packages = {
          testing = self.lib.digitalBrewStudios;
          generated-members = builtins.toFile "generated-members.json" (
            builtins.toJSON self.lib.digitalBrewStudios.members
          );
          generated-teams = builtins.toFile "generated-teams.json" (
            builtins.toJSON self.lib.digitalBrewStudios.teams
          );
        };
      };
      flake.lib.digitalBrewStudios = import ./src {
        inherit (nixpkgs) lib;
      };
    };
}

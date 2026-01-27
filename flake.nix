{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    nix-unit = {
      url = "github:nix-community/nix-unit";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
  };

  outputs =
    inputs@{ self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [
        inputs.nix-unit.modules.flake.default
      ];
      perSystem =
        { ... }:
        {
          nix-unit.inputs = {
            # NOTE: a `nixpkgs-lib` follows rule is currently required
            inherit (inputs)
              nixpkgs
              flake-parts
              nix-unit
              systems
              ;
          };
        };
      flake = {
        lib.digitalBrewStudios = import ./src {
          inherit (inputs.nixpkgs) lib;
        };

        tests =
          let
            inherit (inputs.nixpkgs) lib;
            memberOk =
              m:
              builtins.isAttrs m
              && builtins.isString (lib.attrsets.attrByPath [ "name" ] m)
              && builtins.isString (lib.attrsets.attrByPath [ "role" ] m)
              && (
                builtins.isString (lib.attrsets.attrByPath [ "github_id" ] m)
                || builtins.isString (lib.attrsets.attrByPath [ "discord_id" ] m)
              );
          in
          {
            hasMembers = {
              expr = lib.attrsets.hasAttrByPath self.lib.digitalBrewStudios.members;
              expected = true;
            };

            HasTeams = {
              expr = lib.attrsets.hasAttrByPath self.lib.digitalBrewStudios.teams;
              expected = true;
            };

            TeamMemberRequiredInputs = {
              expr = lib.lists.concatLists (
                lib.attrsets.mapAttrsToList (
                  name: value:
                  lib.lists.concatMap (
                    idx:
                    let
                      m = builtins.elemAt value.members idx;
                    in
                    if memberOk m then [ ] else [ { inherit name idx; } ]
                  ) (lib.lists.range 0 (builtins.length value.members - 1))
                ) (self.lib.digitalBrewStudios.teams)
              );

              expected = [ ];
            };
          };
      };
    };
}

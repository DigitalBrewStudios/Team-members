{ lib, members }:
let
  teams = import ./teams.nix { inherit members; };
  compute-members = lib.mapAttrs (
    name: attrs:
    attrs
    // {
      members =
        lib.attrsets.attrByPath [ "members" ] [ ] attrs
        ++ (lib.optionals (name != "owner") teams.owner.members)
        ++ (lib.optionals (name != "infra" && name != "owner") teams.infra.members)
        ++ (lib.optionals (lib.hasPrefix "teaclient-" name || lib.hasPrefix "visionzero-" name) [
          members.tyro
        ]);
    }
  ) teams;
in
compute-members

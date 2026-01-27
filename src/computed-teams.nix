{ lib, members }:
let
  teams = import ./teams.nix { inherit members; };
  compute-members = lib.mapAttrs (
    name: attrs:
    assert (
      lib.assertMsg (attrs.members != [ ]) # or: attrs ? members, depending on intent
        "Members must be defined for a Team, please add a member to ${name}"
    );
    attrs
    // {
      members =
        attrs.members
        ++ (lib.optionals (name != "owner") teams.owner.members)
        ++ (lib.optionals (name != "infra" && name != "owner") teams.infra.members)
        ++ (lib.optionals (lib.hasPrefix "teaclient-" name) [ members.tyro ]);
    }
  ) teams;
in
compute-members

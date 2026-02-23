{ lib }:
let
  inherit (lib) platforms maintainers;
in
{
  /*
        				Please Read https://github.com/NixOS/nixpkgs/blob/master/maintainers/maintainer-list.nix#L1-L64 all options apply.
        				Plus additonal options such as `ssh_keys`, `discord_id` which is the id to your discord account, `testing-platforms` & `role`.

        			NOTE: ssh keys are used instead of passwords for authentification with our infra and secrets.
        			If you added your self recently to nixpkgs please add lib.maintainers ++ { <extra> } so that we are deduplicating our code.
    					Also some github accounts here are private for a reason.
  */

  # keep-sorted start case=no numeric=no block=yes
  eveeifyeve = maintainers.eveeifyeve // {
    name = "Kayleb Barker"; # TODO: see if I should upstream my real name, what is the worst that could happen.
    role = "Owner/Proprietor of DigitalBrewStudios";
    testing-platforms = platforms.unix ++ platforms.windows;
    discord_id = 639720838635061248;
    #TODO: eveeifyeve: use one main ssh key with two yubikey's one as main and one as backup.
    ssh_keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAo5YULJWWzv5cxkUXRWXoFeK0Taq1RB7ptfjl/DO7cB" # Mac book
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGFy81uW8QQKva3vDeKJo0rAoUmzrsTON28zWyWYAh1v eveeifyeve@nixos" # Home NixOS Machine
    ];
  };

  klsjns = {
    name = "klsjns"; # TODO: if your confertable to have your real name out you can add it here.
    role = "Volunteer DigitalBrewStudios Infrastructure Adminstrator & Backend TeaClient Developer";
    github_id = 119887852;
    discord_id = 1021041519161000026;
  };

  "4a-42" = {
    name = "4a42"; # TODO: if your confertable to have your real name out you can add it here.
    role = "Volunteer Open-Source Nix Open-Source developer & Backend TeaClient Developer";
    github_id = 119887852;
    discord_id = 197236900430479361;
    ssh-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIChKKJ+eT/lWzt2RxVYOO3WdtEPtOS/IbsbM/jLgE5Km faithft@nixos";
  };

  dergamer = {
    name = "Phillipp Jäger";
    role = "Volunteer TeaClient Java-Client Developer";
    github_id = 119887852;
    discord_id = 1033714515377934386;
  };

  ray = {
    name = "Ray"; # TODO: if your confertable to have your real name out you can add it here.
    role = "Volunteer Designer";
    github_id = 82323379;
    discord_id = 1033714515377934386;
  };

  blackwulf = {
    name = "BlackWulf"; # TODO: if your confertable to have your real name out you can add it here.
    role = "Volunteer Frontend Developer";
    matrix = "@blackwulfghg:matrix.org";
    github_id = 168473440;
  };

  tyro = {
    name = "Tyro";
    role = "Co-Owner of TeaClient.";
    github_id = 152630359;
    discord_id = 1060213585764175955;
  };

  # keep-sorted end
}

# Teams follow the nixpkgs format which is here: https://github.com/NixOS/nixpkgs/blob/9833ce188fdb61ddc3047fe150896c03b6354891/maintainers/team-list.nix#L3-L20
# However some teams we combine. Like teaclient-frontend would be teaclient.frontend
{
  members,
  ...
}:
with members;
rec {
  # keep-sorted start case=no numeric=no block=yes newline_separated=yes

  #NOTE: this team gets added to all teams when computed
  owner = {
    members = [
      eveeifyeve
    ];
    scope = "Owner of DigitalBrewStudios";
    shortName = "Owner";
  };

  infra = {
    members = [
      klsjns
    ];
    scope = "A Team that manages the internals of DigitalBrewStudios";
    shortName = "Infra";
    enableFeatureFreezePing = true;
  };

  treefmt = {
    members = nix-team.members;
    scope = "Deprecated team... Please use @DigitalBrewStudios/Nix-Team";
    github = "Treefmt-nix";
  };

  #NOTE: if you are in this team, you still have to add yourself as a lib.maintainers
  nix-team = {
    members = [
      eveeifyeve
      "4a42"
    ];
    scope = "Team that maintains nixpkgs, nix, treefmt-nix & other nix projects";
    shortName = "Nix Team";
    github = "Nix-Team";
  };

  # === TeaClient ===
  # ------------
  teaclient-designers = {
    members = [ ray ];
    github = "@TeaClient/Designers";
    scope = "Team that does TeaClient Designs";
    enableFeatureFreezePing = true;
  };

  teaclient-frontend = {
    members = [
      blackwulf
    ];
    github = "@TeaClientMC/Frontend";
    scope = "Maintains/Develops TeaClient Frontend";
    enableFeatureFreezePing = true;
  };

  teaclient-backend = {
    members = [
      klsjns
    ];
    github = "@TeaClientMC/Backend";
    scope = "Maintains/Develops TeaClient Backend";
    enableFeatureFreezePing = true;
  };

  teaclient-java-client = {
    members = [
      dergamer
    ];
    github = "@TeaClientMC/Backend";
    enableFeatureFreezePing = true;
  };

  visionzero-dsc-bot = {
    github = "@VisionZeroEsp/Dsc-Bot";
    scope = "Maintains the discord bot for vision zero";
  };

  visionzero-web = {
    github = "@VisionZeroEsp/Web";
    scope = "Maintains the website for vision zero";
  };

  # keep-sorted end
}

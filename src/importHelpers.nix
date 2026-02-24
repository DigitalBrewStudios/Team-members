{ lib }:
let
  packageAndName = package: {
    pname = package.name;
    inherit (package) version;
  };
in
{
  CargoPkgNameVersion = toml: packageAndName (lib.importTOML toml).package;
  PjsonPkgNameVersion = json: packageAndName (lib.importJSON json);
}

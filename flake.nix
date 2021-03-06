{
  description = ''View and set the metadata for audio files'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."meta-master".dir   = "master";
  inputs."meta-master".owner = "nim-nix-pkgs";
  inputs."meta-master".ref   = "master";
  inputs."meta-master".repo  = "meta";
  inputs."meta-master".type  = "github";
  inputs."meta-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."meta-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}
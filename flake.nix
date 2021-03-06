{
  description = ''Polynomial operations'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."polynumeric-master".dir   = "master";
  inputs."polynumeric-master".owner = "nim-nix-pkgs";
  inputs."polynumeric-master".ref   = "master";
  inputs."polynumeric-master".repo  = "polynumeric";
  inputs."polynumeric-master".type  = "github";
  inputs."polynumeric-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."polynumeric-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."polynumeric-v0_2_0".dir   = "v0_2_0";
  inputs."polynumeric-v0_2_0".owner = "nim-nix-pkgs";
  inputs."polynumeric-v0_2_0".ref   = "master";
  inputs."polynumeric-v0_2_0".repo  = "polynumeric";
  inputs."polynumeric-v0_2_0".type  = "github";
  inputs."polynumeric-v0_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."polynumeric-v0_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."polynumeric-v0_2_1".dir   = "v0_2_1";
  inputs."polynumeric-v0_2_1".owner = "nim-nix-pkgs";
  inputs."polynumeric-v0_2_1".ref   = "master";
  inputs."polynumeric-v0_2_1".repo  = "polynumeric";
  inputs."polynumeric-v0_2_1".type  = "github";
  inputs."polynumeric-v0_2_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."polynumeric-v0_2_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
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
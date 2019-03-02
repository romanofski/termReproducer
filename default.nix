{ compiler ? null, nixpkgs ? null }:

with (import .nix/nixpkgs.nix { inherit compiler nixpkgs; });

let
  env = haskellPackages.ghcWithPackages (self: [
    self.termReproducer
  ]);
  nativeBuildTools = with pkgs.haskellPackages; [ cabal-install ghcid hindent ];
  in
    if pkgs.lib.inNixShell
    then haskellPackages.shellFor {
      withHoogle = true;
      packages = haskellPackages: [ haskellPackages.termReproducer ];
      nativeBuildInputs = haskellPackages.purebred.env.nativeBuildInputs ++ nativeBuildTools;
    }
    else {
        termReproducer = env;
      }

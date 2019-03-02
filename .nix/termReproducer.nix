{ mkDerivation, base, gi-gtk, haskell-gi-base, stdenv }:
mkDerivation {
  pname = "termReproducer";
  version = "0.1.0.0";
  src = ./..;
  isLibrary = false;
  isExecutable = true;
  enableSeparateDataOutput = true;
  executableHaskellDepends = [ base gi-gtk haskell-gi-base ];
  license = stdenv.lib.licenses.lgpl21;
}

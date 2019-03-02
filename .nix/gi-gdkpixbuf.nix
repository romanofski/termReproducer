{ mkDerivation, base, bytestring, Cabal, containers, gdk_pixbuf
, gi-gio, gi-glib, gi-gobject, haskell-gi, haskell-gi-base
, haskell-gi-overloading, stdenv, text, transformers
}:
mkDerivation {
  pname = "gi-gdkpixbuf";
  version = "2.0.18";
  sha256 = "f232978dde69f4b2a2459ffb5280c33c2a8a079b3a1ce2f34bd9477dc0be3ead";
  setupHaskellDepends = [ base Cabal haskell-gi ];
  libraryHaskellDepends = [
    base bytestring containers gi-gio gi-glib gi-gobject haskell-gi
    haskell-gi-base haskell-gi-overloading text transformers
  ];
  libraryPkgconfigDepends = [ gdk_pixbuf ];
  doHaddock = false;
  homepage = "https://github.com/haskell-gi/haskell-gi";
  description = "GdkPixbuf bindings";
  license = stdenv.lib.licenses.lgpl21;
}

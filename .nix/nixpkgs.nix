{ compiler ? null, nixpkgs ? null}:

let
  compilerVersion = if isNull compiler then "ghc863" else compiler;
  haskellPackagesOverlay = self: super: with super.haskell.lib; {
    haskellPackages = super.haskell.packages.${compilerVersion}.override {
      overrides = hself: hsuper: {
        termReproducer = dontStrip (hsuper.callPackage ./termReproducer.nix { });
        gi-gdkpixbuf = hsuper.callPackage ./gi-gdkpixbuf.nix {
          gdk_pixbuf = self.pkgs.enableDebugging self.pkgs.gdk_pixbuf;
        };
      };
    };
  };
  pkgSrc =
    if isNull nixpkgs
    then
    builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/e27e11480323db005ab62ef477eb1fd28b6b62f5.tar.gz";
      sha256 = "0i64wsl20fl92bsqn900nxmmnr1v3088drbwhwpm9lvln42yf23s";
    }
    else
    nixpkgs;
in
  import pkgSrc { overlays = [ haskellPackagesOverlay ]; }

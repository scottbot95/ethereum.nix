{system ? builtins.currentSystem}: let
  flake = import ./nix/flake-compat.nix {
    inherit system;
    lockPath = ./flake.lock;
    sourceDir = ./.;
  };
in
  flake.defaultNix

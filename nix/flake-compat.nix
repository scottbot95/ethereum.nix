{
  system ? builtins.currentSystem,
  lockPath ? ./flake.lock,
  sourceDir ? ./.,
}: let
  lock = builtins.fromJSON (builtins.readFile lockPath);

  inherit (lock.nodes.flake-compat.locked) owner repo rev narHash;

  flake-compat = fetchTarball {
    url = "https://github.com/${owner}/${repo}/archive/${rev}.tar.gz";
    sha256 = narHash;
  };

  flake = import flake-compat {
    inherit system;
    src = sourceDir;
  };
in
  flake

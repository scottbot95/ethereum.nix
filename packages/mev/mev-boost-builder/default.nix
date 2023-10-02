{
  blst,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "builder";
  version = "1.13.2-dev1";

  src = fetchFromGitHub {
    owner = "flashbots";
    repo = "${pname}";
    rev = "v${version}";
    hash = "sha256-uUWw2yWKbazodb6dIc99POF+Hg7VIxW/PYyBrQleSAo=";
  };

  vendorHash = "sha256-moylFXpGGuzdHqvXrik/LHqquxVr2hm/Puaft7tPJII=";

  buildInputs = [blst];

  subPackages = ["cmd/geth"];

  ldflags = ["-s" "-w"];

  meta = {
    description = "Flashbots mev-boost block builder";
    homepage = "https://github.com/flashbots/builder";
    mainProgram = "geth";
    platforms = ["x86_64-linux"];
  };
}

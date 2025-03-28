{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "ktor-cli";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "ktorio";
    repo = "ktor-cli";
    tag = version;
    hash = "sha256-TGwkGm1Rsg82f6FJeTnhyvfS2MRMe5+DTdxTsOwwb1Q=";
  };

  subPackages = "cmd/ktor";

  vendorHash = "sha256-ITYNSq2hs0QcOZZShkwtjZVcSyGY1uCmhgoZ0l9nPP0=";

  ldflags = [
    "-s"
    "-w"
    "-X main.Version=${version}"
  ];

  meta = {
    description = "Command-line tool for creating Ktor projects";
    homepage = "https://github.com/ktorio/ktor-cli";
    changelog = "https://github.com/ktorio/ktor-cli/releases/tag/${version}";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ nartsiss ];
    mainProgram = "ktor";
  };
}

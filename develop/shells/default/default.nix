{
  inputs,
  pkgs,
  mkShell,
  system,
  ...
}:
let
  jdk = pkgs.jdk23;
  maven = pkgs.maven.override { jdk_headless = jdk; };
  gradle = pkgs.gradle.override { java = jdk; };
in
mkShell {
  packages = [
    jdk
    maven
    gradle
  ];

  inherit (inputs.self.checks.${system}.pre-commit-check) shellHook;
  buildInputs = inputs.self.checks.${system}.pre-commit-check.enabledPackages;
}

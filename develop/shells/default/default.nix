{
  inputs,
  pkgs,
  mkShell,
  system,
  ...
}:
let
  jdk = pkgs.graalvmPackages.graalvm-ce; # pkgs.jdk23;
  maven = pkgs.maven.override { jdk_headless = jdk; };
  gradle = pkgs.gradle.override { java = jdk; };
in
mkShell {
  packages = [
    jdk
    maven
    gradle
    # ant
  ];

  inherit (inputs.self.checks.${system}.pre-commit-check) shellHook;
  buildInputs = inputs.self.checks.${system}.pre-commit-check.enabledPackages;
}

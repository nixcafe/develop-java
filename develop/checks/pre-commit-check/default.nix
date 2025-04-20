{ inputs, system, ... }:
inputs.pre-commit-hooks.lib.${system}.run {
  src = ../../..;
  hooks = { };
}

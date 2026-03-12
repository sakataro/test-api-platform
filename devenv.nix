{ pkgs, lib, config, inputs, ... }:

{
  packages = [
    pkgs.php85
    pkgs.symfony-cli
  ];
}

{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  packages = [
    pkgs.php85
    pkgs.symfony-cli
    pkgs.php85Packages.composer
  ];

  # - Nix の PHP は拡張を動的 .so として管理しており、scan directory の ini で読み込んでいる。
  # - Symfony CLI はプロジェクトルートの php.ini を -c で渡す
  # ので、プロジェクトルートにphp.iniを追加するとデフォルトの scan directory が無効になり拡張が読み込まれなくなる。
  # ↓を明示的に指定することで、Nix の拡張を確実に読み込ませつつルートのphp.iniも読むっぽい。
  env.PHP_INI_SCAN_DIR = "${pkgs.php85}/lib";
}

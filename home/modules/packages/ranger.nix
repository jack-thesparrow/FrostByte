{ pkgs, config, ... }:
let
  rifleConf = ''
    ext,, has nvim, X, flag f = nvim --"$@"
  '';
in
{
  home.packages = with pkgs; [
    ranger
  ];

  #home.file.".config/ranger/rifle.conf".text = rifleConf;
}

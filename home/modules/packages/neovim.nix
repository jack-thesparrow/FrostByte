{ config, pkgs, lib, inputs, ... }@args :
let
  inputs = args.inputs;
in
{
  programs.nixvim.enable = true;
}
  


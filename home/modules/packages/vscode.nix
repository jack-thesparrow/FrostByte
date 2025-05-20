{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        vscjava.vscode-java-pack
        ms-vscode.cpptools
        rust-lang.rust-analyzer
        bbenoist.nix
        #vscodevim.vim
      ];

      userSettings = {
        "editor.tabSize" = 2;
        "editor.fontSize" = 14;
        "editor.defaultFormatter" = "bbenoist.nix";
        "[nix]" = {
          "editor.defaultFormatter" = "bbenoist.nix";
          "editor.formatOnSave" = true;
        };


        "files.autoSave" = "onFocusChange";
        "python.pythonPath" = "${pkgs.python3}/bin/python3";
        "rust-analyzer.server.path" = "${pkgs.rust-analyzer}/bin/rust-analyzer";
      };
    };
  };

  home.packages = with pkgs; [
    python3
    openjdk17
    gcc
    rustup
    nixpkgs-fmt
  ];
}

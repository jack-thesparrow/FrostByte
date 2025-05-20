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
      ];

      userSettings = {
        "editor.tabSize" = 4;
        "editor.fontSize" = 14;
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
  ];
}


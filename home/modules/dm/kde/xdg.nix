{ pkgs, variables, ... }:
{
  xdg.configFile."khotkeysrc".text = ''
    [Main]
    AllowOverlappingShortcuts=false
    ErrorLog=true
    InfoLog=true
    WarningLog=true

    [Data]
    DataCount=3

    [Data_1]
    Comment=Open Terminal
    Enabled=true
    Name=Open Terminal
    Type=COMMAND_URL
    CommandURL=${variables.terminal}
    Shortcut=Meta+T

    [Data_2]
    Comment=Open File Manager
    Enabled=true
    Name=Open File Manager
    Type=COMMAND_URL
    CommandURL=${variables.file}
    Shortcut=Meta+E

    [Data_3]
    Comment=Open Browser
    Enabled=true
    Name=Open Browser
    Type=COMMAND_URL
    CommandURL=${variables.browser}
    Shortcut=Meta+F
  '';
}

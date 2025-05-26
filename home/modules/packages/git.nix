{
  config,
  pkgs,
  variables,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "${variables.gitUsername}";
    userEmail = "${variables.gitEmail}";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}

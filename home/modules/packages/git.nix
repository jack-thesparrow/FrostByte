{config, pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName = "jack-thesparrow";
    userEmail = "dummymail@github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}

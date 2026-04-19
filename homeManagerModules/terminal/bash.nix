{
  programs.bash = {
    enable = true;
    shellAliases = {
      l = "ls -alh";
      ll = "ls -l";
      ls = "ls --color=tty";
      j = "jj";
      n = "nvim";
    };
  };
}

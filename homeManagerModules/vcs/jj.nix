{
  programs.jujutsu = {
    enable = true;
    settings = {
      signing = {
        behavior = "own";
        backend = "gpg";
      };
      user = {
        name = "Demetrius Semanko";
        email = "demetrius@demsem.dev";
      };
      ui = {
        default-command = [
          "log"
          "--reversed"
          "-r"
          "ancestors(@, 5)"
        ];
        editor = "nvim";
      };
      aliases = {
        "d" = [
          "desc"
          "-m"
        ];
        "files" = [
          "file"
          "list"
        ];
        "nd" = [
          "new"
          "-m"
        ];
        "n" = [ "new" ];
        "push" = [
          "git"
          "push"
        ];
        "pull" = [
          "git"
          "fetch"
        ];
        "bsm" = [
          "bookmark"
          "set"
          "main"
        ];
      };
    };
  };
}

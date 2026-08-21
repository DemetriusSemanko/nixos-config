{
  programs.jujutsu = {
    enable = true;
    settings = {
      signing = {
        behavior = "drop";
        backend = "ssh";
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAKlJadcjUHFC9rrdq9x6pK/I4tcR8PtRSAUovHhQMAt";
      };
      git = {
        sign-on-push = true;
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

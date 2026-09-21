{
  programs.jujutsu = {
    enable = true;
    settings = {
      signing = {
        behavior = "drop";
        backend = "ssh";
        key = "~/.ssh/id_ed25519.pub";
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
      merge.same-change = "keep";
      templates.git_push_bookmark = "'\"demsem/auto-\" ++ change_id.short()'";

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

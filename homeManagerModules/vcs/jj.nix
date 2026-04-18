{
  programs.jujutsu = {
    enable = true;
    settings = {
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
        "dm" = [
          "desc"
          "-m"
        ];
        "files" = [
          "file"
          "list"
        ];
      };
    };
  };
}

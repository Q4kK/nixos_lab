{
  programs.fish = {
    enable = true;
    shellAliases = {
      ip = "ip a -color=always";

      #fancy git commands lmao
      go = "git switch";
      geti = "git status && git branch";

      # tea stuff
      "tea pr merge" = "tea pr merge --style='rebase'";
    };
  };
}

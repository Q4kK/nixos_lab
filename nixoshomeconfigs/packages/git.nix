{
  programs.git = {
    enable = true;
    config = {
        init = {
          defaultBranch = "master";
        };
        user = {
          name = "q4kK";
          email = "quantumstar4k@gmail.com";
        };
        core.editor = "vim";
        commit.verbose = true;
        push.autoSetupRemote = true;
        pull.rebase = true;
    };
  };
}

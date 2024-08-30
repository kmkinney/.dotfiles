{...}: {
  programs = {
    lazygit.enable = true;
    gh.enable = true;
    git = {
      enable = true;
      userName = "kmkinney";
      userEmail = "kevinmk712@gmail.com";
      aliases = {
        co = "checkout";
        br = "branch";
        st = "status -sb";
        f = "fetch";
        a = "add .";
        c = "commit";
        cm = "commit -m";
        p = "push";
        pu = "push -u";
        root = "rev-parse --show-toplevel";
      };
      extraConfig = {
        core = {
          editor = "nvim";
          autocrlf = "input";
          ignorecase = false;
        };
        pull = {
          rebase = true;
        };
        push = {
          autoSetupRemote = true;
        };
        init = {
          defaultBranch = "main";
        };
        rebase = {
          updateRefs = true;
        };
        fetch = {
          prune = true;
        };
      };
    };
  };
}

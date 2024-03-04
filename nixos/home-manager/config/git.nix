{...}: {
  home.file = {
    ".gitconfig" = {
      text =
        /*
        toml
        */
        ''
          [user]
              name = kmkinney
              username = kmkinney
              email = kevinmk712@gmail.com
          [alias]
              co = checkout
              br = branch
              st = status -sb
              f = fetch
              a = add .
              c = commit
              cm = commit -m
              p = push
              pu = push -u
              root = rev-parse --show-toplevel
          [core]
              editor = nvim
              autocrlf = input
          [init]
              defaultBranch = main
          [filter "lfs"]
              clean = git-lfs clean -- %f
              smudge = git-lfs smudge -- %f
              process = git-lfs filter-process
              required = true
          [pull]
              rebase = true
          [fetch]
              prune = true
        '';
    };
  };
}

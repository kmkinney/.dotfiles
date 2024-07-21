{...}: {
  # Programs
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "awesomepanda";
      plugins = [
        "git"
      ];
    };
  };
}

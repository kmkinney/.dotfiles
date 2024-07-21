{...}: {
  # Programs
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      v = "nvim";
      ll = "ls -alF";
      lg = "lazygit";
      py = "python3";
    };
    sessionVariables = {
      PS1 = "\[\e[01;37m\]\u\[\e[01;34m\]@\h:\[\e[01;36m\]\w\[\e[01;33m\]\$\[\e[00m\]";
      MOZ_ENABLE_WAYLAND = 1;
      ANDROID_HOME = "~/Android/Sdk/";
    };
    # bashrcExtra = ''
    #   stty -ixon
    # '';
  };
}

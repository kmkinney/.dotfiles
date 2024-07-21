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
    bashrcExtra = ''
      stty -ixon

      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

      # pnpm
      export PNPM_HOME="/home/kevin/.local/share/pnpm"
      case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
      esac
      # pnpm end
      # >>> conda initialize >>>
      # !! Contents within this block are managed by 'conda init' !!
      __conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
      if [ $? -eq 0 ]; then
      	eval "$__conda_setup"
      else
      	if [ -f "/usr/etc/profile.d/conda.sh" ]; then
      		. "/usr/etc/profile.d/conda.sh"
      	else
      		export PATH="/usr/bin:$PATH"
      	fi
      fi
      unset __conda_setup
      # <<< conda initialize <<<
      [ -f "$HOME"/.cargo/env ] && . "$HOME/.cargo/env"
    '';
  };
}

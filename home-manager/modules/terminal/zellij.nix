{...}: {
  programs.zellij = {
    enable = true;
  };

  home.file.zellij = {
    target = ".config/zellij/config.kdl";
    # Brandon config values
    # text = ''
    # simplified_ui true
    # pane_frames false
    # copy_on_select true
    # keybinds {
    #   unbind "Ctrl o"
    #   unbind "Cmd s"
    #   shared {
    #     bind "Ctrl s" { SwitchToMode "session"; }
    #     bind "Ctrl f" { SwitchToMode "scroll"; }
    #   }
    #   locked {
    #     bind "Ctrl b" { SwitchToMode "tmux"; }
    #     bind "Ctrl g" { SwitchToMode "normal"; }
    #     bind "Alt Left" { MoveFocusOrTab "Left"; }
    #     bind "Alt Right" { MoveFocusOrTab "Right"; }
    #     bind "Alt Up" { MoveFocusOrTab "Up"; }
    #     bind "Alt Down" { MoveFocusOrTab "Down"; }
    #   }
    # }
    # ''
    text = ''
      simplified_ui true
      pane_frames false
      copy_on_select true
      keybinds {
        unbind "Ctrl s"
        shared {
          unbind "Ctrl h"
          bind "Ctrl m" { SwitchToMode "move"; }
        }
      }
      theme "everforest-dark-medium"
      themes {
        everforest-dark-medium {
          fg "#d3c6aa"
          bg "#2f383e"
          black "#272e33"
          red "#d6494d"
          green "#a7c080"
          yellow "#dbbc7f"
          blue "#7fbbb3"
          magenta "#d699b6"
          cyan "#83c092"
          white "#d3c6aa"
          orange "#e69875"
        }
      }
    '';
  };
}

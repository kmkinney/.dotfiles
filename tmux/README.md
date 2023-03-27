# TMUX Config Information

## Getting the Terminal Colors Right

[Github Gist](https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6)

### Alacritty Config

```yaml
env:
  TERM: xterm-256color
```

### TMUX Config

```
set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",xterm-256color:RGB"
```

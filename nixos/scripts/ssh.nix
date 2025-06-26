{
  pkgs,
  ...
}:
pkgs.writeShellScriptBin "ssh-init" ''
  echo "Generating ssh keys and adding to agent"
  pushd $HOME/.ssh
  ${pkgs.openssh}/bin/ssh-keygen -t ed25519 -C "kevinmk712@gmail.com" -N "" -f $HOME/.ssh/id_ed25519
  eval "$(${pkgs.openssh}/bin/ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
''

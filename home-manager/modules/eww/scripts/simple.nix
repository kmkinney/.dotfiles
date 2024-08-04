{pkgs, ...}:
pkgs.writeShellScriptBin "notify-test" ''
  ${pkgs.libnotify}/bin/notify-send "this is a test"
''

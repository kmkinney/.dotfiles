{pkgs, ...}:
pkgs.writers.writePython3Bin "show-keybinds" {}
/*
python
*/
''
  from subprocess import check_output, run
  import json

  mod_mask = {
      0: None,
      5: "CTRL",
      8: "ALT",
      64: "SUPER",
      65: "SUPER+SHIFT"
  }

  output = check_output(["${pkgs.hyprland}/bin/hyprctl", "binds", "-j"])
  data = json.loads(output)

  text = ""
  for k in data:
      mod = k['modmask']
      key = k['key']
      has_desc = k['has_description']
      desc = k['description']
      if has_desc:
          text += f"{mod_mask[mod]}+{key}:\t\t{desc}\n"
  run(["${pkgs.libnotify}/bin/notify-send", text])
''

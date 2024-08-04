#!/usr/bin/env python
from subprocess import check_output
import json

mod_mask = {
    0: None,
    5: "CTRL",
    8: "ALT",
    64: "SUPER",
    65: "SUPER+SHIFT"
}

output = check_output(["hyprctl", "binds", "-j"])
data = json.loads(output)

for k in data:
    mod = k['modmask']
    key = k['key']
    has_desc = k['has_description']
    desc = k['description']
    if has_desc:
        print(f"{mod_mask[mod]}+{key}:\t\t{desc}")

const network = await Service.import("network");
const audio = await Service.import("audio");
const hyprland = await Service.import("hyprland");

const WorkspaceIcons = {
  FIREFOX: "󰈹",
  CHROME: "",
  NVIM: "",
  TERMINAL: "",
  DEFAULT: "",
};

const getIcon = (
  /** @type import("types/service/hyprland").Workspace*/ workspace,
) => {
  const title = workspace.lastwindowtitle;
  if (title.match(/firefox/i)) return WorkspaceIcons.FIREFOX;
  if (title.match(/chrome/i)) return WorkspaceIcons.CHROME;
  if (title.match(/^~/i)) return WorkspaceIcons.TERMINAL;
  if (title.match(/^v\s/i)) return WorkspaceIcons.NVIM;
  return WorkspaceIcons.DEFAULT;
};

const date = Variable("", {
  poll: [1000, 'date "+%I:%M %p %b %e"'],
});

const hostname = Variable(Utils.exec(["uname", "-n"]), {
  poll: [1000 * 60, "uname -n"],
});

const Title = () =>
  Widget.Label({
    label: hyprland.active.client.bind("title"),
  });

const Workspaces = () => {
  const activeId = hyprland.active.workspace.bind("id");
  const workspaces = hyprland.bind("workspaces").as((ws) =>
    ws
      .sort((a, b) => a.id - b.id)
      .map((w) => {
        const isActive = activeId.as((aid) => aid === w.id);
        return Widget.Button({
          on_clicked: () => hyprland.messageAsync(`dispatch workspace ${w.id}`),
          class_name: isActive.as((active) =>
            active ? "workspace active" : "workspace",
          ),
          child: Widget.Label({
            label: getIcon(w),
          }),
        });
      }),
  );

  return Widget.Box({
    class_name: "workspaces",
    children: workspaces,
  });
};

const Hostname = () =>
  Widget.Label({
    class_name: "hostname",
    label: hostname.bind(),
  });

function Volume() {
  const icons = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  };

  function getIcon() {
    const icon = audio.speaker.is_muted
      ? 0
      : [101, 67, 34, 1, 0].find(
          (threshold) => threshold <= audio.speaker.volume * 100,
        );

    return `audio-volume-${icons[icon]}-symbolic`;
  }

  const icon = Widget.Button({
    on_clicked: () => Utils.exec("pavucontrol"),
    child: Widget.Icon({
      icon: Utils.watch(getIcon(), audio.speaker, getIcon),
    }),
  });

  const slider = Widget.Slider({
    class_name: "volume-slider",
    hexpand: true,
    draw_value: false,
    on_change: ({ value }) => (audio.speaker.volume = value),
    setup: (self) =>
      self.hook(audio.speaker, () => {
        self.value = audio.speaker.volume || 0;
      }),
  });

  return Widget.Box({
    class_name: "volume icon",
    css: "min-width: 180px",
    children: [icon, slider],
  });
}

const Clock = () =>
  Widget.Label({
    class_name: "date",
    label: date.bind(),
  });

const Network = () =>
  Widget.Icon({
    class_name: "icon network",
    icon: network.wired.bind("icon_name"),
  });

const Right = () =>
  Widget.Box({
    spacing: 16,
    hpack: "end",
    children: [Volume(), Network(), Clock()],
  });

const Center = () =>
  Widget.Box({
    spacing: 16,
    margin_end: 16,
    hpack: "center",
    children: [Title()],
  });

const Left = () =>
  Widget.Box({
    spacing: 16,
    hpack: "start",
    children: [Hostname(), Workspaces()],
  });

export const Bar = (/** @type {number} */ monitor) =>
  Widget.Window({
    monitor,
    class_name: "bar",
    name: `bar${monitor}`,
    anchor: ["top", "left", "right"],
    opacity: 0.9,
    exclusivity: "exclusive", // normal, ignore
    // layer: "top",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });

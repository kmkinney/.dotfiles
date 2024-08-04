import icons from "../utils/icons.js";
import { APPLICATION_LAUNCHER } from "./applications.js";

const ApplicationLauncher = () =>
  Widget.Button({
    on_clicked: () => App.toggleWindow(APPLICATION_LAUNCHER),
    child: Widget.Icon({
      class_name: "dock-icon",
      icon: icons.apps.apps,
    }),
  });

const DockContents = () =>
  Widget.Box({
    class_name: "dock",
    children: [ApplicationLauncher()],
  });

export const Dock = () =>
  Widget.Window({
    monitor: 0,
    name: "dock-window",
    class_name: "dock-window",
    anchor: ["bottom"],
    exclusivity: "ignore",
    layer: "top",
    child: DockContents(),
  });

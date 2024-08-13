import { applauncher } from "./widgets/applications.js";
// import { Dock } from "./widgets/dock.js";
import { Bar } from "./widgets/bar.js";

App.config({
  style: "./style.css",
  windows: [
    Bar(0),
    // Dock(),
    applauncher,
  ],
});

export {};

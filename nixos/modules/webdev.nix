{pkgs, ...}: let
  browsers = (builtins.fromJSON (builtins.readFile "${pkgs.playwright-driver}/browsers.json")).browsers;
  chromium-rev = (builtins.head (builtins.filter (x: x.name == "chromium") browsers)).revision;
in {
  environment.systemPackages = with pkgs; [
    # For Prisma:
    nodejs
    cue
    nodePackages_latest.pnpm
    nodePackages_latest.vercel
    nodePackages_latest.prisma
    openssl
    claude-code
    pscale
    ngrok
    insomnia
    biome
    chromium
    playwright-driver.browsers
    codex
    awscli2
  ];

  # Biome
  environment.variables.BIOME_BINARY = "${pkgs.biome}/bin/biome";

  # Prisma:
  environment.variables.PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
  environment.variables.PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
  environment.variables.PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
  environment.variables.PLAYWRIGHT_BROWSERS_PATH = pkgs.playwright-driver.browsers;
  environment.variables.PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";
  environment.variables.PLAYWRIGHT_LAUNCH_OPTIONS_EXECUTABLE_PATH = "${pkgs.playwright.browsers}/chromium-${chromium-rev}/chrome-linux/chrome";

  # Puppeteer
  environment.variables.PUPPETEER_EXECUTABLE_PATH = "${pkgs.chromium}/bin/chromium";

  # Docker
  virtualisation.docker.enable = true;
  users.users.kevin.extraGroups = ["docker"];
}

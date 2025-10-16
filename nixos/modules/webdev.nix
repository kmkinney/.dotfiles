{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # For Prisma:
    nodejs
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
  ];

  # Prisma:
  environment.variables.PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
  environment.variables.PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
  environment.variables.PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
  environment.variables.PLAYWRIGHT_BROWSERS_PATH = pkgs.playwright-driver.browsers;
  environment.variables.PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";

  # Puppeteer
  environment.variables.PUPPETEER_EXECUTABLE_PATH = "${pkgs.chromium}/bin/chromium";

  # Docker
  virtualisation.docker.enable = true;
  users.users.kevin.extraGroups = ["docker"];
}

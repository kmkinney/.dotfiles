{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # For Prisma:
    nodejs
    nodePackages_latest.pnpm
    nodePackages_latest.vercel
    nodePackages_latest.prisma
    openssl
    claude-code
  ];

  # Prisma:
  environment.variables.PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
  environment.variables.PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
  environment.variables.PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";

  # Docker
  virtualisation.docker.enable = true;
  users.users.kevin.extraGroups = ["docker"];
}

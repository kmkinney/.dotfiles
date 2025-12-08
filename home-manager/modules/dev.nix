{pkgs, ...}: {

  home.packages = with pkgs; [
    # Packages needed from nixos
    act
    alejandra
    awscli2
    # biome
    cargo
    chromium
    claude-code
    code-cursor
    codex
    cue
    doppler
    # firebase-tools
    # firefox
    git
    insomnia
    # lm_sensors
    mariadb.client
    ngrok
    nodePackages_latest.pnpm
    nodePackages_latest.prisma
    nodePackages_latest.vercel
    nodejs
    openssl
    pscale
    python3
    ripgrep
    vim
    vscode
  ];
}

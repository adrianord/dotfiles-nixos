{ inputs, ... }:

{
  home.stateVersion = "22.11";
  imports = [
    ./packages.nix
    ./sway.nix
    ./firefox.nix
  ];

  programs.vscode.enable = true;

  programs.light.enable = false;
}

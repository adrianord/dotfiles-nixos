{ conifg, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    feh
    fzf
    htop
    killall
    ripgrep
    wget
    xclip
    rofi
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
  };
}

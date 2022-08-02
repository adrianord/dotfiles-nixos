{ conifg, options, pkgs, ...}:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland {
      forceWayland = true;
    };
    profiles.aordonez = {
      path = "aordonez";
      settings = {
        "browser.fullscreen.autohide" = false;
      };
    };
  };
}

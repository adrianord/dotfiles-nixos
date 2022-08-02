{ config, pkgs, lib, ... }:

{
  system.stateVersion = "22.11";
  imports = [
    ./hardware-configuration.nix
    ./sway.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
    };
  };

  networking = {
    hostName = "igg";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Chicago";

  nix.settings.trusted-users = [ "aordonez" ];

  environment.systemPackages = with pkgs; [
    wget
    git
    tree
  ];

  users.users.aordonez = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "adbusers" ];
    uid = 1000;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC30mRxyhx135OyZFEkunAgGTrO0oiPC3TTpXTWWTFjpF/1znp2xajNSPQl5k3oNt/uo0yBiuOYBMti0WcSBkfgu9nUABExCuapDkUSuacFuuwo+mvdKtOvDA9DCMBwMNr2UfPNZoIr16otbnTTvBoXHIpJWyry5tNZC83b8M4RmT+EDrI6eNHM6sKKsQbbkvyy1iDOtGjXAlQcCRYHeJGaG7vqkrNSkt/3+xoGbA1oJbWM1mgw97aMmkGIuO3Lpj7vh5yxcoaNRP8hK6SHuNX/oZe6q+HPovlA5Cubczt5cwEBMysumQsMDAQNaCKq0DgVsYyavDTwNg7BHtgMvJmOHkdSnL8zuWpEhXuRSeZFmmCC86wO9DJSlKPTCxEaldzKDXjsWERhDuFO32QiifMWdb68YDUuZTfUZlFuFX1dD5g6RLBGTGDEY1pHfZvbBtkVlcJ9CMouYV4ZSek/bacO4GBnzwD+naI7aW1X6Cotz8o8+L+tRcizJzjMRa+GQ9s= aordonez@workstation"
    ];
  };

  nixpkgs.config.allowUnfree = true;


  virtualisation = {
    docker.enable = true;

    podman = {
      enable = true;
      extraPackages = with pkgs; [ zfs ];
    };

    vmware.guest.enable = true;
  };
}

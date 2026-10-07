{ lib, ... }:

{
  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "never";
  };

  systemd.user.services.udiskie = {
    Unit = {
      After = lib.mkForce [ ];
      PartOf = lib.mkForce [ ];
    };
    Install.WantedBy = lib.mkForce [ "default.target" ];
  };
}

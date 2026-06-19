{ config, pkgs, lib, ... }:

{
  home.packages = [
    pkgs.opencode
  ];

  xdg.configFile."opencode/tui.json".text = ''
    {
      "$schema": "https://opencode.ai/tui.json",
      "keybinds": {
        "leader": "ctrl+space", 
        "session_list": "<leader>ls",
        "messages_page_up": "ctrl+b",
        "messages_page_down": "ctrl+f",
        "input_clear": "ctrl+u"
      }
    }
  '';
}

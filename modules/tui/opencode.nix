{ config, pkgs, nixpkgs-opencode, lib, ... }:

let # WARNING: opencode 1.18.31 hack
  pinnedPkgs = import nixpkgs-opencode {
    system = pkgs.system;
  };
in
{
  home.packages = [
    pinnedPkgs.opencode
  ];

  home.activation.setupOpenCodeConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p ~/.config/opencode
    
    cat << 'EOF' > ~/.config/opencode/tui.json
    {
      "$schema": "https://opencode.ai/tui.json",
      "keybinds": {
        "leader": "ctrl+space",
        "session_list": "<leader>ls",
        "messages_page_up": "ctrl+k",
        "messages_page_down": "ctrl+j",
        "input_clear": "ctrl+c"
      }
    }
    EOF
    
    chmod 644 ~/.config/opencode/tui.json
  '';
}

{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode; # or vscodium

    profiles.default = {
      # Let Nix handle updates
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      userSettings = {
        # Disable Telemetry and Data Collection
        "telemetry.telemetryLevel" = "off";
        "workbench.enableExperiments" = false;
        "update.showReleaseNotes" = false;

        "editor.inlineSuggest.enabled" = false;
        "workbench.layoutControl.enabled" = false;
        "editor.minimap.enabled" = false;
        "breadcrumbs.enabled" = false;
        "workbench.startupEditor" = "none";
        "workbench.tips.enabled" = false;
        "workbench.tree.indent" = 12;

        # Extension specific:
        "[python]" = { "editor.formatOnSave" = false; };
        "vim.useSystemClipboard" = true;
        "vim.handleKeys" = {
          "<C-c>" = false;
          "<C-v>" = false;
          "<C-x>" = false;
        };
      };

      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        ms-python.python
      ];
    };
  };
}

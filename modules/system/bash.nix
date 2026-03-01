{ config, pkgs, ... }:

{
  # 1. env variables

  programs.bash = {
    enable = true;

    # 2. aliases
    shellAliases = {
      ll = "ls -la";
      update = "home-manager switch";
      # Add your other aliases here
    };

    # 3. general bashrc(functions & preferences & other logic)
    initExtra = ''
      # --- Functions ---
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }

      # --- General .bashrc Setup ---
      export PS1='\[\033[38;2;168;153;132m\]\u@\h \[\033[37m\]\w\[\033[0m\]$ '


      # --- Machine-Specific Complement ---
      if [ -f ~/.complement_bashrc ]; then
        source ~/.complement_bashrc
      fi
    '';
  };
}

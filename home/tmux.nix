{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    clock24 = true;
    shortcut = "a";
    customPaneNavigationAndResize = true;
    disableConfirmationPrompt = true;
    historyLimit = 10000;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [{
      plugin = catppuccin;
      extraConfig = ''
        set -g @catppuccin_flavour "frappe"
        set -g @catppuccin_window_right_separator "█"
        set -g @catppuccin_window_number_position "right"
        set -g @catppuccin_window_middle_separator " | "
        set -g @catppuccin_window_default_fill "none"
        set -g @catppuccin_window_current_fill "all"
        set -g @catppuccin_status_left_separator "█"
        set -g @catppuccin_status_right_separator "█"

      '';
    }];
    terminal = "tmux-256color";
    extraConfig = ''
      # No escape time
      set -s escape-time 0

      # Fixes neovim theme issues
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Toggle popup window with F12
      bind-key -n -N 'Toggle popup window' F12 if-shell -F '#{==:#{session_name},popup}' {
      detach-client
      } {
      display-popup -d "#{pane_current_path}" -xC -yC -w 80% -h 75% -E 'tmux attach-session -t popup || tmux new-session -s popup'
      }
    '';
  };
}

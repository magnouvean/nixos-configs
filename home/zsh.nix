{ ... }:
{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    dotDir = ".config/zsh";
    localVariables = {
      "ZSH_AUTOSUGGEST_STRATEGY" = [
        "history"
        "completion"
      ];
    };
    sessionVariables = {
      "BAT_THEME" = "ansi";
      "EDITOR" = "vim";
    };
    shellGlobalAliases = {
      cat = "bat";
      gad = "git add";
      gco = "git commit";
      gpl = "git pull";
      gpu = "git push";
      grm = "git rm";
      gst = "git status";
      ls = "exa -a";
      t = "tmux";
    };
    initExtra = ''
      # Prompt
      autoload -Uz vcs_info
      zstyle ':vcs_info:*' enable git svn
      zstyle ':vcs_info:git*' formats "- (%b) "
      precmd() {
          vcs_info
      }
      setopt prompt_subst
      prompt='%B%F{blue}%2/%f ''${vcs_info_msg_0_}%F{green}>%f%b '

      # Vi-style menu selection
      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit
      _comp_options+=(globdots)
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history
    '';
  };
}

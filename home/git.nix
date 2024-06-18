{ ... }: {
  # Git
  programs.git = {
    enable = true;
    extraConfig = {
      commit.gpgsign = true;
      init.defaultBranch = "main";
      pull.rebase = false;
      user.email = "c6af1d08-d039-472f-b890-6eaf2e96e961@anonaddy.me";
      user.name = "magnouvean";
      user.signingkey = "671B3796AB6E0A04";
    };
  };
}

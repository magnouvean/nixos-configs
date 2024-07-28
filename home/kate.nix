{ ... }:
{
  programs.kate = {
    enable = true;
    editor = {
      inputMode = "vi";
      font = {
        family = "JetBrainsMono Nerd Font";
        pointSize = 11;
      };
      brackets.automaticallyAddClosing = true;
    };
  };
}

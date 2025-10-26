{ ... }:
{
  imports = [ ./plasma.nix ];
  services.syncthing.enable = true;

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "rust"
      "clojure"
      "csharp"
      "direnv"
      "vim"
      "github-dark-default"
    ];
    userSettings = {
      theme = {
        mode = "system";
        light = "GitHub Dark Default";
        dark = "GitHub Dark Default";
      };
      "vim_mode" = true;
      "ui_font_family" = "JetBrains Mono";
      "ui_font_size" = 16;
      "buffer_font_family" = "JetBrains Mono";
      "buffer_font_size" = 16;
      "format_on_save" = "on";
      lsp = {
        nil = {
          "initialization_options" = {
            formatting = {
              command = [ "nixfmt" ];
            };
          };
        };
      };
    };
  };

  home.file = {
    ".zshrc".source = ./files/zsh/zshrc;

    ".config/kitty" = {
      source = ./files/kitty;
      recursive = true;
    };
  };

  home.stateVersion = "25.05";
}

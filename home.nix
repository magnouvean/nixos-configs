{ ... }:
{
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
      languages = {
        cs = {
          language_servers = [ "omnisharp" ];
        };
        python = {
          language_servers = [ "basedpyright" ];
        };
      };
      lsp = {
        nil = {
          "initialization_options" = {
            formatting = {
              command = [ "nixfmt" ];
            };
          };
        };
        omnisharp = {
          command = "OmniSharp";
          args = [ ];
          env = {
            PATH = "$PATH";
          };
          language_ids = [ "cs" ];
        };
        basedpyright = {
          command = "basedpyright-langserver";
          args = [ "--stdio" ];
          env = {
            PATH = "$PATH";
          };
          language_ids = [ "python" ];
        };
      };
    };
  };

  home.file = {
    ".zshrc".source = ./files/zsh/zshrc;
    ".config/cosmic" = {
      source = ./files/cosmic;
      recursive = true;
    };
    ".config/cosmic-initial-setup-done".text = "";
  };

  home.stateVersion = "25.05";
}

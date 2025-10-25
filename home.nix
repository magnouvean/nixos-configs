{ ... }:
{
  services.syncthing.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        icon-theme = "Papirus-Dark";
        gtk-theme = "Dracula";
      };
    };
  };

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "rust"
      "dracula"
      "clojure"
      "csharp"
      "direnv"
      "vim"
    ];
    userSettings = {
      theme = {
        mode = "system";
        light = "Dracula Solid";
        dark = "Dracula Solid";
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
    ".config/hypr" = {
      source = ./files/hypr;
      recursive = true;
    };

    ".config/waybar" = {
      source = ./files/waybar;
      recursive = true;
    };

    ".config/wofi" = {
      source = ./files/wofi;
      recursive = true;
    };

    ".zshrc".source = ./files/zsh/zshrc;
  };

  home.stateVersion = "25.05";
}

{ ... }:
{
  programs.nixvim = {
    enable = true;
    colorschemes.oxocarbon.enable = true;
    plugins = {
      # Editor stuff
      nix.enable = true;
      nvim-autopairs.enable = true;
      treesitter = {
        enable = true;
        settings.indent.enable = true;
      };
      comment.enable = true;
      todo-comments.enable = true;

      # Code formatting
      none-ls = {
        enable = true;
        sources = {
          formatting = {
            black.enable = true;
            csharpier.enable = true;
            nixpkgs_fmt.enable = true;
            shfmt.enable = true;
          };
        };
      };

      # LSP
      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          nil-ls.enable = true;
          csharp-ls.enable = true;
          bashls.enable = true;
          marksman.enable = true;
        };
        keymaps = {
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            K = {
              action = "hover";
              desc = "Hover";
            };
            "<leader>cr" = {
              action = "rename";
              desc = "Rename";
            };
          };
          diagnostic = {
            "[d" = {
              action = "goto_prev";
              desc = "Go to previous [D]iagnostic message";
            };
            "]d" = {
              action = "goto_next";
              desc = "Go to next [D]iagnostic message";
            };
          };
        };
      };
      lsp-format.enable = true;

      # CMP
      cmp-buffer.enable = true;
      cmp-cmdline.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp = {
        enable = true;
        settings = {
          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
            "<C-p>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
            "<CR>" = "cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert })";
          };
          sources = [
            { name = "buffer"; priority = 2; }
            { name = "cmdline"; priority = 2; }
            { name = "codeium"; priority = 1; }
            { name = "nvim_lsp"; prority = 1; }
            { name = "path"; priority = 1; }
          ];
        };
      };

      # Various plugins
      bufferline.enable = true;
      lualine.enable = true;
      nvim-tree = {
        enable = true;
        git.enable = true;
        syncRootWithCwd = true;
      };
      toggleterm = {
        enable = true;
        settings = {
          open_mapping = "[[<f12>]]";
          direction = "float";
        };
      };
      telescope.enable = true;
      which-key.enable = true;
      direnv.enable = true;
      codeium-nvim = {
        enable = true;
        extraOptions.enable_chat = true;
      };
      sniprun = {
        enable = true;
        settings = {
          selected_interpreters = [ "Python3_fifo" ];
          repl_enable = [ "Python3_fifo" ];
          display = [ "TerminalWithCode" ];
        };
      };
    };

    # Some general settings
    opts = {
      number = true;
      relativenumber = true;
      foldenable = false;
      guifont = "JetBrainsMono Nerd Font:h11";
    };

    # Keymaps
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":NvimTreeToggle<CR>";
      }
      {
        mode = [ "v" "n" ];
        key = "<C-c><C-c>";
        action = ":SnipRun<CR>";
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = ":Telescope find_files<CR>";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = ":Telescope live_grep<CR>";
      }
    ];
  };
}

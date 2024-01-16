{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      ChatGPT-nvim
      bufferline-nvim
      catppuccin-nvim
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp_luasnip
      comment-nvim
      diffview-nvim
      direnv-vim
      lualine-nvim
      luasnip
      markdown-preview-nvim
      mini-nvim
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      playground
      telescope-nvim
      telescope-project-nvim
      tmux-nvim
      vim-fugitive
      vim-slime
      vimtex
      which-key-nvim
    ];
    extraLuaConfig = (builtins.readFile ../files/neovim/init.lua);
  };
  home.file.".config/nvim/get_openai.sh" = {
    text = "cat ~/.config/shell_gpt/.sgptrc | rg OPENAI_API_KEY | cut -d = -f2";
    executable = true;
  };
}

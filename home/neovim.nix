{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      bufferline-nvim
      catppuccin-nvim
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp_luasnip
      comment-nvim
      diffview-nvim
      direnv-vim
      iron-nvim
      lualine-nvim
      luasnip
      markdown-preview-nvim
      mini-nvim
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      nvim-ts-rainbow2
      nvim-web-devicons
      playground
      telescope-nvim
      telescope-project-nvim
      vim-fugitive
      vimtex
      which-key-nvim
    ];
    extraLuaConfig = (builtins.readFile ../files/neovim/init.lua);
  };
  home.packages = with pkgs; [ neovide ];
}

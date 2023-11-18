{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      cmp-nvim-lsp
      cmp_luasnip
      comment-nvim
      diffview-nvim
      direnv-vim
      iron-nvim
      kanagawa-nvim
      lualine-nvim
      luasnip
      markdown-preview-nvim
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      playground
      telescope-nvim
      telescope-project-nvim
      toggleterm-nvim
      vim-fugitive
      vimtex
      which-key-nvim
    ];
    extraLuaConfig = (builtins.readFile ../files/neovim/init.lua);
  };
}

{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      cmp-nvim-lsp
      cmp_luasnip
      diffview-nvim
      direnv-vim
      iron-nvim
      lualine-nvim
      luasnip
      markdown-preview-nvim
      mini-nvim
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

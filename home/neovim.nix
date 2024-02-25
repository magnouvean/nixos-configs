{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      bufferline-nvim
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp_luasnip
      comment-nvim
      direnv-vim
      dracula-nvim
      iron-nvim
      lualine-nvim
      luasnip
      markdown-preview-nvim
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      telescope-nvim
      toggleterm-nvim
      vimtex
      which-key-nvim
    ];
    extraLuaConfig = (builtins.readFile ../files/neovim/init.lua);
  };
}

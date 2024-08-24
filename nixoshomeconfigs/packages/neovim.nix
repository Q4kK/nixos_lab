{ pkgs, ... }:
let

  customTreeSitter = (pkgs.vimPlugins.nvim-treesitter.withPlugins [
    pkgs.bash
    pkgs.comment
    pkgs.fish
    pkgs.gitattributes
    pkgs.gitignore
    pkgs.lua
    pkgs.make
    pkgs.nix
    pkgs.rust
    pkgs.toml
    pkgs.yaml
  ]);

    treesitter-parsers = pkgs.symlinkJoin {
      name = "treesitter-parsers";
      paths = customTreeSitter.dependencies;
    };

in
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim;
    vimAlias = true;
    coc.enable = false;

    plugins = [
      customTreeSitter
    ];
  };

  home.file."./.config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };
  
  home.file."./.config/nvim/lua/custom_neovim/init.lua".text = ''
      vim.opt.runtimepath:append("${treesitter-parsers}")
    '';
  
  home.file."./.local/share/nvim/nix/nvim-treesitter/" = {
    recursive = true;
    source = customTreeSitter;
  };
}

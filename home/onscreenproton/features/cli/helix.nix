{ config, ... }: {
  home.sessionVariables.COLORTERM = "truecolor";
  home.sessionVariables.EDITOR = "hx";
  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";
      editor = {
        color-modes = true;
        line-number = "relative";
        indent-guides.render = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
  };
}
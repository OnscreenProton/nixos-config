{ pkgs, lib, config, ... }: {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    aliases = {
      ff = "merge --ff-only";
      pushall = "!git remote | xargs -L1 git push --all";
      graph = "log --decorate --oneline --graph";
      add-nowhitespace = "!git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -";
      fast-forward = "merge --ff-only";
    };
    userName = "OnscreenProton";
    userEmail = "onscreenproton@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      # gpg.program = "${config.programs.gpg.package}/bin/gpg2";
    };
    signing = {
      key = "6E7A1E8ED571D3143011B23B8F15EFF5308F9DF2";
      signByDefault = true;
      gpgPath = "${config.programs.gpg.package}/bin/gpg2";
    };
    lfs.enable = true;
    ignores = [ ".direnv" "result" ];
  };
}

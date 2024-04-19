{
  inputs,
  pkgs,
  outputs,
  ...
}: {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "gitea" ''
      ssh -p 222 -o StrictHostKeyChecking=no git@127.0.0.1 "SSH_ORIGINAL_COMMAND=\"$SSH_ORIGINAL_COMMAND\" $0 $@"
    '')
  ];

  system.activationScripts.gitealink.text = ''
    mkdir -p /usr/local/bin
    rm /usr/local/bin/gitea || true
    ln -s /run/current-system/sw/bin/gitea /usr/local/bin/gitea
  '';
}

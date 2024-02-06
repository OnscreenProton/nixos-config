{ lib
, formats
, stdenv
, fetchFromGitHub
, phonon
, qtgraphicaleffects
, qtmultimedia
, qtquickcontrols
, themeConfig ? { }
}:
let
  user-cfg = (formats.ini {  }).generate "theme.conf.user" themeConfig;
in
stdenv.mkDerivation rec {
  pname = "aerial-sddm-theme";
  version = "74fb9d0";

  src = fetchFromGitHub {
    owner = "3ximus";
    repo = pname;
    rev = "74fb9d0b2cfc3b63f401606b416e908a71efc447";
    hash = "sha256-XXYnvl2uT+u9Ikm97Opa1WwabDDNoAe7HWhUhUzOomQ=";
  };

  propagatedBuildInputs = [
    phonon
    qtgraphicaleffects
    qtmultimedia
    qtquickcontrols
  ];

  dontWrapQtApps = true;

  postInstall = ''
    mkdir -p $out/share/sddm/themes/aerial-sddm-theme

    mv * $out/share/sddm/themes/aerial-sddm-theme/
  '' + lib.optionalString (lib.isAttrs themeConfig) ''
    ln -sf ${user-cfg} $out/share/sddm/themes/aerial-sddm-theme/theme.conf.user
  '';

  postFixup = ''
    mkdir -p $out/nix-support

    echo ${qtgraphicaleffects} ${qtmultimedia} ${qtquickcontrols} >> $out/nix-support/propagated-user-env-packages
  '';

  meta = with lib; {
    description = "SDDM theme with Apple TV Aerial videos";
    homepage = "https://github.com/3ximus/aerial-sddm-theme";
    license = licenses.gpl3;
    maintainers = with maintainers; [ OnscreenProton ];
  };
}

{
  lib,
  stdenv,
  fetchFromGitHub,
  substituteAll,
  gjs,
  vte,
  gnome,
}:
stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-fly-pie";
  version = "unstable-2023-09-23";

  src = fetchzip {
    url = "https://extensions.gnome.org/extension-data/flypieschneegans.github.com.v4.shell-extension.zip";
    sha256 = "";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/share/gnome-shell/extensions"
    cp -r "fly-pie@schneegans.github.com" "$out/share/gnome-shell/extensions/"
    runHook postInstall
  '';

  passthru = {
    extensionUuid = "fly-pie@schneegans.github.com";
    extensionPortalSlug = "fly-pie";
  };

  meta = with lib; {
    description = "Fly-Pie is an innovative marking menu written as a GNOME Shell extension.";
    license = licenses.mit;
    maintainers = with maintainers; [onscreenproton];
    homepage = "https://github.com/schneegans/fly-pie";
    platforms = gnome.gnome-shell.meta.platforms;
  };
}

{ lib, stdenv, fetchurl, fox, pkg-config, gettext, xlibsWrapper, xcbutil, gcc, intltool, file, libpng }:

stdenv.mkDerivation rec {
  pname = "xfe";
  version = "1.44";

  src = fetchurl {
    url = "mirror://sourceforge/xfe/xfe-${version}.tar.xz";
    sha256 = "594c14d185bdfc7e3132aefda7cf4e233625258ca9a1939359944a2c07c030b6";
  };

  nativeBuildInputs = [ pkg-config intltool ];
  buildInputs = [ fox gettext xlibsWrapper xcbutil gcc file libpng ];

  preConfigure = ''
    sed -i s,/usr/share/xfe,$out/share/xfe, src/xfedefs.h
  '';

  enableParallelBuilding = true;

  meta = with lib; {
    description = "MS-Explorer like file manager for X";
    longDescription = ''
      X File Explorer (Xfe) is an MS-Explorer like file manager for X.
      It is based on the popular, but discontinued, X Win Commander, which was developed by Maxim Baranov.
      Xfe aims to be the filemanager of choice for all the Unix addicts!
    '';
    homepage = "https://sourceforge.net/projects/xfe/";
    license = licenses.gpl2;
    maintainers = with maintainers; [ ];
    platforms = platforms.linux;
  };
}

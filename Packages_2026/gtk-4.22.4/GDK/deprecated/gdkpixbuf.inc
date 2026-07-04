  {$IFDEF read_interface}

function gdk_pixbuf_get_from_surface(surface: Pcairo_surface_t; src_x, src_y, width, height: longint): PGdkPixbuf; cdecl; external libgtk4; deprecated;
function gdk_pixbuf_get_from_texture(texture: PGdkTexture): PGdkPixbuf; cdecl; external libgtk4; deprecated;

// === Konventiert am: 2-8-24 17:32:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

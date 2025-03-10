
{$IFDEF read_interface}

procedure gdk_cairo_set_source_rgba(cr: Pcairo_t; rgba: PGdkRGBA); cdecl; external libgtk4;
procedure gdk_cairo_set_source_pixbuf(cr: Pcairo_t; pixbuf: PGdkPixbuf; pixbuf_x: Tdouble; pixbuf_y: Tdouble); cdecl; external libgtk4;
procedure gdk_cairo_rectangle(cr: Pcairo_t; rectangle: PGdkRectangle); cdecl; external libgtk4;
procedure gdk_cairo_region(cr: Pcairo_t; region: Pcairo_region_t); cdecl; external libgtk4;
function gdk_cairo_region_create_from_surface(surface: Pcairo_surface_t): Pcairo_region_t; cdecl; external libgtk4;
procedure gdk_cairo_draw_from_gl(cr: Pcairo_t; surface: PGdkSurface; Source: longint; source_type: longint; buffer_scale: longint;  x: longint; y: longint; Width: longint; Height: longint); cdecl; external libgtk4; deprecated 'GDK_DEPRECATED_IN_4_6_FOR(gdk_gl_texture_new)';

// === Konventiert am: 30-7-24 17:34:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

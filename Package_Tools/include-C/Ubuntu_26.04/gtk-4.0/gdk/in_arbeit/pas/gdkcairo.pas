unit gdkcairo;

interface

uses
  fp_glib2, fp_cairo, gdk2pixbuf, fp_gtk4, gdktypes, gdkrgba;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure gdk_cairo_set_source_rgba(cr: Pcairo_t; rgba: PGdkRGBA); cdecl; external libgtk4;
procedure gdk_cairo_set_source_pixbuf(cr: Pcairo_t; pixbuf: PGdkPixbuf; pixbuf_x: double; pixbuf_y: double); cdecl; external libgtk4; deprecated;
procedure gdk_cairo_rectangle(cr: Pcairo_t; rectangle: PGdkRectangle); cdecl; external libgtk4;
procedure gdk_cairo_region(cr: Pcairo_t; region: Pcairo_region_t); cdecl; external libgtk4;
function gdk_cairo_region_create_from_surface(surface: Pcairo_surface_t): Pcairo_region_t; cdecl; external libgtk4;
procedure gdk_cairo_draw_from_gl(cr: Pcairo_t; surface: PGdkSurface; source: longint; source_type: longint; buffer_scale: longint;
  x: longint; y: longint; width: longint; height: longint); cdecl; external libgtk4; deprecated;

// === Konventiert am: 2-7-26 17:35:50 ===


implementation



end.

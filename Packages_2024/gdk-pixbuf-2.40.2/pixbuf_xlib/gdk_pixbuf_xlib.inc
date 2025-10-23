{$IFDEF read_interface}


procedure gdk_pixbuf_xlib_init(display: PDisplay; screen_num: longint); cdecl; external libgdk_pixbuf_xlib2;
procedure gdk_pixbuf_xlib_init_with_depth(display: PDisplay; screen_num: longint; prefDepth: longint); cdecl; external libgdk_pixbuf_xlib2;
procedure gdk_pixbuf_xlib_render_threshold_alpha(pixbuf: PGdkPixbuf; bitmap: TPixmap; src_x: longint; src_y: longint; dest_x: longint;
  dest_y: longint; width: longint; height: longint; alpha_threshold: longint); cdecl; external libgdk_pixbuf_xlib2;
procedure gdk_pixbuf_xlib_render_to_drawable(pixbuf: PGdkPixbuf; drawable: TDrawable; gc: TGC; src_x: longint; src_y: longint;
  dest_x: longint; dest_y: longint; width: longint; height: longint; dither: TXlibRgbDither;
  x_dither: longint; y_dither: longint); cdecl; external libgdk_pixbuf_xlib2;
procedure gdk_pixbuf_xlib_render_to_drawable_alpha(pixbuf: PGdkPixbuf; drawable: TDrawable; src_x: longint; src_y: longint; dest_x: longint;
  dest_y: longint; width: longint; height: longint; alpha_mode: TGdkPixbufAlphaMode; alpha_threshold: longint;
  dither: TXlibRgbDither; x_dither: longint; y_dither: longint); cdecl; external libgdk_pixbuf_xlib2;
procedure gdk_pixbuf_xlib_render_pixmap_and_mask(pixbuf: PGdkPixbuf; pixmap_return: PPixmap; mask_return: PPixmap; alpha_threshold: longint); cdecl; external libgdk_pixbuf_xlib2;
function gdk_pixbuf_xlib_get_from_drawable(dest: PGdkPixbuf; src: TDrawable; cmap: TColormap; visual: PVisual; src_x: longint;
  src_y: longint; dest_x: longint; dest_y: longint; width: longint; height: longint): PGdkPixbuf; cdecl; external libgdk_pixbuf_xlib2;

// === Konventiert am: 27-5-25 15:00:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

  {$IFDEF read_interface}


type
  TXlibRgbCmap = record
    colors: array[0..255] of dword;
    lut: array[0..255] of byte;
  end;
  PXlibRgbCmap = ^TXlibRgbCmap;


procedure xlib_rgb_init(display: PDisplay; screen: PScreen); cdecl; external libgdk_pixbuf_xlib2;
procedure xlib_rgb_init_with_depth(display: PDisplay; screen: PScreen; prefDepth: longint); cdecl; external libgdk_pixbuf_xlib2;
function xlib_rgb_xpixel_from_rgb(rgb: Tguint32): dword; cdecl; external libgdk_pixbuf_xlib2;
procedure xlib_rgb_gc_set_foreground(gc: TGC; rgb: Tguint32); cdecl; external libgdk_pixbuf_xlib2;
procedure xlib_rgb_gc_set_background(gc: TGC; rgb: Tguint32); cdecl; external libgdk_pixbuf_xlib2;

type
  PXlibRgbDither = ^TXlibRgbDither;
  TXlibRgbDither = longint;

const
  XLIB_RGB_DITHER_NONE = 0;
  XLIB_RGB_DITHER_NORMAL = 1;
  XLIB_RGB_DITHER_MAX = 2;

procedure xlib_draw_rgb_image(drawable: TDrawable; gc: TGC; x: longint; y: longint; width: longint;
  height: longint; dith: TXlibRgbDither; rgb_buf: pbyte; rowstride: longint); cdecl; external libgdk_pixbuf_xlib2;
procedure xlib_draw_rgb_image_dithalign(drawable: TDrawable; gc: TGC; x: longint; y: longint; width: longint;
  height: longint; dith: TXlibRgbDither; rgb_buf: pbyte; rowstride: longint; xdith: longint;
  ydith: longint); cdecl; external libgdk_pixbuf_xlib2;
procedure xlib_draw_rgb_32_image(drawable: TDrawable; gc: TGC; x: longint; y: longint; width: longint;
  height: longint; dith: TXlibRgbDither; buf: pbyte; rowstride: longint); cdecl; external libgdk_pixbuf_xlib2;
procedure xlib_draw_gray_image(drawable: TDrawable; gc: TGC; x: longint; y: longint; width: longint;
  height: longint; dith: TXlibRgbDither; buf: pbyte; rowstride: longint); cdecl; external libgdk_pixbuf_xlib2;
function xlib_rgb_cmap_new(colors: Pguint32; n_colors: longint): PXlibRgbCmap; cdecl; external libgdk_pixbuf_xlib2;
procedure xlib_rgb_cmap_free(cmap: PXlibRgbCmap); cdecl; external libgdk_pixbuf_xlib2;
procedure xlib_draw_indexed_image(drawable: TDrawable; gc: TGC; x: longint; y: longint; width: longint;
  height: longint; dith: TXlibRgbDither; buf: pbyte; rowstride: longint; cmap: PXlibRgbCmap); cdecl; external libgdk_pixbuf_xlib2;
function xlib_rgb_ditherable: TBool; cdecl; external libgdk_pixbuf_xlib2;
procedure xlib_rgb_set_verbose(verbose: TBool); cdecl; external libgdk_pixbuf_xlib2;
procedure xlib_rgb_set_install(install: TBool); cdecl; external libgdk_pixbuf_xlib2;
procedure xlib_rgb_set_min_colors(min_colors: longint); cdecl; external libgdk_pixbuf_xlib2;
function xlib_rgb_get_cmap: TColormap; cdecl; external libgdk_pixbuf_xlib2;
function xlib_rgb_get_visual: PVisual; cdecl; external libgdk_pixbuf_xlib2;
function xlib_rgb_get_visual_info: PXVisualInfo; cdecl; external libgdk_pixbuf_xlib2;
function xlib_rgb_get_depth: longint; cdecl; external libgdk_pixbuf_xlib2;
function xlib_rgb_get_display: PDisplay; cdecl; external libgdk_pixbuf_xlib2;
function xlib_rgb_get_screen: PScreen; cdecl; external libgdk_pixbuf_xlib2;

// === Konventiert am: 27-5-25 15:00:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

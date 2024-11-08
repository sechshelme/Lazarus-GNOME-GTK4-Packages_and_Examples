/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-11-2024   19:15                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGdkInterpType = ^TGdkInterpType;
  TGdkInterpType = longint;

const
  GDK_INTERP_NEAREST = 0;
  GDK_INTERP_TILES = 1;
  GDK_INTERP_BILINEAR = 2;
  GDK_INTERP_HYPER = 3;

type
  PGdkPixbufRotation = ^TGdkPixbufRotation;
  TGdkPixbufRotation = longint;

const
  GDK_PIXBUF_ROTATE_NONE = 0;
  GDK_PIXBUF_ROTATE_COUNTERCLOCKWISE = 90;
  GDK_PIXBUF_ROTATE_UPSIDEDOWN = 180;
  GDK_PIXBUF_ROTATE_CLOCKWISE = 270;

procedure gdk_pixbuf_scale(src: PGdkPixbuf; dest: PGdkPixbuf; dest_x: longint; dest_y: longint; dest_width: longint;
  dest_height: longint; offset_x: Tdouble; offset_y: Tdouble; scale_x: Tdouble; scale_y: Tdouble;
  interp_type: TGdkInterpType); cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_composite(src: PGdkPixbuf; dest: PGdkPixbuf; dest_x: longint; dest_y: longint; dest_width: longint;
  dest_height: longint; offset_x: Tdouble; offset_y: Tdouble; scale_x: Tdouble; scale_y: Tdouble;
  interp_type: TGdkInterpType; overall_alpha: longint); cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_composite_color(src: PGdkPixbuf; dest: PGdkPixbuf; dest_x: longint; dest_y: longint; dest_width: longint;
  dest_height: longint; offset_x: Tdouble; offset_y: Tdouble; scale_x: Tdouble; scale_y: Tdouble;
  interp_type: TGdkInterpType; overall_alpha: longint; check_x: longint; check_y: longint; check_size: longint;
  color1: Tguint32; color2: Tguint32); cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_scale_simple(src: PGdkPixbuf; dest_width: longint; dest_height: longint; interp_type: TGdkInterpType): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_composite_color_simple(src: PGdkPixbuf; dest_width: longint; dest_height: longint; interp_type: TGdkInterpType; overall_alpha: longint;
  check_size: longint; color1: Tguint32; color2: Tguint32): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_rotate_simple(src: PGdkPixbuf; angle: TGdkPixbufRotation): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_flip(src: PGdkPixbuf; horizontal: Tgboolean): PGdkPixbuf; cdecl; external libgdk_pixbuf2;

// === Konventiert am: 8-11-24 17:07:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

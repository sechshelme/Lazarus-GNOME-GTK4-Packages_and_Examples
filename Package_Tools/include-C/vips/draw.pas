unit draw;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_vips, image;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PVipsCombineMode = ^TVipsCombineMode;
  TVipsCombineMode = longint;

const
  VIPS_COMBINE_MODE_SET = 0;
  VIPS_COMBINE_MODE_ADD = 1;
  VIPS_COMBINE_MODE_LAST = 2;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_draw_rect(image: PVipsImage; ink: Pdouble; n: longint; left: longint; top: longint; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_draw_rect1(image: PVipsImage; ink: double; left: longint; top: longint; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_draw_point(image: PVipsImage; ink: Pdouble; n: longint; x: longint; y: longint): longint; varargs; cdecl; external libvips;
function vips_draw_point1(image: PVipsImage; ink: double; x: longint; y: longint): longint; varargs; cdecl; external libvips;
function vips_draw_image(image: PVipsImage; sub: PVipsImage; x: longint; y: longint): longint; varargs; cdecl; external libvips;
function vips_draw_mask(image: PVipsImage; ink: Pdouble; n: longint; mask: PVipsImage; x: longint; y: longint): longint; varargs; cdecl; external libvips;
function vips_draw_mask1(image: PVipsImage; ink: double; mask: PVipsImage; x: longint; y: longint): longint; varargs; cdecl; external libvips;
function vips_draw_line(image: PVipsImage; ink: Pdouble; n: longint; x1: longint; y1: longint; x2: longint; y2: longint): longint; varargs; cdecl; external libvips;
function vips_draw_line1(image: PVipsImage; ink: double; x1: longint; y1: longint; x2: longint; y2: longint): longint; varargs; cdecl; external libvips;
function vips_draw_circle(image: PVipsImage; ink: Pdouble; n: longint; cx: longint; cy: longint; radius: longint): longint; varargs; cdecl; external libvips;
function vips_draw_circle1(image: PVipsImage; ink: double; cx: longint; cy: longint; radius: longint): longint; varargs; cdecl; external libvips;
function vips_draw_flood(image: PVipsImage; ink: Pdouble; n: longint; x: longint; y: longint): longint; varargs; cdecl; external libvips;
function vips_draw_flood1(image: PVipsImage; ink: double; x: longint; y: longint): longint; varargs; cdecl; external libvips;
function vips_draw_smudge(image: PVipsImage; left: longint; top: longint; width: longint; height: longint): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:14:11 ===


implementation



end.

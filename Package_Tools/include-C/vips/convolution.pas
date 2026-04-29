unit convolution;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_vips, image;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PVipsCombine = ^TVipsCombine;
  TVipsCombine = longint;

const
  VIPS_COMBINE_MAX = 0;
  VIPS_COMBINE_SUM = 1;
  VIPS_COMBINE_MIN = 2;
  VIPS_COMBINE_LAST = 3;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_conv(in_: PVipsImage; out_: PPVipsImage; mask: PVipsImage): longint; varargs; cdecl; external libvips;
function vips_convf(in_: PVipsImage; out_: PPVipsImage; mask: PVipsImage): longint; varargs; cdecl; external libvips;
function vips_convi(in_: PVipsImage; out_: PPVipsImage; mask: PVipsImage): longint; varargs; cdecl; external libvips;
function vips_conva(in_: PVipsImage; out_: PPVipsImage; mask: PVipsImage): longint; varargs; cdecl; external libvips;
function vips_convsep(in_: PVipsImage; out_: PPVipsImage; mask: PVipsImage): longint; varargs; cdecl; external libvips;
function vips_convasep(in_: PVipsImage; out_: PPVipsImage; mask: PVipsImage): longint; varargs; cdecl; external libvips;
function vips_compass(in_: PVipsImage; out_: PPVipsImage; mask: PVipsImage): longint; varargs; cdecl; external libvips;
function vips_gaussblur(in_: PVipsImage; out_: PPVipsImage; sigma: double): longint; varargs; cdecl; external libvips;
function vips_sharpen(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_spcor(in_: PVipsImage; ref: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_fastcor(in_: PVipsImage; ref: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_sobel(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_scharr(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_prewitt(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_canny(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:14:45 ===


implementation



end.

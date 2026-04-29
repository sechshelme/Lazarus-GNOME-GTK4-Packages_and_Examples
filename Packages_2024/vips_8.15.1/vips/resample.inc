

  {$IFDEF read_enum}
type
  PVipsKernel = ^TVipsKernel;
  TVipsKernel = longint;

const
  VIPS_KERNEL_NEAREST = 0;
  VIPS_KERNEL_LINEAR = 1;
  VIPS_KERNEL_CUBIC = 2;
  VIPS_KERNEL_MITCHELL = 3;
  VIPS_KERNEL_LANCZOS2 = 4;
  VIPS_KERNEL_LANCZOS3 = 5;
  VIPS_KERNEL_LAST = 6;

type
  PVipsSize = ^TVipsSize;
  TVipsSize = longint;

const
  VIPS_SIZE_BOTH = 0;
  VIPS_SIZE_UP = 1;
  VIPS_SIZE_DOWN = 2;
  VIPS_SIZE_FORCE = 3;
  VIPS_SIZE_LAST = 4;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_shrink(in_: PVipsImage; out_: PPVipsImage; hshrink: double; vshrink: double): longint; varargs; cdecl; external libvips;
function vips_shrinkh(in_: PVipsImage; out_: PPVipsImage; hshrink: longint): longint; varargs; cdecl; external libvips;
function vips_shrinkv(in_: PVipsImage; out_: PPVipsImage; vshrink: longint): longint; varargs; cdecl; external libvips;
function vips_reduce(in_: PVipsImage; out_: PPVipsImage; hshrink: double; vshrink: double): longint; varargs; cdecl; external libvips;
function vips_reduceh(in_: PVipsImage; out_: PPVipsImage; hshrink: double): longint; varargs; cdecl; external libvips;
function vips_reducev(in_: PVipsImage; out_: PPVipsImage; vshrink: double): longint; varargs; cdecl; external libvips;
function vips_thumbnail(filename: pchar; out_: PPVipsImage; width: longint): longint; varargs; cdecl; external libvips;
function vips_thumbnail_buffer(buf: pointer; len: Tsize_t; out_: PPVipsImage; width: longint): longint; varargs; cdecl; external libvips;
function vips_thumbnail_image(_in: PVipsImage; out_: PPVipsImage; width: longint): longint; varargs; cdecl; external libvips;
function vips_thumbnail_source(source: PVipsSource; out_: PPVipsImage; width: longint): longint; varargs; cdecl; external libvips;
function vips_similarity(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_rotate(in_: PVipsImage; out_: PPVipsImage; angle: double): longint; varargs; cdecl; external libvips;
function vips_affine(in_: PVipsImage; out_: PPVipsImage; a: double; b: double; c: double; d: double): longint; varargs; cdecl; external libvips;
function vips_resize(in_: PVipsImage; out_: PPVipsImage; scale: double): longint; varargs; cdecl; external libvips;
function vips_mapim(in_: PVipsImage; out_: PPVipsImage; index: PVipsImage): longint; varargs; cdecl; external libvips;
function vips_quadratic(in_: PVipsImage; out_: PPVipsImage; coeff: PVipsImage): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:10:27 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}

unit morphology;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_vips, image, conversion;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PVipsOperationMorphology = ^TVipsOperationMorphology;
  TVipsOperationMorphology = longint;

const
  VIPS_OPERATION_MORPHOLOGY_ERODE = 0;
  VIPS_OPERATION_MORPHOLOGY_DILATE = 1;
  VIPS_OPERATION_MORPHOLOGY_LAST = 2;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_morph(in_: PVipsImage; out_: PPVipsImage; mask: PVipsImage; morph: TVipsOperationMorphology): longint; varargs; cdecl; external libvips;
function vips_rank(in_: PVipsImage; out_: PPVipsImage; width: longint; height: longint; index: longint): longint; varargs; cdecl; external libvips;
function vips_median(in_: PVipsImage; out_: PPVipsImage; size: longint): longint; varargs; cdecl; external libvips;
function vips_countlines(in_: PVipsImage; nolines: Pdouble; direction: TVipsDirection): longint; varargs; cdecl; external libvips;
function vips_labelregions(in_: PVipsImage; mas_k: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_fill_nearest(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:12:06 ===


implementation



end.

unit create;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_vips,image;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  {$IFDEF read_enum}
type
  PVipsTextWrap = ^TVipsTextWrap;
  TVipsTextWrap = longint;

const
  VIPS_TEXT_WRAP_WORD = 0;
  VIPS_TEXT_WRAP_CHAR = 1;
  VIPS_TEXT_WRAP_WORD_CHAR = 2;
  VIPS_TEXT_WRAP_NONE = 3;
  VIPS_TEXT_WRAP_LAST = 4;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_black(out_: PPVipsImage; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_xyz(out_: PPVipsImage; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_grey(out_: PPVipsImage; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_gaussmat(out_: PPVipsImage; sigma: double; min_ampl: double): longint; varargs; cdecl; external libvips;
function vips_logmat(out_: PPVipsImage; sigma: double; min_ampl: double): longint; varargs; cdecl; external libvips;
function vips_text(out_: PPVipsImage; text: pchar): longint; varargs; cdecl; external libvips;
function vips_gaussnoise(out_: PPVipsImage; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_eye(out_: PPVipsImage; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_sines(out_: PPVipsImage; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_zone(out_: PPVipsImage; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_identity(out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_buildlut(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_invertlut(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_tonelut(out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_mask_ideal(out_: PPVipsImage; width: longint; height: longint; frequency_cutoff: double): longint; varargs; cdecl; external libvips;
function vips_mask_ideal_ring(out_: PPVipsImage; width: longint; height: longint; frequency_cutoff: double; ringwidth: double): longint; varargs; cdecl; external libvips;
function vips_mask_ideal_band(out_: PPVipsImage; width: longint; height: longint; frequency_cutoff_x: double; frequency_cutoff_y: double; radius: double): longint; varargs; cdecl; external libvips;
function vips_mask_butterworth(out_: PPVipsImage; width: longint; height: longint; order: double; frequency_cutoff: double; amplitude_cutoff: double): longint; varargs; cdecl; external libvips;
function vips_mask_butterworth_ring(out_: PPVipsImage; width: longint; height: longint; order: double; frequency_cutoff: double; amplitude_cutoff: double; ringwidth: double): longint; varargs; cdecl; external libvips;
function vips_mask_butterworth_band(out_: PPVipsImage; width: longint; height: longint; order: double; frequency_cutoff_x: double; frequency_cutoff_y: double; radius: double; amplitude_cutoff: double): longint; varargs; cdecl; external libvips;
function vips_mask_gaussian(out_: PPVipsImage; width: longint; height: longint; frequency_cutoff: double; amplitude_cutoff: double): longint; varargs; cdecl; external libvips;
function vips_mask_gaussian_ring(out_: PPVipsImage; width: longint; height: longint; frequency_cutoff: double; amplitude_cutoff: double; ringwidth: double): longint; varargs; cdecl; external libvips;
function vips_mask_gaussian_band(out_: PPVipsImage; width: longint; height: longint; frequency_cutoff_x: double; frequency_cutoff_y: double; radius: double; amplitude_cutoff: double): longint; varargs; cdecl; external libvips;
function vips_mask_fractal(out_: PPVipsImage; width: longint; height: longint; fractal_dimension: double): longint; varargs; cdecl; external libvips;
function vips_fractsurf(out_: PPVipsImage; width: longint; height: longint; fractal_dimension: double): longint; varargs; cdecl; external libvips;
function vips_worley(out_: PPVipsImage; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_perlin(out_: PPVipsImage; width: longint; height: longint): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:14:42 ===


implementation



end.

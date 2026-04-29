unit header;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_vips, basic, image;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  VIPS_META_EXIF_NAME = 'exif-data';
  VIPS_META_XMP_NAME = 'xmp-data';
  VIPS_META_IPTC_NAME = 'iptc-data';
  VIPS_META_PHOTOSHOP_NAME = 'photoshop-data';
  VIPS_META_ICC_NAME = 'icc-profile-data';
  VIPS_META_IMAGEDESCRIPTION = 'image-description';
  VIPS_META_RESOLUTION_UNIT = 'resolution-unit';
  VIPS_META_BITS_PER_SAMPLE = 'bits-per-sample';
  VIPS_META_LOADER = 'vips-loader';
  VIPS_META_SEQUENTIAL = 'vips-sequential';
  VIPS_META_ORIENTATION = 'orientation';
  VIPS_META_PAGE_HEIGHT = 'page-height';
  VIPS_META_N_PAGES = 'n-pages';
  VIPS_META_N_SUBIFDS = 'n-subifds';
  VIPS_META_CONCURRENCY = 'concurrency';
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_format_sizeof(format: TVipsBandFormat): Tguint64; cdecl; external libvips;
function vips_format_sizeof_unsafe(format: TVipsBandFormat): Tguint64; cdecl; external libvips;
function vips_interpretation_max_alpha(interpretation: TVipsInterpretation): double; cdecl; external libvips;
function vips_image_get_width(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_get_height(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_get_bands(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_get_format(image: PVipsImage): TVipsBandFormat; cdecl; external libvips;
function vips_image_get_format_max(format: TVipsBandFormat): double; cdecl; external libvips;
function vips_image_guess_format(image: PVipsImage): TVipsBandFormat; cdecl; external libvips;
function vips_image_get_coding(image: PVipsImage): TVipsCoding; cdecl; external libvips;
function vips_image_get_interpretation(image: PVipsImage): TVipsInterpretation; cdecl; external libvips;
function vips_image_guess_interpretation(image: PVipsImage): TVipsInterpretation; cdecl; external libvips;
function vips_image_get_xres(image: PVipsImage): double; cdecl; external libvips;
function vips_image_get_yres(image: PVipsImage): double; cdecl; external libvips;
function vips_image_get_xoffset(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_get_yoffset(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_get_filename(image: PVipsImage): pchar; cdecl; external libvips;
function vips_image_get_mode(image: PVipsImage): pchar; cdecl; external libvips;
function vips_image_get_scale(image: PVipsImage): double; cdecl; external libvips;
function vips_image_get_offset(image: PVipsImage): double; cdecl; external libvips;
function vips_image_get_page_height(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_get_n_pages(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_get_n_subifds(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_get_orientation(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_get_orientation_swap(image: PVipsImage): Tgboolean; cdecl; external libvips;
function vips_image_get_concurrency(image: PVipsImage; default_concurrency: longint): longint; cdecl; external libvips;
function vips_image_get_data(image: PVipsImage): pointer; cdecl; external libvips;
procedure vips_image_init_fields(image: PVipsImage; xsize: longint; ysize: longint; bands: longint; format: TVipsBandFormat;
  coding: TVipsCoding; interpretation: TVipsInterpretation; xres: double; yres: double); cdecl; external libvips;
procedure vips_image_set(image: PVipsImage; name: pchar; value: PGValue); cdecl; external libvips;
function vips_image_get(image: PVipsImage; name: pchar; value_copy: PGValue): longint; cdecl; external libvips;
function vips_image_get_as_string(image: PVipsImage; name: pchar; out_: PPchar): longint; cdecl; external libvips;
function vips_image_get_typeof(image: PVipsImage; name: pchar): TGType; cdecl; external libvips;
function vips_image_remove(image: PVipsImage; name: pchar): Tgboolean; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsImageMapFn = function(image: PVipsImage; name: pchar; value: PGValue; a: pointer): pointer; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_image_map(image: PVipsImage; fn: TVipsImageMapFn; a: pointer): pointer; cdecl; external libvips;
function vips_image_get_fields(image: PVipsImage): PPgchar; cdecl; external libvips;
procedure vips_image_set_area(image: PVipsImage; name: pchar; free_fn: TVipsCallbackFn; data: pointer); cdecl; external libvips;
function vips_image_get_area(image: PVipsImage; name: pchar; data: Ppointer): longint; cdecl; external libvips;
procedure vips_image_set_blob(image: PVipsImage; name: pchar; free_fn: TVipsCallbackFn; data: pointer; length: Tsize_t); cdecl; external libvips;
procedure vips_image_set_blob_copy(image: PVipsImage; name: pchar; data: pointer; length: Tsize_t); cdecl; external libvips;
function vips_image_get_blob(image: PVipsImage; name: pchar; data: Ppointer; length: Psize_t): longint; cdecl; external libvips;
function vips_image_get_int(image: PVipsImage; name: pchar; out_: Plongint): longint; cdecl; external libvips;
procedure vips_image_set_int(image: PVipsImage; name: pchar; i: longint); cdecl; external libvips;
function vips_image_get_double(image: PVipsImage; name: pchar; out_: Pdouble): longint; cdecl; external libvips;
procedure vips_image_set_double(image: PVipsImage; name: pchar; d: double); cdecl; external libvips;
function vips_image_get_string(image: PVipsImage; name: pchar; out_: PPchar): longint; cdecl; external libvips;
procedure vips_image_set_string(image: PVipsImage; name: pchar; str: pchar); cdecl; external libvips;
procedure vips_image_print_field(image: PVipsImage; name: pchar); cdecl; external libvips;
function vips_image_get_image(image: PVipsImage; name: pchar; out_: PPVipsImage): longint; cdecl; external libvips;
procedure vips_image_set_image(image: PVipsImage; name: pchar; im: PVipsImage); cdecl; external libvips;
procedure vips_image_set_array_int(image: PVipsImage; name: pchar; arr: Plongint; n: longint); cdecl; external libvips;
function vips_image_get_array_int(image: PVipsImage; name: pchar; out_: PPlongint; n: Plongint): longint; cdecl; external libvips;
function vips_image_get_array_double(image: PVipsImage; name: pchar; out_: PPdouble; n: Plongint): longint; cdecl; external libvips;
procedure vips_image_set_array_double(image: PVipsImage; name: pchar; arr: Pdouble; n: longint); cdecl; external libvips;
function vips_image_history_printf(image: PVipsImage; format: pchar): longint; varargs; cdecl; external libvips;
function vips_image_history_args(image: PVipsImage; name: pchar; argc: longint; argv: PPchar): longint; cdecl; external libvips;
function vips_image_get_history(image: PVipsImage): pchar; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:13:11 ===


implementation



end.

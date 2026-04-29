unit foreign;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_vips, basic, type_, image, connection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  TVipsForeign = record
    parent_object: TVipsOperation;
  end;
  PVipsForeign = ^TVipsForeign;

  TVipsForeignClass = record
    parent_class: TVipsOperationClass;
    priority: longint;
    suffs: ^pchar;
  end;
  PVipsForeignClass = ^TVipsForeignClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_foreign_get_type: TGType; cdecl; external libvips;
function vips_foreign_map(base: pchar; fn: TVipsSListMap2Fn; a: pointer; b: pointer): pointer; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PVipsForeignFlags = ^TVipsForeignFlags;
  TVipsForeignFlags = longint;

const
  VIPS_FOREIGN_NONE = 0;
  VIPS_FOREIGN_PARTIAL = 1;
  VIPS_FOREIGN_BIGENDIAN = 2;
  VIPS_FOREIGN_SEQUENTIAL = 4;
  VIPS_FOREIGN_ALL = 7;

type
  PVipsFailOn = ^TVipsFailOn;
  TVipsFailOn = longint;

const
  VIPS_FAIL_ON_NONE = 0;
  VIPS_FAIL_ON_TRUNCATED = 1;
  VIPS_FAIL_ON_ERROR = 2;
  VIPS_FAIL_ON_WARNING = 3;
  VIPS_FAIL_ON_LAST = 4;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TVipsForeignLoad = record
    parent_object: TVipsForeign;
    memory: Tgboolean;
    access: TVipsAccess;
    flags: TVipsForeignFlags;
    fail_on: TVipsFailOn;
    fail: Tgboolean;
    sequential: Tgboolean;
    out: PVipsImage;
    real: PVipsImage;
    nocache: Tgboolean;
    disc: Tgboolean;
    error: Tgboolean;
    revalidate: Tgboolean;
  end;
  PVipsForeignLoad = ^TVipsForeignLoad;

  TVipsForeignLoadClass = record
    parent_class: TVipsForeignClass;
    is_a: function(filename: pchar): Tgboolean; cdecl;
    is_a_buffer: function(data: pointer; size: Tsize_t): Tgboolean; cdecl;
    is_a_source: function(source: PVipsSource): Tgboolean; cdecl;
    get_flags_filename: function(filename: pchar): TVipsForeignFlags; cdecl;
    get_flags: function(load: PVipsForeignLoad): TVipsForeignFlags; cdecl;
    header: function(load: PVipsForeignLoad): longint; cdecl;
    load: function(load: PVipsForeignLoad): longint; cdecl;
  end;
  PVipsForeignLoadClass = ^TVipsForeignLoadClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_foreign_load_get_type: TGType; cdecl; external libvips;
function vips_foreign_find_load(filename: pchar): pchar; cdecl; external libvips;
function vips_foreign_find_load_buffer(data: pointer; size: Tsize_t): pchar; cdecl; external libvips;
function vips_foreign_find_load_source(source: PVipsSource): pchar; cdecl; external libvips;
function vips_foreign_flags(loader: pchar; filename: pchar): TVipsForeignFlags; cdecl; external libvips;
function vips_foreign_is_a(loader: pchar; filename: pchar): Tgboolean; cdecl; external libvips;
function vips_foreign_is_a_buffer(loader: pchar; data: pointer; size: Tsize_t): Tgboolean; cdecl; external libvips;
function vips_foreign_is_a_source(loader: pchar; source: PVipsSource): Tgboolean; cdecl; external libvips;
procedure vips_foreign_load_invalidate(image: PVipsImage); cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PVipsSaveable = ^TVipsSaveable;
  TVipsSaveable = longint;

const
  VIPS_SAVEABLE_MONO = 0;
  VIPS_SAVEABLE_RGB = 1;
  VIPS_SAVEABLE_RGBA = 2;
  VIPS_SAVEABLE_RGBA_ONLY = 3;
  VIPS_SAVEABLE_RGB_CMYK = 4;
  VIPS_SAVEABLE_ANY = 5;
  VIPS_SAVEABLE_LAST = 6;

type
  PVipsForeignKeep = ^TVipsForeignKeep;
  TVipsForeignKeep = longint;

const
  VIPS_FOREIGN_KEEP_NONE = 0;
  VIPS_FOREIGN_KEEP_EXIF = 1 shl 0;
  VIPS_FOREIGN_KEEP_XMP = 1 shl 1;
  VIPS_FOREIGN_KEEP_IPTC = 1 shl 2;
  VIPS_FOREIGN_KEEP_ICC = 1 shl 3;
  VIPS_FOREIGN_KEEP_OTHER = 1 shl 4;
  VIPS_FOREIGN_KEEP_ALL = (((VIPS_FOREIGN_KEEP_EXIF or VIPS_FOREIGN_KEEP_XMP) or VIPS_FOREIGN_KEEP_IPTC) or VIPS_FOREIGN_KEEP_ICC) or VIPS_FOREIGN_KEEP_OTHER;
  {$ENDIF read_enum}

  {$IFDEF read_struct}type
  TVipsForeignSave = record
    parent_object: TVipsForeign;
    strip: Tgboolean;
    keep: TVipsForeignKeep;
    profile: pchar;
    background: PVipsArrayDouble;
    page_height: longint;
    in_: PVipsImage;
    ready: PVipsImage;
  end;
  PVipsForeignSave = ^TVipsForeignSave;

  TVipsForeignSaveClass = record
    parent_class: TVipsForeignClass;
    saveable: TVipsSaveable;
    format_table: PVipsBandFormat;
    coding: array[0..(VIPS_CODING_LAST) - 1] of Tgboolean;
  end;
  PVipsForeignSaveClass = ^TVipsForeignSaveClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_foreign_save_get_type: TGType; cdecl; external libvips;
function vips_foreign_find_save(filename: pchar): pchar; cdecl; external libvips;
function vips_foreign_get_suffixes: PPgchar; cdecl; external libvips;
function vips_foreign_find_save_buffer(suffix: pchar): pchar; cdecl; external libvips;
function vips_foreign_find_save_target(suffix: pchar): pchar; cdecl; external libvips;
function vips_vipsload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_vipsload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_vipssave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_vipssave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
function vips_openslideload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_openslideload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PVipsForeignSubsample = ^TVipsForeignSubsample;
  TVipsForeignSubsample = longint;

const
  VIPS_FOREIGN_SUBSAMPLE_AUTO = 0;
  VIPS_FOREIGN_SUBSAMPLE_ON = 1;
  VIPS_FOREIGN_SUBSAMPLE_OFF = 2;
  VIPS_FOREIGN_SUBSAMPLE_LAST = 3;

type
  PVipsForeignJpegSubsample = ^TVipsForeignJpegSubsample;
  TVipsForeignJpegSubsample = longint;

const
  VIPS_FOREIGN_JPEG_SUBSAMPLE_AUTO = 0;
  VIPS_FOREIGN_JPEG_SUBSAMPLE_ON = 1;
  VIPS_FOREIGN_JPEG_SUBSAMPLE_OFF = 2;
  VIPS_FOREIGN_JPEG_SUBSAMPLE_LAST = 3;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_jpegload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_jpegload_buffer(buf: pointer; len: Tsize_t; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_jpegload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_jpegsave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
function vips_jpegsave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_jpegsave_buffer(in_: PVipsImage; buf: Ppointer; len: Psize_t): longint; varargs; cdecl; external libvips;
function vips_jpegsave_mime(in_: PVipsImage): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PVipsForeignWebpPreset = ^TVipsForeignWebpPreset;
  TVipsForeignWebpPreset = longint;

const
  VIPS_FOREIGN_WEBP_PRESET_DEFAULT = 0;
  VIPS_FOREIGN_WEBP_PRESET_PICTURE = 1;
  VIPS_FOREIGN_WEBP_PRESET_PHOTO = 2;
  VIPS_FOREIGN_WEBP_PRESET_DRAWING = 3;
  VIPS_FOREIGN_WEBP_PRESET_ICON = 4;
  VIPS_FOREIGN_WEBP_PRESET_TEXT = 5;
  VIPS_FOREIGN_WEBP_PRESET_LAST = 6;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_webpload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_webpload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_webpload_buffer(buf: pointer; len: Tsize_t; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_webpsave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
function vips_webpsave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_webpsave_buffer(in_: PVipsImage; buf: Ppointer; len: Psize_t): longint; varargs; cdecl; external libvips;
function vips_webpsave_mime(in_: PVipsImage): longint; varargs; cdecl; external libvips;
{$IFDEF read_enum}
type
  PVipsForeignTiffCompression = ^TVipsForeignTiffCompression;
  TVipsForeignTiffCompression = longint;

const
  VIPS_FOREIGN_TIFF_COMPRESSION_NONE = 0;
  VIPS_FOREIGN_TIFF_COMPRESSION_JPEG = 1;
  VIPS_FOREIGN_TIFF_COMPRESSION_DEFLATE = 2;
  VIPS_FOREIGN_TIFF_COMPRESSION_PACKBITS = 3;
  VIPS_FOREIGN_TIFF_COMPRESSION_CCITTFAX4 = 4;
  VIPS_FOREIGN_TIFF_COMPRESSION_LZW = 5;
  VIPS_FOREIGN_TIFF_COMPRESSION_WEBP = 6;
  VIPS_FOREIGN_TIFF_COMPRESSION_ZSTD = 7;
  VIPS_FOREIGN_TIFF_COMPRESSION_JP2K = 8;
  VIPS_FOREIGN_TIFF_COMPRESSION_LAST = 9;

type
  PVipsForeignTiffPredictor = ^TVipsForeignTiffPredictor;
  TVipsForeignTiffPredictor = longint;

const
  VIPS_FOREIGN_TIFF_PREDICTOR_NONE = 1;
  VIPS_FOREIGN_TIFF_PREDICTOR_HORIZONTAL = 2;
  VIPS_FOREIGN_TIFF_PREDICTOR_FLOAT = 3;
  VIPS_FOREIGN_TIFF_PREDICTOR_LAST = 4;

type
  PVipsForeignTiffResunit = ^TVipsForeignTiffResunit;
  TVipsForeignTiffResunit = longint;

const
  VIPS_FOREIGN_TIFF_RESUNIT_CM = 0;
  VIPS_FOREIGN_TIFF_RESUNIT_INCH = 1;
  VIPS_FOREIGN_TIFF_RESUNIT_LAST = 2;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_tiffload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_tiffload_buffer(buf: pointer; len: Tsize_t; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_tiffload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_tiffsave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_tiffsave_buffer(in_: PVipsImage; buf: Ppointer; len: Psize_t): longint; varargs; cdecl; external libvips;
function vips_tiffsave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
function vips_openexrload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_fitsload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_fitssave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_analyzeload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_rawload(filename: pchar; out_: PPVipsImage; width: longint; height: longint; bands: longint): longint; varargs; cdecl; external libvips;
function vips_rawsave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_rawsave_fd(in_: PVipsImage; fd: longint): longint; varargs; cdecl; external libvips;
function vips_csvload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_csvload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_csvsave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_csvsave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
function vips_matrixload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_matrixload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_matrixsave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_matrixsave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
function vips_matrixprint(in_: PVipsImage): longint; varargs; cdecl; external libvips;
function vips_magickload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_magickload_buffer(buf: pointer; len: Tsize_t; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_magicksave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_magicksave_buffer(in_: PVipsImage; buf: Ppointer; len: Psize_t): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PVipsForeignPngFilter = ^TVipsForeignPngFilter;
  TVipsForeignPngFilter = longint;

const
  VIPS_FOREIGN_PNG_FILTER_NONE = $08;
  VIPS_FOREIGN_PNG_FILTER_SUB = $10;
  VIPS_FOREIGN_PNG_FILTER_UP = $20;
  VIPS_FOREIGN_PNG_FILTER_AVG = $40;
  VIPS_FOREIGN_PNG_FILTER_PAETH = $80;
  VIPS_FOREIGN_PNG_FILTER_ALL = $F8;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_pngload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_pngload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_pngload_buffer(buf: pointer; len: Tsize_t; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_pngsave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
function vips_pngsave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_pngsave_buffer(in_: PVipsImage; buf: Ppointer; len: Psize_t): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PVipsForeignPpmFormat = ^TVipsForeignPpmFormat;
  TVipsForeignPpmFormat = longint;

const
  VIPS_FOREIGN_PPM_FORMAT_PBM = 0;
  VIPS_FOREIGN_PPM_FORMAT_PGM = 1;
  VIPS_FOREIGN_PPM_FORMAT_PPM = 2;
  VIPS_FOREIGN_PPM_FORMAT_PFM = 3;
  VIPS_FOREIGN_PPM_FORMAT_PNM = 4;
  VIPS_FOREIGN_PPM_FORMAT_LAST = 5;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_ppmload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_ppmload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_ppmsave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_ppmsave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
function vips_matload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_radload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_radload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_radload_buffer(buf: pointer; len: Tsize_t; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_radsave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_radsave_buffer(in_: PVipsImage; buf: Ppointer; len: Psize_t): longint; varargs; cdecl; external libvips;
function vips_radsave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
function vips_pdfload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_pdfload_buffer(buf: pointer; len: Tsize_t; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_pdfload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_svgload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_svgload_buffer(buf: pointer; len: Tsize_t; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_svgload_string(str: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_svgload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_gifload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_gifload_buffer(buf: pointer; len: Tsize_t; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_gifload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_gifsave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_gifsave_buffer(in_: PVipsImage; buf: Ppointer; len: Psize_t): longint; varargs; cdecl; external libvips;
function vips_gifsave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
function vips_heifload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_heifload_buffer(buf: pointer; len: Tsize_t; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_heifload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_heifsave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_heifsave_buffer(in_: PVipsImage; buf: Ppointer; len: Psize_t): longint; varargs; cdecl; external libvips;
function vips_heifsave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
function vips_niftiload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_niftiload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_niftisave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_jp2kload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_jp2kload_buffer(buf: pointer; len: Tsize_t; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_jp2kload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_jp2ksave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_jp2ksave_buffer(in_: PVipsImage; buf: Ppointer; len: Psize_t): longint; varargs; cdecl; external libvips;
function vips_jp2ksave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
function vips_jxlload_source(source: PVipsSource; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_jxlload_buffer(buf: pointer; len: Tsize_t; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_jxlload(filename: pchar; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_jxlsave(in_: PVipsImage; filename: pchar): longint; varargs; cdecl; external libvips;
function vips_jxlsave_buffer(in_: PVipsImage; buf: Ppointer; len: Psize_t): longint; varargs; cdecl; external libvips;
function vips_jxlsave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PVipsForeignDzLayout = ^TVipsForeignDzLayout;
  TVipsForeignDzLayout = longint;

const
  VIPS_FOREIGN_DZ_LAYOUT_DZ = 0;
  VIPS_FOREIGN_DZ_LAYOUT_ZOOMIFY = 1;
  VIPS_FOREIGN_DZ_LAYOUT_GOOGLE = 2;
  VIPS_FOREIGN_DZ_LAYOUT_IIIF = 3;
  VIPS_FOREIGN_DZ_LAYOUT_IIIF3 = 4;
  VIPS_FOREIGN_DZ_LAYOUT_LAST = 5;

type
  PVipsForeignDzDepth = ^TVipsForeignDzDepth;
  TVipsForeignDzDepth = longint;

const
  VIPS_FOREIGN_DZ_DEPTH_ONEPIXEL = 0;
  VIPS_FOREIGN_DZ_DEPTH_ONETILE = 1;
  VIPS_FOREIGN_DZ_DEPTH_ONE = 2;
  VIPS_FOREIGN_DZ_DEPTH_LAST = 3;

type
  PVipsForeignDzContainer = ^TVipsForeignDzContainer;
  TVipsForeignDzContainer = longint;

const
  VIPS_FOREIGN_DZ_CONTAINER_FS = 0;
  VIPS_FOREIGN_DZ_CONTAINER_ZIP = 1;
  VIPS_FOREIGN_DZ_CONTAINER_SZI = 2;
  VIPS_FOREIGN_DZ_CONTAINER_LAST = 3;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_dzsave(in_: PVipsImage; name: pchar): longint; varargs; cdecl; external libvips;
function vips_dzsave_buffer(in_: PVipsImage; buf: Ppointer; len: Psize_t): longint; varargs; cdecl; external libvips;
function vips_dzsave_target(in_: PVipsImage; target: PVipsTarget): longint; varargs; cdecl; external libvips;
{$ENDIF read_enum}
type
  PVipsForeignHeifCompression = ^TVipsForeignHeifCompression;
  TVipsForeignHeifCompression = longint;

const
  VIPS_FOREIGN_HEIF_COMPRESSION_HEVC = 1;
  VIPS_FOREIGN_HEIF_COMPRESSION_AVC = 2;
  VIPS_FOREIGN_HEIF_COMPRESSION_JPEG = 3;
  VIPS_FOREIGN_HEIF_COMPRESSION_AV1 = 4;
  VIPS_FOREIGN_HEIF_COMPRESSION_LAST = 5;

type
  PVipsForeignHeifEncoder = ^TVipsForeignHeifEncoder;
  TVipsForeignHeifEncoder = longint;

const
  VIPS_FOREIGN_HEIF_ENCODER_AUTO = 0;
  VIPS_FOREIGN_HEIF_ENCODER_AOM = 1;
  VIPS_FOREIGN_HEIF_ENCODER_RAV1E = 2;
  VIPS_FOREIGN_HEIF_ENCODER_SVT = 3;
  VIPS_FOREIGN_HEIF_ENCODER_X265 = 4;
  VIPS_FOREIGN_HEIF_ENCODER_LAST = 5;
  {$ENDIF read_enum}

  // === Konventiert am: 26-4-26 16:13:44 ===

{$IFDEF read_function}
function VIPS_TYPE_FOREIGN: TGType;
function VIPS_FOREIGN(obj: Pointer): PVipsForeign;
function VIPS_FOREIGN_CLASS(klass: Pointer): PVipsForeignClass;
function VIPS_IS_FOREIGN(obj: Pointer): Tgboolean;
function VIPS_IS_FOREIGN_CLASS(klass: Pointer): Tgboolean;
function VIPS_FOREIGN_GET_CLASS(obj: Pointer): PVipsForeignClass;

function VIPS_TYPE_FOREIGN_LOAD: TGType;
function VIPS_FOREIGN_LOAD(obj: Pointer): PVipsForeignLoad;
function VIPS_FOREIGN_LOAD_CLASS(klass: Pointer): PVipsForeignLoadClass;
function VIPS_IS_FOREIGN_LOAD(obj: Pointer): Tgboolean;
function VIPS_IS_FOREIGN_LOAD_CLASS(klass: Pointer): Tgboolean;
function VIPS_FOREIGN_LOAD_GET_CLASS(obj: Pointer): PVipsForeignLoadClass;

function VIPS_TYPE_FOREIGN_SAVE: TGType;
function VIPS_FOREIGN_SAVE(obj: Pointer): PVipsForeignSave;
function VIPS_FOREIGN_SAVE_CLASS(klass: Pointer): PVipsForeignSaveClass;
function VIPS_IS_FOREIGN_SAVE(obj: Pointer): Tgboolean;
function VIPS_IS_FOREIGN_SAVE_CLASS(klass: Pointer): Tgboolean;
function VIPS_FOREIGN_SAVE_GET_CLASS(obj: Pointer): PVipsForeignSaveClass;
{$ENDIF read_function}

implementation

function VIPS_TYPE_FOREIGN: TGType;
begin
  VIPS_TYPE_FOREIGN := vips_foreign_get_type;
end;

function VIPS_FOREIGN(obj: Pointer): PVipsForeign;
begin
  Result := PVipsForeign(g_type_check_instance_cast(obj, VIPS_TYPE_FOREIGN));
end;

function VIPS_FOREIGN_CLASS(klass: Pointer): PVipsForeignClass;
begin
  Result := PVipsForeignClass(g_type_check_class_cast(klass, VIPS_TYPE_FOREIGN));
end;

function VIPS_IS_FOREIGN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_FOREIGN);
end;

function VIPS_IS_FOREIGN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_FOREIGN);
end;

function VIPS_FOREIGN_GET_CLASS(obj: Pointer): PVipsForeignClass;
begin
  Result := PVipsForeignClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function VIPS_TYPE_FOREIGN_LOAD: TGType;
begin
  Result := vips_foreign_load_get_type;
end;

function VIPS_FOREIGN_LOAD(obj: Pointer): PVipsForeignLoad;
begin
  Result := PVipsForeignLoad(g_type_check_instance_cast(obj, VIPS_TYPE_FOREIGN_LOAD));
end;

function VIPS_FOREIGN_LOAD_CLASS(klass: Pointer): PVipsForeignLoadClass;
begin
  Result := PVipsForeignLoadClass(g_type_check_class_cast(klass, VIPS_TYPE_FOREIGN_LOAD));
end;

function VIPS_IS_FOREIGN_LOAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_FOREIGN_LOAD);
end;

function VIPS_IS_FOREIGN_LOAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_FOREIGN_LOAD);
end;

function VIPS_FOREIGN_LOAD_GET_CLASS(obj: Pointer): PVipsForeignLoadClass;
begin
  Result := PVipsForeignLoadClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function VIPS_TYPE_FOREIGN_SAVE: TGType;
begin
  Result := vips_foreign_save_get_type;
end;

function VIPS_FOREIGN_SAVE(obj: Pointer): PVipsForeignSave;
begin
  Result := PVipsForeignSave(g_type_check_instance_cast(obj, VIPS_TYPE_FOREIGN_SAVE));
end;

function VIPS_FOREIGN_SAVE_CLASS(klass: Pointer): PVipsForeignSaveClass;
begin
  Result := PVipsForeignSaveClass(g_type_check_class_cast(klass, VIPS_TYPE_FOREIGN_SAVE));
end;

function VIPS_IS_FOREIGN_SAVE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_FOREIGN_SAVE);
end;

function VIPS_IS_FOREIGN_SAVE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_FOREIGN_SAVE);
end;

function VIPS_FOREIGN_SAVE_GET_CLASS(obj: Pointer): PVipsForeignSaveClass;
begin
  Result := PVipsForeignSaveClass(PGTypeInstance(obj)^.g_class);
end;

end.

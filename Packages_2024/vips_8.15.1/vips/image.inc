

  {$IFDEF read_enum}
const
  VIPS_MAGIC_INTEL = $b6a6f208;
  VIPS_MAGIC_SPARC = $08f2a6b6;
  VIPS_MAX_COORD = 10000000;

type
  PVipsDemandStyle = ^TVipsDemandStyle;
  TVipsDemandStyle = longint;

const
  VIPS_DEMAND_STYLE_ERROR = -(1);
  VIPS_DEMAND_STYLE_SMALLTILE = (-(1)) + 1;
  VIPS_DEMAND_STYLE_FATSTRIP = (-(1)) + 2;
  VIPS_DEMAND_STYLE_THINSTRIP = (-(1)) + 3;
  VIPS_DEMAND_STYLE_ANY = (-(1)) + 4;

type
  PVipsImageType = ^TVipsImageType;
  TVipsImageType = longint;

const
  VIPS_IMAGE_ERROR = -(1);
  VIPS_IMAGE_NONE = (-(1)) + 1;
  VIPS_IMAGE_SETBUF = (-(1)) + 2;
  VIPS_IMAGE_SETBUF_FOREIGN = (-(1)) + 3;
  VIPS_IMAGE_OPENIN = (-(1)) + 4;
  VIPS_IMAGE_MMAPIN = (-(1)) + 5;
  VIPS_IMAGE_MMAPINRW = (-(1)) + 6;
  VIPS_IMAGE_OPENOUT = (-(1)) + 7;
  VIPS_IMAGE_PARTIAL = (-(1)) + 8;

type
  PVipsInterpretation = ^TVipsInterpretation;
  TVipsInterpretation = longint;

const
  VIPS_INTERPRETATION_ERROR = -(1);
  VIPS_INTERPRETATION_MULTIBAND = 0;
  VIPS_INTERPRETATION_B_W = 1;
  VIPS_INTERPRETATION_HISTOGRAM = 10;
  VIPS_INTERPRETATION_XYZ = 12;
  VIPS_INTERPRETATION_LAB = 13;
  VIPS_INTERPRETATION_CMYK = 15;
  VIPS_INTERPRETATION_LABQ = 16;
  VIPS_INTERPRETATION_RGB = 17;
  VIPS_INTERPRETATION_CMC = 18;
  VIPS_INTERPRETATION_LCH = 19;
  VIPS_INTERPRETATION_LABS = 21;
  VIPS_INTERPRETATION_sRGB = 22;
  VIPS_INTERPRETATION_YXY = 23;
  VIPS_INTERPRETATION_FOURIER = 24;
  VIPS_INTERPRETATION_RGB16 = 25;
  VIPS_INTERPRETATION_GREY16 = 26;
  VIPS_INTERPRETATION_MATRIX = 27;
  VIPS_INTERPRETATION_scRGB = 28;
  VIPS_INTERPRETATION_HSV = 29;
  VIPS_INTERPRETATION_LAST = 30;

type
  PVipsBandFormat = ^TVipsBandFormat;
  TVipsBandFormat = longint;

const
  VIPS_FORMAT_NOTSET = -(1);
  VIPS_FORMAT_UCHAR = 0;
  VIPS_FORMAT_CHAR = 1;
  VIPS_FORMAT_USHORT = 2;
  VIPS_FORMAT_SHORT = 3;
  VIPS_FORMAT_UINT = 4;
  VIPS_FORMAT_INT = 5;
  VIPS_FORMAT_FLOAT = 6;
  VIPS_FORMAT_COMPLEX = 7;
  VIPS_FORMAT_DOUBLE = 8;
  VIPS_FORMAT_DPCOMPLEX = 9;
  VIPS_FORMAT_LAST = 10;

type
  PVipsCoding = ^TVipsCoding;
  TVipsCoding = longint;

const
  VIPS_CODING_ERROR = -(1);
  VIPS_CODING_NONE = 0;
  VIPS_CODING_LABQ = 2;
  VIPS_CODING_RAD = 6;
  VIPS_CODING_LAST = 7;

type
  PVipsAccess = ^TVipsAccess;
  TVipsAccess = longint;

const
  VIPS_ACCESS_RANDOM = 0;
  VIPS_ACCESS_SEQUENTIAL = 1;
  VIPS_ACCESS_SEQUENTIAL_UNBUFFERED = 2;
  VIPS_ACCESS_LAST = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PVipsImage = ^TVipsImage;
  PPVipsImage = ^PVipsImage;
  TVipsStartFn = function(out_: PVipsImage; a: pointer; b: pointer): pointer; cdecl;
//  TVipsGenerateFn = function(out_: PVipsRegion; seq: pointer; a: pointer; b: pointer; stop: Pgboolean): longint; cdecl;
  TVipsGenerateFn = function(out_: Pointer; seq: pointer; a: pointer; b: pointer; stop: Pgboolean): longint; cdecl;
  TVipsStopFn = function(seq: pointer; a: pointer; b: pointer): longint; cdecl;

  TVipsProgress = record
    im: PVipsImage;
    run: longint;
    eta: longint;
    tpels: Tgint64;
    npels: Tgint64;
    percent: longint;
    start: PGTimer;
  end;
  PVipsProgress = ^TVipsProgress;

  TVipsImage = record
    parent_instance: TVipsObject;
    Xsize: longint;
    Ysize: longint;
    Bands: longint;
    BandFmt: TVipsBandFormat;
    Coding: TVipsCoding;
    _Type: TVipsInterpretation;
    Xres: double;
    Yres: double;
    Xoffset: longint;
    Yoffset: longint;
    Length: longint;
    Compression: smallint;
    Level: smallint;
    Bbits: longint;
    time: PVipsProgress;
    Hist: pchar;
    filename: pchar;
    data: PVipsPel;
    kill: longint;
    Xres_float: single;
    Yres_float: single;
    mode: pchar;
    dtype: TVipsImageType;
    fd: longint;
    baseaddr: pointer;
    len: Tsize_t;
    magic: Tguint32;
    start_fn: TVipsStartFn;
    generate_fn: TVipsGenerateFn;
    stop_fn: TVipsStopFn;
    client1: pointer;
    client2: pointer;
    sslock: PGMutex;
    regions: PGSList;
    dhint: TVipsDemandStyle;
    meta: PGHashTable;
    meta_traverse: PGSList;
    sizeof_header: Tgint64;
    windows: PGSList;
    upstream: PGSList;
    downstream: PGSList;
    serial: longint;
    history_list: PGSList;
    progress_signal: PVipsImage;
    file_length: Tgint64;
    hint_set: Tgboolean;
    delete_on_close: Tgboolean;
    delete_on_close_filename: pchar;
  end;

  TVipsImageClass = record
    parent_class: TVipsObjectClass;
    preeval: procedure(image: PVipsImage; progress: PVipsProgress; data: pointer); cdecl;
    eval: procedure(image: PVipsImage; progress: PVipsProgress; data: pointer); cdecl;
    posteval: procedure(image: PVipsImage; progress: PVipsProgress; data: pointer); cdecl;
    written: procedure(image: PVipsImage; result: Plongint; data: pointer); cdecl;
    invalidate: procedure(image: PVipsImage; data: pointer); cdecl;
    minimise: procedure(image: PVipsImage; data: pointer); cdecl;
  end;
  PVipsImageClass = ^TVipsImageClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_image_get_type: TGType; cdecl; external libvips;
procedure vips_progress_set(progress: Tgboolean); cdecl; external libvips;
procedure vips_image_invalidate_all(image: PVipsImage); cdecl; external libvips;
procedure vips_image_minimise_all(image: PVipsImage); cdecl; external libvips;
function vips_image_is_sequential(image: PVipsImage): Tgboolean; cdecl; external libvips;
procedure vips_image_set_progress(image: PVipsImage; progress: Tgboolean); cdecl; external libvips;
function vips_image_iskilled(image: PVipsImage): Tgboolean; cdecl; external libvips;
procedure vips_image_set_kill(image: PVipsImage; kill: Tgboolean); cdecl; external libvips;
function vips_filename_get_filename(vips_filename: pchar): pchar; cdecl; external libvips;
function vips_filename_get_options(vips_filename: pchar): pchar; cdecl; external libvips;
function vips_image_new: PVipsImage; cdecl; external libvips;
function vips_image_new_memory: PVipsImage; cdecl; external libvips;
function vips_image_memory: PVipsImage; cdecl; external libvips;
function vips_image_new_from_file(name: pchar): PVipsImage; varargs; cdecl; external libvips;
function vips_image_new_from_file_RW(filename: pchar): PVipsImage; cdecl; external libvips;
function vips_image_new_from_file_raw(filename: pchar; xsize: longint; ysize: longint; bands: longint; offset: Tguint64): PVipsImage; cdecl; external libvips;
function vips_image_new_from_memory(data: pointer; size: Tsize_t; width: longint; height: longint; bands: longint;
  format: TVipsBandFormat): PVipsImage; cdecl; external libvips;
function vips_image_new_from_memory_copy(data: pointer; size: Tsize_t; width: longint; height: longint; bands: longint;
  format: TVipsBandFormat): PVipsImage; cdecl; external libvips;
function vips_image_new_from_buffer(buf: pointer; len: Tsize_t; option_string: pchar): PVipsImage; varargs; cdecl; external libvips;
function vips_image_new_from_source(source: PVipsSource; option_string: pchar): PVipsImage; varargs; cdecl; external libvips;
function vips_image_new_matrix(width: longint; height: longint): PVipsImage; cdecl; external libvips;
function vips_image_new_matrixv(width: longint; height: longint): PVipsImage; varargs; cdecl; external libvips;
function vips_image_new_matrix_from_array(width: longint; height: longint; arr: Pdouble; size: longint): PVipsImage; cdecl; external libvips;
function vips_image_matrix_from_array(width: longint; height: longint; arr: Pdouble; size: longint): PVipsImage; cdecl; external libvips;
function vips_image_new_from_image(image: PVipsImage; c: Pdouble; n: longint): PVipsImage; cdecl; external libvips;
function vips_image_new_from_image1(image: PVipsImage; c: double): PVipsImage; cdecl; external libvips;
procedure vips_image_set_delete_on_close(image: PVipsImage; delete_on_close: Tgboolean); cdecl; external libvips;
function vips_get_disc_threshold: Tguint64; cdecl; external libvips;
function vips_image_new_temp_file(format: pchar): PVipsImage; cdecl; external libvips;
function vips_image_write(image: PVipsImage; out_: PVipsImage): longint; cdecl; external libvips;
function vips_image_write_to_file(image: PVipsImage; name: pchar): longint; varargs; cdecl; external libvips;
function vips_image_write_to_buffer(in_: PVipsImage; suffix: pchar; buf: Ppointer; size: Psize_t): longint; varargs; cdecl; external libvips;
function vips_image_write_to_target(in_: PVipsImage; suffix: pchar; target: PVipsTarget): longint; varargs; cdecl; external libvips;
function vips_image_write_to_memory(in_: PVipsImage; size: Psize_t): pointer; cdecl; external libvips;
function vips_image_decode_predict(in_: PVipsImage; bands: Plongint; format: PVipsBandFormat): longint; cdecl; external libvips;
function vips_image_decode(in_: PVipsImage; out_: PPVipsImage): longint; cdecl; external libvips;
function vips_image_encode(in_: PVipsImage; out_: PPVipsImage; coding: TVipsCoding): longint; cdecl; external libvips;
function vips_image_isMSBfirst(image: PVipsImage): Tgboolean; cdecl; external libvips;
function vips_image_isfile(image: PVipsImage): Tgboolean; cdecl; external libvips;
function vips_image_ispartial(image: PVipsImage): Tgboolean; cdecl; external libvips;
function vips_image_hasalpha(image: PVipsImage): Tgboolean; cdecl; external libvips;
function vips_image_copy_memory(image: PVipsImage): PVipsImage; cdecl; external libvips;
function vips_image_wio_input(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_pio_input(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_pio_output(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_inplace(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_write_prepare(image: PVipsImage): longint; cdecl; external libvips;
function vips_image_write_line(image: PVipsImage; ypos: longint; linebuffer: PVipsPel): longint; cdecl; external libvips;
function vips_band_format_isint(format: TVipsBandFormat): Tgboolean; cdecl; external libvips;
function vips_band_format_isuint(format: TVipsBandFormat): Tgboolean; cdecl; external libvips;
function vips_band_format_is8bit(format: TVipsBandFormat): Tgboolean; cdecl; external libvips;
function vips_band_format_isfloat(format: TVipsBandFormat): Tgboolean; cdecl; external libvips;
function vips_band_format_iscomplex(format: TVipsBandFormat): Tgboolean; cdecl; external libvips;
function vips_system(cmd_format: pchar): longint; varargs; cdecl; external libvips;
function vips_array_image_new(arr: PPVipsImage; n: longint): PVipsArrayImage; cdecl; external libvips;
function vips_array_image_newv(n: longint): PVipsArrayImage; varargs; cdecl; external libvips;
function vips_array_image_new_from_string(_string: pchar; flags: TVipsAccess): PVipsArrayImage; cdecl; external libvips;
function vips_array_image_empty: PVipsArrayImage; cdecl; external libvips;
function vips_array_image_append(arr: PVipsArrayImage; image: PVipsImage): PVipsArrayImage; cdecl; external libvips;
function vips_array_image_get(arr: PVipsArrayImage; n: Plongint): PPVipsImage; cdecl; external libvips;
function vips_value_get_array_image(value: PGValue; n: Plongint): PPVipsImage; cdecl; external libvips;
procedure vips_value_set_array_image(value: PGValue; n: longint); cdecl; external libvips;
//function vips_reorder_prepare_many(image: PVipsImage; regions: PPVipsRegion; r: PVipsRect): longint; cdecl; external libvips;
function vips_reorder_prepare_many(image: PVipsImage; regions: Pointer; r: PVipsRect): longint; cdecl; external libvips;
procedure vips_reorder_margin_hint(image: PVipsImage; margin: longint); cdecl; external libvips;
procedure vips_image_free_buffer(image: PVipsImage; buffer: pointer); cdecl; external libvips;

// === Konventiert am: 26-4-26 16:12:59 ===

function VIPS_TYPE_IMAGE: TGType;
function VIPS_IMAGE(obj: Pointer): PVipsImage;
function VIPS_IMAGE_CLASS(klass: Pointer): PVipsImageClass;
function VIPS_IS_IMAGE(obj: Pointer): Tgboolean;
function VIPS_IS_IMAGE_CLASS(klass: Pointer): Tgboolean;
function VIPS_IMAGE_GET_CLASS(obj: Pointer): PVipsImageClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function VIPS_TYPE_IMAGE: TGType;
begin
  VIPS_TYPE_IMAGE := vips_image_get_type;
end;

function VIPS_IMAGE(obj: Pointer): PVipsImage;
begin
  Result := PVipsImage(g_type_check_instance_cast(obj, VIPS_TYPE_IMAGE));
end;

function VIPS_IMAGE_CLASS(klass: Pointer): PVipsImageClass;
begin
  Result := PVipsImageClass(g_type_check_class_cast(klass, VIPS_TYPE_IMAGE));
end;

function VIPS_IS_IMAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_IMAGE);
end;

function VIPS_IS_IMAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_IMAGE);
end;

function VIPS_IMAGE_GET_CLASS(obj: Pointer): PVipsImageClass;
begin
  Result := PVipsImageClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

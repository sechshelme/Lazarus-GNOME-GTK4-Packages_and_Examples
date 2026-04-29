

  {$IFDEF read_enum}
const
  VIPS_SPARE = 8;
  VIPS__WINDOW_MARGIN_PIXELS = 128;
  VIPS__WINDOW_MARGIN_BYTES = (1024 * 1024) * 10;
  VIPS_SIZEOF_HEADER = 64;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TVipsWindow = record
    ref_count: longint;
    im: PVipsImage;
    top: longint;
    height: longint;
    data: PVipsPel;
    baseaddr: pointer;
    length: Tsize_t;
  end;
  PVipsWindow = ^TVipsWindow;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_window_unref(window: PVipsWindow): longint; cdecl; external libvips;
procedure vips_window_print(window: PVipsWindow); cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsBufferThread = record
    hash: PGHashTable;
    thread: PGThread;
  end;
  PVipsBufferThread = ^TVipsBufferThread;

  TVipsBufferCache = record
    buffers: PGSList;
    thread: PGThread;
    im: PVipsImage;
    buffer_thread: PVipsBufferThread;
    reserve: PGSList;
    n_reserve: longint;
  end;
  PVipsBufferCache = ^TVipsBufferCache;

  TVipsBuffer = record
    ref_count: longint;
    im: PVipsImage;
    area: TVipsRect;
    done: Tgboolean;
    cache: PVipsBufferCache;
    buf: PVipsPel;
    bsize: Tsize_t;
  end;
  PVipsBuffer = ^TVipsBuffer;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure vips_buffer_dump_all; cdecl; external libvips;
procedure vips_buffer_done(buffer: PVipsBuffer); cdecl; external libvips;
procedure vips_buffer_undone(buffer: PVipsBuffer); cdecl; external libvips;
procedure vips_buffer_unref(buffer: PVipsBuffer); cdecl; external libvips;
function vips_buffer_new(im: PVipsImage; area: PVipsRect): PVipsBuffer; cdecl; external libvips;
function vips_buffer_ref(im: PVipsImage; area: PVipsRect): PVipsBuffer; cdecl; external libvips;
function vips_buffer_unref_ref(buffer: PVipsBuffer; im: PVipsImage; area: PVipsRect): PVipsBuffer; cdecl; external libvips;
procedure vips_buffer_print(buffer: PVipsBuffer); cdecl; external libvips;
procedure vips__render_shutdown; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PRegionType = ^TRegionType;
  TRegionType = longint;

const
  VIPS_REGION_NONE = 0;
  VIPS_REGION_BUFFER_ = 1;
  VIPS_REGION_OTHER_REGION = 2;
  VIPS_REGION_OTHER_IMAGE = 3;
  VIPS_REGION_WINDOW = 4;

const
  VIPS__TILE_WIDTH = 128;
  VIPS__TILE_HEIGHT = 128;
  VIPS__THINSTRIP_HEIGHT = 1;
  VIPS__FATSTRIP_HEIGHT = 16;
  {$ENDIF read_enum}

{$IFDEF read_function}
procedure vips__region_take_ownership(reg: PVipsRegion); cdecl; external libvips;
procedure vips__region_check_ownership(reg: PVipsRegion); cdecl; external libvips;
procedure vips__region_no_ownership(reg: PVipsRegion); cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsRegionFillFn = function(para1: PVipsRegion; para2: pointer): longint; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_region_fill(reg: PVipsRegion; r: PVipsRect; fn: TVipsRegionFillFn; a: pointer): longint; cdecl; external libvips;
function vips__image_wio_output(image: PVipsImage): longint; cdecl; external libvips;
function vips__image_pio_output(image: PVipsImage): longint; cdecl; external libvips;
function vips__argument_get_instance(argument_class: PVipsArgumentClass; obj: PVipsObject): PVipsArgumentInstance; cdecl; external libvips;
function vips__argument_table_lookup(table: PVipsArgumentTable; pspec: PGParamSpec): PVipsArgument; cdecl; external libvips;

function vips__image_copy_fields_array(out_: PVipsImage; in_: PPVipsImage): longint; cdecl; external libvips;
procedure vips__region_count_pixels(region: PVipsRegion; nickname: pchar); cdecl; external libvips;
procedure vips_region_dump_all; cdecl; external libvips;
function vips_region_prepare_many(reg: PPVipsRegion; r: PVipsRect): longint; cdecl; external libvips;
function vips__view_image(image: PVipsImage): longint; cdecl; external libvips;

var
  _vips__argument_id : longint;cvar;external libvips;

procedure vips__meta_init; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:11:06 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}

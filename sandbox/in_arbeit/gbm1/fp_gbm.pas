unit fp_gbm;

interface

uses
  ctypes;

const
  {$IFDEF linux}
  libgbm = 'libgbm';
  {$ENDIF}

  {$IFDEF windows}
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tsize_t = SizeUInt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  __GBM__ = 1;

type
  Pgbm_device = type Pointer;
  Pgbm_bo = type Pointer;
  Pgbm_surface = type Pointer;

  Tgbm_bo_handle = record
    case longint of
      0: (ptr: pointer);
      1: (s32: Tint32_t);
      2: (u32: Tuint32_t);
      3: (s64: Tint64_t);
      4: (u64: Tuint64_t);
  end;
  Pgbm_bo_handle = ^Tgbm_bo_handle;

  Tgbm_bo_format = longint;

const
  GBM_BO_FORMAT_XRGB8888 = 0;
  GBM_BO_FORMAT_ARGB8888 = 1;

const
  GBM_FORMAT_BIG_ENDIAN = 1 shl 31;

const

  // Color and R
  GBM_FORMAT_C8 = $20203843; // 'C','8',' ',' '
  GBM_FORMAT_R8 = $20203852; // 'R','8',' ',' '
  GBM_FORMAT_R16 = $20363152; // 'R','1','6',' '
  GBM_FORMAT_GR88 = $38385247; // 'G','R','8','8'
  GBM_FORMAT_RG1616 = $32334752; // 'R','G','3','2'
  GBM_FORMAT_GR1616 = $32335247; // 'G','R','3','2'

  // 8 bpp RGB
  GBM_FORMAT_RGB332 = $38424752; // 'R','G','B','8'
  GBM_FORMAT_BGR233 = $38524742; // 'B','G','R','8'

  // 16 bpp RGB
  GBM_FORMAT_XRGB4444 = $32315258; // 'X','R','1','2'
  GBM_FORMAT_XBGR4444 = $32314258; // 'X','B','1','2'
  GBM_FORMAT_RGBX4444 = $32315852; // 'R','X','1','2'
  GBM_FORMAT_BGRX4444 = $32315842; // 'B','X','1','2'

  GBM_FORMAT_ARGB4444 = $32315241; // 'A','R','1','2'
  GBM_FORMAT_ABGR4444 = $32314241; // 'A','B','1','2'
  GBM_FORMAT_RGBA4444 = $32314152; // 'R','A','1','2'
  GBM_FORMAT_BGRA4444 = $32314142; // 'B','A','1','2'

  GBM_FORMAT_XRGB1555 = $35315258; // 'X','R','1','5'
  GBM_FORMAT_XBGR1555 = $35314258; // 'X','B','1','5'
  GBM_FORMAT_RGBX5551 = $35315852; // 'R','X','1','5'
  GBM_FORMAT_BGRX5551 = $35315842; // 'B','X','1','5'

  GBM_FORMAT_ARGB1555 = $35315241; // 'A','R','1','5'
  GBM_FORMAT_ABGR1555 = $35314241; // 'A','B','1','5'
  GBM_FORMAT_RGBA5551 = $35314152; // 'R','A','1','5'
  GBM_FORMAT_BGRA5551 = $35314142; // 'B','A','1','5'

  GBM_FORMAT_RGB565 = $36314752; // 'R','G','1','6'
  GBM_FORMAT_BGR565 = $36314742; // 'B','G','1','6'

  // 24 bpp RGB
  GBM_FORMAT_RGB888 = $34324752; // 'R','G','2','4'
  GBM_FORMAT_BGR888 = $34324742; // 'B','G','2','4'

  // 32 bpp RGB
  GBM_FORMAT_XRGB8888 = $34325258; // 'X','R','2','4'
  GBM_FORMAT_XBGR8888 = $34324258; // 'X','B','2','4'
  GBM_FORMAT_RGBX8888 = $34325852; // 'R','X','2','4'
  GBM_FORMAT_BGRX8888 = $34325842; // 'B','X','2','4'

  GBM_FORMAT_ARGB8888 = $34325241; // 'A','R','2','4'
  GBM_FORMAT_ABGR8888 = $34324241; // 'A','B','2','4'
  GBM_FORMAT_RGBA8888 = $34324152; // 'R','A','2','4'
  GBM_FORMAT_BGRA8888 = $34324142; // 'B','A','2','4'

  GBM_FORMAT_XRGB2101010 = $30335258;
  GBM_FORMAT_XBGR2101010 = $30334258;
  GBM_FORMAT_RGBX1010102 = $30335852;
  GBM_FORMAT_BGRX1010102 = $30335842;

  GBM_FORMAT_ARGB2101010 = $30335241;
  GBM_FORMAT_ABGR2101010 = $30334241;
  GBM_FORMAT_RGBA1010102 = $30334152;
  GBM_FORMAT_BGRA1010102 = $30334142;

  // YUV packed
  GBM_FORMAT_YUYV = $56595559;
  GBM_FORMAT_YVYU = $55595659;
  GBM_FORMAT_UYVY = $59565955;
  GBM_FORMAT_VYUY = $59555956;
  GBM_FORMAT_AYUV = $56555941;

  // NV formats
  GBM_FORMAT_NV12 = $3231564E;
  GBM_FORMAT_NV21 = $3132564E;
  GBM_FORMAT_NV16 = $3631564E;
  GBM_FORMAT_NV61 = $3136564E;

  // Planar YUV
  GBM_FORMAT_YUV410 = $39565559;
  GBM_FORMAT_YVU410 = $39555659;
  GBM_FORMAT_YUV411 = $31315559;
  GBM_FORMAT_YVU411 = $31315659;
  GBM_FORMAT_YUV420 = $32315559;
  GBM_FORMAT_YVU420 = $32315659;
  GBM_FORMAT_YUV422 = $36315559;
  GBM_FORMAT_YVU422 = $36315659;
  GBM_FORMAT_YUV444 = $34325559;
  GBM_FORMAT_YVU444 = $34325659;

type
  Pgbm_format_name_desc = ^Tgbm_format_name_desc;

  Tgbm_format_name_desc = record
    name: array[0..4] of char;
  end;

type
  Tgbm_bo_flags = longint;

const
  GBM_BO_USE_SCANOUT = 1 shl 0;
  GBM_BO_USE_CURSOR = 1 shl 1;
  GBM_BO_USE_CURSOR_64X64 = GBM_BO_USE_CURSOR;
  GBM_BO_USE_RENDERING = 1 shl 2;
  GBM_BO_USE_WRITE = 1 shl 3;
  GBM_BO_USE_LINEAR = 1 shl 4;
  GBM_BO_USE_PROTECTED = 1 shl 5;
  GBM_BO_USE_FRONT_RENDERING = 1 shl 6;
  GBM_BO_FIXED_COMPRESSION_DEFAULT = 1 shl 7;
  GBM_BO_FIXED_COMPRESSION_1BPC = 2 shl 7;
  GBM_BO_FIXED_COMPRESSION_2BPC = 3 shl 7;
  GBM_BO_FIXED_COMPRESSION_3BPC = 4 shl 7;
  GBM_BO_FIXED_COMPRESSION_4BPC = 5 shl 7;
  GBM_BO_FIXED_COMPRESSION_5BPC = 6 shl 7;
  GBM_BO_FIXED_COMPRESSION_6BPC = 7 shl 7;
  GBM_BO_FIXED_COMPRESSION_7BPC = 8 shl 7;
  GBM_BO_FIXED_COMPRESSION_8BPC = 9 shl 7;
  GBM_BO_FIXED_COMPRESSION_9BPC = 10 shl 7;
  GBM_BO_FIXED_COMPRESSION_10BPC = 11 shl 7;
  GBM_BO_FIXED_COMPRESSION_11BPC = 12 shl 7;
  GBM_BO_FIXED_COMPRESSION_12BPC = 13 shl 7;

  GBM_BO_FIXED_COMPRESSION_MASK = ((1 shl 11) - 1) and (not ((1 shl 7) - 1));

function gbm_device_get_fd(gbm: Pgbm_device): longint; cdecl; external libgbm;
function gbm_device_get_backend_name(gbm: Pgbm_device): pchar; cdecl; external libgbm;
function gbm_device_is_format_supported(gbm: Pgbm_device; format: Tuint32_t; flags: Tuint32_t): longint; cdecl; external libgbm;
function gbm_device_get_format_modifier_plane_count(gbm: Pgbm_device; format: Tuint32_t; modifier: Tuint64_t): longint; cdecl; external libgbm;
procedure gbm_device_destroy(gbm: Pgbm_device); cdecl; external libgbm;
function gbm_create_device(fd: longint): Pgbm_device; cdecl; external libgbm;
function gbm_bo_create(gbm: Pgbm_device; width: Tuint32_t; height: Tuint32_t; format: Tuint32_t; flags: Tuint32_t): Pgbm_bo; cdecl; external libgbm;
function gbm_bo_create_with_modifiers(gbm: Pgbm_device; width: Tuint32_t; height: Tuint32_t; format: Tuint32_t; modifiers: Puint64_t;
  count: dword): Pgbm_bo; cdecl; external libgbm;
function gbm_bo_create_with_modifiers2(gbm: Pgbm_device; width: Tuint32_t; height: Tuint32_t; format: Tuint32_t; modifiers: Puint64_t;
  count: dword; flags: Tuint32_t): Pgbm_bo; cdecl; external libgbm;

const
  GBM_BO_IMPORT_WL_BUFFER = $5501;
  GBM_BO_IMPORT_EGL_IMAGE = $5502;
  GBM_BO_IMPORT_FD = $5503;
  GBM_BO_IMPORT_FD_MODIFIER = $5504;

type
  Pgbm_import_fd_data = ^Tgbm_import_fd_data;

  Tgbm_import_fd_data = record
    fd: longint;
    width: Tuint32_t;
    height: Tuint32_t;
    stride: Tuint32_t;
    format: Tuint32_t;
  end;


const
  GBM_MAX_PLANES = 4;

type
  Pgbm_import_fd_modifier_data = ^Tgbm_import_fd_modifier_data;

  Tgbm_import_fd_modifier_data = record
    width: Tuint32_t;
    height: Tuint32_t;
    format: Tuint32_t;
    num_fds: Tuint32_t;
    fds: array[0..(GBM_MAX_PLANES) - 1] of longint;
    strides: array[0..(GBM_MAX_PLANES) - 1] of longint;
    offsets: array[0..(GBM_MAX_PLANES) - 1] of longint;
    modifier: Tuint64_t;
  end;


function gbm_bo_import(gbm: Pgbm_device; _type: Tuint32_t; buffer: pointer; flags: Tuint32_t): Pgbm_bo; cdecl; external libgbm;

type
  Tgbm_bo_transfer_flags = longint;

const
  GBM_BO_TRANSFER_READ = 1 shl 0;
  GBM_BO_TRANSFER_WRITE = 1 shl 1;
  GBM_BO_TRANSFER_READ_WRITE = GBM_BO_TRANSFER_READ or GBM_BO_TRANSFER_WRITE;

function gbm_bo_map(bo: Pgbm_bo; x: Tuint32_t; y: Tuint32_t; width: Tuint32_t; height: Tuint32_t;
  flags: Tuint32_t; stride: Puint32_t; map_data: Ppointer): pointer; cdecl; external libgbm;
procedure gbm_bo_unmap(bo: Pgbm_bo; map_data: pointer); cdecl; external libgbm;
function gbm_bo_get_width(bo: Pgbm_bo): Tuint32_t; cdecl; external libgbm;
function gbm_bo_get_height(bo: Pgbm_bo): Tuint32_t; cdecl; external libgbm;
function gbm_bo_get_stride(bo: Pgbm_bo): Tuint32_t; cdecl; external libgbm;
function gbm_bo_get_stride_for_plane(bo: Pgbm_bo; plane: longint): Tuint32_t; cdecl; external libgbm;
function gbm_bo_get_format(bo: Pgbm_bo): Tuint32_t; cdecl; external libgbm;
function gbm_bo_get_bpp(bo: Pgbm_bo): Tuint32_t; cdecl; external libgbm;
function gbm_bo_get_offset(bo: Pgbm_bo; plane: longint): Tuint32_t; cdecl; external libgbm;
function gbm_bo_get_device(bo: Pgbm_bo): Pgbm_device; cdecl; external libgbm;
function gbm_bo_get_handle(bo: Pgbm_bo): Tgbm_bo_handle; cdecl; external libgbm;
function gbm_bo_get_fd(bo: Pgbm_bo): longint; cdecl; external libgbm;
function gbm_bo_get_modifier(bo: Pgbm_bo): Tuint64_t; cdecl; external libgbm;
function gbm_bo_get_plane_count(bo: Pgbm_bo): longint; cdecl; external libgbm;
function gbm_bo_get_handle_for_plane(bo: Pgbm_bo; plane: longint): Tgbm_bo_handle; cdecl; external libgbm;
function gbm_bo_get_fd_for_plane(bo: Pgbm_bo; plane: longint): longint; cdecl; external libgbm;
function gbm_bo_write(bo: Pgbm_bo; buf: pointer; count: Tsize_t): longint; cdecl; external libgbm;

type
  Tdestry_func = procedure(para1: Pgbm_bo; para2: pointer);

procedure gbm_bo_set_user_data(bo: Pgbm_bo; data: pointer; destroy_user_data: Tdestry_func); cdecl; external libgbm;
function gbm_bo_get_user_data(bo: Pgbm_bo): pointer; cdecl; external libgbm;
procedure gbm_bo_destroy(bo: Pgbm_bo); cdecl; external libgbm;
function gbm_surface_create(gbm: Pgbm_device; width: Tuint32_t; height: Tuint32_t; format: Tuint32_t; flags: Tuint32_t): Pgbm_surface; cdecl; external libgbm;
function gbm_surface_create_with_modifiers(gbm: Pgbm_device; width: Tuint32_t; height: Tuint32_t; format: Tuint32_t; modifiers: Puint64_t;
  count: dword): Pgbm_surface; cdecl; external libgbm;
function gbm_surface_create_with_modifiers2(gbm: Pgbm_device; width: Tuint32_t; height: Tuint32_t; format: Tuint32_t; modifiers: Puint64_t;
  count: dword; flags: Tuint32_t): Pgbm_surface; cdecl; external libgbm;
function gbm_surface_lock_front_buffer(surface: Pgbm_surface): Pgbm_bo; cdecl; external libgbm;
procedure gbm_surface_release_buffer(surface: Pgbm_surface; bo: Pgbm_bo); cdecl; external libgbm;
function gbm_surface_has_free_buffers(surface: Pgbm_surface): longint; cdecl; external libgbm;
procedure gbm_surface_destroy(surface: Pgbm_surface); cdecl; external libgbm;
function gbm_format_get_name(gbm_format: Tuint32_t; desc: Pgbm_format_name_desc): pchar; cdecl; external libgbm;

// === Konventiert am: 27-9-25 19:28:40 ===


implementation


end.

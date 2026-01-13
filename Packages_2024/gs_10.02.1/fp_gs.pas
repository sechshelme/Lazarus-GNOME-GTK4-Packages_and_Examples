unit fp_gs;

interface

const
  {$IFDEF Linux}
  libgs = 'gs';
  {$ENDIF}

  {$IFDEF Windows}
  libgs = 'libgs-10.dll';
  {$ENDIF}

  {$IFDEF Windows}
type
  Pwchar_t = type Pointer;
  PPwchar_t = ^Pwchar_t;
  {$ENDIF}

type
  Tsize_t = SizeUInt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ==== /usr/include/ghostscript/gserrors.h

type
  Tgs_error_type = longint;

const
  gs_error_ok = 0;
  gs_error_unknownerror = -(1);
  gs_error_dictfull = -(2);
  gs_error_dictstackoverflow = -(3);
  gs_error_dictstackunderflow = -(4);
  gs_error_execstackoverflow = -(5);
  gs_error_interrupt = -(6);
  gs_error_invalidaccess = -(7);
  gs_error_invalidexit = -(8);
  gs_error_invalidfileaccess = -(9);
  gs_error_invalidfont = -(10);
  gs_error_invalidrestore = -(11);
  gs_error_ioerror = -(12);
  gs_error_limitcheck = -(13);
  gs_error_nocurrentpoint = -(14);
  gs_error_rangecheck = -(15);
  gs_error_stackoverflow = -(16);
  gs_error_stackunderflow = -(17);
  gs_error_syntaxerror = -(18);
  gs_error_timeout = -(19);
  gs_error_typecheck = -(20);
  gs_error_undefined = -(21);
  gs_error_undefinedfilename = -(22);
  gs_error_undefinedresult = -(23);
  gs_error_unmatchedmark = -(24);
  gs_error_VMerror = -(25);
  gs_error_configurationerror = -(26);
  gs_error_undefinedresource = -(27);
  gs_error_unregistered = -(28);
  gs_error_invalidcontext = -(29);
  gs_error_invalidid = -(30);
  gs_error_pdf_stackoverflow = -(31);
  gs_error_circular_reference = -(32);
  gs_error_hit_detected = -(99);
  gs_error_Fatal = -(100);
  gs_error_Quit = -(101);
  gs_error_InterpreterExit = -(102);
  gs_error_Remap_Color = -(103);
  gs_error_ExecStackUnderflow = -(104);
  gs_error_VMreclaim = -(105);
  gs_error_NeedInput = -(106);
  gs_error_NeedFile = -(107);
  gs_error_Info = -(110);
  gs_error_handled = -(111);

type
  Pgs_error_t = ^Tgs_error_t;
  Tgs_error_t = Tgs_error_type;

function gs_log_error(para1: longint; para2: pchar; para3: longint): longint; cdecl; external libgs;
function gs_errstr(code: longint): pchar; cdecl; external libgs;
function gs_throw_imp(func: pchar; file_: pchar; line: longint; op: longint; code: longint; fmt: pchar): longint; cdecl; varargs; external libgs;

const
  gs_okay = 0;


  // ==== /usr/include/ghostscript/gdevdsp.h

const
  DISPLAY_VERSION_MAJOR = 3;
  DISPLAY_VERSION_MINOR = 0;
  DISPLAY_VERSION_MAJOR_V1 = 1;
  DISPLAY_VERSION_MINOR_V1 = 0;
  DISPLAY_VERSION_MAJOR_V2 = 2;
  DISPLAY_VERSION_MINOR_V2 = 0;

type
  PDISPLAY_FORMAT_COLOR = ^TDISPLAY_FORMAT_COLOR;
  TDISPLAY_FORMAT_COLOR = longint;

const
  DISPLAY_COLORS_NATIVE = 1 shl 0;
  DISPLAY_COLORS_GRAY = 1 shl 1;
  DISPLAY_COLORS_RGB = 1 shl 2;
  DISPLAY_COLORS_CMYK = 1 shl 3;
  DISPLAY_COLORS_SEPARATION = 1 shl 19;
  DISPLAY_COLORS_MASK = $8000f;

type
  PDISPLAY_FORMAT_ALPHA = ^TDISPLAY_FORMAT_ALPHA;
  TDISPLAY_FORMAT_ALPHA = longint;

const
  DISPLAY_ALPHA_NONE = 0 shl 4;
  DISPLAY_ALPHA_FIRST = 1 shl 4;
  DISPLAY_ALPHA_LAST = 1 shl 5;
  DISPLAY_UNUSED_FIRST = 1 shl 6;
  DISPLAY_UNUSED_LAST = 1 shl 7;
  DISPLAY_ALPHA_MASK = $00f0;

type
  PDISPLAY_FORMAT_DEPTH = ^TDISPLAY_FORMAT_DEPTH;
  TDISPLAY_FORMAT_DEPTH = longint;

const
  DISPLAY_DEPTH_1 = 1 shl 8;
  DISPLAY_DEPTH_2 = 1 shl 9;
  DISPLAY_DEPTH_4 = 1 shl 10;
  DISPLAY_DEPTH_8 = 1 shl 11;
  DISPLAY_DEPTH_12 = 1 shl 12;
  DISPLAY_DEPTH_16 = 1 shl 13;
  DISPLAY_DEPTH_MASK = $ff00;

type
  PDISPLAY_FORMAT_ENDIAN = ^TDISPLAY_FORMAT_ENDIAN;
  TDISPLAY_FORMAT_ENDIAN = longint;

const
  DISPLAY_BIGENDIAN = 0 shl 16;
  DISPLAY_LITTLEENDIAN = 1 shl 16;
  DISPLAY_ENDIAN_MASK = $00010000;

type
  PDISPLAY_FORMAT_FIRSTROW = ^TDISPLAY_FORMAT_FIRSTROW;
  TDISPLAY_FORMAT_FIRSTROW = longint;

const
  DISPLAY_TOPFIRST = 0 shl 17;
  DISPLAY_BOTTOMFIRST = 1 shl 17;
  DISPLAY_FIRSTROW_MASK = $00020000;

type
  PDISPLAY_FORMAT_555 = ^TDISPLAY_FORMAT_555;
  TDISPLAY_FORMAT_555 = longint;

const
  DISPLAY_NATIVE_555 = 0 shl 18;
  DISPLAY_NATIVE_565 = 1 shl 18;
  DISPLAY_555_MASK = $00040000;

type
  PDISPLAY_FORMAT_ROW_ALIGN = ^TDISPLAY_FORMAT_ROW_ALIGN;
  TDISPLAY_FORMAT_ROW_ALIGN = longint;

const
  DISPLAY_ROW_ALIGN_DEFAULT = 0 shl 20;
  DISPLAY_ROW_ALIGN_4 = 3 shl 20;
  DISPLAY_ROW_ALIGN_8 = 4 shl 20;
  DISPLAY_ROW_ALIGN_16 = 5 shl 20;
  DISPLAY_ROW_ALIGN_32 = 6 shl 20;
  DISPLAY_ROW_ALIGN_64 = 7 shl 20;
  DISPLAY_ROW_ALIGN_MASK = $00700000;

type
  PDISPLAY_FORMAT_PLANARNESS = ^TDISPLAY_FORMAT_PLANARNESS;
  TDISPLAY_FORMAT_PLANARNESS = longint;

const
  DISPLAY_CHUNKY = 0 shl 23;
  DISPLAY_PLANAR = 1 shl 23;
  DISPLAY_PLANAR_INTERLEAVED = 2 shl 23;

type
  Tdisplay_callback = record
    size: longint;
    version_major: longint;
    version_minor: longint;
    display_open: function(handle: pointer; device: pointer): longint; cdecl;
    display_preclose: function(handle: pointer; device: pointer): longint; cdecl;
    display_close: function(handle: pointer; device: pointer): longint; cdecl;
    display_presize: function(handle: pointer; device: pointer; width: longint; height: longint; raster: longint;
      format: dword): longint; cdecl;
    display_size: function(handle: pointer; device: pointer; width: longint; height: longint; raster: longint;
      format: dword; pimage: pbyte): longint; cdecl;
    display_sync: function(handle: pointer; device: pointer): longint; cdecl;
    display_page: function(handle: pointer; device: pointer; copies: longint; flush: longint): longint; cdecl;
    display_update: function(handle: pointer; device: pointer; x: longint; y: longint; w: longint;
      h: longint): longint; cdecl;
    display_memalloc: function(handle: pointer; device: pointer; size: Tsize_t): pointer; cdecl;
    display_memfree: function(handle: pointer; device: pointer; mem: pointer): longint; cdecl;
    display_separation: function(handle: pointer; device: pointer; component: longint; component_name: pchar; c: word;
      m: word; y: word; k: word): longint; cdecl;
    display_adjust_band_height: function(handle: pointer; device: pointer; bandheight: longint): longint; cdecl;
    display_rectangle_request: function(handle: pointer; device: pointer; memory: Ppointer; ox: Plongint; oy: Plongint;
      raster: Plongint; plane_raster: Plongint; x: Plongint; y: Plongint; w: Plongint;
      h: Plongint): longint; cdecl;
  end;
  Pdisplay_callback = ^Tdisplay_callback;

  Tdisplay_callback_v2 = record
    size: longint;
    version_major: longint;
    version_minor: longint;
    display_open: function(handle: pointer; device: pointer): longint; cdecl;
    display_preclose: function(handle: pointer; device: pointer): longint; cdecl;
    display_close: function(handle: pointer; device: pointer): longint; cdecl;
    display_presize: function(handle: pointer; device: pointer; width: longint; height: longint; raster: longint;
      format: dword): longint; cdecl;
    display_size: function(handle: pointer; device: pointer; width: longint; height: longint; raster: longint;
      format: dword; pimage: pbyte): longint; cdecl;
    display_sync: function(handle: pointer; device: pointer): longint; cdecl;
    display_page: function(handle: pointer; device: pointer; copies: longint; flush: longint): longint; cdecl;
    display_update: function(handle: pointer; device: pointer; x: longint; y: longint; w: longint;
      h: longint): longint; cdecl;
    display_memalloc: function(handle: pointer; device: pointer; size: dword): pointer; cdecl;
    display_memfree: function(handle: pointer; device: pointer; mem: pointer): longint; cdecl;
    display_separation: function(handle: pointer; device: pointer; component: longint; component_name: pchar; c: word;
      m: word; y: word; k: word): longint; cdecl;
  end;
  Pdisplay_callback_v2 = ^Tdisplay_callback_v2;

  Tdisplay_callback_v1 = record
    size: longint;
    version_major: longint;
    version_minor: longint;
    display_open: function(handle: pointer; device: pointer): longint; cdecl;
    display_preclose: function(handle: pointer; device: pointer): longint; cdecl;
    display_close: function(handle: pointer; device: pointer): longint; cdecl;
    display_presize: function(handle: pointer; device: pointer; width: longint; height: longint; raster: longint;
      format: dword): longint; cdecl;
    display_size: function(handle: pointer; device: pointer; width: longint; height: longint; raster: longint;
      format: dword; pimage: pbyte): longint; cdecl;
    display_sync: function(handle: pointer; device: pointer): longint; cdecl;
    display_page: function(handle: pointer; device: pointer; copies: longint; flush: longint): longint; cdecl;
    display_update: function(handle: pointer; device: pointer; x: longint; y: longint; w: longint;
      h: longint): longint; cdecl;
    display_memalloc: function(handle: pointer; device: pointer; size: dword): pointer; cdecl;
    display_memfree: function(handle: pointer; device: pointer; mem: pointer): longint; cdecl;
  end;
  Pdisplay_callback_v1 = ^Tdisplay_callback_v1;

const
  DISPLAY_CALLBACK_V1_SIZEOF = sizeof(Tdisplay_callback_v1);

const
  DISPLAY_CALLOUT_GET_CALLBACK = 0;
  DISPLAY_CALLOUT_GET_CALLBACK_LEGACY = 1;

type
  Tgs_display_get_callback_t = record
    callback: Pdisplay_callback;
    caller_handle: pointer;
  end;
  Pgs_display_get_callback_t = ^Tgs_display_get_callback_t;


  // ==== /usr/include/ghostscript/iapi.h

type
  Pgs_memory_t = type Pointer;
  Pgp_file = type Pointer;
  PPgp_file = ^Pgp_file;

type
  Tgsapi_revision_t = record
    product: pchar;
    copyright: pchar;
    revision: longint;
    revisiondate: longint;
  end;
  Pgsapi_revision_t = ^Tgsapi_revision_t;

type
  Tstdin_fn_func = function(caller_handle: pointer; buf: pchar; len: longint): longint; cdecl;
  Tstdout_fn_func = function(caller_handle: pointer; str: pchar; len: longint): longint; cdecl;
  Tstderr_fn_func = function(caller_handle: pointer; str: pchar; len: longint): longint; cdecl;
  Tpoll_fn_func = function(caller_handle: pointer): longint; cdecl;

function gsapi_revision(pr: Pgsapi_revision_t; len: longint): longint; cdecl; external libgs;
function gsapi_new_instance(pinstance: Ppointer; caller_handle: pointer): longint; cdecl; external libgs;
procedure gsapi_delete_instance(instance: pointer); cdecl; external libgs;
function gsapi_set_stdio(instance: pointer; stdin_fn: Tstdin_fn_func; stdout_fn: Tstdout_fn_func; stderr_fn: Tstderr_fn_func): longint; cdecl; external libgs;
function gsapi_set_stdio_with_handle(instance: pointer; stdin_fn: Tstdin_fn_func; stdout_fn: Tstdout_fn_func; stderr_fn: Tstderr_fn_func; caller_handle: pointer): longint; cdecl; external libgs;
function gsapi_set_poll(instance: pointer; poll_fn: Tpoll_fn_func): longint; cdecl; external libgs;
function gsapi_set_poll_with_handle(instance: pointer; poll_fn: Tpoll_fn_func; caller_handle: pointer): longint; cdecl; external libgs;
function gsapi_set_display_callback(instance: pointer; callback: Pdisplay_callback): longint; cdecl; external libgs;

type
  Tgs_callout = function(instance: pointer; callout_handle: pointer; device_name: pchar; id: longint; size: longint; data: pointer): longint; cdecl;

function gsapi_register_callout(instance: pointer; callout: Tgs_callout; callout_handle: pointer): longint; cdecl; external libgs;
procedure gsapi_deregister_callout(instance: pointer; callout: Tgs_callout; callout_handle: pointer); cdecl; external libgs;
function gsapi_set_default_device_list(instance: pointer; list: pchar; listlen: longint): longint; cdecl; external libgs;
function gsapi_get_default_device_list(instance: pointer; list: PPchar; listlen: Plongint): longint; cdecl; external libgs;
function gsapi_set_arg_encoding(instance: pointer; encoding: longint): longint; cdecl; external libgs;

const
  GS_ARG_ENCODING_LOCAL = 0;
  GS_ARG_ENCODING_UTF8 = 1;
  GS_ARG_ENCODING_UTF16LE = 2;

function gsapi_init_with_args(instance: pointer; argc: longint; argv: PPchar): longint; cdecl; external libgs;

{$ifdef windows}
function gsapi_init_with_argsA(instance: pointer; argc: longint; argv: PPchar): longint; cdecl; external libgs;
function gsapi_init_with_argsW(instance: pointer; argc: longint; argv: PPwchar_t): longint; cdecl; external libgs;
{$endif}

function gsapi_run_string_begin(instance: pointer; user_errors: longint; pexit_code: Plongint): longint; cdecl; external libgs;
function gsapi_run_string_continue(instance: pointer; str: pchar; length: dword; user_errors: longint; pexit_code: Plongint): longint; cdecl; external libgs;
function gsapi_run_string_end(instance: pointer; user_errors: longint; pexit_code: Plongint): longint; cdecl; external libgs;
function gsapi_run_string_with_length(instance: pointer; str: pchar; length: dword; user_errors: longint; pexit_code: Plongint): longint; cdecl; external libgs;
function gsapi_run_string(instance: pointer; str: pchar; user_errors: longint; pexit_code: Plongint): longint; cdecl; external libgs;
function gsapi_run_file(instance: pointer; file_name: pchar; user_errors: longint; pexit_code: Plongint): longint; cdecl; external libgs;

{$ifdef windows}
function gsapi_run_fileA(instance: pointer; file_name: pchar; user_errors: longint; pexit_code: Plongint): longint; cdecl; external libgs;
function gsapi_run_fileW(instance: pointer; file_name: Pwchar_t; user_errors: longint; pexit_code: Plongint): longint; cdecl; external libgs;
{$endif}

function gsapi_exit(instance: pointer): longint; cdecl; external libgs;

type
  Tgs_set_param_type = longint;
  Pgs_set_param_type = ^Tgs_set_param_type;

const
  gs_spt_invalid = -(1);
  gs_spt_null = 0;
  gs_spt_bool = 1;
  gs_spt_int = 2;
  gs_spt_float = 3;
  gs_spt_name = 4;
  gs_spt_string = 5;
  gs_spt_long = 6;
  gs_spt_i64 = 7;
  gs_spt_size_t = 8;
  gs_spt_parsed = 9;
  gs_spt_more_to_come = 1 shl 31;

function gsapi_set_param(instance: pointer; param: pchar; value: pointer; _type: Tgs_set_param_type): longint; cdecl; external libgs;
function gsapi_get_param(instance: pointer; param: pchar; value: pointer; _type: Tgs_set_param_type): longint; cdecl; external libgs;
function gsapi_enumerate_params(instance: pointer; iterator: Ppointer; key: PPchar; _type: Pgs_set_param_type): longint; cdecl; external libgs;

const
  GS_PERMIT_FILE_READING = 0;
  GS_PERMIT_FILE_WRITING = 1;
  GS_PERMIT_FILE_CONTROL = 2;

function gsapi_add_control_path(instance: pointer; _type: longint; path: pchar): longint; cdecl; external libgs;
function gsapi_remove_control_path(instance: pointer; _type: longint; path: pchar): longint; cdecl; external libgs;
procedure gsapi_purge_control_paths(instance: pointer; _type: longint); cdecl; external libgs;
procedure gsapi_activate_path_control(instance: pointer; enable: longint); cdecl; external libgs;
function gsapi_is_path_control_active(instance: pointer): longint; cdecl; external libgs;

const
  gp_file_name_sizeof = 4096;

type
  Pgsapi_fs_t = ^Tgsapi_fs_t;

  Tgsapi_fs_t = record
    open_file: function(mem: Pgs_memory_t; secret: pointer; fname: pchar; mode: pchar; file_: PPgp_file): longint; cdecl;
    open_pipe: function(mem: Pgs_memory_t; secret: pointer; fname: pchar; rfname: pchar; mode: pchar; file_: PPgp_file): longint; cdecl;
    open_scratch: function(mem: Pgs_memory_t; secret: pointer; prefix: pchar; rfname: pchar; mode: pchar; rm: longint; file_: PPgp_file): longint; cdecl;
    open_printer: function(mem: Pgs_memory_t; secret: pointer; fname: pchar; binary: longint; file_: PPgp_file): longint; cdecl;
    open_handle: function(mem: Pgs_memory_t; secret: pointer; fname: pchar; mode: pchar; file_: PPgp_file): longint; cdecl;
  end;

function gsapi_add_fs(instance: pointer; fs: Pgsapi_fs_t; secret: pointer): longint; cdecl; external libgs;
procedure gsapi_remove_fs(instance: pointer; fs: Pgsapi_fs_t; secret: pointer); cdecl; external libgs;

type
  TPFN_gsapi_revision = function(pr: Pgsapi_revision_t; len: longint): longint; cdecl;
  TPFN_gsapi_new_instance = function(pinstance: Ppointer; caller_handle: pointer): longint; cdecl;
  TPFN_gsapi_delete_instance = procedure(instance: pointer); cdecl;
  TPFN_gsapi_set_stdio = function(instance: pointer; stdin_fn: Tstdin_fn_func; stdout_fn: Tstdout_fn_func; stderr_fn: Tstderr_fn_func): longint; cdecl;
  TPFN_gsapi_set_poll = function(instance: pointer; poll_fn: Tpoll_fn_func): longint; cdecl;
  TPFN_gsapi_set_display_callback = function(instance: pointer; callback: Pdisplay_callback): longint; cdecl;
  TPFN_gsapi_set_default_device_list = function(instance: pointer; list: pchar; listlen: longint): longint; cdecl;
  TPFN_gsapi_get_default_device_list = function(instance: pointer; list: PPchar; listlen: Plongint): longint; cdecl;
  TPFN_gsapi_init_with_args = function(instance: pointer; argc: longint; argv: PPchar): longint; cdecl;

  {$ifdef windows}
  TPFN_gsapi_init_with_argsA = function(instance: pointer; argc: longint; argv: PPchar): longint; cdecl;
  TPFN_gsapi_init_with_argsW = function(instance: pointer; argc: longint; argv: PPwchar_t): longint; cdecl;
  {$endif}

  TPFN_gsapi_set_arg_encoding = function(instance: pointer; encoding: longint): longint; cdecl;
  TPFN_gsapi_run_string_begin = function(instance: pointer; user_errors: longint; pexit_code: Plongint): longint; cdecl;
  TPFN_gsapi_run_string_continue = function(instance: pointer; str: pchar; length: dword; user_errors: longint; pexit_code: Plongint): longint; cdecl;
  TPFN_gsapi_run_string_end = function(instance: pointer; user_errors: longint; pexit_code: Plongint): longint; cdecl;
  TPFN_gsapi_run_string_with_length = function(instance: pointer; str: pchar; length: dword; user_errors: longint; pexit_code: Plongint): longint; cdecl;
  TPFN_gsapi_run_string = function(instance: pointer; str: pchar; user_errors: longint; pexit_code: Plongint): longint; cdecl;
  TPFN_gsapi_run_file = function(instance: pointer; file_name: pchar; user_errors: longint; pexit_code: Plongint): longint; cdecl;

  {$ifdef windows}
  TPFN_gsapi_run_fileA = function(instance: pointer; file_name: pchar; user_errors: longint; pexit_code: Plongint): longint; cdecl;
  TPFN_gsapi_run_fileW = function(instance: pointer; file_name: Pwchar_t; user_errors: longint; pexit_code: Plongint): longint; cdecl;
  {$endif}

  TPFN_gsapi_exit = function(instance: pointer): longint; cdecl;
  TPFN_gsapi_set_param = function(instance: pointer; param: pchar; value: pointer; _type: Tgs_set_param_type): longint; cdecl;
  TPFN_gsapi_add_control_path = function(instance: pointer; _type: longint; path: pchar): longint; cdecl;
  TPFN_gsapi_remove_control_path = function(instance: pointer; _type: longint; path: pchar): longint; cdecl;
  TPFN_gsapi_purge_control_paths = procedure(instance: pointer; _type: longint); cdecl;
  TPFN_gsapi_activate_path_control = procedure(instance: pointer; enable: longint); cdecl;
  TPFN_gsapi_is_path_control_active = function(instance: pointer): longint; cdecl;
  TPFN_gsapi_add_fs = function(instance: pointer; fs: Pgsapi_fs_t; secret: pointer): longint; cdecl;
  TPFN_gsapi_remove_fs = procedure(instance: pointer; fs: Pgsapi_fs_t; secret: pointer); cdecl;

  // === Konventiert am: 13-12-25 13:59:40 ===


implementation



end.

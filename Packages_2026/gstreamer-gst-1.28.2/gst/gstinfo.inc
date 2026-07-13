

  {$IFDEF read_enum}
type
  PGstDebugLevel = ^TGstDebugLevel;
  TGstDebugLevel = longint;
const
  GST_LEVEL_NONE = 0;
  GST_LEVEL_ERROR = 1;
  GST_LEVEL_WARNING = 2;
  GST_LEVEL_FIXME = 3;
  GST_LEVEL_INFO = 4;
  GST_LEVEL_DEBUG = 5;
  GST_LEVEL_LOG = 6;
  GST_LEVEL_TRACE = 7;
  GST_LEVEL_MEMDUMP = 9;
  GST_LEVEL_COUNT = 10;

type
  PGstDebugColorFlags = ^TGstDebugColorFlags;
  TGstDebugColorFlags = longint;
const
  GST_DEBUG_FG_BLACK = $0000;
  GST_DEBUG_FG_RED = $0001;
  GST_DEBUG_FG_GREEN = $0002;
  GST_DEBUG_FG_YELLOW = $0003;
  GST_DEBUG_FG_BLUE = $0004;
  GST_DEBUG_FG_MAGENTA = $0005;
  GST_DEBUG_FG_CYAN = $0006;
  GST_DEBUG_FG_WHITE = $0007;
  GST_DEBUG_BG_BLACK = $0000;
  GST_DEBUG_BG_RED = $0010;
  GST_DEBUG_BG_GREEN = $0020;
  GST_DEBUG_BG_YELLOW = $0030;
  GST_DEBUG_BG_BLUE = $0040;
  GST_DEBUG_BG_MAGENTA = $0050;
  GST_DEBUG_BG_CYAN = $0060;
  GST_DEBUG_BG_WHITE = $0070;
  GST_DEBUG_BOLD = $0100;
  GST_DEBUG_UNDERLINE = $0200;

type
  PGstStackTraceFlags = ^TGstStackTraceFlags;
  TGstStackTraceFlags = longint;
const
  GST_STACK_TRACE_SHOW_NONE = 0;
  GST_STACK_TRACE_SHOW_FULL = 1 shl 0;

type
  PGstDebugColorMode = ^TGstDebugColorMode;
  TGstDebugColorMode = longint;
const
  GST_DEBUG_COLOR_MODE_OFF = 0;
  GST_DEBUG_COLOR_MODE_ON = 1;
  GST_DEBUG_COLOR_MODE_UNIX = 2;

  GST_DEBUG_FG_MASK = $000F;
  GST_DEBUG_BG_MASK = $00F0;
  GST_DEBUG_FORMAT_MASK = $FF00;

type
  PGstLogContextHashFlags = ^TGstLogContextHashFlags;
  TGstLogContextHashFlags = longint;
const
  GST_LOG_CONTEXT_DEFAULT = 0;
  GST_LOG_CONTEXT_IGNORE_OBJECT = 1 shl 0;
  GST_LOG_CONTEXT_IGNORE_FORMAT = 1 shl 1;
  GST_LOG_CONTEXT_IGNORE_FILE = 1 shl 2;
  GST_LOG_CONTEXT_USE_LINE_NUMBER = 1 shl 3;
  GST_LOG_CONTEXT_USE_STRING_ARGS = 1 shl 4;

type
  PGstLogContextFlags = ^TGstLogContextFlags;
  TGstLogContextFlags = longint;
const
  GST_LOG_CONTEXT_FLAG_NONE = 0;
  GST_LOG_CONTEXT_FLAG_THROTTLE = 1 shl 0;

const
  GST_PTR_FORMAT = 'p\aA';
  GST_SEGMENT_FORMAT = 'p\aB';
  GST_TIMEP_FORMAT = 'p\aT';
  GST_STIMEP_FORMAT = 'p\aS';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstDebugCategory = ^TGstDebugCategory;
  TGstDebugCategory = record
    threshold: Tgint;
    color: Tguint;
    name: Pgchar;
    description: Pgchar;
  end;

type
  PGstDebugMessage = type Pointer;
  PGstLogContext = type Pointer;
  PGstLogContextBuilder = type Pointer;

  TGstLogFunction = procedure(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint; obj: PGObject; message: PGstDebugMessage; user_data: Tgpointer); cdecl;
  TGstDebugFuncPtr = procedure(para1: pointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure gst_debug_log(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  obj: PGObject; format: Pgchar); cdecl; varargs; external libgstreamer;
procedure gst_debug_log_valist(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  obj: PGObject; format: Pgchar; args: Tva_list); cdecl; external libgstreamer;
procedure gst_debug_log_literal(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  obj: PGObject; message_string: Pgchar); cdecl; external libgstreamer;
procedure gst_debug_log_id(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  id: Pgchar; format: Pgchar); cdecl; varargs; external libgstreamer;
procedure gst_debug_log_id_valist(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  id: Pgchar; format: Pgchar; args: Tva_list); cdecl; external libgstreamer;
procedure gst_debug_log_id_literal(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  id: Pgchar; message_string: Pgchar); cdecl; external libgstreamer;
function _gst_debug_category_new(name: Pgchar; color: Tguint; description: Pgchar): PGstDebugCategory; cdecl; external libgstreamer;
function _gst_debug_get_category(name: Pgchar): PGstDebugCategory; cdecl; external libgstreamer;
procedure _gst_debug_dump_mem(cat: PGstDebugCategory; file_: Pgchar; func: Pgchar; line: Tgint; obj: PGObject;
  msg: Pgchar; data: Pguint8; length: Tguint); cdecl; external libgstreamer;
procedure _gst_debug_dump_mem_id(cat: PGstDebugCategory; file_: Pgchar; func: Pgchar; line: Tgint; object_id: Pgchar;
  msg: Pgchar; data: Pguint8; length: Tguint); cdecl; external libgstreamer;

procedure _gst_debug_register_funcptr(func: TGstDebugFuncPtr; ptrname: Pgchar); cdecl; external libgstreamer;
function _gst_debug_nameof_funcptr(func: TGstDebugFuncPtr): Pgchar; cdecl; external libgstreamer;
function gst_debug_message_get(message: PGstDebugMessage): Pgchar; cdecl; external libgstreamer;
function gst_debug_message_get_id(message: PGstDebugMessage): Pgchar; cdecl; external libgstreamer;
function gst_debug_log_get_line(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  obj: PGObject; message: PGstDebugMessage): Pgchar; cdecl; external libgstreamer;
procedure gst_debug_log_default(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  obj: PGObject; message: PGstDebugMessage; user_data: Tgpointer); cdecl; external libgstreamer;
function gst_debug_level_get_name(level: TGstDebugLevel): Pgchar; cdecl; external libgstreamer;
procedure gst_debug_add_log_function(func: TGstLogFunction; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstreamer;
function gst_debug_remove_log_function(func: TGstLogFunction): Tguint; cdecl; external libgstreamer;
function gst_debug_remove_log_function_by_data(data: Tgpointer): Tguint; cdecl; external libgstreamer;
procedure gst_debug_set_active(active: Tgboolean); cdecl; external libgstreamer;
function gst_debug_is_active: Tgboolean; cdecl; external libgstreamer;
procedure gst_debug_set_colored(colored: Tgboolean); cdecl; external libgstreamer;
procedure gst_debug_set_color_mode(mode: TGstDebugColorMode); cdecl; external libgstreamer;
procedure gst_debug_set_color_mode_from_string(mode: Pgchar); cdecl; external libgstreamer;
function gst_debug_is_colored: Tgboolean; cdecl; external libgstreamer;
function gst_debug_get_color_mode: TGstDebugColorMode; cdecl; external libgstreamer;
procedure gst_debug_set_default_threshold(level: TGstDebugLevel); cdecl; external libgstreamer;
function gst_debug_get_default_threshold: TGstDebugLevel; cdecl; external libgstreamer;
procedure gst_debug_set_threshold_for_name(name: Pgchar; level: TGstDebugLevel); cdecl; external libgstreamer;
procedure gst_debug_set_threshold_from_string(list: Pgchar; reset: Tgboolean); cdecl; external libgstreamer;
procedure gst_debug_unset_threshold_for_name(name: Pgchar); cdecl; external libgstreamer;
procedure gst_debug_category_free(category: PGstDebugCategory); cdecl; external libgstreamer; deprecated;
procedure gst_debug_category_set_threshold(category: PGstDebugCategory; level: TGstDebugLevel); cdecl; external libgstreamer;
procedure gst_debug_category_reset_threshold(category: PGstDebugCategory); cdecl; external libgstreamer;
function gst_debug_category_get_threshold(category: PGstDebugCategory): TGstDebugLevel; cdecl; external libgstreamer;
function gst_debug_category_get_name(category: PGstDebugCategory): Pgchar; cdecl; external libgstreamer;
function gst_debug_category_get_color(category: PGstDebugCategory): Tguint; cdecl; external libgstreamer;
function gst_debug_category_get_description(category: PGstDebugCategory): Pgchar; cdecl; external libgstreamer;
function gst_debug_get_all_categories: PGSList; cdecl; external libgstreamer;
function gst_debug_print_object(ptr: Tgconstpointer): Pgchar; cdecl; external libgstreamer;
function gst_debug_print_segment(segment: PGstSegment): Pgchar; cdecl; external libgstreamer;
function gst_debug_construct_term_color(colorinfo: Tguint): Pgchar; cdecl; external libgstreamer;
function gst_debug_construct_win_color(colorinfo: Tguint): Tgint; cdecl; external libgstreamer;
function gst_info_vasprintf(result: PPgchar; format: Pgchar; args: Tva_list): Tgint; cdecl; external libgstreamer;
function gst_info_strdup_vprintf(format: Pgchar; args: Tva_list): Pgchar; cdecl; external libgstreamer;
function gst_info_strdup_printf(format: Pgchar): Pgchar; cdecl; varargs; external libgstreamer;
procedure gst_print(format: Pgchar); cdecl; varargs; external libgstreamer;
procedure gst_println(format: Pgchar); cdecl; varargs; external libgstreamer;
procedure gst_printerr(format: Pgchar); cdecl; varargs; external libgstreamer;
procedure gst_printerrln(format: Pgchar); cdecl; varargs; external libgstreamer;

var
  GST_CAT_DEFAULT: PGstDebugCategory; cvar;external libgstreamer;
  _gst_debug_enabled: Tgboolean; cvar;external libgstreamer;
  _gst_debug_min: TGstDebugLevel; cvar;external libgstreamer;

procedure gst_debug_print_stack_trace; cdecl; external libgstreamer;
function gst_debug_get_stack_trace(flags: TGstStackTraceFlags): Pgchar; cdecl; external libgstreamer;
procedure gst_debug_add_ring_buffer_logger(max_size_per_thread: Tguint; thread_timeout: Tguint); cdecl; external libgstreamer;
procedure gst_debug_remove_ring_buffer_logger; cdecl; external libgstreamer;
function gst_debug_ring_buffer_logger_get_logs: PPgchar; cdecl; external libgstreamer;

function gst_log_context_get_category(context: PGstLogContext): PGstDebugCategory; cdecl; external libgstreamer;
procedure gst_log_context_reset(ctx: PGstLogContext); cdecl; external libgstreamer;
procedure gst_log_context_free(ctx: PGstLogContext); cdecl; external libgstreamer;
procedure gst_debug_log_with_context(ctx: PGstLogContext; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  obj: PGObject; format: Pgchar); cdecl; varargs; external libgstreamer;
procedure gst_debug_log_with_context_valist(ctx: PGstLogContext; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  obj: PGObject; format: Pgchar; args: Tva_list); cdecl; external libgstreamer;
procedure gst_debug_log_literal_with_context(ctx: PGstLogContext; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  obj: PGObject; message: Pgchar); cdecl; external libgstreamer;
procedure gst_debug_log_id_with_context(ctx: PGstLogContext; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  id: Pgchar; format: Pgchar); cdecl; varargs; external libgstreamer;
procedure gst_debug_log_id_with_context_valist(ctx: PGstLogContext; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  id: Pgchar; format: Pgchar; args: Tva_list); cdecl; external libgstreamer;
procedure gst_debug_log_id_literal_with_context(ctx: PGstLogContext; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  id: Pgchar; message: Pgchar); cdecl; external libgstreamer;
procedure _gst_debug_log_once(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  obj: PGObject; format: Pgchar); cdecl; varargs; external libgstreamer;
procedure _gst_debug_log_once_id(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  id: Pgchar; format: Pgchar); cdecl; varargs; external libgstreamer;
function gst_log_context_builder_new(category: PGstDebugCategory; flags: TGstLogContextFlags): PGstLogContextBuilder; cdecl; external libgstreamer;
function gst_log_context_builder_set_hash_flags(builder: PGstLogContextBuilder; flags: TGstLogContextHashFlags): PGstLogContextBuilder; cdecl; external libgstreamer;
function gst_log_context_builder_set_category(builder: PGstLogContextBuilder; category: PGstDebugCategory): PGstLogContextBuilder; cdecl; external libgstreamer;
function gst_log_context_builder_set_interval(builder: PGstLogContextBuilder; interval: TGstClockTime): PGstLogContextBuilder; cdecl; external libgstreamer;
function gst_log_context_builder_build(builder: PGstLogContextBuilder): PGstLogContext; cdecl; external libgstreamer;
{$ENDIF read_function}

// === Konventiert am: 11-7-26 11:30:45 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}

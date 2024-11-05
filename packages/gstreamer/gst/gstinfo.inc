/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

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

const
  GST_LEVEL_DEFAULT = GST_LEVEL_NONE;

const
  GST_LEVEL_MAX = GST_LEVEL_COUNT;

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
  PGstDebugCategory = ^TGstDebugCategory;

  TGstDebugCategory = record
    threshold: Tgint;
    color: Tguint;
    Name: Pgchar;
    description: Pgchar;
  end;

const
  GST_PTR_FORMAT = 'p\aA';
  GST_SEGMENT_FORMAT = 'p\aB';
  GST_TIMEP_FORMAT = 'p\aT';
  GST_STIMEP_FORMAT = 'p\aS';

type
  TGstDebugMessage = record
  end;
  PGstDebugMessage = ^TGstDebugMessage;

  TGstLogFunction = procedure(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
    obj: PGObject; message: PGstDebugMessage; user_data: Tgpointer); cdecl;

procedure gst_debug_log(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  obj: PGObject; format: Pgchar); varargs cdecl; external libgstreamer;
procedure gst_debug_log_valist(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  obj: PGObject; format: Pgchar; args: Tva_list); cdecl; external libgstreamer;
procedure gst_debug_log_literal(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  obj: PGObject; message_string: Pgchar); cdecl; external libgstreamer;
procedure gst_debug_log_id(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  id: Pgchar; format: Pgchar); varargs cdecl; external libgstreamer;
procedure gst_debug_log_id_valist(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  id: Pgchar; format: Pgchar; args: Tva_list); cdecl; external libgstreamer;
procedure gst_debug_log_id_literal(category: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar; line: Tgint;
  id: Pgchar; message_string: Pgchar); cdecl; external libgstreamer;
function _gst_debug_category_new(Name: Pgchar; color: Tguint; description: Pgchar): PGstDebugCategory; cdecl; external libgstreamer;
function _gst_debug_get_category(Name: Pgchar): PGstDebugCategory; cdecl; external libgstreamer;
procedure _gst_debug_dump_mem(cat: PGstDebugCategory; file_: Pgchar; func: Pgchar; line: Tgint; obj: PGObject;
  msg: Pgchar; Data: Pguint8; length: Tguint); cdecl; external libgstreamer;
procedure _gst_debug_dump_mem_id(cat: PGstDebugCategory; file_: Pgchar; func: Pgchar; line: Tgint; object_id: Pgchar;
  msg: Pgchar; Data: Pguint8; length: Tguint); cdecl; external libgstreamer;

type
  TGstDebugFuncPtr = procedure(para1: pointer); cdecl;

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
function gst_debug_remove_log_function_by_data(Data: Tgpointer): Tguint; cdecl; external libgstreamer;
procedure gst_debug_set_active(active: Tgboolean); cdecl; external libgstreamer;
function gst_debug_is_active: Tgboolean; cdecl; external libgstreamer;
procedure gst_debug_set_colored(colored: Tgboolean); cdecl; external libgstreamer;
procedure gst_debug_set_color_mode(mode: TGstDebugColorMode); cdecl; external libgstreamer;
procedure gst_debug_set_color_mode_from_string(mode: Pgchar); cdecl; external libgstreamer;
function gst_debug_is_colored: Tgboolean; cdecl; external libgstreamer;
function gst_debug_get_color_mode: TGstDebugColorMode; cdecl; external libgstreamer;
procedure gst_debug_set_default_threshold(level: TGstDebugLevel); cdecl; external libgstreamer;
function gst_debug_get_default_threshold: TGstDebugLevel; cdecl; external libgstreamer;
procedure gst_debug_set_threshold_for_name(Name: Pgchar; level: TGstDebugLevel); cdecl; external libgstreamer;
procedure gst_debug_set_threshold_from_string(list: Pgchar; reset: Tgboolean); cdecl; external libgstreamer;
procedure gst_debug_unset_threshold_for_name(Name: Pgchar); cdecl; external libgstreamer;
procedure gst_debug_category_free(category: PGstDebugCategory); cdecl; external libgstreamer;
procedure gst_debug_category_set_threshold(category: PGstDebugCategory; level: TGstDebugLevel); cdecl; external libgstreamer;
procedure gst_debug_category_reset_threshold(category: PGstDebugCategory); cdecl; external libgstreamer;
function gst_debug_category_get_threshold(category: PGstDebugCategory): TGstDebugLevel; cdecl; external libgstreamer;
function gst_debug_category_get_name(category: PGstDebugCategory): Pgchar; cdecl; external libgstreamer;
function gst_debug_category_get_color(category: PGstDebugCategory): Tguint; cdecl; external libgstreamer;
function gst_debug_category_get_description(category: PGstDebugCategory): Pgchar; cdecl; external libgstreamer;
function gst_debug_get_all_categories: PGSList; cdecl; external libgstreamer;
function gst_debug_construct_term_color(colorinfo: Tguint): Pgchar; cdecl; external libgstreamer;
function gst_debug_construct_win_color(colorinfo: Tguint): Tgint; cdecl; external libgstreamer;
function gst_info_vasprintf(Result: PPgchar; format: Pgchar; args: Tva_list): Tgint; cdecl; external libgstreamer;
function gst_info_strdup_vprintf(format: Pgchar; args: Tva_list): Pgchar; cdecl; external libgstreamer;
function gst_info_strdup_printf(format: Pgchar): Pgchar; varargs cdecl; external libgstreamer;
procedure gst_print(format: Pgchar); varargs cdecl; external libgstreamer;
procedure gst_println(format: Pgchar); varargs cdecl; external libgstreamer;
procedure gst_printerr(format: Pgchar); varargs cdecl; external libgstreamer;
procedure gst_printerrln(format: Pgchar); varargs cdecl; external libgstreamer;

var
  GST_CAT_DEFAULT: PGstDebugCategory; cvar;external libgstreamer;
  _gst_debug_enabled: Tgboolean; cvar;external libgstreamer;
  _gst_debug_min: TGstDebugLevel; cvar;external libgstreamer;

procedure gst_debug_print_stack_trace; cdecl; external libgstreamer;
function gst_debug_get_stack_trace(flags: TGstStackTraceFlags): Pgchar; cdecl; external libgstreamer;
procedure gst_debug_add_ring_buffer_logger(max_size_per_thread: Tguint; thread_timeout: Tguint); cdecl; external libgstreamer;
procedure gst_debug_remove_ring_buffer_logger; cdecl; external libgstreamer;
function gst_debug_ring_buffer_logger_get_logs: PPgchar; cdecl; external libgstreamer;

function GST_STR_NULL(str: Pgchar): Pgchar;
function GST_FUNCTION: Pgchar;


// === Konventiert am: 16-9-24 15:46:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_STR_NULL(str: Pgchar): Pgchar;
begin
  if str <> nil then begin
    Result := str;
  end else begin
    Result := '(NULL)';
  end;
end;

function GST_FUNCTION: Pgchar;
begin
  GST_FUNCTION := PChar('???');
end;


{$ENDIF read_implementation}

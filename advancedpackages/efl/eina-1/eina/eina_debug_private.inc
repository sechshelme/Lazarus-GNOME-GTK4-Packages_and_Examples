{$IFDEF read_interface}

const
  LOCAL_SERVER_PATH = '.edebug';
  LOCAL_SERVER_NAME = 'efl_debug';
  LOCAL_SERVER_PORT = 0;
  REMOTE_SERVER_PORT = 6666;
  EINA_DEBUG_MAX_PACKET_SIZE = 10000000;

type
  TEina_Debug_Thread = record
    thread: TEina_Thread;
    cmd_session: PEina_Debug_Session;
    cmd_buffer: pointer;
    cmd_result: longint;
    thread_id: longint;
    val: longint;
  end;
  PEina_Debug_Thread = ^TEina_Debug_Thread;

var
  _eina_debug_lock: TEina_Spinlock; cvar;external libeina;
  _eina_debug_thread_lock: TEina_Spinlock; cvar;external libeina;
  _eina_debug_thread_mainloop: TEina_Thread; cvar;external libeina;
  _eina_debug_thread_active: PEina_Debug_Thread; cvar;external libeina;
  _eina_debug_thread_active_num: longint; cvar;external libeina;

procedure _eina_debug_thread_add(th: pointer); cdecl; external libeina;
procedure _eina_debug_thread_del(th: pointer); cdecl; external libeina;
procedure _eina_debug_thread_mainloop_set(th: pointer); cdecl; external libeina;
function _eina_debug_chunk_push(size: longint): pointer; cdecl; external libeina;
function _eina_debug_chunk_realloc(size: longint): pointer; cdecl; external libeina;
function _eina_debug_chunk_strdup(str: pchar): pchar; cdecl; external libeina;
function _eina_debug_chunk_tmp_push(size: longint): pointer; cdecl; external libeina;
procedure _eina_debug_chunk_tmp_reset; cdecl; external libeina;
function _eina_debug_file_get(fname: pchar): pchar; cdecl; external libeina;
procedure _eina_debug_dump_fhandle_bt(f: PFILE; bt: Ppointer; btlen: longint); cdecl; external libeina;
function _eina_debug_cpu_init: TEina_Bool; cdecl; external libeina;
function _eina_debug_cpu_shutdown: TEina_Bool; cdecl; external libeina;
function _eina_debug_bt_init: TEina_Bool; cdecl; external libeina;
function _eina_debug_bt_shutdown: TEina_Bool; cdecl; external libeina;
function _eina_debug_timer_init: TEina_Bool; cdecl; external libeina;
function _eina_debug_timer_shutdown: TEina_Bool; cdecl; external libeina;

// === Konventiert am: 17-5-25 15:44:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}


unit eina_debug_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_debug_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_debug_private.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PEina_Debug_Session  = ^Eina_Debug_Session;
PEina_Debug_Thread  = ^Eina_Debug_Thread;
PFILE  = ^FILE;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EINA_DEBUG_PRIVATE_H_}
{$define EINA_DEBUG_PRIVATE_H_}
{$include "eina_config.h"}
{$include "eina_lock.h"}
{$include "eina_thread.h"}

const
  LOCAL_SERVER_PATH = '.edebug';  
  LOCAL_SERVER_NAME = 'efl_debug';  
  LOCAL_SERVER_PORT = 0;  
  REMOTE_SERVER_PORT = 6666;  
{ Max packet size  }
  EINA_DEBUG_MAX_PACKET_SIZE = 10000000;  
type
  PEina_Debug_Thread = ^TEina_Debug_Thread;
  TEina_Debug_Thread = record
      thread : TEina_Thread;
      cmd_session : PEina_Debug_Session;
      cmd_buffer : pointer;
      cmd_result : longint;
      thread_id : longint;
      val : longint;
    end;

  var
    _eina_debug_lock : TEina_Spinlock;cvar;external;
    _eina_debug_thread_lock : TEina_Spinlock;cvar;external;
    _eina_debug_thread_mainloop : TEina_Thread;cvar;external;
    _eina_debug_thread_active : PEina_Debug_Thread;cvar;external;
    _eina_debug_thread_active_num : longint;cvar;external;
{ TEMP: should be private to debug thread module  }

procedure _eina_debug_thread_add(th:pointer);cdecl;external;
procedure _eina_debug_thread_del(th:pointer);cdecl;external;
procedure _eina_debug_thread_mainloop_set(th:pointer);cdecl;external;
function _eina_debug_chunk_push(size:longint):pointer;cdecl;external;
function _eina_debug_chunk_realloc(size:longint):pointer;cdecl;external;
(* Const before type ignored *)
function _eina_debug_chunk_strdup(str:Pchar):Pchar;cdecl;external;
function _eina_debug_chunk_tmp_push(size:longint):pointer;cdecl;external;
procedure _eina_debug_chunk_tmp_reset;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _eina_debug_file_get(fname:Pchar):Pchar;cdecl;external;
procedure _eina_debug_dump_fhandle_bt(f:PFILE; bt:Ppointer; btlen:longint);cdecl;external;
function _eina_debug_cpu_init:TEina_Bool;cdecl;external;
function _eina_debug_cpu_shutdown:TEina_Bool;cdecl;external;
function _eina_debug_bt_init:TEina_Bool;cdecl;external;
function _eina_debug_bt_shutdown:TEina_Bool;cdecl;external;
function _eina_debug_timer_init:TEina_Bool;cdecl;external;
function _eina_debug_timer_shutdown:TEina_Bool;cdecl;external;
{$endif}

implementation


end.

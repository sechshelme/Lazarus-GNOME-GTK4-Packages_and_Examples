unit eina_debug;

interface

uses
  ctypes, efl, eina_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  EINA_DEBUG_OPCODE_INVALID = -(1);
  EINA_DEBUG_OPCODE_REGISTER = 0;
  EINA_DEBUG_OPCODE_HELLO = 1;

type
  TEina_Debug_Session = record
  end;
  PEina_Debug_Session = ^TEina_Debug_Session;

  TEina_Debug_Timer = record
  end;
  PEina_Debug_Timer = ^TEina_Debug_Timer;

  TEina_Debug_Cb = function(session: PEina_Debug_Session; srcid: longint; buffer: pointer; size: longint): TEina_Bool; cdecl;
  TEina_Debug_Opcode_Status_Cb = procedure(data: pointer; status: TEina_Bool); cdecl;
  TEina_Debug_Dispatch_Cb = function(session: PEina_Debug_Session; buffer: pointer): TEina_Bool; cdecl;
  TEina_Debug_Timer_Cb = function(para1: pointer): TEina_Bool; cdecl;
  PEina_Debug_Packet_Header = ^TEina_Debug_Packet_Header;

  TEina_Debug_Packet_Header = record
    size: dword;
    cid: longint;
    opcode: longint;
  end;

  TEina_Debug_Opcode = record
    opcode_name: pchar;
    opcode_id: Plongint;
    cb: TEina_Debug_Cb;
  end;
  PEina_Debug_Opcode = ^TEina_Debug_Opcode;

procedure eina_debug_disable; cdecl; external libeina;
function eina_debug_local_connect(is_master: TEina_Bool): PEina_Debug_Session; cdecl; external libeina;
function eina_debug_remote_connect(port: longint): PEina_Debug_Session; cdecl; external libeina;
procedure eina_debug_session_terminate(session: PEina_Debug_Session); cdecl; external libeina;
procedure eina_debug_session_dispatch_override(session: PEina_Debug_Session; disp_cb: TEina_Debug_Dispatch_Cb); cdecl; external libeina;
function eina_debug_session_dispatch_get(session: PEina_Debug_Session): TEina_Debug_Dispatch_Cb; cdecl; external libeina;
function eina_debug_dispatch(session: PEina_Debug_Session; buffer: pointer): TEina_Bool; cdecl; external libeina;
procedure eina_debug_session_data_set(session: PEina_Debug_Session; data: pointer); cdecl; external libeina;
function eina_debug_session_data_get(session: PEina_Debug_Session): pointer; cdecl; external libeina;
procedure eina_debug_opcodes_register(session: PEina_Debug_Session; ops: PEina_Debug_Opcode; status_cb: TEina_Debug_Opcode_Status_Cb; status_data: pointer); cdecl; external libeina;
function eina_debug_session_send(session: PEina_Debug_Session; dest_id: longint; op: longint; data: pointer; size: longint): longint; cdecl; external libeina;
function eina_debug_timer_add(timeout_ms: dword; cb: TEina_Debug_Timer_Cb; data: pointer): PEina_Debug_Timer; cdecl; external libeina;
procedure eina_debug_timer_del(timer: PEina_Debug_Timer); cdecl; external libeina;
procedure eina_debug_fork_reset; cdecl; external libeina;

// === Konventiert am: 17-5-25 15:25:41 ===


implementation



end.

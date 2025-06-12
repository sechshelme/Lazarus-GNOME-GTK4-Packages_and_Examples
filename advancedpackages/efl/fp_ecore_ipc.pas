unit fp_ecore_ipc;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // Viele Makros entfernt

type
  TEcore_Ipc_Client = record
  end;
  PEcore_Ipc_Client = ^TEcore_Ipc_Client;

  TEcore_Ipc_Server = record
  end;
  PEcore_Ipc_Server = ^TEcore_Ipc_Server;


function _ecore_ipc_swap_16(v: word): word; cdecl; external libefreet; deprecated;
function _ecore_ipc_swap_32(v: dword): dword; cdecl; external libecore_ipc; deprecated;
function _ecore_ipc_swap_64(v: qword): qword; cdecl; external libecore_ipc; deprecated;


{$ifdef endian_big}
function ECORE_IPC_SWAP2NET64(x: UInt64): UInt64;
function ECORE_IPC_SWAP2CPU64(x: UInt64): UInt64;
function ECORE_IPC_SWAP2NET32(x: UInt32): UInt32;
function ECORE_IPC_SWAP2CPU32(x: UInt32): UInt32;
function ECORE_IPC_SWAP2NET16(x: UInt16): UInt16;
function ECORE_IPC_SWAP2CPU16(x: UInt16): UInt16;
function ECORE_IPC_SWAP2NET8(x: UInt8): UInt8;
function ECORE_IPC_SWAP2CPU8(x: UInt8): UInt8;
{$else}
function ECORE_IPC_SWAP2NET64(x: UInt64): UInt64;
function ECORE_IPC_SWAP2CPU64(x: UInt64): UInt64;
function ECORE_IPC_SWAP2NET32(x: UInt32): UInt32;
function ECORE_IPC_SWAP2CPU32(x: UInt32): UInt32;
function ECORE_IPC_SWAP2NET16(x: UInt16): UInt16;
function ECORE_IPC_SWAP2CPU16(x: UInt16): UInt16;
function ECORE_IPC_SWAP2NET8(x: UInt8): UInt8;
function ECORE_IPC_SWAP2CPU8(x: UInt8): UInt8;
{$endif}

type
  PEcore_Ipc_Type = ^TEcore_Ipc_Type;
  TEcore_Ipc_Type = longint;

const
  ECORE_IPC_LOCAL_USER = 0;
  ECORE_IPC_LOCAL_SYSTEM = 1;
  ECORE_IPC_REMOTE_SYSTEM = 2;
  ECORE_IPC_USE_SSL = 1 shl 4;
  ECORE_IPC_NO_PROXY = 1 shl 5;

type
  TEcore_Ipc_Event_Client_Add = record
    client: PEcore_Ipc_Client;
  end;
  PEcore_Ipc_Event_Client_Add = ^TEcore_Ipc_Event_Client_Add;

  TEcore_Ipc_Event_Client_Del = record
    client: PEcore_Ipc_Client;
  end;
  PEcore_Ipc_Event_Client_Del = ^TEcore_Ipc_Event_Client_Del;

  TEcore_Ipc_Event_Server_Add = record
    server: PEcore_Ipc_Server;
  end;
  PEcore_Ipc_Event_Server_Add = ^TEcore_Ipc_Event_Server_Add;

  TEcore_Ipc_Event_Server_Del = record
    server: PEcore_Ipc_Server;
  end;
  PEcore_Ipc_Event_Server_Del = ^TEcore_Ipc_Event_Server_Del;

  TEcore_Ipc_Event_Client_Data = record
    client: PEcore_Ipc_Client;
    major: longint;
    minor: longint;
    ref: longint;
    ref_to: longint;
    response: longint;
    data: pointer;
    size: longint;
  end;
  PEcore_Ipc_Event_Client_Data = ^TEcore_Ipc_Event_Client_Data;

  TEcore_Ipc_Event_Server_Data = record
    server: PEcore_Ipc_Server;
    major: longint;
    minor: longint;
    ref: longint;
    ref_to: longint;
    response: longint;
    data: pointer;
    size: longint;
  end;
  PEcore_Ipc_Event_Server_Data = ^TEcore_Ipc_Event_Server_Data;

var
  ECORE_IPC_EVENT_CLIENT_ADD: longint; cvar;external libecore_ipc;
  ECORE_IPC_EVENT_CLIENT_DEL: longint; cvar;external libecore_ipc;
  ECORE_IPC_EVENT_SERVER_ADD: longint; cvar;external libecore_ipc;
  ECORE_IPC_EVENT_SERVER_DEL: longint; cvar;external libecore_ipc;
  ECORE_IPC_EVENT_CLIENT_DATA: longint; cvar;external libecore_ipc;
  ECORE_IPC_EVENT_SERVER_DATA: longint; cvar;external libecore_ipc;

function ecore_ipc_init: longint; cdecl; external libecore_ipc;
function ecore_ipc_shutdown: longint; cdecl; external libecore_ipc;
function ecore_ipc_server_add(_type: TEcore_Ipc_Type; name: pchar; port: longint; data: pointer): PEcore_Ipc_Server; cdecl; external libecore_ipc;
function ecore_ipc_server_connect(_type: TEcore_Ipc_Type; name: pchar; port: longint; data: pointer): PEcore_Ipc_Server; cdecl; external libecore_ipc;
function ecore_ipc_server_del(svr: PEcore_Ipc_Server): pointer; cdecl; external libecore_ipc;
function ecore_ipc_server_data_get(svr: PEcore_Ipc_Server): pointer; cdecl; external libecore_ipc;
function ecore_ipc_server_connected_get(svr: PEcore_Ipc_Server): TEina_Bool; cdecl; external libecore_ipc;
function ecore_ipc_server_clients_get(svr: PEcore_Ipc_Server): PEina_List; cdecl; external libecore_ipc;
function ecore_ipc_server_send(svr: PEcore_Ipc_Server; major: longint; minor: longint; ref: longint; ref_to: longint;
  response: longint; data: pointer; size: longint): longint; cdecl; external libecore_ipc;
procedure ecore_ipc_server_client_limit_set(svr: PEcore_Ipc_Server; client_limit: longint; reject_excess_clients: char); cdecl; external libecore_ipc;
procedure ecore_ipc_server_data_size_max_set(svr: PEcore_Ipc_Server; size: longint); cdecl; external libecore_ipc;
function ecore_ipc_server_data_size_max_get(svr: PEcore_Ipc_Server): longint; cdecl; external libecore_ipc;
function ecore_ipc_server_ip_get(svr: PEcore_Ipc_Server): pchar; cdecl; external libecore_ipc;
procedure ecore_ipc_server_flush(svr: PEcore_Ipc_Server); cdecl; external libecore_ipc;
function ecore_ipc_client_send(cl: PEcore_Ipc_Client; major: longint; minor: longint; ref: longint; ref_to: longint;
  response: longint; data: pointer; size: longint): longint; cdecl; external libecore_ipc;
function ecore_ipc_client_server_get(cl: PEcore_Ipc_Client): PEcore_Ipc_Server; cdecl; external libecore_ipc;
function ecore_ipc_client_del(cl: PEcore_Ipc_Client): pointer; cdecl; external libecore_ipc;
procedure ecore_ipc_client_data_set(cl: PEcore_Ipc_Client; data: pointer); cdecl; external libecore_ipc;
function ecore_ipc_client_data_get(cl: PEcore_Ipc_Client): pointer; cdecl; external libecore_ipc;
procedure ecore_ipc_client_data_size_max_set(cl: PEcore_Ipc_Client; size: longint); cdecl; external libecore_ipc;
function ecore_ipc_client_data_size_max_get(cl: PEcore_Ipc_Client): longint; cdecl; external libecore_ipc;
function ecore_ipc_client_ip_get(cl: PEcore_Ipc_Client): pchar; cdecl; external libecore_ipc;
procedure ecore_ipc_client_flush(cl: PEcore_Ipc_Client); cdecl; external libecore_ipc;
function ecore_ipc_ssl_available_get: longint; cdecl; external libecore_ipc;

// === Konventiert am: 11-6-25 20:01:16 ===


implementation


{$ifdef endian_bif}

function ECORE_IPC_SWAP2NET64(x: UInt64): UInt64;
begin
  ECORE_IPC_SWAP2NET64 := Swap(x);
end;

function ECORE_IPC_SWAP2CPU64(x: UInt64): UInt64;
begin
  ECORE_IPC_SWAP2CPU64 := Swap(x);
end;

function ECORE_IPC_SWAP2NET32(x: UInt32): UInt32;
begin
  ECORE_IPC_SWAP2NET32 := Swap(x);
end;

function ECORE_IPC_SWAP2CPU32(x: UInt32): UInt32;
begin
  ECORE_IPC_SWAP2CPU32 := Swap(x);
end;

function ECORE_IPC_SWAP2NET16(x: UInt16): UInt16;
begin
  ECORE_IPC_SWAP2NET16 := Swap(x);
end;

function ECORE_IPC_SWAP2CPU16(x: UInt16): UInt16;
begin
  ECORE_IPC_SWAP2CPU16 := Swap(x);
end;

function ECORE_IPC_SWAP2NET8(x: UInt8): UInt8;
begin
  ECORE_IPC_SWAP2NET8 := x;
end;

function ECORE_IPC_SWAP2CPU8(x: UInt8): UInt8;
begin
  ECORE_IPC_SWAP2CPU8 := x;
end;

{$else}

function ECORE_IPC_SWAP2NET64(x: UInt64): UInt64;
begin
  ECORE_IPC_SWAP2NET64 := x;
end;

function ECORE_IPC_SWAP2CPU64(x: UInt64): UInt64;
begin
  ECORE_IPC_SWAP2CPU64 := x;
end;

function ECORE_IPC_SWAP2NET32(x: UInt32): UInt32;
begin
  ECORE_IPC_SWAP2NET32 := x;
end;

function ECORE_IPC_SWAP2CPU32(x: UInt32): UInt32;
begin
  ECORE_IPC_SWAP2CPU32 := x;
end;

function ECORE_IPC_SWAP2NET16(x: UInt16): UInt16;
begin
  ECORE_IPC_SWAP2NET16 := x;
end;

function ECORE_IPC_SWAP2CPU16(x: UInt16): UInt16;
begin
  ECORE_IPC_SWAP2CPU16 := x;
end;

function ECORE_IPC_SWAP2NET8(x: UInt8): UInt8;
begin
  ECORE_IPC_SWAP2NET8 := x;
end;

function ECORE_IPC_SWAP2CPU8(x: UInt8): UInt8;
begin
  ECORE_IPC_SWAP2CPU8 := x;
end;

{$endif}

end.

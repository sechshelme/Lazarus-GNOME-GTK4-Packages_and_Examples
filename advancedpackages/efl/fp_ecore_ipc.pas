unit fp_ecore_ipc;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

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
{ EINA_DEPRECATED; }
{$ifdef WORDS_BIGENDIAN}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET64(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU64(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET32(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU32(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET16(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU16(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET8(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU8(x: longint): longint;

{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }

function ECORE_IPC_SWAP2NET64(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU64(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET32(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU32(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET16(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU16(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET8(x: longint): longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU8(x: longint): longint;

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
  PEcore_Ipc_Event_Client_Add = ^TEcore_Ipc_Event_Client_Add;

  TEcore_Ipc_Event_Client_Add = record
    client: PEcore_Ipc_Client;
  end;

{*
 * @struct _Ecore_Ipc_Event_Client_Del
 *
 * An IPC structure for client_del event.
  }
  {*< An IPC connection handle  }
  PEcore_Ipc_Event_Client_Del = ^TEcore_Ipc_Event_Client_Del;

  TEcore_Ipc_Event_Client_Del = record
    client: PEcore_Ipc_Client;
  end;

{*
 * @struct _Ecore_Ipc_Event_Server_Add
 *
 * An IPC structure for server_add event.
  }
  {*< An IPC connection handle  }
  PEcore_Ipc_Event_Server_Add = ^TEcore_Ipc_Event_Server_Add;

  TEcore_Ipc_Event_Server_Add = record
    server: PEcore_Ipc_Server;
  end;

{*
 * @struct _Ecore_Ipc_Event_Server_Del
 *
 * An IPC structure for server_del event.
  }
  {*< An IPC connection handle  }
  PEcore_Ipc_Event_Server_Del = ^TEcore_Ipc_Event_Server_Del;

  TEcore_Ipc_Event_Server_Del = record
    server: PEcore_Ipc_Server;
  end;

{*
 * @struct _Ecore_Ipc_Event_Client_Data
 *
 * An IPC structure for client_data event.
  }
  {*< An IPC connection handle  }
  { FIXME: this needs to become an ipc message  }
  {*< The message major opcode number  }
  {*< The message minor opcode number  }
  {*< The message reference number  }
  {*< Reference number of the message it refers to  }
  {*< Requires response  }
  {*< The message data  }
  {*< The data length (in bytes)  }
  PEcore_Ipc_Event_Client_Data = ^TEcore_Ipc_Event_Client_Data;

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

{*
 * @struct _Ecore_Ipc_Event_Server_Data
 *
 * An IPC structure for server_data event.
  }
  {*< An IPC connection handle  }
  { FIXME: this needs to become an ipc message  }
  {*< The message major opcode number  }
  {*< The message minor opcode number  }
  {*< The message reference number  }
  {*< Reference number of the message it refers to  }
  {*< Requires response  }
  {*< The message data  }
  {*< The data length (in bytes)  }
  PEcore_Ipc_Event_Server_Data = ^TEcore_Ipc_Event_Server_Data;

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
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Retrieves whether the given IPC server is currently connected.
 * @param   svr The given IPC server.
 * @return @c EINA_TRUE if the server is connected, @c EINA_FALSE otherwise.
  }
function ecore_ipc_server_connected_get(svr: PEcore_Ipc_Server): TEina_Bool; cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Retrieves the list of clients for this server.
 * @param   svr The given IPC server.
 * @return  An Eina_List with the clients.
  }
function ecore_ipc_server_clients_get(svr: PEcore_Ipc_Server): PEina_List; cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Sends a message to the given IPC server.
 *
 * The content of the parameters, excluding the @p svr parameter, is up to
 * the client.
 *
 * @param   svr      The given IPC server.
 * @param   major    Major opcode of the message.
 * @param   minor    Minor opcode of the message.
 * @param   ref      Message reference number.
 * @param   ref_to   Reference number of the message this message refers to.
 * @param   response Requires response.
 * @param   data     The data to send as part of the message.
 * @param   size     Length of the data, in bytes, to send.
 * @return  Number of bytes sent.  @c 0 is returned if there is an error.
 * @todo    This function needs to become an IPC message.
 * @todo Fix up the documentation: Make sure what ref_to and response are.
  }
function ecore_ipc_server_send(svr: PEcore_Ipc_Server; major: longint; minor: longint; ref: longint; ref_to: longint;
  response: longint; data: pointer; size: longint): longint; cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Sets a limit on the number of clients that can be handled concurrently
 * by the given server, and a policy on what to do if excess clients try to
 * connect.
 * Beware that if you set this once ecore is already running, you may
 * already have pending CLIENT_ADD events in your event queue.  Those
 * clients have already connected and will not be affected by this call.
 * Only clients subsequently trying to connect will be affected.
 * @param   svr           The given server.
 * @param   client_limit  The maximum number of clients to handle
 *                        concurrently.  -1 means unlimited (default).  0
 *                        effectively disables the server.
 * @param   reject_excess_clients  Set to 1 to automatically disconnect
 *                        excess clients as soon as they connect if you are
 *                        already handling client_limit clients.  Set to 0
 *                        (default) to just hold off on the "accept()"
 *                        system call until the number of active clients
 *                        drops. This causes the kernel to queue up to 4096
 *                        connections (or your kernel's limit, whichever is
 *                        lower).
  }
procedure ecore_ipc_server_client_limit_set(svr: PEcore_Ipc_Server; client_limit: longint; reject_excess_clients: char); cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Sets the max data payload size for an Ipc message in bytes
 *
 * @param   svr           The given server.
 * @param   size          The maximum data payload size in bytes.
  }
procedure ecore_ipc_server_data_size_max_set(svr: PEcore_Ipc_Server; size: longint); cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Gets the max data payload size for an Ipc message in bytes
 *
 * @param   svr           The given server.
 * @return The maximum data payload in bytes.
  }
function ecore_ipc_server_data_size_max_get(svr: PEcore_Ipc_Server): longint; cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Gets the IP address of a server that has been connected to.
 *
 * @param   svr           The given server.
 * @return  A pointer to an internal string that contains the IP address of
 *          the connected server in the form "XXX.YYY.ZZZ.AAA" IP notation.
 *          This string should not be modified or trusted to stay valid after
 *          deletion for the @p svr object. If no IP is known NULL is returned.
  }
function ecore_ipc_server_ip_get(svr: PEcore_Ipc_Server): pchar; cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Flushes all pending data to the given server. Will return when done.
 *
 * @param   svr           The given server.
  }
procedure ecore_ipc_server_flush(svr: PEcore_Ipc_Server); cdecl; external libecore_ipc;
{*
 * @defgroup Ecore_IPC_Client_Group IPC Client Functions
 * @ingroup Ecore_IPC_Group
 *
 * Functions that deal with IPC client objects.
  }
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Sends a message to the given IPC client.
 *
 * @param   cl       The given IPC client.
 * @param   major    Major opcode of the message.
 * @param   minor    Minor opcode of the message.
 * @param   ref      Reference number of the message.
 * @param   ref_to   Reference number of the message this message refers to.
 * @param   response Requires response.
 * @param   data     The data to send as part of the message.
 * @param   size     Length of the data, in bytes, to send.
 * @return  The number of bytes sent.  @c 0 will be returned if there is
 *          an error.
 * @todo    This function needs to become an IPC message.
 * @todo    Make sure ref_to and response parameters are described correctly.
  }
function ecore_ipc_client_send(cl: PEcore_Ipc_Client; major: longint; minor: longint; ref: longint; ref_to: longint;
  response: longint; data: pointer; size: longint): longint; cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Retrieves the IPC server that the given IPC client is connected to.
 *
 * @param   cl The given IPC client.
 * @return  The IPC server the IPC client is connected to.
  }
function ecore_ipc_client_server_get(cl: PEcore_Ipc_Client): PEcore_Ipc_Server; cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Closes the connection and frees memory allocated to the given IPC
 * client.
 *
 * @param   cl The given client.
 * @return  Data associated with the client.
  }
function ecore_ipc_client_del(cl: PEcore_Ipc_Client): pointer; cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Sets the IPC data associated with the given IPC client to @p data.
 *
 * @param   cl   The given IPC client.
 * @param   data The data to associate with the IPC client.
  }
procedure ecore_ipc_client_data_set(cl: PEcore_Ipc_Client; data: pointer); cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Retrieves the data that has been associated with the given IPC client.
 *
 * @param   cl The given client.
 * @return  The data associated with the IPC client.
  }
function ecore_ipc_client_data_get(cl: PEcore_Ipc_Client): pointer; cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Sets the max data payload size for an Ipc message in bytes
 *
 * @param   cl        The given client.
 * @param   size          The maximum data payload size in bytes.
  }
procedure ecore_ipc_client_data_size_max_set(cl: PEcore_Ipc_Client; size: longint); cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Gets the max data payload size for an Ipc message in bytes
 *
 * @param   cl            The given client.
 * @return The maximum data payload size in bytes on success, @c -1 on failure.
  }
function ecore_ipc_client_data_size_max_get(cl: PEcore_Ipc_Client): longint; cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Gets the IP address of a client that has been connected to.
 *
 * @param   cl            The given client.
 * @return  A pointer to an internal string that contains the IP address of
 *          the connected server in the form "XXX.YYY.ZZZ.AAA" IP notation.
 *          This string should not be modified or trusted to stay valid after
 *          deletion for the @p cl object. If no IP is known @c NULL is
 *          returned.
  }
function ecore_ipc_client_ip_get(cl: PEcore_Ipc_Client): pchar; cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Flushes all pending data to the given client. Will return when done.
 *
 * @param   cl            The given client.
  }
procedure ecore_ipc_client_flush(cl: PEcore_Ipc_Client); cdecl; external libecore_ipc;
{*
 * @ingroup Ecore_Con_Client_Group
 * @brief Returns if SSL support is available
 *
 * @return  1 if SSL is available, 0 if it is not.
  }
function ecore_ipc_ssl_available_get: longint; cdecl; external libecore_ipc;
{ FIXME: need to add a callback to "ok" large ipc messages greater than  }
{        a certain size (security/DOS attack safety)  }
{ C++ end of extern C conditionnal removed }
{*
 * @
  }
{$endif}

// === Konventiert am: 11-6-25 20:01:16 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET64(x: longint): longint;
begin
  ECORE_IPC_SWAP2NET64 := eina_swap64(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU64(x: longint): longint;
begin
  ECORE_IPC_SWAP2CPU64 := eina_swap64(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET32(x: longint): longint;
begin
  ECORE_IPC_SWAP2NET32 := eina_swap32(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU32(x: longint): longint;
begin
  ECORE_IPC_SWAP2CPU32 := eina_swap32(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET16(x: longint): longint;
begin
  ECORE_IPC_SWAP2NET16 := eina_swap16(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU16(x: longint): longint;
begin
  ECORE_IPC_SWAP2CPU16 := eina_swap16(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET8(x: longint): longint;
begin
  ECORE_IPC_SWAP2NET8 := x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU8(x: longint): longint;
begin
  ECORE_IPC_SWAP2CPU8 := x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET64(x: longint): longint;
begin
  ECORE_IPC_SWAP2NET64 := x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU64(x: longint): longint;
begin
  ECORE_IPC_SWAP2CPU64 := x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET32(x: longint): longint;
begin
  ECORE_IPC_SWAP2NET32 := x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU32(x: longint): longint;
begin
  ECORE_IPC_SWAP2CPU32 := x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET16(x: longint): longint;
begin
  ECORE_IPC_SWAP2NET16 := x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU16(x: longint): longint;
begin
  ECORE_IPC_SWAP2CPU16 := x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2NET8(x: longint): longint;
begin
  ECORE_IPC_SWAP2NET8 := x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function ECORE_IPC_SWAP2CPU8(x: longint): longint;
begin
  ECORE_IPC_SWAP2CPU8 := x;
end;


end.

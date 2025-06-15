
unit Ecore_Ipc;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_Ipc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_Ipc.h
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
PEcore_Ipc_Client  = ^Ecore_Ipc_Client;
PEcore_Ipc_Event_Client_Add  = ^Ecore_Ipc_Event_Client_Add;
PEcore_Ipc_Event_Client_Data  = ^Ecore_Ipc_Event_Client_Data;
PEcore_Ipc_Event_Client_Del  = ^Ecore_Ipc_Event_Client_Del;
PEcore_Ipc_Event_Server_Add  = ^Ecore_Ipc_Event_Server_Add;
PEcore_Ipc_Event_Server_Data  = ^Ecore_Ipc_Event_Server_Data;
PEcore_Ipc_Event_Server_Del  = ^Ecore_Ipc_Event_Server_Del;
PEcore_Ipc_Server  = ^Ecore_Ipc_Server;
PEcore_Ipc_Type  = ^Ecore_Ipc_Type;
PEina_List  = ^Eina_List;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_IPC_H}
{$define _ECORE_IPC_H}
{$include <Eina.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{*
 * @defgroup Ecore_IPC_Group Ecore_IPC - Ecore inter-process communication functions.
 * @ingroup Ecore
 *
 * Functions that set up and shut down the Ecore IPC Library.
 *
 * @
  }
{ C++ extern C conditionnal removed }
type
{*< An IPC connection handle  }
{*< An IPC connection handle  }

function _ecore_ipc_swap_16(v:word):word;cdecl;external;
{ EINA_DEPRECATED; }
function _ecore_ipc_swap_32(v:dword):dword;cdecl;external;
{ EINA_DEPRECATED; }
function _ecore_ipc_swap_64(v:qword):qword;cdecl;external;
{ EINA_DEPRECATED; }
{$ifdef WORDS_BIGENDIAN}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET64(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU64(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET32(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU32(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET16(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU16(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET8(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU8(x : longint) : longint;

{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ECORE_IPC_SWAP2NET64(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU64(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET32(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU32(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET16(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU16(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET8(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU8(x : longint) : longint;

{$endif}
{ 1, 2, 4 and 8 byte datatypes  }
{ unpacking  }
{ padding data  }
{ strings  }
{ handy to calculate what sized block we need to alloc  }
{*
 * @typedef Ecore_Ipc_Type
 *
 * Enum containing IPC types.
  }
type
  PEcore_Ipc_Type = ^TEcore_Ipc_Type;
  TEcore_Ipc_Type =  Longint;
  Const
    ECORE_IPC_LOCAL_USER = 0;
    ECORE_IPC_LOCAL_SYSTEM = 1;
    ECORE_IPC_REMOTE_SYSTEM = 2;
    ECORE_IPC_USE_SSL = 1 shl 4;
    ECORE_IPC_NO_PROXY = 1 shl 5;
;
type
{*
 * @struct _Ecore_Ipc_Event_Client_Add
 *
 * An IPC structure for client_add event.
  }
{*< An IPC connection handle  }
  PEcore_Ipc_Event_Client_Add = ^TEcore_Ipc_Event_Client_Add;
  TEcore_Ipc_Event_Client_Add = record
      client : PEcore_Ipc_Client;
    end;

{*
 * @struct _Ecore_Ipc_Event_Client_Del
 *
 * An IPC structure for client_del event.
  }
{*< An IPC connection handle  }
  PEcore_Ipc_Event_Client_Del = ^TEcore_Ipc_Event_Client_Del;
  TEcore_Ipc_Event_Client_Del = record
      client : PEcore_Ipc_Client;
    end;

{*
 * @struct _Ecore_Ipc_Event_Server_Add
 *
 * An IPC structure for server_add event.
  }
{*< An IPC connection handle  }
  PEcore_Ipc_Event_Server_Add = ^TEcore_Ipc_Event_Server_Add;
  TEcore_Ipc_Event_Server_Add = record
      server : PEcore_Ipc_Server;
    end;

{*
 * @struct _Ecore_Ipc_Event_Server_Del
 *
 * An IPC structure for server_del event.
  }
{*< An IPC connection handle  }
  PEcore_Ipc_Event_Server_Del = ^TEcore_Ipc_Event_Server_Del;
  TEcore_Ipc_Event_Server_Del = record
      server : PEcore_Ipc_Server;
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
      client : PEcore_Ipc_Client;
      major : longint;
      minor : longint;
      ref : longint;
      ref_to : longint;
      response : longint;
      data : pointer;
      size : longint;
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
      server : PEcore_Ipc_Server;
      major : longint;
      minor : longint;
      ref : longint;
      ref_to : longint;
      response : longint;
      data : pointer;
      size : longint;
    end;

  var
    ECORE_IPC_EVENT_CLIENT_ADD : longint;cvar;external;
    ECORE_IPC_EVENT_CLIENT_DEL : longint;cvar;external;
    ECORE_IPC_EVENT_SERVER_ADD : longint;cvar;external;
    ECORE_IPC_EVENT_SERVER_DEL : longint;cvar;external;
    ECORE_IPC_EVENT_CLIENT_DATA : longint;cvar;external;
    ECORE_IPC_EVENT_SERVER_DATA : longint;cvar;external;
{*
 * @ingroup Ecore_IPC_Group
 * @brief Initializes the Ecore IPC library.
 * @return  Number of times the library has been initialised without
 *          being shut down.
  }

function ecore_ipc_init:longint;cdecl;external;
{*
 * @ingroup Ecore_IPC_Group
 * @brief Shuts down the Ecore IPC library.
 * @return  Number of times the library has been initialised without being
 *          shut down.
  }
function ecore_ipc_shutdown:longint;cdecl;external;
{*
 * @defgroup Ecore_IPC_Server_Group IPC Server Functions
 * @ingroup Ecore_IPC_Group
 *
 * Functions the deal with IPC server objects.
  }
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Creates an IPC server that listens for connections.
 *
 * For more details about the @p type, @p name and @p port
 * parameters, see the @ref ecore_con_server_add documentation.
 *
 * @param   type      The connection type.
 * @param   name       Name to associate with the socket used for connection.
 * @param   port       Number to identify with socket used for connection.
 * @param   data       Data to associate with the IPC server.
 * @return  New IPC server.  If there is an error, @c NULL is returned.
 * @todo    Need to add protocol type parameter to this function.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_ipc_server_add(_type:TEcore_Ipc_Type; name:Pchar; port:longint; data:pointer):PEcore_Ipc_Server;cdecl;external;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Creates an IPC server object to represent the IPC server listening
 * on the given port.
 *
 * For more details about the @p type, @p name and @p port
 * parameters, see the @ref ecore_con_server_connect documentation.
 *
 * @param   type       The IPC connection type.
 * @param   name       Name used to determine which socket to use for the
 *                     IPC connection.
 * @param   port       Number used to identify the socket to use for the
 *                     IPC connection.
 * @param   data       Data to associate with the server.
 * @return  A new IPC server.  @c NULL is returned on error.
 * @todo    Need to add protocol type parameter.
  }
(* Const before type ignored *)
function ecore_ipc_server_connect(_type:TEcore_Ipc_Type; name:Pchar; port:longint; data:pointer):PEcore_Ipc_Server;cdecl;external;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Closes the connection and frees the given IPC server.
 * @param   svr The given IPC server.
 * @return  The data associated with the server when it was created.
  }
function ecore_ipc_server_del(svr:PEcore_Ipc_Server):pointer;cdecl;external;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Retrieves the data associated with the given IPC server.
 * @param   svr The given IPC server.
 * @return  The associated data.
  }
function ecore_ipc_server_data_get(svr:PEcore_Ipc_Server):pointer;cdecl;external;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Retrieves whether the given IPC server is currently connected.
 * @param   svr The given IPC server.
 * @return @c EINA_TRUE if the server is connected, @c EINA_FALSE otherwise.
  }
function ecore_ipc_server_connected_get(svr:PEcore_Ipc_Server):TEina_Bool;cdecl;external;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Retrieves the list of clients for this server.
 * @param   svr The given IPC server.
 * @return  An Eina_List with the clients.
  }
function ecore_ipc_server_clients_get(svr:PEcore_Ipc_Server):PEina_List;cdecl;external;
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
(* Const before type ignored *)
function ecore_ipc_server_send(svr:PEcore_Ipc_Server; major:longint; minor:longint; ref:longint; ref_to:longint; 
           response:longint; data:pointer; size:longint):longint;cdecl;external;
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
procedure ecore_ipc_server_client_limit_set(svr:PEcore_Ipc_Server; client_limit:longint; reject_excess_clients:char);cdecl;external;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Sets the max data payload size for an Ipc message in bytes
 *
 * @param   svr           The given server.
 * @param   size          The maximum data payload size in bytes.
  }
procedure ecore_ipc_server_data_size_max_set(svr:PEcore_Ipc_Server; size:longint);cdecl;external;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Gets the max data payload size for an Ipc message in bytes
 *
 * @param   svr           The given server.
 * @return The maximum data payload in bytes.
  }
function ecore_ipc_server_data_size_max_get(svr:PEcore_Ipc_Server):longint;cdecl;external;
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
(* Const before type ignored *)
function ecore_ipc_server_ip_get(svr:PEcore_Ipc_Server):Pchar;cdecl;external;
{*
 * @ingroup Ecore_IPC_Server_Group
 * @brief Flushes all pending data to the given server. Will return when done.
 *
 * @param   svr           The given server.
  }
procedure ecore_ipc_server_flush(svr:PEcore_Ipc_Server);cdecl;external;
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
(* Const before type ignored *)
function ecore_ipc_client_send(cl:PEcore_Ipc_Client; major:longint; minor:longint; ref:longint; ref_to:longint; 
           response:longint; data:pointer; size:longint):longint;cdecl;external;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Retrieves the IPC server that the given IPC client is connected to.
 *
 * @param   cl The given IPC client.
 * @return  The IPC server the IPC client is connected to.
  }
function ecore_ipc_client_server_get(cl:PEcore_Ipc_Client):PEcore_Ipc_Server;cdecl;external;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Closes the connection and frees memory allocated to the given IPC
 * client.
 *
 * @param   cl The given client.
 * @return  Data associated with the client.
  }
function ecore_ipc_client_del(cl:PEcore_Ipc_Client):pointer;cdecl;external;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Sets the IPC data associated with the given IPC client to @p data.
 *
 * @param   cl   The given IPC client.
 * @param   data The data to associate with the IPC client.
  }
(* Const before type ignored *)
procedure ecore_ipc_client_data_set(cl:PEcore_Ipc_Client; data:pointer);cdecl;external;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Retrieves the data that has been associated with the given IPC client.
 *
 * @param   cl The given client.
 * @return  The data associated with the IPC client.
  }
function ecore_ipc_client_data_get(cl:PEcore_Ipc_Client):pointer;cdecl;external;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Sets the max data payload size for an Ipc message in bytes
 *
 * @param   cl        The given client.
 * @param   size          The maximum data payload size in bytes.
  }
procedure ecore_ipc_client_data_size_max_set(cl:PEcore_Ipc_Client; size:longint);cdecl;external;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Gets the max data payload size for an Ipc message in bytes
 *
 * @param   cl            The given client.
 * @return The maximum data payload size in bytes on success, @c -1 on failure.
  }
function ecore_ipc_client_data_size_max_get(cl:PEcore_Ipc_Client):longint;cdecl;external;
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
(* Const before type ignored *)
function ecore_ipc_client_ip_get(cl:PEcore_Ipc_Client):Pchar;cdecl;external;
{*
 * @ingroup Ecore_IPC_Client_Group
 * @brief Flushes all pending data to the given client. Will return when done.
 *
 * @param   cl            The given client.
  }
procedure ecore_ipc_client_flush(cl:PEcore_Ipc_Client);cdecl;external;
{*
 * @ingroup Ecore_Con_Client_Group
 * @brief Returns if SSL support is available
 *
 * @return  1 if SSL is available, 0 if it is not.
  }
function ecore_ipc_ssl_available_get:longint;cdecl;external;
{ FIXME: need to add a callback to "ok" large ipc messages greater than  }
{        a certain size (security/DOS attack safety)  }
{ C++ end of extern C conditionnal removed }
{*
 * @
  }
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET64(x : longint) : longint;
begin
  ECORE_IPC_SWAP2NET64:=eina_swap64(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU64(x : longint) : longint;
begin
  ECORE_IPC_SWAP2CPU64:=eina_swap64(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET32(x : longint) : longint;
begin
  ECORE_IPC_SWAP2NET32:=eina_swap32(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU32(x : longint) : longint;
begin
  ECORE_IPC_SWAP2CPU32:=eina_swap32(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET16(x : longint) : longint;
begin
  ECORE_IPC_SWAP2NET16:=eina_swap16(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU16(x : longint) : longint;
begin
  ECORE_IPC_SWAP2CPU16:=eina_swap16(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET8(x : longint) : longint;
begin
  ECORE_IPC_SWAP2NET8:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU8(x : longint) : longint;
begin
  ECORE_IPC_SWAP2CPU8:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET64(x : longint) : longint;
begin
  ECORE_IPC_SWAP2NET64:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU64(x : longint) : longint;
begin
  ECORE_IPC_SWAP2CPU64:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET32(x : longint) : longint;
begin
  ECORE_IPC_SWAP2NET32:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU32(x : longint) : longint;
begin
  ECORE_IPC_SWAP2CPU32:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET16(x : longint) : longint;
begin
  ECORE_IPC_SWAP2NET16:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU16(x : longint) : longint;
begin
  ECORE_IPC_SWAP2CPU16:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2NET8(x : longint) : longint;
begin
  ECORE_IPC_SWAP2NET8:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ECORE_IPC_SWAP2CPU8(x : longint) : longint;
begin
  ECORE_IPC_SWAP2CPU8:=x;
end;


end.

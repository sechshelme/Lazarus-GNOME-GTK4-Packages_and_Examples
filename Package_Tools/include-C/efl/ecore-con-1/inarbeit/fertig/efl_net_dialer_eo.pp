
unit efl_net_dialer_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_dialer_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_dialer_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Net_Dialer  = ^Efl_Net_Dialer;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_DIALER_EO_H_}
{$define _EFL_NET_DIALER_EO_H_}
{$ifndef _EFL_NET_DIALER_EO_CLASS_TYPE}
{$define _EFL_NET_DIALER_EO_CLASS_TYPE}
type
  PEfl_Net_Dialer = ^TEfl_Net_Dialer;
  TEfl_Net_Dialer = TEo;
{$endif}
{$ifndef _EFL_NET_DIALER_EO_TYPES}
{$define _EFL_NET_DIALER_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}

function efl_net_dialer_error_couldnt_connect_get:TEina_Error;cdecl;external;
{* The dialer could not connect to the remote
 *
 * @ingroup Efl_Net_Dialer_Error_COULDNT_CONNECT
  }
{ was #define dname def_expr }
function EFL_NET_DIALER_ERROR_COULDNT_CONNECT : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}

function efl_net_dialer_error_couldnt_resolve_proxy_get:TEina_Error;cdecl;external;
{* The dialer could not resolve the given proxy server
 *
 * @ingroup Efl_Net_Dialer_Error_COULDNT_RESOLVE_PROXY
  }
{ was #define dname def_expr }
function EFL_NET_DIALER_ERROR_COULDNT_RESOLVE_PROXY : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}

function efl_net_dialer_error_proxy_authentication_failed_get:TEina_Error;cdecl;external;
{* The dialer failed to authenticate against the proxy server
 *
 * @ingroup Efl_Net_Dialer_Error_PROXY_AUTHENTICATION_FAILED
  }
{ was #define dname def_expr }
function EFL_NET_DIALER_ERROR_PROXY_AUTHENTICATION_FAILED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Creates a client socket to reach a remote peer.
 *
 * The connection process starts when @ref efl_net_dialer_dial is executed.
 * This allows implementations to request more complex setups requiring a live
 * object handle, which is not possible during construction.
 *
 * The socket should be considered connected and ready to use only when
 * "connected" event is dispatched. By then @ref efl_io_reader_can_read_get and
 * @ref efl_io_writer_can_write_get should change accordingly.
 *
 * Once the socket is closed, @ref efl_io_closer_closed_get will be called and
 * the "closed" event is dispatched.
 *
 * @ingroup Efl_Net_Dialer
  }

{ was #define dname def_expr }
function EFL_NET_DIALER_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_dialer_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Dials to the remote peer.
 *
 * This method starts the connection process, resolves the address and then
 * proceeds to the actual connection.
 *
 * Once the connection is fully setup "connected" event is dispatched.
 *
 * @param[in] obj The object.
 * @param[in] address Remote address
 *
 * @return 0 on success, error code otherwise
 *
 * @ingroup Efl_Net_Dialer
  }
(* Const before type ignored *)
function efl_net_dialer_dial(obj:PEo; address:Pchar):TEina_Error;cdecl;external;
{$ifdef EFL_NET_DIALER_PROTECTED}
{*
 * @brief Returns the address given to @ref efl_net_dialer_dial.
 *
 * If the resolved address is required, listen to "resolved" event and use the
 * @ref efl_net_socket_address_remote_get property.
 *
 * @param[in] obj The object.
 * @param[in] address Remote address
 *
 * @ingroup Efl_Net_Dialer
  }
(* Const before type ignored *)
procedure efl_net_dialer_address_dial_set(obj:PEo; address:Pchar);cdecl;external;
{$endif}
{*
 * @brief Returns the address given to @ref efl_net_dialer_dial.
 *
 * If the resolved address is required, listen to "resolved" event and use the
 * @ref efl_net_socket_address_remote_get property.
 *
 * @param[in] obj The object.
 *
 * @return Remote address
 *
 * @ingroup Efl_Net_Dialer
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_net_dialer_address_dial_get(obj:PEo):Pchar;cdecl;external;
{$ifdef EFL_NET_DIALER_PROTECTED}
{*
 * @brief Returns whenever the socket is connected or not.
 *
 * Whenever this property becomes true the "connected" event should be
 * dispatched.
 *
 * @param[in] obj The object.
 * @param[in] connected @c true if the socket is connected, @c false otherwise
 *
 * @ingroup Efl_Net_Dialer
  }
procedure efl_net_dialer_connected_set(obj:PEo; connected:TEina_Bool);cdecl;external;
{$endif}
{*
 * @brief Returns whenever the socket is connected or not.
 *
 * Whenever this property becomes true the "connected" event should be
 * dispatched.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the socket is connected, @c false otherwise
 *
 * @ingroup Efl_Net_Dialer
  }
(* Const before type ignored *)

function efl_net_dialer_connected_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Controls/retrieves if the dialer should use a proxy.
 *
 * The proxy is an URL in the form:
 *
 * - protocol://username:password\@proxyserver:port
 *
 * Where protocol is defined by class, such as a TCP or UDP, dialer will use
 * 'socks4', 'socks4a', 'socks5' or 'socks5h'; while http and websocket will
 * want those or 'http'.
 *
 * Whenever appropriate dialers may use system proxy if the proxy is @c NULL
 * (the default). To forcefully disable proxy, use an empty string ("").
 *
 * - http://username:password\@proxyserver:port -
 * http://username\@proxyserver:port - http://proxyserver:port -
 * http://proxyserver  (default port) -
 * socks5://username:password\@proxyserver:port (SOCKSv5) -
 * socks5h://username\@proxyserver:port (let socks server to resolve domain) -
 * socks5://proxyserver:port - socks5://proxyserver (default port 1080) -
 * socks4a://proxyserver:port (SOCKSv4 and let socks server to resolve domain)
 * - socks4://proxyserver:port (SOCKSv4)
 *
 * @param[in] obj The object.
 * @param[in] proxy_url May be empty or @c NULL to unset
 *
 * @ingroup Efl_Net_Dialer
  }
(* Const before type ignored *)
procedure efl_net_dialer_proxy_set(obj:PEo; proxy_url:Pchar);cdecl;external;
{*
 * @brief Controls/retrieves if the dialer should use a proxy.
 *
 * The proxy is an URL in the form:
 *
 * - protocol://username:password\@proxyserver:port
 *
 * Where protocol is defined by class, such as a TCP or UDP, dialer will use
 * 'socks4', 'socks4a', 'socks5' or 'socks5h'; while http and websocket will
 * want those or 'http'.
 *
 * Whenever appropriate dialers may use system proxy if the proxy is @c NULL
 * (the default). To forcefully disable proxy, use an empty string ("").
 *
 * - http://username:password\@proxyserver:port -
 * http://username\@proxyserver:port - http://proxyserver:port -
 * http://proxyserver  (default port) -
 * socks5://username:password\@proxyserver:port (SOCKSv5) -
 * socks5h://username\@proxyserver:port (let socks server to resolve domain) -
 * socks5://proxyserver:port - socks5://proxyserver (default port 1080) -
 * socks4a://proxyserver:port (SOCKSv4 and let socks server to resolve domain)
 * - socks4://proxyserver:port (SOCKSv4)
 *
 * @param[in] obj The object.
 *
 * @return May be empty or @c NULL to unset
 *
 * @ingroup Efl_Net_Dialer
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_net_dialer_proxy_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief The timeout in seconds to use for dialing/connecting.
 *
 * This should be set before dialing.
 *
 * @param[in] obj The object.
 * @param[in] seconds Timeout value is seconds
 *
 * @ingroup Efl_Net_Dialer
  }
procedure efl_net_dialer_timeout_dial_set(obj:PEo; seconds:Tdouble);cdecl;external;
{*
 * @brief The timeout in seconds to use for dialing/connecting.
 *
 * This should be set before dialing.
 *
 * @param[in] obj The object.
 *
 * @return Timeout value is seconds
 *
 * @ingroup Efl_Net_Dialer
  }
(* Const before type ignored *)
function efl_net_dialer_timeout_dial_get(obj:PEo):Tdouble;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_NET_DIALER_EVENT_DIALER_RESOLVED : TEfl_Event_Description;cvar;external;
{*
 * @brief Notifies @ref efl_net_dialer_address_dial_get was resolved to
 * @ref efl_net_socket_address_remote_get.
 *
 * This is emitted before "connected" and may be emitted from
 * @ref efl_finalize. As such be sure to connect the callbacks during the
 * object construction.
 *
 * Some protocols allows redirects and this may be emitted multiple times, such
 * as HTTP.
 *
 * @return const char *
 *
 * @ingroup Efl_Net_Dialer
  }

{ was #define dname def_expr }
function EFL_NET_DIALER_EVENT_DIALER_RESOLVED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_NET_DIALER_EVENT_DIALER_ERROR : TEfl_Event_Description;cvar;external;
{* Some error happened and the socket stopped working.
 * @return Eina_Error
 *
 * @ingroup Efl_Net_Dialer
  }

{ was #define dname def_expr }
function EFL_NET_DIALER_EVENT_DIALER_ERROR : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_NET_DIALER_EVENT_DIALER_CONNECTED : TEfl_Event_Description;cvar;external;
{* Notifies the socket is connected to the remote peer.
 *
 * @ingroup Efl_Net_Dialer
  }

{ was #define dname def_expr }
function EFL_NET_DIALER_EVENT_DIALER_CONNECTED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_DIALER_ERROR_COULDNT_CONNECT : longint; { return type might be wrong }
  begin
    EFL_NET_DIALER_ERROR_COULDNT_CONNECT:=efl_net_dialer_error_couldnt_connect_get;
  end;

{ was #define dname def_expr }
function EFL_NET_DIALER_ERROR_COULDNT_RESOLVE_PROXY : longint; { return type might be wrong }
  begin
    EFL_NET_DIALER_ERROR_COULDNT_RESOLVE_PROXY:=efl_net_dialer_error_couldnt_resolve_proxy_get;
  end;

{ was #define dname def_expr }
function EFL_NET_DIALER_ERROR_PROXY_AUTHENTICATION_FAILED : longint; { return type might be wrong }
  begin
    EFL_NET_DIALER_ERROR_PROXY_AUTHENTICATION_FAILED:=efl_net_dialer_error_proxy_authentication_failed_get;
  end;

{ was #define dname def_expr }
function EFL_NET_DIALER_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_NET_DIALER_INTERFACE:=efl_net_dialer_interface_get;
  end;

{ was #define dname def_expr }
function EFL_NET_DIALER_EVENT_DIALER_RESOLVED : longint; { return type might be wrong }
  begin
    EFL_NET_DIALER_EVENT_DIALER_RESOLVED:=@(_EFL_NET_DIALER_EVENT_DIALER_RESOLVED);
  end;

{ was #define dname def_expr }
function EFL_NET_DIALER_EVENT_DIALER_ERROR : longint; { return type might be wrong }
  begin
    EFL_NET_DIALER_EVENT_DIALER_ERROR:=@(_EFL_NET_DIALER_EVENT_DIALER_ERROR);
  end;

{ was #define dname def_expr }
function EFL_NET_DIALER_EVENT_DIALER_CONNECTED : longint; { return type might be wrong }
  begin
    EFL_NET_DIALER_EVENT_DIALER_CONNECTED:=@(_EFL_NET_DIALER_EVENT_DIALER_CONNECTED);
  end;


end.

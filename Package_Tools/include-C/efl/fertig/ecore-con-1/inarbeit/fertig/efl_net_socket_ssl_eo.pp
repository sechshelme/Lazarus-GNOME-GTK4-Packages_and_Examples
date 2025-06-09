
unit efl_net_socket_ssl_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_socket_ssl_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_socket_ssl_eo.h
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
PEfl_Net_Socket  = ^Efl_Net_Socket;
PEfl_Net_Socket_Ssl  = ^Efl_Net_Socket_Ssl;
PEfl_Net_Ssl_Context  = ^Efl_Net_Ssl_Context;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SOCKET_SSL_EO_H_}
{$define _EFL_NET_SOCKET_SSL_EO_H_}
{$ifndef _EFL_NET_SOCKET_SSL_EO_CLASS_TYPE}
{$define _EFL_NET_SOCKET_SSL_EO_CLASS_TYPE}
type
  PEfl_Net_Socket_Ssl = ^TEfl_Net_Socket_Ssl;
  TEfl_Net_Socket_Ssl = TEo;
{$endif}
{$ifndef _EFL_NET_SOCKET_SSL_EO_TYPES}
{$define _EFL_NET_SOCKET_SSL_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}

function efl_net_socket_ssl_error_handshake_get:TEina_Error;cdecl;external;
{* Failed SSL handshake
 *
 * @ingroup Efl_Net_Socket_Ssl_Error_HANDSHAKE
  }
{ was #define dname def_expr }
function EFL_NET_SOCKET_SSL_ERROR_HANDSHAKE : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}

function efl_net_socket_ssl_error_certificate_verify_failed_get:TEina_Error;cdecl;external;
{* Failed to verify peer's certificate
 *
 * @ingroup Efl_Net_Socket_Ssl_Error_CERTIFICATE_VERIFY_FAILED
  }
{ was #define dname def_expr }
function EFL_NET_SOCKET_SSL_ERROR_CERTIFICATE_VERIFY_FAILED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A wrapper socket doing SSL (Secure Sockets Layer).
 *
 * Use this wrapper around an existing socket for secure communication. One
 * common use is to apply it to TCP sockets created with
 * @ref Efl_Net_Dialer_Tcp or @ref Efl_Net_Server_Tcp created with "client,add"
 * event.
 *
 * @ingroup Efl_Net_Socket_Ssl
  }

{ was #define dname def_expr }
function EFL_NET_SOCKET_SSL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_socket_ssl_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Adopt an Efl.Net.Dialer or regular Efl.Net.Socket that will be used
 * for the actual communication.
 *
 * If used with an Efl.Net.Dialer object, it will assume the 'connect' role,
 * otherwise will use 'accept'.
 *
 * This is a constructor only method and should be called before
 * @ref efl_finalize.
 *
 * @param[in] obj The object.
 * @param[in] efl_net_socket The socket to adopt
 * @param[in] ctx The SSL context to use when adopting the socket
 *
 * @ingroup Efl_Net_Socket_Ssl
  }
procedure efl_net_socket_ssl_adopt(obj:PEo; efl_net_socket:PEfl_Net_Socket; ctx:PEfl_Net_Ssl_Context);cdecl;external;
{$ifdef EFL_NET_SOCKET_SSL_PROTECTED}
{*
 * @brief Return the adopted object, if any. Be careful!
 *
 * @param[in] obj The object.
 * @param[out] efl_net_socket The adopted object, if any, otherwise @c NULL
 * @param[out] ctx The SSL context used when adopting the socket, if any,
 * otherwise @c NULL
 *
 * @return @c true if adopted, @c false otherwise
 *
 * @ingroup Efl_Net_Socket_Ssl
  }
(* Const before type ignored *)
function efl_net_socket_ssl_adopted_get(obj:PEo; efl_net_socket:PPEfl_Net_Socket; ctx:PPEfl_Net_Ssl_Context):TEina_Bool;cdecl;external;
{$endif}
{*
 * @brief How to verify the remote peer.
 *
 * @param[in] obj The object.
 * @param[in] verify_mode Remote verification mode
 *
 * @ingroup Efl_Net_Socket_Ssl
  }

procedure efl_net_socket_ssl_verify_mode_set(obj:PEo; verify_mode:TEfl_Net_Ssl_Verify_Mode);cdecl;external;
{*
 * @brief How to verify the remote peer.
 *
 * @param[in] obj The object.
 *
 * @return Remote verification mode
 *
 * @ingroup Efl_Net_Socket_Ssl
  }
(* Const before type ignored *)
function efl_net_socket_ssl_verify_mode_get(obj:PEo):TEfl_Net_Ssl_Verify_Mode;cdecl;external;
{*
 * @brief Define if hostname should be verified.
 *
 * This will check the socket hostname (without the port in case of an IP) or
 * the overriden value from @ref efl_net_socket_ssl_hostname_override_get.
 *
 * @param[in] obj The object.
 * @param[in] hostname_verify @c true if the hostname will be verified,
 * @c false otherwise
 *
 * @ingroup Efl_Net_Socket_Ssl
  }
procedure efl_net_socket_ssl_hostname_verify_set(obj:PEo; hostname_verify:TEina_Bool);cdecl;external;
{*
 * @brief Define if hostname should be verified.
 *
 * This will check the socket hostname (without the port in case of an IP) or
 * the overriden value from @ref efl_net_socket_ssl_hostname_override_get.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the hostname will be verified, @c false otherwise
 *
 * @ingroup Efl_Net_Socket_Ssl
  }
(* Const before type ignored *)
function efl_net_socket_ssl_hostname_verify_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Overrides the hostname to use for this socket.
 *
 * Most of time this is useful if you're using an IP address but the server
 * certificate only specifies DNS (names).
 *
 * If @c NULL, then it will fetch from socket using
 * @ref efl_net_socket_address_remote_get or
 * @ref efl_net_dialer_address_dial_get.
 *
 * It's only used if @ref efl_net_socket_ssl_hostname_verify_get is @c true.
 *
 * @param[in] obj The object.
 * @param[in] hostname_override Hostname for this socket
 *
 * @ingroup Efl_Net_Socket_Ssl
  }
(* Const before type ignored *)
procedure efl_net_socket_ssl_hostname_override_set(obj:PEo; hostname_override:Pchar);cdecl;external;
{*
 * @brief Overrides the hostname to use for this socket.
 *
 * Most of time this is useful if you're using an IP address but the server
 * certificate only specifies DNS (names).
 *
 * If @c NULL, then it will fetch from socket using
 * @ref efl_net_socket_address_remote_get or
 * @ref efl_net_dialer_address_dial_get.
 *
 * It's only used if @ref efl_net_socket_ssl_hostname_verify_get is @c true.
 *
 * @param[in] obj The object.
 *
 * @return Hostname for this socket
 *
 * @ingroup Efl_Net_Socket_Ssl
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_net_socket_ssl_hostname_override_get(obj:PEo):Pchar;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_NET_SOCKET_SSL_EVENT_SSL_READY : TEfl_Event_Description;cvar;external;
{* Notifies the SSL handshake has been performed and the socket is now able to
 * communicate
 *
 * @ingroup Efl_Net_Socket_Ssl
  }

{ was #define dname def_expr }
function EFL_NET_SOCKET_SSL_EVENT_SSL_READY : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_NET_SOCKET_SSL_EVENT_SSL_ERROR : TEfl_Event_Description;cvar;external;
{* An error such as @ref Efl_Net_Socket_Ssl_Error_HANDSHAKE
 * @return Eina_Error
 *
 * @ingroup Efl_Net_Socket_Ssl
  }

{ was #define dname def_expr }
function EFL_NET_SOCKET_SSL_EVENT_SSL_ERROR : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SOCKET_SSL_ERROR_HANDSHAKE : longint; { return type might be wrong }
  begin
    EFL_NET_SOCKET_SSL_ERROR_HANDSHAKE:=efl_net_socket_ssl_error_handshake_get;
  end;

{ was #define dname def_expr }
function EFL_NET_SOCKET_SSL_ERROR_CERTIFICATE_VERIFY_FAILED : longint; { return type might be wrong }
  begin
    EFL_NET_SOCKET_SSL_ERROR_CERTIFICATE_VERIFY_FAILED:=efl_net_socket_ssl_error_certificate_verify_failed_get;
  end;

{ was #define dname def_expr }
function EFL_NET_SOCKET_SSL_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SOCKET_SSL_CLASS:=efl_net_socket_ssl_class_get;
  end;

{ was #define dname def_expr }
function EFL_NET_SOCKET_SSL_EVENT_SSL_READY : longint; { return type might be wrong }
  begin
    EFL_NET_SOCKET_SSL_EVENT_SSL_READY:=@(_EFL_NET_SOCKET_SSL_EVENT_SSL_READY);
  end;

{ was #define dname def_expr }
function EFL_NET_SOCKET_SSL_EVENT_SSL_ERROR : longint; { return type might be wrong }
  begin
    EFL_NET_SOCKET_SSL_EVENT_SSL_ERROR:=@(_EFL_NET_SOCKET_SSL_EVENT_SSL_ERROR);
  end;


end.

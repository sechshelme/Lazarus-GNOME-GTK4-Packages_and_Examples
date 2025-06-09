
unit efl_net_socket_tcp_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_socket_tcp_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_socket_tcp_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Net_Socket_Tcp  = ^Efl_Net_Socket_Tcp;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SOCKET_TCP_EO_H_}
{$define _EFL_NET_SOCKET_TCP_EO_H_}
{$ifndef _EFL_NET_SOCKET_TCP_EO_CLASS_TYPE}
{$define _EFL_NET_SOCKET_TCP_EO_CLASS_TYPE}
type
  PEfl_Net_Socket_Tcp = ^TEfl_Net_Socket_Tcp;
  TEfl_Net_Socket_Tcp = TEo;
{$endif}
{$ifndef _EFL_NET_SOCKET_TCP_EO_TYPES}
{$define _EFL_NET_SOCKET_TCP_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A base TCP socket.
 *
 * This is the common class and takes an existing FD, usually created by an
 * dialer or server.
 *
 * @ingroup Efl_Net_Socket_Tcp
  }

{ was #define dname def_expr }
function EFL_NET_SOCKET_TCP_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_socket_tcp_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Controls keep-alive using SO_KEEPALIVE
 *
 * @param[in] obj The object.
 * @param[in] keep_alive @c true if keep alive is enabled, @c false otherwise
 *
 * @return @c true on success
 *
 * @ingroup Efl_Net_Socket_Tcp
  }
function efl_net_socket_tcp_keep_alive_set(obj:PEo; keep_alive:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Controls keep-alive using SO_KEEPALIVE
 *
 * @param[in] obj The object.
 *
 * @return @c true if keep alive is enabled, @c false otherwise
 *
 * @ingroup Efl_Net_Socket_Tcp
  }
(* Const before type ignored *)
function efl_net_socket_tcp_keep_alive_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Controls TCP's no-delay using TCP_NODELAY
 *
 * @param[in] obj The object.
 * @param[in] no_delay @c true if no delay is enabled, @c false otherwise
 *
 * @return @c true on success
 *
 * @ingroup Efl_Net_Socket_Tcp
  }
function efl_net_socket_tcp_no_delay_set(obj:PEo; no_delay:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Controls TCP's no-delay using TCP_NODELAY
 *
 * @param[in] obj The object.
 *
 * @return @c true if no delay is enabled, @c false otherwise
 *
 * @ingroup Efl_Net_Socket_Tcp
  }
(* Const before type ignored *)
function efl_net_socket_tcp_no_delay_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Controls TCP's cork using TCP_CORK
 *
 * @param[in] obj The object.
 * @param[in] cork @c true if cork is enabled, @c false otherwise
 *
 * @return @c true on success
 *
 * @ingroup Efl_Net_Socket_Tcp
  }
function efl_net_socket_tcp_cork_set(obj:PEo; cork:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Controls TCP's cork using TCP_CORK
 *
 * @param[in] obj The object.
 *
 * @return @c true if cork is enabled, @c false otherwise
 *
 * @ingroup Efl_Net_Socket_Tcp
  }
(* Const before type ignored *)
function efl_net_socket_tcp_cork_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SOCKET_TCP_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SOCKET_TCP_CLASS:=efl_net_socket_tcp_class_get;
  end;


end.

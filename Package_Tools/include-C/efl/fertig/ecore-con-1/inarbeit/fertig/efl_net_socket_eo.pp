
unit efl_net_socket_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_socket_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_socket_eo.h
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
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SOCKET_EO_H_}
{$define _EFL_NET_SOCKET_EO_H_}
{$ifndef _EFL_NET_SOCKET_EO_CLASS_TYPE}
{$define _EFL_NET_SOCKET_EO_CLASS_TYPE}
type
  PEfl_Net_Socket = ^TEfl_Net_Socket;
  TEfl_Net_Socket = TEo;
{$endif}
{$ifndef _EFL_NET_SOCKET_EO_TYPES}
{$define _EFL_NET_SOCKET_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief The basic socket interface.
 *
 * This is built upon the three core Input/Output interfaces: -
 * @ref Efl_Io_Reader: to receive data. - @ref Efl_Io_Writer: to send data. -
 * @ref Efl_Io_Closer: to close the socket for further operations.
 *
 * As such it can be used with utilities like @ref Efl_Io_Copier.
 *
 * @ingroup Efl_Net_Socket
  }

{ was #define dname def_expr }
function EFL_NET_SOCKET_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_socket_interface_get:PEfl_Class;cdecl;external;
{$ifdef EFL_NET_SOCKET_PROTECTED}
{*
 * @brief The local address, similar to getsockname().
 *
 * The actual value depends on the type of socket, such as an IPv4 (ip:port) or
 * IPv6 ([ip]:port) formatted for a TCP/UDP socket, the path if an Unix
 * Local...
 *
 * It's always resolved. If operations are working with domain names or URLs,
 * these are the values the kernel reports. It's similar to getsockname() in
 * behavior.
 *
 * @param[in] obj The object.
 * @param[in] address Local address
 *
 * @ingroup Efl_Net_Socket
  }
(* Const before type ignored *)
procedure efl_net_socket_address_local_set(obj:PEo; address:Pchar);cdecl;external;
{$endif}
{*
 * @brief The local address, similar to getsockname().
 *
 * The actual value depends on the type of socket, such as an IPv4 (ip:port) or
 * IPv6 ([ip]:port) formatted for a TCP/UDP socket, the path if an Unix
 * Local...
 *
 * It's always resolved. If operations are working with domain names or URLs,
 * these are the values the kernel reports. It's similar to getsockname() in
 * behavior.
 *
 * @param[in] obj The object.
 *
 * @return Local address
 *
 * @ingroup Efl_Net_Socket
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_net_socket_address_local_get(obj:PEo):Pchar;cdecl;external;
{$ifdef EFL_NET_SOCKET_PROTECTED}
{*
 * @brief The remote address, similar to getpeername().
 *
 * The actual value depends on the type of socket, like an IPv4 (ip:port) or
 * IPv6 ([ip]:port) formatted for a TCP/UDP socket, the path if an Unix
 * Local...
 *
 * It's always resolved. If operations are working with domain names or URLs,
 * these are the values the kernel reports. It's similar to getpeername() in
 * behavior.
 *
 * @param[in] obj The object.
 * @param[in] address Remote address
 *
 * @ingroup Efl_Net_Socket
  }
(* Const before type ignored *)
procedure efl_net_socket_address_remote_set(obj:PEo; address:Pchar);cdecl;external;
{$endif}
{*
 * @brief The remote address, similar to getpeername().
 *
 * The actual value depends on the type of socket, like an IPv4 (ip:port) or
 * IPv6 ([ip]:port) formatted for a TCP/UDP socket, the path if an Unix
 * Local...
 *
 * It's always resolved. If operations are working with domain names or URLs,
 * these are the values the kernel reports. It's similar to getpeername() in
 * behavior.
 *
 * @param[in] obj The object.
 *
 * @return Remote address
 *
 * @ingroup Efl_Net_Socket
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_net_socket_address_remote_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SOCKET_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_NET_SOCKET_INTERFACE:=efl_net_socket_interface_get;
  end;


end.

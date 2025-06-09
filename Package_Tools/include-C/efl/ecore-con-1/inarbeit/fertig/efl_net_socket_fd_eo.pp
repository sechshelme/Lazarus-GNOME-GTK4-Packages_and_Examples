
unit efl_net_socket_fd_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_socket_fd_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_socket_fd_eo.h
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
PEfl_Net_Socket_Fd  = ^Efl_Net_Socket_Fd;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SOCKET_FD_EO_H_}
{$define _EFL_NET_SOCKET_FD_EO_H_}
{$ifndef _EFL_NET_SOCKET_FD_EO_CLASS_TYPE}
{$define _EFL_NET_SOCKET_FD_EO_CLASS_TYPE}
type
  PEfl_Net_Socket_Fd = ^TEfl_Net_Socket_Fd;
  TEfl_Net_Socket_Fd = TEo;
{$endif}
{$ifndef _EFL_NET_SOCKET_FD_EO_TYPES}
{$define _EFL_NET_SOCKET_FD_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A base implementation for sockets over file descriptors (fd)
 *
 * This is the common class and takes an existing FD, usually created by an
 * dialler or server.
 *
 * @ref efl_io_closer_close_on_exec_get and
 * @ref efl_io_closer_close_on_invalidate_get are respected and default to
 * @c true.
 *
 * @ingroup Efl_Net_Socket_Fd
  }

{ was #define dname def_expr }
function EFL_NET_SOCKET_FD_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_socket_fd_class_get:PEfl_Class;cdecl;external;
{$ifdef EFL_NET_SOCKET_FD_PROTECTED}
{*
 * @brief The address family (AF_*) family of this socket.
 *
 * It will be one of AF_INET (IPv4), AF_INET6 (IPv6), AF_UNIX...
 *
 * It must be set before the @ref efl_loop_fd_set is called with a valid file
 * descriptor.
 *
 * @param[in] obj The object.
 * @param[in] family Address family
 *
 * @ingroup Efl_Net_Socket_Fd
  }
procedure efl_net_socket_fd_family_set(obj:PEo; family:longint);cdecl;external;
{$endif}
{*
 * @brief The address family (AF_*) family of this socket.
 *
 * It will be one of AF_INET (IPv4), AF_INET6 (IPv6), AF_UNIX...
 *
 * It must be set before the @ref efl_loop_fd_set is called with a valid file
 * descriptor.
 *
 * @param[in] obj The object.
 *
 * @return Address family
 *
 * @ingroup Efl_Net_Socket_Fd
  }
(* Const before type ignored *)

function efl_net_socket_fd_family_get(obj:PEo):longint;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SOCKET_FD_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SOCKET_FD_CLASS:=efl_net_socket_fd_class_get;
  end;


end.

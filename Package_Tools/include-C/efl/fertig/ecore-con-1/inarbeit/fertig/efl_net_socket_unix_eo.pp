
unit efl_net_socket_unix_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_socket_unix_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_socket_unix_eo.h
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
PEfl_Net_Socket_Unix  = ^Efl_Net_Socket_Unix;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SOCKET_UNIX_EO_H_}
{$define _EFL_NET_SOCKET_UNIX_EO_H_}
{$ifndef _EFL_NET_SOCKET_UNIX_EO_CLASS_TYPE}
{$define _EFL_NET_SOCKET_UNIX_EO_CLASS_TYPE}
type
  PEfl_Net_Socket_Unix = ^TEfl_Net_Socket_Unix;
  TEfl_Net_Socket_Unix = TEo;
{$endif}
{$ifndef _EFL_NET_SOCKET_UNIX_EO_TYPES}
{$define _EFL_NET_SOCKET_UNIX_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A base UNIX socket.
 *
 * This is the common class and takes an existing FD, usually created by an
 * dialer or server.
 *
 * @ingroup Efl_Net_Socket_Unix
  }

{ was #define dname def_expr }
function EFL_NET_SOCKET_UNIX_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_socket_unix_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SOCKET_UNIX_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SOCKET_UNIX_CLASS:=efl_net_socket_unix_class_get;
  end;


end.

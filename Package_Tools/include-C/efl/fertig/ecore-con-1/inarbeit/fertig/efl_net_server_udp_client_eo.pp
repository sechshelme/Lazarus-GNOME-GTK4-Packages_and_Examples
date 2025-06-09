
unit efl_net_server_udp_client_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_server_udp_client_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_server_udp_client_eo.h
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
PEfl_Net_Server_Udp_Client  = ^Efl_Net_Server_Udp_Client;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SERVER_UDP_CLIENT_EO_H_}
{$define _EFL_NET_SERVER_UDP_CLIENT_EO_H_}
{$ifndef _EFL_NET_SERVER_UDP_CLIENT_EO_CLASS_TYPE}
{$define _EFL_NET_SERVER_UDP_CLIENT_EO_CLASS_TYPE}
type
  PEfl_Net_Server_Udp_Client = ^TEfl_Net_Server_Udp_Client;
  TEfl_Net_Server_Udp_Client = TEo;
{$endif}
{$ifndef _EFL_NET_SERVER_UDP_CLIENT_EO_TYPES}
{$define _EFL_NET_SERVER_UDP_CLIENT_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A UDP client child of Efl.Net.Server_Udp
 *
 * Unlike connection protocols such as TCP or Local, UDP doesn't create extra
 * sockets for its "clients". This thin class will then provide the required
 * socket interface on top of the server internal socket.
 *
 * Given this limitation, some features such as 'cork' (used to coalesce
 * multiple writes() into a single datagram) are not available since it could
 * interfere with other clients.
 *
 * @ingroup Efl_Net_Server_Udp_Client
  }

{ was #define dname def_expr }
function EFL_NET_SERVER_UDP_CLIENT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_server_udp_client_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Query the next datagram size.
 *
 * This will query the next pending datagram size, in bytes. If no datagrams
 * are pending, 0 is returned.
 *
 * @param[in] obj The object.
 *
 * @return Size in bytes
 *
 * @ingroup Efl_Net_Server_Udp_Client
  }
function efl_net_server_udp_client_next_datagram_size_query(obj:PEo):Tsize_t;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SERVER_UDP_CLIENT_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SERVER_UDP_CLIENT_CLASS:=efl_net_server_udp_client_class_get;
  end;


end.

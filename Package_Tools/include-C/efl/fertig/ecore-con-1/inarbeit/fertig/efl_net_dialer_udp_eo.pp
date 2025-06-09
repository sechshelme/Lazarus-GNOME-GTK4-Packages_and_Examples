
unit efl_net_dialer_udp_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_dialer_udp_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_dialer_udp_eo.h
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
PEfl_Net_Dialer_Udp  = ^Efl_Net_Dialer_Udp;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_DIALER_UDP_EO_H_}
{$define _EFL_NET_DIALER_UDP_EO_H_}
{$ifndef _EFL_NET_DIALER_UDP_EO_CLASS_TYPE}
{$define _EFL_NET_DIALER_UDP_EO_CLASS_TYPE}
type
  PEfl_Net_Dialer_Udp = ^TEfl_Net_Dialer_Udp;
  TEfl_Net_Dialer_Udp = TEo;
{$endif}
{$ifndef _EFL_NET_DIALER_UDP_EO_TYPES}
{$define _EFL_NET_DIALER_UDP_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Connects to a remote UDP server.
 *
 * UDP proxies are not supported, not even using SOCKSv5.
 *
 * In addition to an IP:PORT, the UDP address to dial may be an IPv4 broadcast
 * (255.255.255.255), 'any ip' 0.0.0.0 (IPv4) '::' (IPv6) or a multicast of
 * both IPv4 and IPv6, then the group will be joined automatically.
 *
 * Any IP (0.0.0.0 or '::') and multicast addresses will allow incoming packets
 * on @ref efl_io_reader_read regardless of their source. If using a regular
 * IP, packets that do not match the remote peer will be dropped as spurious,
 * returning EAGAIN.
 *
 * To allow finer control, see:
 *
 * - @ref efl_net_socket_udp_bind_get: choose the local address to bind. -
 * @ref efl_net_socket_udp_multicast_join: join other multicast groups. -
 * @ref efl_net_socket_udp_multicast_loopback_get: if packets should be
 * delivered locally or only to remote peers. -
 * @ref efl_net_socket_udp_multicast_time_to_live_get: how far, in number of
 * hops, the packet should go.
 *
 * @ingroup Efl_Net_Dialer_Udp
  }

{ was #define dname def_expr }
function EFL_NET_DIALER_UDP_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_dialer_udp_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_DIALER_UDP_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_DIALER_UDP_CLASS:=efl_net_dialer_udp_class_get;
  end;


end.

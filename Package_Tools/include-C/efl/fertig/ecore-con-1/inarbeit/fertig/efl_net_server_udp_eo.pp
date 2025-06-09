
unit efl_net_server_udp_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_server_udp_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_server_udp_eo.h
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
PEfl_Net_Server_Udp  = ^Efl_Net_Server_Udp;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SERVER_UDP_EO_H_}
{$define _EFL_NET_SERVER_UDP_EO_H_}
{$ifndef _EFL_NET_SERVER_UDP_EO_CLASS_TYPE}
{$define _EFL_NET_SERVER_UDP_EO_CLASS_TYPE}
type
  PEfl_Net_Server_Udp = ^TEfl_Net_Server_Udp;
  TEfl_Net_Server_Udp = TEo;
{$endif}
{$ifndef _EFL_NET_SERVER_UDP_EO_TYPES}
{$define _EFL_NET_SERVER_UDP_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* A UDP server.
 *
 * @ingroup Efl_Net_Server_Udp
  }

{ was #define dname def_expr }
function EFL_NET_SERVER_UDP_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_server_udp_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Avoids sent UDP packets being routed by a gateway, limiting them to
 * the local network.
 *
 * This will use SO_DONTROUTE option to avoid gateways routing sent packets to
 * outside the local network. It's useful for some protocols that only want the
 * local area to be affected.
 *
 * @param[in] obj The object.
 * @param[in] dont_route If @c true limit packets to the local network,
 * @c false otherwise
 *
 * @return @c true on success
 *
 * @ingroup Efl_Net_Server_Udp
  }
function efl_net_server_udp_dont_route_set(obj:PEo; dont_route:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Avoids sent UDP packets being routed by a gateway, limiting them to
 * the local network.
 *
 * This will use SO_DONTROUTE option to avoid gateways routing sent packets to
 * outside the local network. It's useful for some protocols that only want the
 * local area to be affected.
 *
 * @param[in] obj The object.
 *
 * @return If @c true limit packets to the local network, @c false otherwise
 *
 * @ingroup Efl_Net_Server_Udp
  }
(* Const before type ignored *)
function efl_net_server_udp_dont_route_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Joins a multicast group.
 *
 * The multicast address should be in the format:
 *
 * IP\@INTERFACE
 *
 * With '\@INTERFACE' being optional, such as:
 *
 * 224.0.0.1 - use any interface (ie: 0.0.0.0) 224.0.0.1@0.0.0.0
 * 224.0.0.1@192.168.0.1 - use the interface assigned to 192.168.0.1 ff02::1@0
 * - use any interface ff02::1@1 - use loopback interface (idx=1)
 *
 * @param[in] obj The object.
 * @param[in] address Multicast group address
 *
 * @return 0 on success, error code otherwise
 *
 * @ingroup Efl_Net_Server_Udp
  }
(* Const before type ignored *)
function efl_net_server_udp_multicast_join(obj:PEo; address:Pchar):TEina_Error;cdecl;external;
{*
 * @brief Leaves a multicast group.
 *
 * This reverses the effect of @ref efl_net_server_udp_multicast_join.
 *
 * @param[in] obj The object.
 * @param[in] address Multicast group address
 *
 * @return 0 on success, error code otherwise
 *
 * @ingroup Efl_Net_Server_Udp
  }
(* Const before type ignored *)
function efl_net_server_udp_multicast_leave(obj:PEo; address:Pchar):TEina_Error;cdecl;external;
{*
 * @brief Returns the multicast groups this server has joined.
 *
 * The iterator is only valid until a new group is joined or left using
 * @ref efl_net_server_udp_multicast_join or
 * @ref efl_net_server_udp_multicast_leave.
 *
 * @param[in] obj The object.
 *
 * @return List of multicast groups
 *
 * @ingroup Efl_Net_Server_Udp
  }
function efl_net_server_udp_multicast_groups_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief Controls time to live in number of hops.
 *
 * If 1 (default), packets are only delivered to the local network.
 *
 * @param[in] obj The object.
 * @param[in] ttl Time to live
 *
 * @return 0 on success, error code otherwise
 *
 * @ingroup Efl_Net_Server_Udp
  }
function efl_net_server_udp_multicast_time_to_live_set(obj:PEo; ttl:Tuint8_t):TEina_Error;cdecl;external;
{*
 * @brief Controls time to live in number of hops.
 *
 * If 1 (default), packets are only delivered to the local network.
 *
 * @param[in] obj The object.
 *
 * @return Time to live
 *
 * @ingroup Efl_Net_Server_Udp
  }
(* Const before type ignored *)
function efl_net_server_udp_multicast_time_to_live_get(obj:PEo):Tuint8_t;cdecl;external;
{*
 * @brief Controls whenever multicast will loopback packets locally.
 *
 * If @c false, then packets won't be looped back locally, just delivered for
 * remote peers.
 *
 * @param[in] obj The object.
 * @param[in] loopback @c true when multicast packets are looped back, @c false
 * otherwise
 *
 * @return 0 on success, error code otherwise
 *
 * @ingroup Efl_Net_Server_Udp
  }
function efl_net_server_udp_multicast_loopback_set(obj:PEo; loopback:TEina_Bool):TEina_Error;cdecl;external;
{*
 * @brief Controls whenever multicast will loopback packets locally.
 *
 * If @c false, then packets won't be looped back locally, just delivered for
 * remote peers.
 *
 * @param[in] obj The object.
 *
 * @return @c true when multicast packets are looped back, @c false otherwise
 *
 * @ingroup Efl_Net_Server_Udp
  }
(* Const before type ignored *)
function efl_net_server_udp_multicast_loopback_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SERVER_UDP_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SERVER_UDP_CLASS:=efl_net_server_udp_class_get;
  end;


end.

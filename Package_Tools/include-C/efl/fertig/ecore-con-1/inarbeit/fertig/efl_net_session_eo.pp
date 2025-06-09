
unit efl_net_session_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_session_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_session_eo.h
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
PEfl_Net_Session  = ^Efl_Net_Session;
PEfl_Net_Session_State  = ^Efl_Net_Session_State;
PEfl_Net_Session_Technology  = ^Efl_Net_Session_Technology;
PEo  = ^Eo;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SESSION_EO_H_}
{$define _EFL_NET_SESSION_EO_H_}
{$ifndef _EFL_NET_SESSION_EO_CLASS_TYPE}
{$define _EFL_NET_SESSION_EO_CLASS_TYPE}
type
  PEfl_Net_Session = ^TEfl_Net_Session;
  TEfl_Net_Session = TEo;
{$endif}
{$ifndef _EFL_NET_SESSION_EO_TYPES}
{$define _EFL_NET_SESSION_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Provides the session connectivity state.
 *
 * @ingroup Efl_Net_Session_State
  }
{*< No access point is connected.  }
{*< At least one access point has connected and
                                * the internet connection hasn't been verified.
                                 }
{*< At least one access point has connected and
                                * the internet connection has been verified.  }
type
  PEfl_Net_Session_State = ^TEfl_Net_Session_State;
  TEfl_Net_Session_State =  Longint;
  Const
    EFL_NET_SESSION_STATE_OFFLINE = 0;
    EFL_NET_SESSION_STATE_LOCAL = 1;
    EFL_NET_SESSION_STATE_ONLINE = 2;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Bitwise-able technologies to allow for a network session.
 *
 * @ingroup Efl_Net_Session_Technology
  }
{*< Type: unknown  }
{ 1 >> 1  }{*< Type: ethernet  }
{ 1 >> 2  }{*< Type: WiFi  }
{ 1 >> 3  }{*< Type: Bluetooth  }
{ 1 >> 4  }{*< Type:
                                                          * cellular/mobile  }
{ 1 >> 6  }{*< Type: Virtual Private
                                                     * Network  }
{ 1 >> 7  }{*< Type: USB gadget  }
{ ((((Efl.Net.Session_Technology.ethernet ^ Efl.Net.Session_Technology.wifi) ^ Efl.Net.Session_Technology.bluetooth) ^ Efl.Net.Session_Technology.cellular) ^ Efl.Net.Session_Technology.vpn) ^ Efl.Net.Session_Technology.gadget  }{*< All technology types  }
type
  PEfl_Net_Session_Technology = ^TEfl_Net_Session_Technology;
  TEfl_Net_Session_Technology =  Longint;
  Const
    EFL_NET_SESSION_TECHNOLOGY_UNKNOWN = 0;
    EFL_NET_SESSION_TECHNOLOGY_ETHERNET = 2;
    EFL_NET_SESSION_TECHNOLOGY_WIFI = 4;
    EFL_NET_SESSION_TECHNOLOGY_BLUETOOTH = 8;
    EFL_NET_SESSION_TECHNOLOGY_CELLULAR = 16;
    EFL_NET_SESSION_TECHNOLOGY_VPN = 64;
    EFL_NET_SESSION_TECHNOLOGY_GADGET = 128;
    EFL_NET_SESSION_TECHNOLOGY_ALL = 222;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Used by application to request network connectivity.
 *
 * This API is targeted at applications that need access to the network,
 * specifying the allowed bearer technologies to connect to the internet, as
 * well as whether local networking is enough or validated internet access is
 * required.
 *
 * Some platforms may not implement the backend for this class. In this cases
 * the system will report always @ref efl_net_session_state_get "online"
 * (@Efl.Net.Session_State.online) and other properties will be @c NULL, such
 * as @ref efl_net_session_network_name_get,
 * @ref efl_net_session_interface_get, @ref efl_net_session_ipv4_get and
 * @ref efl_net_session_ipv6_get; as well as
 * @ref efl_net_session_technology_get is set to
 * @ref EFL_NET_SESSION_TECHNOLOGY_UNKNOWN. As such if you need to detect for
 * an actual backend, check if the state is online but those properties are
 * @c NULL or technology is unknown.
 *
 * @note the @ref efl_net_session_connect method is subject to backend policy.
 * For instance, ConnMan uses
 * https://github.com/aldebaran/connman/blob/master/doc/session-policy-format.txt
 *
 * @ingroup Efl_Net_Session
  }

{ was #define dname def_expr }
function EFL_NET_SESSION_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_session_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Asks the session to be connected.
 *
 * This method doesn't need to be called if an application only needs to
 * monitor the connectivity state, such as  a poller which will only try to
 * access the webservice when there is an existing connection, without
 * triggering one.
 *
 * This method is subject to backend policy. For instance, ConnMan uses
 * https://github.com/aldebaran/connman/blob/master/doc/session-policy-format.txt
 *
 * @param[in] obj The object.
 * @param[in] online_required If @c false, access points with local state are
 * enough. If @c true, the access point must be in online state, with a
 * validated internet connection
 * @param[in] technologies_allowed Bitwise OR of technologies to allow
 *
 * @ingroup Efl_Net_Session
  }
procedure efl_net_session_connect(obj:PEo; online_required:TEina_Bool; technologies_allowed:TEfl_Net_Session_Technology);cdecl;external;
{*
 * @brief Indicates this session doesn't need a connection anymore.
 *
 * This reverses the effect of @ref efl_net_session_connect, let the system
 * disconnect if nothing else needs a connection. You can still use the session
 * object to monitor the connectivity state via properties and "changed" event.
 * @param[in] obj The object.
 *
 * @ingroup Efl_Net_Session
  }
procedure efl_net_session_disconnect(obj:PEo);cdecl;external;
{*
 * @brief The user-friendly access point name.
 *
 * @param[in] obj The object.
 *
 * @return Access point name
 *
 * @ingroup Efl_Net_Session
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_net_session_network_name_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief If the session connectivity is offline, local or online.
 *
 * @note if there is no backend for this class, then state will be always
 * online, however @ref efl_net_session_technology_get will be unknown,
 * @ref efl_net_session_interface_get, @ref efl_net_session_network_name_get,
 * @ref efl_net_session_ipv4_get and @ref efl_net_session_ipv6_get will be
 * @c NULL.
 *
 * @param[in] obj The object.
 *
 * @return Network session state
 *
 * @ingroup Efl_Net_Session
  }
(* Const before type ignored *)
function efl_net_session_state_get(obj:PEo):TEfl_Net_Session_State;cdecl;external;
{*
 * @brief The access point technology that backs this session
 *
 * @param[in] obj The object.
 *
 * @return Network session technology
 *
 * @ingroup Efl_Net_Session
  }
(* Const before type ignored *)
function efl_net_session_technology_get(obj:PEo):TEfl_Net_Session_Technology;cdecl;external;
{*
 * @brief The interface allows the application to assign the socket to a given
 * device using SO_BINDTODEVICE
 *
 * @param[in] obj The object.
 *
 * @return Network interface to bind to
 *
 * @ingroup Efl_Net_Session
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_net_session_interface_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief IPv4 in use for this session.
 *
 * @param[in] obj The object.
 * @param[out] address IPv4 address
 * @param[out] netmask IPv4 netmask
 * @param[out] gateway IPv4 gateway
 *
 * @ingroup Efl_Net_Session
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_session_ipv4_get(obj:PEo; address:PPchar; netmask:PPchar; gateway:PPchar);cdecl;external;
{*
 * @brief IPv6 in use for this session.
 *
 * @param[in] obj The object.
 * @param[out] address IPv6 address
 * @param[out] prefix_length IPv6 prefix
 * @param[out] netmask IPv6 netmask
 * @param[out] gateway IPv6 gateway
 *
 * @ingroup Efl_Net_Session
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_session_ipv6_get(obj:PEo; address:PPchar; prefix_length:Puint8_t; netmask:PPchar; gateway:PPchar);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_NET_SESSION_EVENT_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when some properties were changed.
 *
 * @ingroup Efl_Net_Session
  }

{ was #define dname def_expr }
function EFL_NET_SESSION_EVENT_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SESSION_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SESSION_CLASS:=efl_net_session_class_get;
  end;

{ was #define dname def_expr }
function EFL_NET_SESSION_EVENT_CHANGED : longint; { return type might be wrong }
  begin
    EFL_NET_SESSION_EVENT_CHANGED:=@(_EFL_NET_SESSION_EVENT_CHANGED);
  end;


end.

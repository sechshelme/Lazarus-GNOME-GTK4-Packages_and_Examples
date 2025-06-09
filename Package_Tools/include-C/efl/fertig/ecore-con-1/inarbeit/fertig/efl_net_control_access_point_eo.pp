
unit efl_net_control_access_point_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_control_access_point_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_control_access_point_eo.h
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
PEfl_Net_Control_Access_Point  = ^Efl_Net_Control_Access_Point;
PEfl_Net_Control_Access_Point_Error  = ^Efl_Net_Control_Access_Point_Error;
PEfl_Net_Control_Access_Point_Ipv4_Method  = ^Efl_Net_Control_Access_Point_Ipv4_Method;
PEfl_Net_Control_Access_Point_Ipv6_Method  = ^Efl_Net_Control_Access_Point_Ipv6_Method;
PEfl_Net_Control_Access_Point_Proxy_Method  = ^Efl_Net_Control_Access_Point_Proxy_Method;
PEfl_Net_Control_Access_Point_Security  = ^Efl_Net_Control_Access_Point_Security;
PEfl_Net_Control_Access_Point_State  = ^Efl_Net_Control_Access_Point_State;
PEfl_Net_Control_Technology  = ^Efl_Net_Control_Technology;
PEina_Future  = ^Eina_Future;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_CONTROL_ACCESS_POINT_EO_H_}
{$define _EFL_NET_CONTROL_ACCESS_POINT_EO_H_}
{$ifndef _EFL_NET_CONTROL_ACCESS_POINT_EO_CLASS_TYPE}
{$define _EFL_NET_CONTROL_ACCESS_POINT_EO_CLASS_TYPE}
type
  PEfl_Net_Control_Access_Point = ^TEfl_Net_Control_Access_Point;
  TEfl_Net_Control_Access_Point = TEo;
{$endif}
{$ifndef _EFL_NET_CONTROL_ACCESS_POINT_EO_TYPES}
{$define _EFL_NET_CONTROL_ACCESS_POINT_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Provides the access point state.
 *
 * @ingroup Efl_Net_Control_Access_Point_State
  }
{*< Nothing is happening with
                                                * this access point  }
{*< The access point is
                                                   * trying to associate
                                                   * itself. This is the first
                                                   * state after a connection
                                                   * attempt.  }
{*< The access point is
                                                     * configuring itself, such
                                                     * as DHCP.  }
{*< The access point is connected
                                             * but the internet connection
                                             * hasn't been validated.  }
{*< The access point is connected
                                              * and the internet connection has
                                              * been validated.  }
{*< The access point is
                                                  * disconnecting.  }
{*< The connection attempt failed,
                                              * @ref efl_net_control_access_point_error_get
                                              * will provide more details  }
type
  PEfl_Net_Control_Access_Point_State = ^TEfl_Net_Control_Access_Point_State;
  TEfl_Net_Control_Access_Point_State =  Longint;
  Const
    EFL_NET_CONTROL_ACCESS_POINT_STATE_IDLE = 0;
    EFL_NET_CONTROL_ACCESS_POINT_STATE_ASSOCIATION = 1;
    EFL_NET_CONTROL_ACCESS_POINT_STATE_CONFIGURATION = 2;
    EFL_NET_CONTROL_ACCESS_POINT_STATE_LOCAL = 3;
    EFL_NET_CONTROL_ACCESS_POINT_STATE_ONLINE = 4;
    EFL_NET_CONTROL_ACCESS_POINT_STATE_DISCONNECT = 5;
    EFL_NET_CONTROL_ACCESS_POINT_STATE_FAILURE = 6;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* The reason for the connection error.
 *
 * @ingroup Efl_Net_Control_Access_Point_Error
  }
{*< All OK, no errors  }
{*< Wireless device is out
                                                    * of range.  }
{*< PIN was required and is
                                                   * missing.  }
{*< DHCP failed to provide
                                                   * configuration.  }
{*< Could not connect to
                                                      * access point.  }
{*< Login or authentication
                                                   * information was incorrect,
                                                   * agent_request_input event
                                                   * may be emitted.  }
type
  PEfl_Net_Control_Access_Point_Error = ^TEfl_Net_Control_Access_Point_Error;
  TEfl_Net_Control_Access_Point_Error =  Longint;
  Const
    EFL_NET_CONTROL_ACCESS_POINT_ERROR_NONE = 0;
    EFL_NET_CONTROL_ACCESS_POINT_ERROR_OUT_OF_RANGE = 1;
    EFL_NET_CONTROL_ACCESS_POINT_ERROR_PIN_MISSING = 2;
    EFL_NET_CONTROL_ACCESS_POINT_ERROR_DHCP_FAILED = 3;
    EFL_NET_CONTROL_ACCESS_POINT_ERROR_CONNECT_FAILED = 4;
    EFL_NET_CONTROL_ACCESS_POINT_ERROR_LOGIN_FAILED = 5;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Bitwise-able securities supported by an access point.
 *
 * @ingroup Efl_Net_Control_Access_Point_Security
  }
{*< Unknown  }
{ 1 >> 0  }{*< Open access, no security  }
{ 1 >> 1  }{*< WEP  }
{ 1 >> 2  }{*< PSK (Pre Shared Key), such as WPA
                                                               * or RSN  }
{ 1 >> 3  }{*< IEEE 802.1X  }
type
  PEfl_Net_Control_Access_Point_Security = ^TEfl_Net_Control_Access_Point_Security;
  TEfl_Net_Control_Access_Point_Security =  Longint;
  Const
    EFL_NET_CONTROL_ACCESS_POINT_SECURITY_UNKNOW = 0;
    EFL_NET_CONTROL_ACCESS_POINT_SECURITY_NONE = 1;
    EFL_NET_CONTROL_ACCESS_POINT_SECURITY_WEP = 2;
    EFL_NET_CONTROL_ACCESS_POINT_SECURITY_PSK = 4;
    EFL_NET_CONTROL_ACCESS_POINT_SECURITY_IEEE802_1X = 8;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* The method used to configure IPv4
 *
 * @ingroup Efl_Net_Control_Access_Point_Ipv4_Method
  }
{*< IPv4 is disabled.  }
{*< IPv4 is configured using
                                                  * DHCP.  }
{*< IPv4 is manually set
                                                    * using address, netmask
                                                    * and gateway  }
{*< Only to be used with
                                                  * @ref efl_net_control_access_point_configuration_ipv4_get
                                                   }
type
  PEfl_Net_Control_Access_Point_Ipv4_Method = ^TEfl_Net_Control_Access_Point_Ipv4_Method;
  TEfl_Net_Control_Access_Point_Ipv4_Method =  Longint;
  Const
    EFL_NET_CONTROL_ACCESS_POINT_IPV4_METHOD_OFF = 0;
    EFL_NET_CONTROL_ACCESS_POINT_IPV4_METHOD_DHCP = 1;
    EFL_NET_CONTROL_ACCESS_POINT_IPV4_METHOD_MANUAL = 2;
    EFL_NET_CONTROL_ACCESS_POINT_IPV4_METHOD_UNSET = 3;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* The method used to configure IPv6
 *
 * @ingroup Efl_Net_Control_Access_Point_Ipv6_Method
  }
{*< IPv6 is disabled.  }
{*< IPv6 is fixed by operator
                                                   * and cannot be changed.  }
{*< IPv6 is manually set
                                                    * using address, netmask
                                                    * and gateway.  }
{*< IPv6 is set using dhcp or using a
                                                               * tunnel6to4. No privacy extensions
                                                               * should be used.  }
{*< IPv6 is set using dhcp or using a
                                                                 * tunnel6to4, privacy extensions are
                                                                 * used and the system prefers a public
                                                                 * IP address over temporary addresses.
                                                                  }
{*< IPv6 is set using dhcp or using a
                                                                    * tunnel6to4, privacy extensions are
                                                                    * used and the system prefers a
                                                                    * temporary IP address over public
                                                                    * addresses.  }
{*< IPv6 was configured
                                                        * using a 6-to-4
                                                        * tunnel. This cannot
                                                        * be set by the user,
                                                        * which is set to
                                                        * "auto" instead  }
{*< Only to be used with
                                                  * @ref efl_net_control_access_point_configuration_ipv6_get
                                                   }
type
  PEfl_Net_Control_Access_Point_Ipv6_Method = ^TEfl_Net_Control_Access_Point_Ipv6_Method;
  TEfl_Net_Control_Access_Point_Ipv6_Method =  Longint;
  Const
    EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_OFF = 0;
    EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_FIXED = 1;
    EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_MANUAL = 2;
    EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_AUTO_PRIVACY_NONE = 3;
    EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_AUTO_PRIVACY_PUBLIC = 4;
    EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_AUTO_PRIVACY_TEMPORARY = 5;
    EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_TUNNEL6TO4 = 6;
    EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_UNSET = 7;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* The method used to configure Proxies.
 *
 * @ingroup Efl_Net_Control_Access_Point_Proxy_Method
  }
{*< Direct connection to
                                                      * the internet, no proxy
                                                      * used.  }
{*< Proxy is autoconfigured
                                                   * using
                                                   * Proxy-Auto-Configuration
                                                   * (PAC) using given URL.  }
{*< Proxy is configured
                                                     * manually using servers
                                                     * and excludes.  }
{*< Only to be used with
                                                   * @ref efl_net_control_access_point_configuration_proxy_get.
                                                    }
type
  PEfl_Net_Control_Access_Point_Proxy_Method = ^TEfl_Net_Control_Access_Point_Proxy_Method;
  TEfl_Net_Control_Access_Point_Proxy_Method =  Longint;
  Const
    EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_OFF = 0;
    EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_AUTO = 1;
    EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_MANUAL = 2;
    EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_UNSET = 3;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief An access point for network connectivity.
 *
 * The @ref Efl_Net_Control_Manager is composed of multiple technologies, each
 * create access points to allow configuration and connection.
 *
 * An application requiring only a network connection can just use a
 * @ref Efl_Net_Session instead.
 *
 * @ingroup Efl_Net_Control_Access_Point
  }

{ was #define dname def_expr }
function EFL_NET_CONTROL_ACCESS_POINT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_control_access_point_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Connects to this access point.
 *
 * This connection will happen asynchronously in the background, with results
 * being delivered by events in the access point object, such as the "changed".
 *
 * Successful connections will remember the device and set it to auto-connect
 * using the property @ref efl_net_control_access_point_auto_connect_get.
 *
 * See @ref efl_net_control_access_point_forget,
 * @ref efl_net_control_access_point_remembered_get,
 * @ref efl_net_control_access_point_auto_connect_get and
 * @ref efl_net_control_access_point_disconnect
 *
 * The future may fail with non-fatal errors such as EINPROGRESS (the
 * connection was already ongoing) and EALREADY (the connection was already
 * established).
 *
 * @param[in] obj The object.
 *
 * @return Future for asynchronous connect
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
function efl_net_control_access_point_connect(obj:PEo):PEina_Future;cdecl;external;
{*
 * @brief Disconnects from this access point.
 *
 * When disconnected previously connected access points won't be forgotten. The
 * configuration and other details such as priority and passphrase will be
 * available for future re-connection with a call to
 * @ref efl_net_control_access_point_connect. If you need to disconnect and
 * forget all access point information, use
 * @ref efl_net_control_access_point_forget instead.
 * @param[in] obj The object.
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
procedure efl_net_control_access_point_disconnect(obj:PEo);cdecl;external;
{*
 * @brief Disconnects and forgets about this access point.
 *
 * Successful @ref efl_net_control_access_point_connect will always remember
 * the access point for future re-connections. This method overrides this by
 * disconnecting and forgetting the access point and its configuration, which
 * will set @ref efl_net_control_access_point_remembered_get to @c false.
 * @param[in] obj The object.
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
procedure efl_net_control_access_point_forget(obj:PEo);cdecl;external;
{*
 * @brief The current state of the access point.
 *
 * Whenever the state changes, "changed" will be emitted.
 *
 * @param[in] obj The object.
 *
 * @return Access point state
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_state_get(obj:PEo):TEfl_Net_Control_Access_Point_State;cdecl;external;
{*
 * @brief If the access point is in error state, this states the error.
 *
 * @param[in] obj The object.
 *
 * @return Access point error
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_error_get(obj:PEo):TEfl_Net_Control_Access_Point_Error;cdecl;external;
{*
 * @brief The user-friendly access point name.
 *
 * For hidden WiFi networks, this is empty.
 *
 * @param[in] obj The object.
 *
 * @return Access point name
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_net_control_access_point_ssid_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief The access point priority in the current access point listing.
 *
 * This property is dynamic and reflects the index of the access point in the
 * current access points list. As access points may come and go, the value may
 * change at any time and send notifications via the "changed" event.
 *
 * If set, then it will reorder priorities, moving all other services at equal
 * or higher priority up. To move as the first (most priority), then use 0. To
 * move as the last priority, use UINT32_MAX or the last known priority + 1.
 *
 * @note Only stored access points may be reordered among themselves. Those
 * that are not remembered will always come last in a random order defined by
 * the backend.
 *
 * @param[in] obj The object.
 * @param[in] priority Access point priority in listing
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
procedure efl_net_control_access_point_priority_set(obj:PEo; priority:dword);cdecl;external;
{*
 * @brief The access point priority in the current access point listing.
 *
 * This property is dynamic and reflects the index of the access point in the
 * current access points list. As access points may come and go, the value may
 * change at any time and send notifications via the "changed" event.
 *
 * If set, then it will reorder priorities, moving all other services at equal
 * or higher priority up. To move as the first (most priority), then use 0. To
 * move as the last priority, use UINT32_MAX or the last known priority + 1.
 *
 * @note Only stored access points may be reordered among themselves. Those
 * that are not remembered will always come last in a random order defined by
 * the backend.
 *
 * @param[in] obj The object.
 *
 * @return Access point priority in listing
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_priority_get(obj:PEo):dword;cdecl;external;
{*
 * @brief The technology that generated this access point
 *
 * @param[in] obj The object.
 *
 * @return Access point technology
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_technology_get(obj:PEo):PEfl_Net_Control_Technology;cdecl;external;
{*
 * @brief Signal strength percentage in 0-100
 *
 * @param[in] obj The object.
 *
 * @return Access point signal strength
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_strength_get(obj:PEo):Tuint8_t;cdecl;external;
{*
 * @brief If it's a cellular access point and it's on roaming.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the access point is cellular and uses roaming, @c false
 * otherwise
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_roaming_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Whenever to auto-connect to this access point if no other is
 * connected.
 *
 * By default successfully connected access points are remembered and set to
 * auto-connect. This behavior can be changed with this property.
 *
 * An access point is only connected automatically if there are no other
 * connected and if it is not on roaming.
 *
 * @param[in] obj The object.
 * @param[in] auto_connect @c true when auto-connect is set for this access
 * point, @c false otherwise
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
procedure efl_net_control_access_point_auto_connect_set(obj:PEo; auto_connect:TEina_Bool);cdecl;external;
{*
 * @brief Whenever to auto-connect to this access point if no other is
 * connected.
 *
 * By default successfully connected access points are remembered and set to
 * auto-connect. This behavior can be changed with this property.
 *
 * An access point is only connected automatically if there are no other
 * connected and if it is not on roaming.
 *
 * @param[in] obj The object.
 *
 * @return @c true when auto-connect is set for this access point, @c false
 * otherwise
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_auto_connect_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Successfully connected access points are remembered.
 *
 * To forget about this access point, call
 * @ref efl_net_control_access_point_forget.
 *
 * @param[in] obj The object.
 *
 * @return @c true if this access point will be remembered, @c false otherwise
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_remembered_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Immutable access points are those defined in configuration files and
 * its properties can't be changed using API.
 *
 * @param[in] obj The object.
 *
 * @return @c true is this access point is immutable, @c false otherwise
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_immutable_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Security options such as WEP, WPS, PSK or none (open).
 *
 * @param[in] obj The object.
 *
 * @return Bitwise OR of security supported by this access point
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_security_get(obj:PEo):TEfl_Net_Control_Access_Point_Security;cdecl;external;
{*
 * @brief DNS (Domain Name Servers) in use for this access point.
 *
 * These are the actual values used. Configure them using
 * @ref efl_net_control_access_point_configuration_name_servers_get. This may
 * generate changes to this property, triggering the "changed" event.
 *
 * @param[in] obj The object.
 *
 * @return Iterator to DNS server
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_name_servers_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief NTP (Time Server) in use for this access point.
 *
 * These are the actual values used. Configure them using
 * @ref efl_net_control_access_point_configuration_name_servers_get. This may
 * generate changes to this property, triggering the "changed" event.
 *
 * @param[in] obj The object.
 *
 * @return Iterator to time server
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_time_servers_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief Searches domains in use for this access point.
 *
 * These are the actual values used. Configure them using
 * @ref efl_net_control_access_point_configuration_name_servers_get. This may
 * generate changes to this property, triggering the "changed" event.
 *
 * @param[in] obj The object.
 *
 * @return Iterator to search domains
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_domains_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief IPv4 in use for this access point.
 *
 * These are the actual values used. Configure them using
 * @ref efl_net_control_access_point_configuration_name_servers_get. This may
 * generate changes to this property, triggering the "changed" event.
 *
 * @param[in] obj The object.
 * @param[out] method IPv4 method
 * @param[out] address IPv4 address
 * @param[out] netmask IPv4 netmask
 * @param[out] gateway IPv4 gateway
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_control_access_point_ipv4_get(obj:PEo; method:PEfl_Net_Control_Access_Point_Ipv4_Method; address:PPchar; netmask:PPchar; gateway:PPchar);cdecl;external;
{*
 * @brief IPv6 in use for this access point.
 *
 * These are the actual values used. Configure them using
 * @ref efl_net_control_access_point_configuration_name_servers_get. This may
 * generate changes to this property, triggering the "changed" event.
 *
 * @param[in] obj The object.
 * @param[out] method IPv6 method
 * @param[out] address IPv6 address
 * @param[out] prefix_length IPv6 prefix length
 * @param[out] netmask IPv6 netmask
 * @param[out] gateway IPv6 gateway
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_control_access_point_ipv6_get(obj:PEo; method:PEfl_Net_Control_Access_Point_Ipv6_Method; address:PPchar; prefix_length:Puint8_t; netmask:PPchar; 
            gateway:PPchar);cdecl;external;
{*
 * @brief Proxy in use for this access point.
 *
 * These are the actual values used. Configure them using
 * @ref efl_net_control_access_point_configuration_name_servers_get. This may
 * generate changes to this property, triggering the "changed" event.
 *
 * @param[in] obj The object.
 * @param[out] method Proxy method
 * @param[out] url If @ref EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_AUTO, then
 * states the URL to use for proxy auto-configuration
 * @param[out] servers If
 * @ref EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_MANUAL, then states the URI
 * with proxy servers to use, like "http://proxy.domain.com:911"
 * @param[out] excludes If
 * @ref EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_MANUAL, then states the hosts
 * or patterns to exclude from proxy access, such as "localhost",
 * ".domain.com", or "10.0.0.0..."
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_control_access_point_proxy_get(obj:PEo; method:PEfl_Net_Control_Access_Point_Proxy_Method; url:PPchar; servers:PPEina_Iterator; excludes:PPEina_Iterator);cdecl;external;
{*
 * @brief DNS (Domain Name Servers) configured by user for this access point.
 *
 * These are user configured values, which will be applied by the backend
 * system and in turn may result in "changed" event to notify of
 * @ref efl_net_control_access_point_name_servers_get property with the actual
 * value in use, which may differ from this.
 *
 * @param[in] obj The object.
 * @param[in] name_servers Iterator to user DNS server
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
procedure efl_net_control_access_point_configuration_name_servers_set(obj:PEo; name_servers:PEina_Iterator);cdecl;external;
{*
 * @brief DNS (Domain Name Servers) configured by user for this access point.
 *
 * These are user configured values, which will be applied by the backend
 * system and in turn may result in "changed" event to notify of
 * @ref efl_net_control_access_point_name_servers_get property with the actual
 * value in use, which may differ from this.
 *
 * @param[in] obj The object.
 *
 * @return Iterator to user DNS server
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_configuration_name_servers_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief NTP (Time Server) configured by user for this access point.
 *
 * These are user configured values, which will be applied by the backend
 * system and in turn may result in "changed" event to notify of
 * @ref efl_net_control_access_point_name_servers_get property with the actual
 * value in use, which may differ from this.
 *
 * @param[in] obj The object.
 * @param[in] time_servers Iterator to user time server
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
procedure efl_net_control_access_point_configuration_time_servers_set(obj:PEo; time_servers:PEina_Iterator);cdecl;external;
{*
 * @brief NTP (Time Server) configured by user for this access point.
 *
 * These are user configured values, which will be applied by the backend
 * system and in turn may result in "changed" event to notify of
 * @ref efl_net_control_access_point_name_servers_get property with the actual
 * value in use, which may differ from this.
 *
 * @param[in] obj The object.
 *
 * @return Iterator to user time server
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_configuration_time_servers_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief Searches domains configured by user for this access point.
 *
 * These are user configured values, which will be applied by the backend
 * system and in turn may result in "changed" event to notify of
 * @ref efl_net_control_access_point_domains_get property with the actual value
 * in use, which may differ from this.
 *
 * @param[in] obj The object.
 * @param[in] domains Iterator to user search domains
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
procedure efl_net_control_access_point_configuration_domains_set(obj:PEo; domains:PEina_Iterator);cdecl;external;
{*
 * @brief Searches domains configured by user for this access point.
 *
 * These are user configured values, which will be applied by the backend
 * system and in turn may result in "changed" event to notify of
 * @ref efl_net_control_access_point_domains_get property with the actual value
 * in use, which may differ from this.
 *
 * @param[in] obj The object.
 *
 * @return Iterator to user search domains
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
function efl_net_control_access_point_configuration_domains_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief IPv4 configured by user for this access point.
 *
 * These are user configured values, which will be applied by the backend
 * system and in turn may result in "changed" event to notify of
 * @ref efl_net_control_access_point_ipv4_get property with the actual value in
 * use, which may differ from this.
 *
 * @param[in] obj The object.
 * @param[in] method IPv4 method
 * @param[in] address IPv4 address
 * @param[in] netmask IPv4 netmask
 * @param[in] gateway IPv4 gateway
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_control_access_point_configuration_ipv4_set(obj:PEo; method:TEfl_Net_Control_Access_Point_Ipv4_Method; address:Pchar; netmask:Pchar; gateway:Pchar);cdecl;external;
{*
 * @brief IPv4 configured by user for this access point.
 *
 * These are user configured values, which will be applied by the backend
 * system and in turn may result in "changed" event to notify of
 * @ref efl_net_control_access_point_ipv4_get property with the actual value in
 * use, which may differ from this.
 *
 * @param[in] obj The object.
 * @param[out] method IPv4 method
 * @param[out] address IPv4 address
 * @param[out] netmask IPv4 netmask
 * @param[out] gateway IPv4 gateway
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_control_access_point_configuration_ipv4_get(obj:PEo; method:PEfl_Net_Control_Access_Point_Ipv4_Method; address:PPchar; netmask:PPchar; gateway:PPchar);cdecl;external;
{*
 * @brief IPv6 configured by user for this access point.
 *
 * These are user configured values, which will be applied by the backend
 * system and in turn may result in "changed" event to notify of
 * @ref efl_net_control_access_point_ipv6_get property with the actual value in
 * use, which may differ from this.
 *
 * @param[in] obj The object.
 * @param[in] method IPv6 method
 * @param[in] address IPv6 address
 * @param[in] prefix_length IPv6 prefix length
 * @param[in] netmask IPv6 netmask
 * @param[in] gateway IPv6 gateway
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_control_access_point_configuration_ipv6_set(obj:PEo; method:TEfl_Net_Control_Access_Point_Ipv6_Method; address:Pchar; prefix_length:Tuint8_t; netmask:Pchar; 
            gateway:Pchar);cdecl;external;
{*
 * @brief IPv6 configured by user for this access point.
 *
 * These are user configured values, which will be applied by the backend
 * system and in turn may result in "changed" event to notify of
 * @ref efl_net_control_access_point_ipv6_get property with the actual value in
 * use, which may differ from this.
 *
 * @param[in] obj The object.
 * @param[out] method IPv6 method
 * @param[out] address IPv6 address
 * @param[out] prefix_length IPv6 prefix length
 * @param[out] netmask IPv6 netmask
 * @param[out] gateway IPv6 gateway
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_control_access_point_configuration_ipv6_get(obj:PEo; method:PEfl_Net_Control_Access_Point_Ipv6_Method; address:PPchar; prefix_length:Puint8_t; netmask:PPchar; 
            gateway:PPchar);cdecl;external;
{*
 * @brief Proxy configured by user for this access point.
 *
 * These are user configured values, which will be applied by the backend
 * system and in turn may result in "changed" event to notify of
 * @ref efl_net_control_access_point_proxy_get property with the actual value
 * in use, which may differ from this.
 *
 * @param[in] obj The object.
 * @param[in] method Proxy method
 * @param[in] url If @ref EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_AUTO, then
 * states the URL to use for proxy auto-configuration
 * @param[in] servers If @ref EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_MANUAL,
 * then states the URI with proxy servers to use, like
 * "http://proxy.domain.com:911"
 * @param[in] excludes If
 * @ref EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_MANUAL, then states the hosts
 * or patterns to exclude from proxy access, such as "localhost",
 * ".domain.com", or "10.0.0.0..."
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
procedure efl_net_control_access_point_configuration_proxy_set(obj:PEo; method:TEfl_Net_Control_Access_Point_Proxy_Method; url:Pchar; servers:PEina_Iterator; excludes:PEina_Iterator);cdecl;external;
{*
 * @brief Proxy configured by user for this access point.
 *
 * These are user configured values, which will be applied by the backend
 * system and in turn may result in "changed" event to notify of
 * @ref efl_net_control_access_point_proxy_get property with the actual value
 * in use, which may differ from this.
 *
 * @param[in] obj The object.
 * @param[out] method Proxy method
 * @param[out] url If @ref EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_AUTO, then
 * states the URL to use for proxy auto-configuration
 * @param[out] servers If
 * @ref EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_MANUAL, then states the URI
 * with proxy servers to use, like "http://proxy.domain.com:911"
 * @param[out] excludes If
 * @ref EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_MANUAL, then states the hosts
 * or patterns to exclude from proxy access, such as "localhost",
 * ".domain.com", or "10.0.0.0..."
 *
 * @ingroup Efl_Net_Control_Access_Point
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_control_access_point_configuration_proxy_get(obj:PEo; method:PEfl_Net_Control_Access_Point_Proxy_Method; url:PPchar; servers:PPEina_Iterator; excludes:PPEina_Iterator);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_NET_CONTROL_ACCESS_POINT_EVENT_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when some properties were changed.
 *
 * @ingroup Efl_Net_Control_Access_Point
  }

{ was #define dname def_expr }
function EFL_NET_CONTROL_ACCESS_POINT_EVENT_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_CONTROL_ACCESS_POINT_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_ACCESS_POINT_CLASS:=efl_net_control_access_point_class_get;
  end;

{ was #define dname def_expr }
function EFL_NET_CONTROL_ACCESS_POINT_EVENT_CHANGED : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_ACCESS_POINT_EVENT_CHANGED:=@(_EFL_NET_CONTROL_ACCESS_POINT_EVENT_CHANGED);
  end;


end.

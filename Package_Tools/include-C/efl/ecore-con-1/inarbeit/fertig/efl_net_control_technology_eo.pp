
unit efl_net_control_technology_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_control_technology_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_control_technology_eo.h
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
PEfl_Net_Control_Technology  = ^Efl_Net_Control_Technology;
PEfl_Net_Control_Technology_Type  = ^Efl_Net_Control_Technology_Type;
PEina_Bool  = ^Eina_Bool;
PEina_Future  = ^Eina_Future;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_CONTROL_TECHNOLOGY_EO_H_}
{$define _EFL_NET_CONTROL_TECHNOLOGY_EO_H_}
{$ifndef _EFL_NET_CONTROL_TECHNOLOGY_EO_CLASS_TYPE}
{$define _EFL_NET_CONTROL_TECHNOLOGY_EO_CLASS_TYPE}
type
  PEfl_Net_Control_Technology = ^TEfl_Net_Control_Technology;
  TEfl_Net_Control_Technology = TEo;
{$endif}
{$ifndef _EFL_NET_CONTROL_TECHNOLOGY_EO_TYPES}
{$define _EFL_NET_CONTROL_TECHNOLOGY_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Technology types
 *
 * @ingroup Efl_Net_Control_Technology_Type
  }
{*< Type: unknown  }
{*< Type: system  }
{*< Type: ethernet  }
{*< Type: WiFi  }
{*< Type: Bluetooth  }
{*< Type: cellular/mobile  }
{*< Type: GPS  }
{*< Type: Virtual Private Network  }
{*< Type: USB gadget  }
{*< Type: Peer-2-Peer  }
type
  PEfl_Net_Control_Technology_Type = ^TEfl_Net_Control_Technology_Type;
  TEfl_Net_Control_Technology_Type =  Longint;
  Const
    EFL_NET_CONTROL_TECHNOLOGY_TYPE_UNKNOWN = 0;
    EFL_NET_CONTROL_TECHNOLOGY_TYPE_SYSTEM = 1;
    EFL_NET_CONTROL_TECHNOLOGY_TYPE_ETHERNET = 2;
    EFL_NET_CONTROL_TECHNOLOGY_TYPE_WIFI = 3;
    EFL_NET_CONTROL_TECHNOLOGY_TYPE_BLUETOOTH = 4;
    EFL_NET_CONTROL_TECHNOLOGY_TYPE_CELLULAR = 5;
    EFL_NET_CONTROL_TECHNOLOGY_TYPE_GPS = 6;
    EFL_NET_CONTROL_TECHNOLOGY_TYPE_VPN = 7;
    EFL_NET_CONTROL_TECHNOLOGY_TYPE_GADGET = 8;
    EFL_NET_CONTROL_TECHNOLOGY_TYPE_P2P = 9;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A technology that allows control of network access points.
 *
 * The @ref Efl_Net_Control_Manager is composed of multiple technologies, each
 * can be disabled/enabled with @ref efl_net_control_technology_powered_get
 * property.
 *
 * When powered, the technology will dynamically create and remove access
 * points in @ref efl_net_control_manager_access_points_get.
 *
 * @ingroup Efl_Net_Control_Technology
  }

{ was #define dname def_expr }
function EFL_NET_CONTROL_TECHNOLOGY_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_control_technology_class_get:PEfl_Class;cdecl;external;
{*
 * @brief If @c true the technology is available. If @c false technology is
 * disabled and if possible rfkill is used.
 *
 * @param[in] obj The object.
 * @param[in] powered @c true if technology is powered, @c false otherwise
 *
 * @ingroup Efl_Net_Control_Technology
  }
procedure efl_net_control_technology_powered_set(obj:PEo; powered:TEina_Bool);cdecl;external;
{*
 * @brief If @c true the technology is available. If @c false technology is
 * disabled and if possible rfkill is used.
 *
 * @param[in] obj The object.
 *
 * @return @c true if technology is powered, @c false otherwise
 *
 * @ingroup Efl_Net_Control_Technology
  }
(* Const before type ignored *)
function efl_net_control_technology_powered_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Tethering allows the default access point to be bridged to all
 * clients connected through the technology.
 *
 * A common use case is to deploy the device as a router, such as a tethered
 * phone allowing a laptop to connect to a 4G network.
 *
 * @param[in] obj The object.
 * @param[in] enabled When to enable or disable tethering for this technology.
 * @param[in] identifier The name to identify the tethering. For WiFi this will
 * translate to an SSID.
 * @param[in] passphrase The passphrase for tethering access. For WiFi this
 * will translate to WPA passphrase.
 *
 * @ingroup Efl_Net_Control_Technology
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_control_technology_tethering_set(obj:PEo; enabled:TEina_Bool; identifier:Pchar; passphrase:Pchar);cdecl;external;
{*
 * @brief Tethering allows the default access point to be bridged to all
 * clients connected through the technology.
 *
 * A common use case is to deploy the device as a router, such as a tethered
 * phone allowing a laptop to connect to a 4G network.
 *
 * @param[in] obj The object.
 * @param[out] enabled When to enable or disable tethering for this technology.
 * @param[out] identifier The name to identify the tethering. For WiFi this
 * will translate to an SSID.
 * @param[out] passphrase The passphrase for tethering access. For WiFi this
 * will translate to WPA passphrase.
 *
 * @ingroup Efl_Net_Control_Technology
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_control_technology_tethering_get(obj:PEo; enabled:PEina_Bool; identifier:PPchar; passphrase:PPchar);cdecl;external;
{*
 * @brief If @c true the technology has at least one access point connected.
 *
 * @param[in] obj The object.
 *
 * @return @c true if technology is connected, @c false otherwise
 *
 * @ingroup Efl_Net_Control_Technology
  }
(* Const before type ignored *)
function efl_net_control_technology_connected_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief The technology type, such as "ethernet" or "wifi"
 *
 * @param[in] obj The object.
 *
 * @return Technology type
 *
 * @ingroup Efl_Net_Control_Technology
  }
(* Const before type ignored *)
function efl_net_control_technology_type_get(obj:PEo):TEfl_Net_Control_Technology_Type;cdecl;external;
{*
 * @brief Explicitly trigger a scan.
 *
 * The scan will happen asynchronously in the background, with the results
 * being delivered by events in the technology, @ref Efl_Net_Control_Manager or
 * @ref Efl_Net_Control_Access_Point associated with the technology. For
 * example, a scan on WiFi will add and remove access points.
 *
 * Try to avoid explicit scans. Rare exceptions to this rule include when the
 * user requests them, such as entering a configuration dialog which demands a
 * fresh state. Otherwise allow the system to perform passive scans in a timely
 * manner.
 *
 * @param[in] obj The object.
 *
 * @return Future return for finished background scan
 *
 * @ingroup Efl_Net_Control_Technology
  }
function efl_net_control_technology_scan(obj:PEo):PEina_Future;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_NET_CONTROL_TECHNOLOGY_EVENT_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when some properties were changed.
 *
 * @ingroup Efl_Net_Control_Technology
  }

{ was #define dname def_expr }
function EFL_NET_CONTROL_TECHNOLOGY_EVENT_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_CONTROL_TECHNOLOGY_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_TECHNOLOGY_CLASS:=efl_net_control_technology_class_get;
  end;

{ was #define dname def_expr }
function EFL_NET_CONTROL_TECHNOLOGY_EVENT_CHANGED : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_TECHNOLOGY_EVENT_CHANGED:=@(_EFL_NET_CONTROL_TECHNOLOGY_EVENT_CHANGED);
  end;


end.

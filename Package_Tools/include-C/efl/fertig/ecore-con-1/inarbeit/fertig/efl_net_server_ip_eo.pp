
unit efl_net_server_ip_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_server_ip_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_server_ip_eo.h
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
PEfl_Net_Server_Ip  = ^Efl_Net_Server_Ip;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SERVER_IP_EO_H_}
{$define _EFL_NET_SERVER_IP_EO_H_}
{$ifndef _EFL_NET_SERVER_IP_EO_CLASS_TYPE}
{$define _EFL_NET_SERVER_IP_EO_CLASS_TYPE}
type
  PEfl_Net_Server_Ip = ^TEfl_Net_Server_Ip;
  TEfl_Net_Server_Ip = TEo;
{$endif}
{$ifndef _EFL_NET_SERVER_IP_EO_TYPES}
{$define _EFL_NET_SERVER_IP_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* An IP server.
 *
 * @ingroup Efl_Net_Server_Ip
  }

{ was #define dname def_expr }
function EFL_NET_SERVER_IP_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_server_ip_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Whenever IPv6 listen address will accept only same-family clients or
 * will allow IPv4 to connect as well.
 *
 * Since Linux 2.4.21, Windows Vista and MacOS X these control whenever a
 * server that did bind to an IPv6 address will accept only IPv6 clients or
 * will also accept IPv4 by automatically converting them in an IPv6 address,
 * allowing a single socket to handle both protocols.
 *
 * If an IPv6 address was used in @ref efl_net_server_address_get, this
 * property is @c false and an IPv4 connects, then an address such as
 * [::ffff:IPv4]:PORT will be used, such as [::ffff:192.168.0.2]:1234, where
 * the IPv4 address can be extracted.
 *
 * If an IPv4 address was used in @ref efl_net_server_address_get, this has no
 * effect.
 *
 * Systems can configure their default value, usually true (allows only IPv6
 * clients).
 *
 * @param[in] obj The object.
 * @param[in] ipv6_only If @c true the server will only accept IPv6 clients,
 * @c false otherwise
 *
 * @ingroup Efl_Net_Server_Ip
  }
procedure efl_net_server_ip_ipv6_only_set(obj:PEo; ipv6_only:TEina_Bool);cdecl;external;
{*
 * @brief Whenever IPv6 listen address will accept only same-family clients or
 * will allow IPv4 to connect as well.
 *
 * Since Linux 2.4.21, Windows Vista and MacOS X these control whenever a
 * server that did bind to an IPv6 address will accept only IPv6 clients or
 * will also accept IPv4 by automatically converting them in an IPv6 address,
 * allowing a single socket to handle both protocols.
 *
 * If an IPv6 address was used in @ref efl_net_server_address_get, this
 * property is @c false and an IPv4 connects, then an address such as
 * [::ffff:IPv4]:PORT will be used, such as [::ffff:192.168.0.2]:1234, where
 * the IPv4 address can be extracted.
 *
 * If an IPv4 address was used in @ref efl_net_server_address_get, this has no
 * effect.
 *
 * Systems can configure their default value, usually true (allows only IPv6
 * clients).
 *
 * @param[in] obj The object.
 *
 * @return If @c true the server will only accept IPv6 clients, @c false
 * otherwise
 *
 * @ingroup Efl_Net_Server_Ip
  }
(* Const before type ignored *)
function efl_net_server_ip_ipv6_only_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SERVER_IP_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SERVER_IP_CLASS:=efl_net_server_ip_class_get;
  end;


end.

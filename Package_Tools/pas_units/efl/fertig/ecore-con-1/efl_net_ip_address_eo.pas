unit efl_net_ip_address_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Net_Ip_Address = ^TEfl_Net_Ip_Address;
  TEfl_Net_Ip_Address = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Net_Ip_Address_Resolve_Results = record
    request_address: pchar;
    canonical_name: pchar;
    results: PEina_Array;
  end;
  PEfl_Net_Ip_Address_Resolve_Results = ^TEfl_Net_Ip_Address_Resolve_Results;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_IP_ADDRESS_CLASS: PEfl_Class;

function efl_net_ip_address_class_get: PEfl_Class; cdecl; external libecore_con;
function efl_net_ip_address_create(port: uint16; address: TEina_Slice): PEfl_Net_Ip_Address; cdecl; external libecore_con;
function efl_net_ip_address_create_sockaddr(sockaddr: pointer): PEfl_Net_Ip_Address; cdecl; external libecore_con;
function efl_net_ip_address_parse(numeric_address: pchar): PEfl_Net_Ip_Address; cdecl; external libecore_con;
function efl_net_ip_address_resolve(address: pchar; family: longint; flags: longint): PEina_Future; cdecl; external libecore_con;
function efl_net_ip_address_string_get(obj: PEo): pchar; cdecl; external libecore_con;
procedure efl_net_ip_address_family_set(obj: PEo; family: longint); cdecl; external libecore_con;
function efl_net_ip_address_family_get(obj: PEo): longint; cdecl; external libecore_con;
procedure efl_net_ip_address_port_set(obj: PEo; port: uint16); cdecl; external libecore_con;
function efl_net_ip_address_port_get(obj: PEo): uint16; cdecl; external libecore_con;
procedure efl_net_ip_address_set(obj: PEo; address: TEina_Slice); cdecl; external libecore_con;
function efl_net_ip_address_get(obj: PEo): TEina_Slice; cdecl; external libecore_con;
procedure efl_net_ip_address_sockaddr_set(obj: PEo; sockaddr: pointer); cdecl; external libecore_con;
function efl_net_ip_address_sockaddr_get(obj: PEo): pointer; cdecl; external libecore_con;
function efl_net_ip_address_ipv4_class_a_check(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_ip_address_ipv4_class_b_check(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_ip_address_ipv4_class_c_check(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_ip_address_ipv4_class_d_check(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_ip_address_ipv6_v4mapped_check(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_ip_address_ipv6_v4compat_check(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_ip_address_ipv6_local_link_check(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_ip_address_ipv6_local_site_check(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_ip_address_multicast_check(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_ip_address_loopback_check(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_ip_address_any_check(obj: PEo): TEina_Bool; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 17:03:12 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_IP_ADDRESS_CLASS: PEfl_Class;
begin
  EFL_NET_IP_ADDRESS_CLASS := efl_net_ip_address_class_get;
end;
{$endif}


end.

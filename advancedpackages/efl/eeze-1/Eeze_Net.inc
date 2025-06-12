{$IFDEF read_interface}


type
  TEeze_Net = record
  end;
  PEeze_Net = ^TEeze_Net;

type
  PEeze_Net_Addr_Type = ^TEeze_Net_Addr_Type;
  TEeze_Net_Addr_Type = longint;

const
  EEZE_NET_ADDR_TYPE_IP = 0;
  EEZE_NET_ADDR_TYPE_IP6 = 1;
  EEZE_NET_ADDR_TYPE_BROADCAST = 2;
  EEZE_NET_ADDR_TYPE_BROADCAST6 = 3;
  EEZE_NET_ADDR_TYPE_NETMASK = 4;
  EEZE_NET_ADDR_TYPE_NETMASK6 = 5;

function eeze_net_new(name: pchar): PEeze_Net; cdecl; external libeeze;
procedure eeze_net_free(net: PEeze_Net); cdecl; external libeeze;
function eeze_net_mac_get(net: PEeze_Net): pchar; cdecl; external libeeze;
function eeze_net_idx_get(net: PEeze_Net): longint; cdecl; external libeeze;
function eeze_net_scan(net: PEeze_Net): TEina_Bool; cdecl; external libeeze;
function eeze_net_addr_get(net: PEeze_Net; _type: TEeze_Net_Addr_Type): pchar; cdecl; external libeeze;
function eeze_net_attribute_get(net: PEeze_Net; attr: pchar): pchar; cdecl; external libeeze;
function eeze_net_syspath_get(net: PEeze_Net): pchar; cdecl; external libeeze;
function eeze_net_list: PEina_List; cdecl; external libeeze;

// === Konventiert am: 12-6-25 17:32:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

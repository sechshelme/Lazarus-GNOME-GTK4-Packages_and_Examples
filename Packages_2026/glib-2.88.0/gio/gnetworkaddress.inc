
  {$IFDEF read_struct}
type
  PGNetworkAddressPrivate = type Pointer;

  PGNetworkAddress = ^TGNetworkAddress;
  TGNetworkAddress = record
    parent_instance: TGObject;
    priv: PGNetworkAddressPrivate;
  end;

  PGNetworkAddressClass = ^TGNetworkAddressClass;
  TGNetworkAddressClass = record
    parent_class: TGObjectClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_network_address_get_type: TGType; cdecl; external libgio2;
function g_network_address_new(hostname: Pgchar; port: Tguint16): PGSocketConnectable; cdecl; external libgio2;
function g_network_address_new_loopback(port: Tguint16): PGSocketConnectable; cdecl; external libgio2;
function g_network_address_parse(host_and_port: Pgchar; default_port: Tguint16; error: PPGError): PGSocketConnectable; cdecl; external libgio2;
function g_network_address_parse_uri(uri: Pgchar; default_port: Tguint16; error: PPGError): PGSocketConnectable; cdecl; external libgio2;
function g_network_address_get_hostname(addr: PGNetworkAddress): Pgchar; cdecl; external libgio2;
function g_network_address_get_port(addr: PGNetworkAddress): Tguint16; cdecl; external libgio2;
function g_network_address_get_scheme(addr: PGNetworkAddress): Pgchar; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:43:54 ===

function G_TYPE_NETWORK_ADDRESS: TGType;
function G_NETWORK_ADDRESS(obj: Pointer): PGNetworkAddress;
function G_NETWORK_ADDRESS_CLASS(klass: Pointer): PGNetworkAddressClass;
function G_IS_NETWORK_ADDRESS(obj: Pointer): Tgboolean;
function G_IS_NETWORK_ADDRESS_CLASS(klass: Pointer): Tgboolean;
function G_NETWORK_ADDRESS_GET_CLASS(obj: Pointer): PGNetworkAddressClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function G_TYPE_NETWORK_ADDRESS: TGType;
begin
  G_TYPE_NETWORK_ADDRESS := g_network_address_get_type;
end;

function G_NETWORK_ADDRESS(obj: Pointer): PGNetworkAddress;
begin
  Result := PGNetworkAddress(g_type_check_instance_cast(obj, G_TYPE_NETWORK_ADDRESS));
end;

function G_NETWORK_ADDRESS_CLASS(klass: Pointer): PGNetworkAddressClass;
begin
  Result := PGNetworkAddressClass(g_type_check_class_cast(klass, G_TYPE_NETWORK_ADDRESS));
end;

function G_IS_NETWORK_ADDRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_NETWORK_ADDRESS);
end;

function G_IS_NETWORK_ADDRESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_NETWORK_ADDRESS);
end;

function G_NETWORK_ADDRESS_GET_CLASS(obj: Pointer): PGNetworkAddressClass;
begin
  Result := PGNetworkAddressClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

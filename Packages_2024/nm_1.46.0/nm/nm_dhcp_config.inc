

  {$IFDEF read_struct}
type
  PNMDhcpConfig = type Pointer;
  PNMDhcpConfigClass = type Pointer;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  NM_DHCP_CONFIG_FAMILY = 'family';
  NM_DHCP_CONFIG_OPTIONS = 'options';
  {$ENDIF read_enum}

{$IFDEF read_function}
function nm_dhcp_config_get_type: TGType; cdecl; external libnm;
function nm_dhcp_config_get_family(config: PNMDhcpConfig): longint; cdecl; external libnm;
function nm_dhcp_config_get_options(config: PNMDhcpConfig): PGHashTable; cdecl; external libnm;
function nm_dhcp_config_get_one_option(config: PNMDhcpConfig; option: pchar): pchar; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:29:39 ===

function NM_TYPE_DHCP_CONFIG: TGType;
function NM_DHCP_CONFIG(obj: Pointer): PNMDhcpConfig;
function NM_DHCP_CONFIG_CLASS(klass: Pointer): PNMDhcpConfigClass;
function NM_IS_DHCP_CONFIG(obj: Pointer): Tgboolean;
function NM_IS_DHCP_CONFIG_CLASS(klass: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_DHCP_CONFIG: TGType;
begin
  NM_TYPE_DHCP_CONFIG := nm_dhcp_config_get_type;
end;

function NM_DHCP_CONFIG(obj: Pointer): PNMDhcpConfig;
begin
  Result := PNMDhcpConfig(g_type_check_instance_cast(obj, NM_TYPE_DHCP_CONFIG));
end;

function NM_DHCP_CONFIG_CLASS(klass: Pointer): PNMDhcpConfigClass;
begin
  Result := PNMDhcpConfigClass(g_type_check_class_cast(klass, NM_TYPE_DHCP_CONFIG));
end;

function NM_IS_DHCP_CONFIG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DHCP_CONFIG);
end;

function NM_IS_DHCP_CONFIG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DHCP_CONFIG);
end;



{$ENDIF read_implementation}

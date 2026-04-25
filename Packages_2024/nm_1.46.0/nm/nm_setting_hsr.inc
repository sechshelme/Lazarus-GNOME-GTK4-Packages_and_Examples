

  {$IFDEF read_enum}
const
  NM_SETTING_HSR_SETTING_NAME = 'hsr';
  NM_SETTING_HSR_PORT1 = 'port1';
  NM_SETTING_HSR_PORT2 = 'port2';
  NM_SETTING_HSR_MULTICAST_SPEC = 'multicast-spec';
  NM_SETTING_HSR_PRP = 'prp';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingHsr = type Pointer;
  PNMSettingHsrClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_hsr_get_type: TGType; cdecl; external libnm;
function nm_setting_hsr_new: PNMSetting; cdecl; external libnm;
function nm_setting_hsr_get_port1(setting: PNMSettingHsr): pchar; cdecl; external libnm;
function nm_setting_hsr_get_port2(setting: PNMSettingHsr): pchar; cdecl; external libnm;
function nm_setting_hsr_get_multicast_spec(setting: PNMSettingHsr): Tguint32; cdecl; external libnm;
function nm_setting_hsr_get_prp(setting: PNMSettingHsr): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:27:10 ===

function NM_TYPE_SETTING_HSR: TGType;
function NM_SETTING_HSR(obj: Pointer): PNMSettingHsr;
function NM_IS_SETTING_HSR(obj: Pointer): Tgboolean;
function NM_IS_SETTING_HSR_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_HSR_GET_CLASS(obj: Pointer): PNMSettingHsrClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_HSR: TGType;
begin
  NM_TYPE_SETTING_HSR := nm_setting_hsr_get_type;
end;

function NM_SETTING_HSR(obj: Pointer): PNMSettingHsr;
begin
  Result := PNMSettingHsr(g_type_check_instance_cast(obj, NM_TYPE_SETTING_HSR));
end;

function NM_IS_SETTING_HSR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_HSR);
end;

function NM_IS_SETTING_HSR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_HSR);
end;

function NM_SETTING_HSR_GET_CLASS(obj: Pointer): PNMSettingHsrClass;
begin
  Result := (PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

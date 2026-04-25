

  {$IFDEF read_enum}
const
  NM_SETTING_LOOPBACK_SETTING_NAME = 'loopback';
  NM_SETTING_LOOPBACK_MTU = 'mtu';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingLoopback = type Pointer;
  PNMSettingLoopbackClass = type Pointer;
  {$ENDIF read_struct}


{$IFDEF read_function}
function nm_setting_loopback_get_type: TGType; cdecl; external libnm;
function nm_setting_loopback_new: PNMSetting; cdecl; external libnm;
function nm_setting_loopback_get_mtu(setting: PNMSettingLoopback): Tguint32; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:26:21 ===

function NM_TYPE_SETTING_LOOPBACK: TGType;
function NM_SETTING_LOOPBACK(obj: Pointer): PNMSettingLoopback;
function NM_SETTING_LOOPBACK_CLASS(klass: Pointer): PNMSettingLoopbackClass;
function NM_IS_SETTING_LOOPBACK(obj: Pointer): Tgboolean;
function NM_IS_SETTING_LOOPBACK_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_LOOPBACK_GET_CLASS(obj: Pointer): PNMSettingLoopbackClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_LOOPBACK: TGType;
begin
  NM_TYPE_SETTING_LOOPBACK := nm_setting_loopback_get_type;
end;

function NM_SETTING_LOOPBACK(obj: Pointer): PNMSettingLoopback;
begin
  Result := PNMSettingLoopback(g_type_check_instance_cast(obj, NM_TYPE_SETTING_LOOPBACK));
end;

function NM_SETTING_LOOPBACK_CLASS(klass: Pointer): PNMSettingLoopbackClass;
begin
  Result := PNMSettingLoopbackClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_LOOPBACK));
end;

function NM_IS_SETTING_LOOPBACK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_LOOPBACK);
end;

function NM_IS_SETTING_LOOPBACK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_LOOPBACK);
end;

function NM_SETTING_LOOPBACK_GET_CLASS(obj: Pointer): PNMSettingLoopbackClass;
begin
  Result := PNMSettingLoopbackClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}


  {$IFDEF read_enum}
const
  NM_SETTING_USER_SETTING_NAME = 'user';
  NM_SETTING_USER_DATA = 'data';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingUser = type Pointer;
  PNMSettingUserClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_user_get_type: TGType; cdecl; external libnm;
function nm_setting_user_new: PNMSetting; cdecl; external libnm;
function nm_setting_user_get_keys(setting: PNMSettingUser; out_len: Pguint): Ppchar; cdecl; external libnm;
function nm_setting_user_get_data(setting: PNMSettingUser; key: pchar): pchar; cdecl; external libnm;
function nm_setting_user_set_data(setting: PNMSettingUser; key: pchar; val: pchar; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_setting_user_check_key(key: pchar; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_setting_user_check_val(val: pchar; error: PPGError): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:24:42 ===

function NM_TYPE_SETTING_USER: TGType;
function NM_SETTING_USER(obj: Pointer): PNMSettingUser;
function NM_SETTING_USER_CLASS(klass: Pointer): PNMSettingUserClass;
function NM_IS_SETTING_USER(obj: Pointer): Tgboolean;
function NM_IS_SETTING_USER_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_USER_GET_CLASS(obj: Pointer): PNMSettingUserClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_USER: TGType;
begin
  NM_TYPE_SETTING_USER := nm_setting_user_get_type;
end;

function NM_SETTING_USER(obj: Pointer): PNMSettingUser;
begin
  Result := PNMSettingUser(g_type_check_instance_cast(obj, NM_TYPE_SETTING_USER));
end;

function NM_SETTING_USER_CLASS(klass: Pointer): PNMSettingUserClass;
begin
  Result := PNMSettingUserClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_USER));
end;

function NM_IS_SETTING_USER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_USER);
end;

function NM_IS_SETTING_USER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_USER);
end;

function NM_SETTING_USER_GET_CLASS(obj: Pointer): PNMSettingUserClass;
begin
  Result := PNMSettingUserClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

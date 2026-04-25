

  {$IFDEF read_enum}
const
  NM_SETTING_6LOWPAN_SETTING_NAME = '6lowpan';
  NM_SETTING_6LOWPAN_PARENT = 'parent';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSetting6Lowpan = type Pointer;
  PNMSetting6LowpanClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_6lowpan_get_type: TGType; cdecl; external libnm;
function nm_setting_6lowpan_new: PNMSetting; cdecl; external libnm;
function nm_setting_6lowpan_get_parent(setting: PNMSetting6Lowpan): pchar; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:28:20 ===

function NM_TYPE_SETTING_6LOWPAN: TGType;
function NM_SETTING_6LOWPAN(obj: Pointer): PNMSetting6Lowpan;
function NM_SETTING_6LOWPAN_CLASS(klass: Pointer): PNMSetting6LowpanClass;
function NM_IS_SETTING_6LOWPAN(obj: Pointer): Tgboolean;
function NM_IS_SETTING_6LOWPAN_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_6LOWPAN_GET_CLASS(obj: Pointer): PNMSetting6LowpanClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_6LOWPAN: TGType;
begin
  NM_TYPE_SETTING_6LOWPAN := nm_setting_6lowpan_get_type;
end;

function NM_SETTING_6LOWPAN(obj: Pointer): PNMSetting6Lowpan;
begin
  Result := PNMSetting6Lowpan(g_type_check_instance_cast(obj, NM_TYPE_SETTING_6LOWPAN));
end;

function NM_SETTING_6LOWPAN_CLASS(klass: Pointer): PNMSetting6LowpanClass;
begin
  Result := PNMSetting6LowpanClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_6LOWPAN));
end;

function NM_IS_SETTING_6LOWPAN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_6LOWPAN);
end;

function NM_IS_SETTING_6LOWPAN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_6LOWPAN);
end;

function NM_SETTING_6LOWPAN_GET_CLASS(obj: Pointer): PNMSetting6LowpanClass;
begin
  Result := PNMSetting6LowpanClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

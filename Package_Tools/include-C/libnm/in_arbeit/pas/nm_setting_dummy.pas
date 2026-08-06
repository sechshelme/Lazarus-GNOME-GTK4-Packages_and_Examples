unit nm_setting_dummy;

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SETTING_DUMMY_SETTING_NAME = 'dummy';

type
  PNMSettingDummy = type Pointer;
  PNMSettingDummyClass = type Pointer;

function nm_setting_dummy_get_type: TGType; cdecl; external libnm;
function nm_setting_dummy_new: PNMSetting; cdecl; external libnm;

// === Konventiert am: 5-8-26 19:45:47 ===

function NM_TYPE_SETTING_DUMMY: TGType;
function NM_SETTING_DUMMY(obj: Pointer): PNMSettingDummy;
function NM_SETTING_DUMMY_CLASS(klass: Pointer): PNMSettingDummyClass;
function NM_IS_SETTING_DUMMY(obj: Pointer): Tgboolean;
function NM_IS_SETTING_DUMMY_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_DUMMY_GET_CLASS(obj: Pointer): PNMSettingDummyClass;

implementation

function NM_TYPE_SETTING_DUMMY: TGType;
begin
  NM_TYPE_SETTING_DUMMY := nm_setting_dummy_get_type;
end;

function NM_SETTING_DUMMY(obj: Pointer): PNMSettingDummy;
begin
  Result := PNMSettingDummy(g_type_check_instance_cast(obj, NM_TYPE_SETTING_DUMMY));
end;

function NM_SETTING_DUMMY_CLASS(klass: Pointer): PNMSettingDummyClass;
begin
  Result := PNMSettingDummyClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_DUMMY));
end;

function NM_IS_SETTING_DUMMY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_DUMMY);
end;

function NM_IS_SETTING_DUMMY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_DUMMY);
end;

function NM_SETTING_DUMMY_GET_CLASS(obj: Pointer): PNMSettingDummyClass;
begin
  Result := PNMSettingDummyClass(PGTypeInstance(obj)^.g_class);
end;



end.

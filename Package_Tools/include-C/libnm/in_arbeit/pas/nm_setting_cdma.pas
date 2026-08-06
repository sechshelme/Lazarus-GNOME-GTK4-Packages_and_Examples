unit nm_setting_cdma;

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SETTING_CDMA_SETTING_NAME = 'cdma';
  NM_SETTING_CDMA_NUMBER = 'number';
  NM_SETTING_CDMA_USERNAME = 'username';
  NM_SETTING_CDMA_PASSWORD = 'password';
  NM_SETTING_CDMA_PASSWORD_FLAGS = 'password-flags';
  NM_SETTING_CDMA_MTU = 'mtu';

type
  PNMSettingCdma = type Pointer;
  PNMSettingCdmaClass = type Pointer;

function nm_setting_cdma_get_type: TGType; cdecl; external libnm;
function nm_setting_cdma_new: PNMSetting; cdecl; external libnm;
function nm_setting_cdma_get_number(setting: PNMSettingCdma): pchar; cdecl; external libnm;
function nm_setting_cdma_get_username(setting: PNMSettingCdma): pchar; cdecl; external libnm;
function nm_setting_cdma_get_password(setting: PNMSettingCdma): pchar; cdecl; external libnm;
function nm_setting_cdma_get_password_flags(setting: PNMSettingCdma): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_cdma_get_mtu(setting: PNMSettingCdma): Tguint32; cdecl; external libnm;

// === Konventiert am: 5-8-26 19:45:58 ===

function NM_TYPE_SETTING_CDMA: TGType;
function NM_SETTING_CDMA(obj: Pointer): PNMSettingCdma;
function NM_SETTING_CDMA_CLASS(klass: Pointer): PNMSettingCdmaClass;
function NM_IS_SETTING_CDMA(obj: Pointer): Tgboolean;
function NM_IS_SETTING_CDMA_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_CDMA_GET_CLASS(obj: Pointer): PNMSettingCdmaClass;

implementation

function NM_TYPE_SETTING_CDMA: TGType;
begin
  NM_TYPE_SETTING_CDMA := nm_setting_cdma_get_type;
end;

function NM_SETTING_CDMA(obj: Pointer): PNMSettingCdma;
begin
  Result := PNMSettingCdma(g_type_check_instance_cast(obj, NM_TYPE_SETTING_CDMA));
end;

function NM_SETTING_CDMA_CLASS(klass: Pointer): PNMSettingCdmaClass;
begin
  Result := PNMSettingCdmaClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_CDMA));
end;

function NM_IS_SETTING_CDMA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_CDMA);
end;

function NM_IS_SETTING_CDMA_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_CDMA);
end;

function NM_SETTING_CDMA_GET_CLASS(obj: Pointer): PNMSettingCdmaClass;
begin
  Result := PNMSettingCdmaClass(PGTypeInstance(obj)^.g_class);
end;



end.

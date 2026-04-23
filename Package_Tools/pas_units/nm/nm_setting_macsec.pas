unit nm_setting_macsec;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_SETTING_MACSEC_SETTING_NAME = 'macsec';
  NM_SETTING_MACSEC_PARENT = 'parent';
  NM_SETTING_MACSEC_MODE = 'mode';
  NM_SETTING_MACSEC_ENCRYPT = 'encrypt';
  NM_SETTING_MACSEC_MKA_CAK = 'mka-cak';
  NM_SETTING_MACSEC_MKA_CAK_FLAGS = 'mka-cak-flags';
  NM_SETTING_MACSEC_MKA_CKN = 'mka-ckn';
  NM_SETTING_MACSEC_PORT = 'port';
  NM_SETTING_MACSEC_VALIDATION = 'validation';
  NM_SETTING_MACSEC_SEND_SCI = 'send-sci';
  NM_SETTING_MACSEC_OFFLOAD = 'offload';

type
  PNMSettingMacsecMode = ^TNMSettingMacsecMode;
  TNMSettingMacsecMode = longint;

const
  NM_SETTING_MACSEC_MODE_PSK = 0;
  NM_SETTING_MACSEC_MODE_EAP = 1;

type
  PNMSettingMacsecValidation = ^TNMSettingMacsecValidation;
  TNMSettingMacsecValidation = longint;

const
  NM_SETTING_MACSEC_VALIDATION_DISABLE = 0;
  NM_SETTING_MACSEC_VALIDATION_CHECK = 1;
  NM_SETTING_MACSEC_VALIDATION_STRICT = 2;

const
  NM_SETTING_MACSEC_MKA_CAK_LENGTH = 32;
  NM_SETTING_MACSEC_MKA_CKN_LENGTH = 64;

type
  PNMSettingMacsecOffload = ^TNMSettingMacsecOffload;
  TNMSettingMacsecOffload = longint;

const
  NM_SETTING_MACSEC_OFFLOAD_DEFAULT = -(1);
  NM_SETTING_MACSEC_OFFLOAD_OFF = 0;
  NM_SETTING_MACSEC_OFFLOAD_PHY = 1;
  NM_SETTING_MACSEC_OFFLOAD_MAC = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingMacsec = type Pointer;
  PNMSettingMacsecClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_macsec_get_type: TGType; cdecl; external libnm;
function nm_setting_macsec_new: PNMSetting; cdecl; external libnm;
function nm_setting_macsec_get_parent(setting: PNMSettingMacsec): pchar; cdecl; external libnm;
function nm_setting_macsec_get_mode(setting: PNMSettingMacsec): TNMSettingMacsecMode; cdecl; external libnm;
function nm_setting_macsec_get_encrypt(setting: PNMSettingMacsec): Tgboolean; cdecl; external libnm;
function nm_setting_macsec_get_mka_cak(setting: PNMSettingMacsec): pchar; cdecl; external libnm;
function nm_setting_macsec_get_mka_cak_flags(setting: PNMSettingMacsec): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_macsec_get_mka_ckn(setting: PNMSettingMacsec): pchar; cdecl; external libnm;
function nm_setting_macsec_get_port(setting: PNMSettingMacsec): longint; cdecl; external libnm;
function nm_setting_macsec_get_validation(setting: PNMSettingMacsec): TNMSettingMacsecValidation; cdecl; external libnm;
function nm_setting_macsec_get_send_sci(setting: PNMSettingMacsec): Tgboolean; cdecl; external libnm;
function nm_setting_macsec_get_offload(setting: PNMSettingMacsec): TNMSettingMacsecOffload; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:26:17 ===

function NM_TYPE_SETTING_MACSEC: TGType;
function NM_SETTING_MACSEC(obj: Pointer): PNMSettingMacsec;
function NM_SETTING_MACSEC_CLASS(klass: Pointer): PNMSettingMacsecClass;
function NM_IS_SETTING_MACSEC(obj: Pointer): Tgboolean;
function NM_IS_SETTING_MACSEC_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_MACSEC_GET_CLASS(obj: Pointer): PNMSettingMacsecClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_MACSEC: TGType;
begin
  NM_TYPE_SETTING_MACSEC := nm_setting_macsec_get_type;
end;

function NM_SETTING_MACSEC(obj: Pointer): PNMSettingMacsec;
begin
  Result := PNMSettingMacsec(g_type_check_instance_cast(obj, NM_TYPE_SETTING_MACSEC));
end;

function NM_SETTING_MACSEC_CLASS(klass: Pointer): PNMSettingMacsecClass;
begin
  Result := PNMSettingMacsecClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_MACSEC));
end;

function NM_IS_SETTING_MACSEC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_MACSEC);
end;

function NM_IS_SETTING_MACSEC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_MACSEC);
end;

function NM_SETTING_MACSEC_GET_CLASS(obj: Pointer): PNMSettingMacsecClass;
begin
  Result := PNMSettingMacsecClass(PGTypeInstance(obj)^.g_class);
end;



end.

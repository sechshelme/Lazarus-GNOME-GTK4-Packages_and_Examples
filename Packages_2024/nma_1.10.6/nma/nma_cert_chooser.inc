{$IFDEF read_interface}


type
  PNMACertChooserFlags = ^TNMACertChooserFlags;
  TNMACertChooserFlags = longint;

const
  NMA_CERT_CHOOSER_FLAG_NONE = $0;
  NMA_CERT_CHOOSER_FLAG_CERT = $1;
  NMA_CERT_CHOOSER_FLAG_PASSWORDS = $2;
  NMA_CERT_CHOOSER_FLAG_PEM = $4;
  NMA_CERT_CHOOSER_FLAG_NO_PASSWORDS = $8;

type
  PNMACertChooser = type Pointer;
  PNMACertChooserClass = type Pointer;

function nma_cert_chooser_get_type: TGType; cdecl; external libnma;
procedure nma_cert_chooser_set_cert(cert_chooser: PNMACertChooser; value: Pgchar; scheme: TNMSetting8021xCKScheme); cdecl; external libnma;
procedure nma_cert_chooser_set_cert_uri(cert_chooser: PNMACertChooser; uri: Pgchar); cdecl; external libnma;
function nma_cert_chooser_get_cert(cert_chooser: PNMACertChooser; scheme: PNMSetting8021xCKScheme): Pgchar; cdecl; external libnma;
function nma_cert_chooser_get_cert_uri(cert_chooser: PNMACertChooser): Pgchar; cdecl; external libnma;
procedure nma_cert_chooser_set_cert_password(cert_chooser: PNMACertChooser; password: Pgchar); cdecl; external libnma;
function nma_cert_chooser_get_cert_password(cert_chooser: PNMACertChooser): Pgchar; cdecl; external libnma;
procedure nma_cert_chooser_set_key(cert_chooser: PNMACertChooser; value: Pgchar; scheme: TNMSetting8021xCKScheme); cdecl; external libnma;
procedure nma_cert_chooser_set_key_uri(cert_chooser: PNMACertChooser; uri: Pgchar); cdecl; external libnma;
function nma_cert_chooser_get_key(cert_chooser: PNMACertChooser; scheme: PNMSetting8021xCKScheme): Pgchar; cdecl; external libnma;
function nma_cert_chooser_get_key_uri(cert_chooser: PNMACertChooser): Pgchar; cdecl; external libnma;
procedure nma_cert_chooser_set_key_password(cert_chooser: PNMACertChooser; password: Pgchar); cdecl; external libnma;
function nma_cert_chooser_get_key_password(cert_chooser: PNMACertChooser): Pgchar; cdecl; external libnma;
function nma_cert_chooser_new(title: Pgchar; flags: TNMACertChooserFlags): PGtkWidget; cdecl; external libnma;
procedure nma_cert_chooser_add_to_size_group(cert_chooser: PNMACertChooser; group: PGtkSizeGroup); cdecl; external libnma;
function nma_cert_chooser_validate(cert_chooser: PNMACertChooser; error: PPGError): Tgboolean; cdecl; external libnma;
procedure nma_cert_chooser_setup_cert_password_storage(cert_chooser: PNMACertChooser; initial_flags: TNMSettingSecretFlags; setting: PNMSetting; password_flags_name: pchar; with_not_required: Tgboolean;
  ask_mode: Tgboolean); cdecl; external libnma;
procedure nma_cert_chooser_update_cert_password_storage(cert_chooser: PNMACertChooser; secret_flags: TNMSettingSecretFlags; setting: PNMSetting; password_flags_name: pchar); cdecl; external libnma;
function nma_cert_chooser_get_cert_password_flags(cert_chooser: PNMACertChooser): TNMSettingSecretFlags; cdecl; external libnma;
procedure nma_cert_chooser_setup_key_password_storage(cert_chooser: PNMACertChooser; initial_flags: TNMSettingSecretFlags; setting: PNMSetting; password_flags_name: pchar; with_not_required: Tgboolean;
  ask_mode: Tgboolean); cdecl; external libnma;
procedure nma_cert_chooser_update_key_password_storage(cert_chooser: PNMACertChooser; secret_flags: TNMSettingSecretFlags; setting: PNMSetting; password_flags_name: pchar); cdecl; external libnma;
function nma_cert_chooser_get_key_password_flags(cert_chooser: PNMACertChooser): TNMSettingSecretFlags; cdecl; external libnma;

// === Konventiert am: 8-8-26 13:27:05 ===

function NMA_TYPE_CERT_CHOOSER: TGType;
function NMA_CERT_CHOOSER(obj: Pointer): PNMACertChooser;
function NMA_CERT_CHOOSER_CLASS(klass: Pointer): PNMACertChooserClass;
function NMA_IS_CERT_CHOOSER(obj: Pointer): Tgboolean;
function NMA_IS_CERT_CHOOSER_CLASS(klass: Pointer): Tgboolean;
function NMA_CERT_CHOOSER_GET_CLASS(obj: Pointer): PNMACertChooserClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function NMA_TYPE_CERT_CHOOSER: TGType;
begin
  NMA_TYPE_CERT_CHOOSER := nma_cert_chooser_get_type;
end;

function NMA_CERT_CHOOSER(obj: Pointer): PNMACertChooser;
begin
  Result := PNMACertChooser(g_type_check_instance_cast(obj, NMA_TYPE_CERT_CHOOSER));
end;

function NMA_CERT_CHOOSER_CLASS(klass: Pointer): PNMACertChooserClass;
begin
  Result := PNMACertChooserClass(g_type_check_class_cast(klass, NMA_TYPE_CERT_CHOOSER));
end;

function NMA_IS_CERT_CHOOSER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NMA_TYPE_CERT_CHOOSER);
end;

function NMA_IS_CERT_CHOOSER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NMA_TYPE_CERT_CHOOSER);
end;

function NMA_CERT_CHOOSER_GET_CLASS(obj: Pointer): PNMACertChooserClass;
begin
  Result := PNMACertChooserClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

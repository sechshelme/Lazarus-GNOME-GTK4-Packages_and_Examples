unit nm_setting_8021x;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_SETTING_802_1X_CERT_SCHEME_PREFIX_PATH = 'file://';
  NM_SETTING_802_1X_CERT_SCHEME_PREFIX_PKCS11 = 'pkcs11:';

type
  PNMSetting8021xCKFormat = ^TNMSetting8021xCKFormat;
  TNMSetting8021xCKFormat = longint;

const
  NM_SETTING_802_1X_CK_FORMAT_UNKNOWN = 0;
  NM_SETTING_802_1X_CK_FORMAT_X509 = 1;
  NM_SETTING_802_1X_CK_FORMAT_RAW_KEY = 2;
  NM_SETTING_802_1X_CK_FORMAT_PKCS12 = 3;

type
  PNMSetting8021xCKScheme = ^TNMSetting8021xCKScheme;
  TNMSetting8021xCKScheme = longint;

const
  NM_SETTING_802_1X_CK_SCHEME_UNKNOWN = 0;
  NM_SETTING_802_1X_CK_SCHEME_BLOB = 1;
  NM_SETTING_802_1X_CK_SCHEME_PATH = 2;
  NM_SETTING_802_1X_CK_SCHEME_PKCS11 = 3;

type
  PNMSetting8021xAuthFlags = ^TNMSetting8021xAuthFlags;
  TNMSetting8021xAuthFlags = longint;

const
  NM_SETTING_802_1X_AUTH_FLAGS_NONE = 0;
  NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_0_DISABLE = $1;
  NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_1_DISABLE = $2;
  NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_2_DISABLE = $4;
  NM_SETTING_802_1X_AUTH_FLAGS_TLS_DISABLE_TIME_CHECKS = $8;
  NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_3_DISABLE = $10;
  NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_0_ENABLE = $20;
  NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_1_ENABLE = $40;
  NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_2_ENABLE = $80;
  NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_3_ENABLE = $100;
  NM_SETTING_802_1X_AUTH_FLAGS_ALL = $1FF;

const
  NM_SETTING_802_1X_SETTING_NAME = '802-1x';
  NM_SETTING_802_1X_EAP = 'eap';
  NM_SETTING_802_1X_IDENTITY = 'identity';
  NM_SETTING_802_1X_ANONYMOUS_IDENTITY = 'anonymous-identity';
  NM_SETTING_802_1X_PAC_FILE = 'pac-file';
  NM_SETTING_802_1X_CA_CERT = 'ca-cert';
  NM_SETTING_802_1X_CA_CERT_PASSWORD = 'ca-cert-password';
  NM_SETTING_802_1X_CA_CERT_PASSWORD_FLAGS = 'ca-cert-password-flags';
  NM_SETTING_802_1X_CA_PATH = 'ca-path';
  NM_SETTING_802_1X_SUBJECT_MATCH = 'subject-match';
  NM_SETTING_802_1X_ALTSUBJECT_MATCHES = 'altsubject-matches';
  NM_SETTING_802_1X_DOMAIN_SUFFIX_MATCH = 'domain-suffix-match';
  NM_SETTING_802_1X_DOMAIN_MATCH = 'domain-match';
  NM_SETTING_802_1X_CLIENT_CERT = 'client-cert';
  NM_SETTING_802_1X_CLIENT_CERT_PASSWORD = 'client-cert-password';
  NM_SETTING_802_1X_CLIENT_CERT_PASSWORD_FLAGS = 'client-cert-password-flags';
  NM_SETTING_802_1X_PHASE1_PEAPVER = 'phase1-peapver';
  NM_SETTING_802_1X_PHASE1_PEAPLABEL = 'phase1-peaplabel';
  NM_SETTING_802_1X_PHASE1_FAST_PROVISIONING = 'phase1-fast-provisioning';
  NM_SETTING_802_1X_PHASE1_AUTH_FLAGS = 'phase1-auth-flags';
  NM_SETTING_802_1X_PHASE2_AUTH = 'phase2-auth';
  NM_SETTING_802_1X_PHASE2_AUTHEAP = 'phase2-autheap';
  NM_SETTING_802_1X_PHASE2_CA_CERT = 'phase2-ca-cert';
  NM_SETTING_802_1X_PHASE2_CA_CERT_PASSWORD = 'phase2-ca-cert-password';
  NM_SETTING_802_1X_PHASE2_CA_CERT_PASSWORD_FLAGS = 'phase2-ca-cert-password-flags';
  NM_SETTING_802_1X_PHASE2_CA_PATH = 'phase2-ca-path';
  NM_SETTING_802_1X_PHASE2_SUBJECT_MATCH = 'phase2-subject-match';
  NM_SETTING_802_1X_PHASE2_ALTSUBJECT_MATCHES = 'phase2-altsubject-matches';
  NM_SETTING_802_1X_PHASE2_DOMAIN_SUFFIX_MATCH = 'phase2-domain-suffix-match';
  NM_SETTING_802_1X_PHASE2_DOMAIN_MATCH = 'phase2-domain-match';
  NM_SETTING_802_1X_PHASE2_CLIENT_CERT = 'phase2-client-cert';
  NM_SETTING_802_1X_PHASE2_CLIENT_CERT_PASSWORD = 'phase2-client-cert-password';
  NM_SETTING_802_1X_PHASE2_CLIENT_CERT_PASSWORD_FLAGS = 'phase2-client-cert-password-flags';
  NM_SETTING_802_1X_PASSWORD = 'password';
  NM_SETTING_802_1X_PASSWORD_FLAGS = 'password-flags';
  NM_SETTING_802_1X_PASSWORD_RAW = 'password-raw';
  NM_SETTING_802_1X_PASSWORD_RAW_FLAGS = 'password-raw-flags';
  NM_SETTING_802_1X_PRIVATE_KEY = 'private-key';
  NM_SETTING_802_1X_PRIVATE_KEY_PASSWORD = 'private-key-password';
  NM_SETTING_802_1X_PRIVATE_KEY_PASSWORD_FLAGS = 'private-key-password-flags';
  NM_SETTING_802_1X_PHASE2_PRIVATE_KEY = 'phase2-private-key';
  NM_SETTING_802_1X_PHASE2_PRIVATE_KEY_PASSWORD = 'phase2-private-key-password';
  NM_SETTING_802_1X_PHASE2_PRIVATE_KEY_PASSWORD_FLAGS = 'phase2-private-key-password-flags';
  NM_SETTING_802_1X_PIN = 'pin';
  NM_SETTING_802_1X_PIN_FLAGS = 'pin-flags';
  NM_SETTING_802_1X_SYSTEM_CA_CERTS = 'system-ca-certs';
  NM_SETTING_802_1X_AUTH_TIMEOUT = 'auth-timeout';
  NM_SETTING_802_1X_OPTIONAL = 'optional';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSetting8021x = type Pointer;
  PNMSetting8021xClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_802_1x_get_type: TGType; cdecl; external libnm;
function nm_setting_802_1x_new: PNMSetting; cdecl; external libnm;
function nm_setting_802_1x_check_cert_scheme(pdata: Tgconstpointer; length: Tgsize; error: PPGError): TNMSetting8021xCKScheme; cdecl; external libnm;
function nm_setting_802_1x_get_num_eap_methods(setting: PNMSetting8021x): Tguint32; cdecl; external libnm;
function nm_setting_802_1x_get_eap_method(setting: PNMSetting8021x; i: Tguint32): pchar; cdecl; external libnm;
function nm_setting_802_1x_add_eap_method(setting: PNMSetting8021x; eap: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_802_1x_remove_eap_method(setting: PNMSetting8021x; i: Tguint32); cdecl; external libnm;
function nm_setting_802_1x_remove_eap_method_by_value(setting: PNMSetting8021x; eap: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_802_1x_clear_eap_methods(setting: PNMSetting8021x); cdecl; external libnm;
function nm_setting_802_1x_get_identity(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_anonymous_identity(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_pac_file(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_system_ca_certs(setting: PNMSetting8021x): Tgboolean; cdecl; external libnm;
function nm_setting_802_1x_get_ca_path(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_ca_path(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_ca_cert_scheme(setting: PNMSetting8021x): TNMSetting8021xCKScheme; cdecl; external libnm;
function nm_setting_802_1x_get_ca_cert_blob(setting: PNMSetting8021x): PGBytes; cdecl; external libnm;
function nm_setting_802_1x_get_ca_cert_path(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_ca_cert_uri(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_set_ca_cert(setting: PNMSetting8021x; value: pchar; scheme: TNMSetting8021xCKScheme; out_format: PNMSetting8021xCKFormat; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_setting_802_1x_get_ca_cert_password(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_ca_cert_password_flags(setting: PNMSetting8021x): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_802_1x_get_subject_match(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_num_altsubject_matches(setting: PNMSetting8021x): Tguint32; cdecl; external libnm;
function nm_setting_802_1x_get_altsubject_match(setting: PNMSetting8021x; i: Tguint32): pchar; cdecl; external libnm;
function nm_setting_802_1x_add_altsubject_match(setting: PNMSetting8021x; altsubject_match: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_802_1x_remove_altsubject_match(setting: PNMSetting8021x; i: Tguint32); cdecl; external libnm;
function nm_setting_802_1x_remove_altsubject_match_by_value(setting: PNMSetting8021x; altsubject_match: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_802_1x_clear_altsubject_matches(setting: PNMSetting8021x); cdecl; external libnm;
function nm_setting_802_1x_get_domain_suffix_match(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_domain_match(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_client_cert_scheme(setting: PNMSetting8021x): TNMSetting8021xCKScheme; cdecl; external libnm;
function nm_setting_802_1x_get_client_cert_blob(setting: PNMSetting8021x): PGBytes; cdecl; external libnm;
function nm_setting_802_1x_get_client_cert_path(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_client_cert_uri(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_set_client_cert(setting: PNMSetting8021x; value: pchar; scheme: TNMSetting8021xCKScheme; out_format: PNMSetting8021xCKFormat; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_setting_802_1x_get_client_cert_password(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_client_cert_password_flags(setting: PNMSetting8021x): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_802_1x_get_phase1_peapver(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase1_peaplabel(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase1_fast_provisioning(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_auth(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_autheap(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_ca_cert_scheme(setting: PNMSetting8021x): TNMSetting8021xCKScheme; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_ca_cert_blob(setting: PNMSetting8021x): PGBytes; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_ca_cert_path(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_ca_cert_uri(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_set_phase2_ca_cert(setting: PNMSetting8021x; value: pchar; scheme: TNMSetting8021xCKScheme; out_format: PNMSetting8021xCKFormat; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_ca_cert_password(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_ca_cert_password_flags(setting: PNMSetting8021x): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_subject_match(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_num_phase2_altsubject_matches(setting: PNMSetting8021x): Tguint32; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_altsubject_match(setting: PNMSetting8021x; i: Tguint32): pchar; cdecl; external libnm;
function nm_setting_802_1x_add_phase2_altsubject_match(setting: PNMSetting8021x; phase2_altsubject_match: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_802_1x_remove_phase2_altsubject_match(setting: PNMSetting8021x; i: Tguint32); cdecl; external libnm;
function nm_setting_802_1x_remove_phase2_altsubject_match_by_value(setting: PNMSetting8021x; phase2_altsubject_match: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_802_1x_clear_phase2_altsubject_matches(setting: PNMSetting8021x); cdecl; external libnm;
function nm_setting_802_1x_get_phase2_domain_suffix_match(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_domain_match(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_client_cert_scheme(setting: PNMSetting8021x): TNMSetting8021xCKScheme; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_client_cert_blob(setting: PNMSetting8021x): PGBytes; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_client_cert_path(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_client_cert_uri(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_set_phase2_client_cert(setting: PNMSetting8021x; value: pchar; scheme: TNMSetting8021xCKScheme; out_format: PNMSetting8021xCKFormat; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_client_cert_password(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_client_cert_password_flags(setting: PNMSetting8021x): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_802_1x_get_password(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_password_flags(setting: PNMSetting8021x): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_802_1x_get_password_raw(setting: PNMSetting8021x): PGBytes; cdecl; external libnm;
function nm_setting_802_1x_get_password_raw_flags(setting: PNMSetting8021x): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_802_1x_get_pin(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_pin_flags(setting: PNMSetting8021x): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_802_1x_get_private_key_scheme(setting: PNMSetting8021x): TNMSetting8021xCKScheme; cdecl; external libnm;
function nm_setting_802_1x_get_private_key_blob(setting: PNMSetting8021x): PGBytes; cdecl; external libnm;
function nm_setting_802_1x_get_private_key_path(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_private_key_uri(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_set_private_key(setting: PNMSetting8021x; value: pchar; password: pchar; scheme: TNMSetting8021xCKScheme; out_format: PNMSetting8021xCKFormat; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_setting_802_1x_get_private_key_password(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_private_key_password_flags(setting: PNMSetting8021x): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_802_1x_get_private_key_format(setting: PNMSetting8021x): TNMSetting8021xCKFormat; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_private_key_scheme(setting: PNMSetting8021x): TNMSetting8021xCKScheme; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_private_key_blob(setting: PNMSetting8021x): PGBytes; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_private_key_path(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_private_key_uri(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_set_phase2_private_key(setting: PNMSetting8021x; value: pchar; password: pchar; scheme: TNMSetting8021xCKScheme; out_format: PNMSetting8021xCKFormat; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_private_key_password(setting: PNMSetting8021x): pchar; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_private_key_password_flags(setting: PNMSetting8021x): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_802_1x_get_phase2_private_key_format(setting: PNMSetting8021x): TNMSetting8021xCKFormat; cdecl; external libnm;
function nm_setting_802_1x_get_phase1_auth_flags(setting: PNMSetting8021x): TNMSetting8021xAuthFlags; cdecl; external libnm;
function nm_setting_802_1x_get_auth_timeout(setting: PNMSetting8021x): longint; cdecl; external libnm;
function nm_setting_802_1x_get_optional(setting: PNMSetting8021x): Tgboolean; cdecl; external libnm;
{$ENDIF read_function}

// === Konventiert am: 19-4-26 19:28:11 ===

function NM_TYPE_SETTING_802_1X: TGType;
function NM_SETTING_802_1X(obj: Pointer): PNMSetting8021x;
function NM_SETTING_802_1X_CLASS(klass: Pointer): PNMSetting8021xClass;
function NM_IS_SETTING_802_1X(obj: Pointer): Tgboolean;
function NM_IS_SETTING_802_1X_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_802_1X_GET_CLASS(obj: Pointer): PNMSetting8021xClass;

implementation

function NM_TYPE_SETTING_802_1X: TGType;
begin
  NM_TYPE_SETTING_802_1X := nm_setting_802_1x_get_type;
end;

function NM_SETTING_802_1X(obj: Pointer): PNMSetting8021x;
begin
  Result := PNMSetting8021x(g_type_check_instance_cast(obj, NM_TYPE_SETTING_802_1X));
end;

function NM_SETTING_802_1X_CLASS(klass: Pointer): PNMSetting8021xClass;
begin
  Result := PNMSetting8021xClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_802_1X));
end;

function NM_IS_SETTING_802_1X(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_802_1X);
end;

function NM_IS_SETTING_802_1X_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_802_1X);
end;

function NM_SETTING_802_1X_GET_CLASS(obj: Pointer): PNMSetting8021xClass;
begin
  Result := PNMSetting8021xClass(PGTypeInstance(obj)^.g_class);
end;



end.

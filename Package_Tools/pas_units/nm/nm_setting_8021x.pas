unit nm_setting_8021x;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2014 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_8021X_H__}
{$define __NM_SETTING_8021X_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_802_1X_CERT_SCHEME_PREFIX_PATH = 'file://';  
  NM_SETTING_802_1X_CERT_SCHEME_PREFIX_PKCS11 = 'pkcs11:';  
{*
 * NMSetting8021xCKFormat:
 * @NM_SETTING_802_1X_CK_FORMAT_UNKNOWN: unknown file format
 * @NM_SETTING_802_1X_CK_FORMAT_X509: file contains an X.509 format certificate
 * @NM_SETTING_802_1X_CK_FORMAT_RAW_KEY: file contains an old-style OpenSSL PEM
 * or DER private key
 * @NM_SETTING_802_1X_CK_FORMAT_PKCS12: file contains a PKCS#<!-- -->12 certificate
 * and private key
 *
 * #NMSetting8021xCKFormat values indicate the general type of a certificate
 * or private key
  }
{< underscore_name=nm_setting_802_1x_ck_format > }
type
  PNMSetting8021xCKFormat = ^TNMSetting8021xCKFormat;
  TNMSetting8021xCKFormat =  Longint;
  Const
    NM_SETTING_802_1X_CK_FORMAT_UNKNOWN = 0;
    NM_SETTING_802_1X_CK_FORMAT_X509 = 1;
    NM_SETTING_802_1X_CK_FORMAT_RAW_KEY = 2;
    NM_SETTING_802_1X_CK_FORMAT_PKCS12 = 3;
;
{*
 * NMSetting8021xCKScheme:
 * @NM_SETTING_802_1X_CK_SCHEME_UNKNOWN: unknown certificate or private key
 * scheme
 * @NM_SETTING_802_1X_CK_SCHEME_BLOB: certificate or key is stored as the raw
 * item data
 * @NM_SETTING_802_1X_CK_SCHEME_PATH: certificate or key is stored as a path
 * to a file containing the certificate or key data
 * @NM_SETTING_802_1X_CK_SCHEME_PKCS11: certificate or key is stored as a
 * URI of an object on a PKCS#11 token
 *
 * #NMSetting8021xCKScheme values indicate how a certificate or private key is
 * stored in the setting properties, either as a blob of the item's data, or as
 * a path to a certificate or private key file on the filesystem
  }
{< underscore_name=nm_setting_802_1x_ck_scheme > }
type
  PNMSetting8021xCKScheme = ^TNMSetting8021xCKScheme;
  TNMSetting8021xCKScheme =  Longint;
  Const
    NM_SETTING_802_1X_CK_SCHEME_UNKNOWN = 0;
    NM_SETTING_802_1X_CK_SCHEME_BLOB = 1;
    NM_SETTING_802_1X_CK_SCHEME_PATH = 2;
    NM_SETTING_802_1X_CK_SCHEME_PKCS11 = 3;
;
{*
 * NMSetting8021xAuthFlags:
 * @NM_SETTING_802_1X_AUTH_FLAGS_NONE: No flags
 * @NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_0_DISABLE: Disable TLSv1.0
 * @NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_0_ENABLE: Enable TLSv1.0. Since 1.42.
 * @NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_1_DISABLE: Disable TLSv1.1
 * @NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_1_ENABLE: Enable TLSv1.1. Since 1.42.
 * @NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_2_DISABLE: Disable TLSv1.2
 * @NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_2_ENABLE: Enable TLSv1.2. Since 1.42.
 * @NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_3_DISABLE: Disable TLSv1.3. Since 1.42.
 * @NM_SETTING_802_1X_AUTH_FLAGS_TLS_1_3_ENABLE: Enable TLSv1.3. Since 1.42.
 * @NM_SETTING_802_1X_AUTH_FLAGS_TLS_DISABLE_TIME_CHECKS: Disable TLS time checks. Since 1.42.
 * @NM_SETTING_802_1X_AUTH_FLAGS_ALL: All supported flags
 *
 * #NMSetting8021xAuthFlags values indicate which authentication settings
 * should be used.
 *
 * Before 1.22, this was wrongly marked as a enum and not as a flags
 * type.
 *
 * Since: 1.8
  }
{< underscore_name=nm_setting_802_1x_auth_flags, flags > }type
  PNMSetting8021xAuthFlags = ^TNMSetting8021xAuthFlags;
  TNMSetting8021xAuthFlags =  Longint;
  Const
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
;

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
{ PRIVATE KEY NOTE: when setting PKCS#12 private keys directly via properties
 * using the "blob" scheme, the data must be passed in PKCS#12 binary format.
 * In this case, the appropriate "client-cert" (or "phase2-client-cert")
 * property of the NMSetting8021x object must also contain the exact same
 * PKCS#12 binary data that the private key does.  This is because the
 * PKCS#12 file contains both the private key and client certificate, so both
 * properties need to be set to the same thing.  When using the "path" scheme,
 * just set both the private-key and client-cert properties to the same path.
 *
 * When setting OpenSSL-derived "traditional" format (ie S/MIME style, not
 * PKCS#8) RSA and DSA keys directly via properties with the "blob" scheme, they
 * should be passed to NetworkManager in PEM format with the "DEK-Info" and
 * "Proc-Type" tags intact.  Decrypted private keys should not be used as this
 * is insecure and could allow unprivileged users to access the decrypted
 * private key data.
 *
 * When using the "path" scheme, just set the private-key and client-cert
 * properties to the paths to their respective objects.
  }
type

function nm_setting_802_1x_get_type:TGType;cdecl;external libnm;
function nm_setting_802_1x_new:PNMSetting;cdecl;external libnm;
function nm_setting_802_1x_check_cert_scheme(pdata:Tgconstpointer; length:Tgsize; error:PPGError):TNMSetting8021xCKScheme;cdecl;external libnm;
function nm_setting_802_1x_get_num_eap_methods(setting:PNMSetting8021x):Tguint32;cdecl;external libnm;
function nm_setting_802_1x_get_eap_method(setting:PNMSetting8021x; i:Tguint32):Pchar;cdecl;external libnm;
function nm_setting_802_1x_add_eap_method(setting:PNMSetting8021x; eap:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_802_1x_remove_eap_method(setting:PNMSetting8021x; i:Tguint32);cdecl;external libnm;
function nm_setting_802_1x_remove_eap_method_by_value(setting:PNMSetting8021x; eap:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_802_1x_clear_eap_methods(setting:PNMSetting8021x);cdecl;external libnm;
function nm_setting_802_1x_get_identity(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_anonymous_identity(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_pac_file(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_system_ca_certs(setting:PNMSetting8021x):Tgboolean;cdecl;external libnm;
function nm_setting_802_1x_get_ca_path(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_ca_path(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_ca_cert_scheme(setting:PNMSetting8021x):TNMSetting8021xCKScheme;cdecl;external libnm;
function nm_setting_802_1x_get_ca_cert_blob(setting:PNMSetting8021x):PGBytes;cdecl;external libnm;
function nm_setting_802_1x_get_ca_cert_path(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_ca_cert_uri(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_set_ca_cert(setting:PNMSetting8021x; value:Pchar; scheme:TNMSetting8021xCKScheme; out_format:PNMSetting8021xCKFormat; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_setting_802_1x_get_ca_cert_password(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_ca_cert_password_flags(setting:PNMSetting8021x):TNMSettingSecretFlags;cdecl;external libnm;
function nm_setting_802_1x_get_subject_match(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_num_altsubject_matches(setting:PNMSetting8021x):Tguint32;cdecl;external libnm;
function nm_setting_802_1x_get_altsubject_match(setting:PNMSetting8021x; i:Tguint32):Pchar;cdecl;external libnm;
function nm_setting_802_1x_add_altsubject_match(setting:PNMSetting8021x; altsubject_match:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_802_1x_remove_altsubject_match(setting:PNMSetting8021x; i:Tguint32);cdecl;external libnm;
function nm_setting_802_1x_remove_altsubject_match_by_value(setting:PNMSetting8021x; altsubject_match:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_802_1x_clear_altsubject_matches(setting:PNMSetting8021x);cdecl;external libnm;
function nm_setting_802_1x_get_domain_suffix_match(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_domain_match(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_client_cert_scheme(setting:PNMSetting8021x):TNMSetting8021xCKScheme;cdecl;external libnm;
function nm_setting_802_1x_get_client_cert_blob(setting:PNMSetting8021x):PGBytes;cdecl;external libnm;
function nm_setting_802_1x_get_client_cert_path(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_client_cert_uri(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_set_client_cert(setting:PNMSetting8021x; value:Pchar; scheme:TNMSetting8021xCKScheme; out_format:PNMSetting8021xCKFormat; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_setting_802_1x_get_client_cert_password(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_client_cert_password_flags(setting:PNMSetting8021x):TNMSettingSecretFlags;cdecl;external libnm;
function nm_setting_802_1x_get_phase1_peapver(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase1_peaplabel(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase1_fast_provisioning(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_auth(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_autheap(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_ca_cert_scheme(setting:PNMSetting8021x):TNMSetting8021xCKScheme;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_ca_cert_blob(setting:PNMSetting8021x):PGBytes;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_ca_cert_path(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_ca_cert_uri(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_set_phase2_ca_cert(setting:PNMSetting8021x; value:Pchar; scheme:TNMSetting8021xCKScheme; out_format:PNMSetting8021xCKFormat; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_ca_cert_password(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_ca_cert_password_flags(setting:PNMSetting8021x):TNMSettingSecretFlags;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_subject_match(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_num_phase2_altsubject_matches(setting:PNMSetting8021x):Tguint32;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_altsubject_match(setting:PNMSetting8021x; i:Tguint32):Pchar;cdecl;external libnm;
function nm_setting_802_1x_add_phase2_altsubject_match(setting:PNMSetting8021x; phase2_altsubject_match:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_802_1x_remove_phase2_altsubject_match(setting:PNMSetting8021x; i:Tguint32);cdecl;external libnm;
function nm_setting_802_1x_remove_phase2_altsubject_match_by_value(setting:PNMSetting8021x; phase2_altsubject_match:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_802_1x_clear_phase2_altsubject_matches(setting:PNMSetting8021x);cdecl;external libnm;
function nm_setting_802_1x_get_phase2_domain_suffix_match(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_domain_match(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_client_cert_scheme(setting:PNMSetting8021x):TNMSetting8021xCKScheme;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_client_cert_blob(setting:PNMSetting8021x):PGBytes;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_client_cert_path(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_client_cert_uri(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_set_phase2_client_cert(setting:PNMSetting8021x; value:Pchar; scheme:TNMSetting8021xCKScheme; out_format:PNMSetting8021xCKFormat; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_client_cert_password(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_client_cert_password_flags(setting:PNMSetting8021x):TNMSettingSecretFlags;cdecl;external libnm;
function nm_setting_802_1x_get_password(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_password_flags(setting:PNMSetting8021x):TNMSettingSecretFlags;cdecl;external libnm;
function nm_setting_802_1x_get_password_raw(setting:PNMSetting8021x):PGBytes;cdecl;external libnm;
function nm_setting_802_1x_get_password_raw_flags(setting:PNMSetting8021x):TNMSettingSecretFlags;cdecl;external libnm;
function nm_setting_802_1x_get_pin(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_pin_flags(setting:PNMSetting8021x):TNMSettingSecretFlags;cdecl;external libnm;
function nm_setting_802_1x_get_private_key_scheme(setting:PNMSetting8021x):TNMSetting8021xCKScheme;cdecl;external libnm;
function nm_setting_802_1x_get_private_key_blob(setting:PNMSetting8021x):PGBytes;cdecl;external libnm;
function nm_setting_802_1x_get_private_key_path(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_private_key_uri(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_set_private_key(setting:PNMSetting8021x; value:Pchar; password:Pchar; scheme:TNMSetting8021xCKScheme; out_format:PNMSetting8021xCKFormat; 
           error:PPGError):Tgboolean;cdecl;external libnm;
function nm_setting_802_1x_get_private_key_password(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_private_key_password_flags(setting:PNMSetting8021x):TNMSettingSecretFlags;cdecl;external libnm;
function nm_setting_802_1x_get_private_key_format(setting:PNMSetting8021x):TNMSetting8021xCKFormat;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_private_key_scheme(setting:PNMSetting8021x):TNMSetting8021xCKScheme;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_private_key_blob(setting:PNMSetting8021x):PGBytes;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_private_key_path(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_private_key_uri(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_set_phase2_private_key(setting:PNMSetting8021x; value:Pchar; password:Pchar; scheme:TNMSetting8021xCKScheme; out_format:PNMSetting8021xCKFormat; 
           error:PPGError):Tgboolean;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_private_key_password(setting:PNMSetting8021x):Pchar;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_private_key_password_flags(setting:PNMSetting8021x):TNMSettingSecretFlags;cdecl;external libnm;
function nm_setting_802_1x_get_phase2_private_key_format(setting:PNMSetting8021x):TNMSetting8021xCKFormat;cdecl;external libnm;
function nm_setting_802_1x_get_phase1_auth_flags(setting:PNMSetting8021x):TNMSetting8021xAuthFlags;cdecl;external libnm;
function nm_setting_802_1x_get_auth_timeout(setting:PNMSetting8021x):longint;cdecl;external libnm;
function nm_setting_802_1x_get_optional(setting:PNMSetting8021x):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_SETTING_8021X_H__  }

// === Konventiert am: 19-4-26 19:28:11 ===

function NM_TYPE_SETTING_802_1X : TGType;
function NM_SETTING_802_1X(obj : Pointer) : PNMSetting8021x;
function NM_SETTING_802_1X_CLASS(klass : Pointer) : PNMSetting8021xClass;
function NM_IS_SETTING_802_1X(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_802_1X_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_802_1X_GET_CLASS(obj : Pointer) : PNMSetting8021xClass;

implementation

function NM_TYPE_SETTING_802_1X : TGType;
  begin
    NM_TYPE_SETTING_802_1X:=nm_setting_802_1x_get_type;
  end;

function NM_SETTING_802_1X(obj : Pointer) : PNMSetting8021x;
begin
  Result := PNMSetting8021x(g_type_check_instance_cast(obj, NM_TYPE_SETTING_802_1X));
end;

function NM_SETTING_802_1X_CLASS(klass : Pointer) : PNMSetting8021xClass;
begin
  Result := PNMSetting8021xClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_802_1X));
end;

function NM_IS_SETTING_802_1X(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_802_1X);
end;

function NM_IS_SETTING_802_1X_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_802_1X);
end;

function NM_SETTING_802_1X_GET_CLASS(obj : Pointer) : PNMSetting8021xClass;
begin
  Result := PNMSetting8021xClass(PGTypeInstance(obj)^.g_class);
end;



end.

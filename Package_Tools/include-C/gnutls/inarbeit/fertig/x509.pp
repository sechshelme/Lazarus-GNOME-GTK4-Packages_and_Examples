
unit x509;
interface

{
  Automatically converted by H2Pas 1.0.0 from x509.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    x509.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pbyte  = ^byte;
Pchar  = ^char;
Pdword  = ^dword;
Pgnutls_certificate_import_flags  = ^gnutls_certificate_import_flags;
Pgnutls_certificate_verification_profiles_t  = ^gnutls_certificate_verification_profiles_t;
Pgnutls_certificate_verify_flags  = ^gnutls_certificate_verify_flags;
Pgnutls_datum_t  = ^gnutls_datum_t;
Pgnutls_digest_algorithm_t  = ^gnutls_digest_algorithm_t;
Pgnutls_ecc_curve_t  = ^gnutls_ecc_curve_t;
Pgnutls_gost_paramset_t  = ^gnutls_gost_paramset_t;
Pgnutls_info_access_what_t  = ^gnutls_info_access_what_t;
Pgnutls_keygen_data_st  = ^gnutls_keygen_data_st;
Pgnutls_keygen_types_t  = ^gnutls_keygen_types_t;
Pgnutls_keyid_flags_t  = ^gnutls_keyid_flags_t;
Pgnutls_name_constraints_st  = ^gnutls_name_constraints_st;
Pgnutls_pkcs_encrypt_flags_t  = ^gnutls_pkcs_encrypt_flags_t;
Pgnutls_trust_list_flags_t  = ^gnutls_trust_list_flags_t;
Pgnutls_typed_vdata_st  = ^gnutls_typed_vdata_st;
Pgnutls_verify_output_function  = ^gnutls_verify_output_function;
Pgnutls_x509_ava_st  = ^gnutls_x509_ava_st;
Pgnutls_x509_crl_iter  = ^gnutls_x509_crl_iter;
Pgnutls_x509_crl_iter_t  = ^gnutls_x509_crl_iter_t;
Pgnutls_x509_crl_reason_flags_t  = ^gnutls_x509_crl_reason_flags_t;
Pgnutls_x509_crl_t  = ^gnutls_x509_crl_t;
Pgnutls_x509_crq_t  = ^gnutls_x509_crq_t;
Pgnutls_x509_crt_flags  = ^gnutls_x509_crt_flags;
Pgnutls_x509_crt_t  = ^gnutls_x509_crt_t;
Pgnutls_x509_dn_st  = ^gnutls_x509_dn_st;
Pgnutls_x509_dn_t  = ^gnutls_x509_dn_t;
Pgnutls_x509_ext_st  = ^gnutls_x509_ext_st;
Pgnutls_x509_name_constraints_t  = ^gnutls_x509_name_constraints_t;
Pgnutls_x509_policy_st  = ^gnutls_x509_policy_st;
Pgnutls_x509_privkey_t  = ^gnutls_x509_privkey_t;
Pgnutls_x509_qualifier_t  = ^gnutls_x509_qualifier_t;
Pgnutls_x509_spki_st  = ^gnutls_x509_spki_st;
Pgnutls_x509_spki_t  = ^gnutls_x509_spki_t;
Pgnutls_x509_tlsfeatures_st  = ^gnutls_x509_tlsfeatures_st;
Pgnutls_x509_tlsfeatures_t  = ^gnutls_x509_tlsfeatures_t;
Pgnutls_x509_trust_list_getissuer_function  = ^gnutls_x509_trust_list_getissuer_function;
Pgnutls_x509_trust_list_iter  = ^gnutls_x509_trust_list_iter;
Pgnutls_x509_trust_list_iter_t  = ^gnutls_x509_trust_list_iter_t;
Pgnutls_x509_trust_list_st  = ^gnutls_x509_trust_list_st;
Pgnutls_x509_trust_list_t  = ^gnutls_x509_trust_list_t;
Plongint  = ^longint;
Psize_t  = ^size_t;
Ptime_t  = ^time_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2003-2016 Free Software Foundation, Inc.
 * Copyright (C) 2015-2016 Red Hat, Inc.
 *
 * Author: Nikos Mavrogiannopoulos
 *
 * This file is part of GnuTLS.
 *
 * The GnuTLS is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>
 *
  }
{ This file contains the types and prototypes for the X.509
 * certificate and CRL handling functions.
  }
{$ifndef GNUTLS_X509_H}
{$define GNUTLS_X509_H}
{$include <gnutls/gnutls.h>}
{ C++ extern C conditionnal removed }
{ Some OIDs usually found in Distinguished names, or
 * in Subject Directory Attribute extensions.
  }

const
  GNUTLS_OID_X520_COUNTRY_NAME = '2.5.4.6';  
  GNUTLS_OID_X520_ORGANIZATION_NAME = '2.5.4.10';  
  GNUTLS_OID_X520_ORGANIZATIONAL_UNIT_NAME = '2.5.4.11';  
  GNUTLS_OID_X520_COMMON_NAME = '2.5.4.3';  
  GNUTLS_OID_X520_LOCALITY_NAME = '2.5.4.7';  
  GNUTLS_OID_X520_STATE_OR_PROVINCE_NAME = '2.5.4.8';  
  GNUTLS_OID_X520_INITIALS = '2.5.4.43';  
  GNUTLS_OID_X520_GENERATION_QUALIFIER = '2.5.4.44';  
  GNUTLS_OID_X520_SURNAME = '2.5.4.4';  
  GNUTLS_OID_X520_GIVEN_NAME = '2.5.4.42';  
  GNUTLS_OID_X520_TITLE = '2.5.4.12';  
  GNUTLS_OID_X520_DN_QUALIFIER = '2.5.4.46';  
  GNUTLS_OID_X520_PSEUDONYM = '2.5.4.65';  
  GNUTLS_OID_X520_POSTALCODE = '2.5.4.17';  
  GNUTLS_OID_X520_NAME = '2.5.4.41';  
  GNUTLS_OID_LDAP_DC = '0.9.2342.19200300.100.1.25';  
  GNUTLS_OID_LDAP_UID = '0.9.2342.19200300.100.1.1';  
{ The following should not be included in DN.
  }
  GNUTLS_OID_PKCS9_EMAIL = '1.2.840.113549.1.9.1';  
  GNUTLS_OID_PKIX_DATE_OF_BIRTH = '1.3.6.1.5.5.7.9.1';  
  GNUTLS_OID_PKIX_PLACE_OF_BIRTH = '1.3.6.1.5.5.7.9.2';  
  GNUTLS_OID_PKIX_GENDER = '1.3.6.1.5.5.7.9.3';  
  GNUTLS_OID_PKIX_COUNTRY_OF_CITIZENSHIP = '1.3.6.1.5.5.7.9.4';  
  GNUTLS_OID_PKIX_COUNTRY_OF_RESIDENCE = '1.3.6.1.5.5.7.9.5';  
{ Key purpose Object Identifiers.
  }
  GNUTLS_KP_TLS_WWW_SERVER = '1.3.6.1.5.5.7.3.1';  
  GNUTLS_KP_TLS_WWW_CLIENT = '1.3.6.1.5.5.7.3.2';  
  GNUTLS_KP_CODE_SIGNING = '1.3.6.1.5.5.7.3.3';  
  GNUTLS_KP_MS_SMART_CARD_LOGON = '1.3.6.1.4.1.311.20.2.2';  
  GNUTLS_KP_EMAIL_PROTECTION = '1.3.6.1.5.5.7.3.4';  
  GNUTLS_KP_TIME_STAMPING = '1.3.6.1.5.5.7.3.8';  
  GNUTLS_KP_OCSP_SIGNING = '1.3.6.1.5.5.7.3.9';  
  GNUTLS_KP_IPSEC_IKE = '1.3.6.1.5.5.7.3.17';  
  GNUTLS_KP_ANY = '2.5.29.37.0';  
  GNUTLS_KP_FLAG_DISALLOW_ANY = 1;  
  GNUTLS_OID_AIA = '1.3.6.1.5.5.7.1.1';  
  GNUTLS_OID_AD_OCSP = '1.3.6.1.5.5.7.48.1';  
  GNUTLS_OID_AD_CAISSUERS = '1.3.6.1.5.5.7.48.2';  
  GNUTLS_FSAN_SET = 0;  
  GNUTLS_FSAN_APPEND = 1;  
  GNUTLS_FSAN_ENCODE_OCTET_STRING = 1 shl 1;  
  GNUTLS_FSAN_ENCODE_UTF8_STRING = 1 shl 2;  
  GNUTLS_X509EXT_OID_SUBJECT_KEY_ID = '2.5.29.14';  
  GNUTLS_X509EXT_OID_KEY_USAGE = '2.5.29.15';  
  GNUTLS_X509EXT_OID_PRIVATE_KEY_USAGE_PERIOD = '2.5.29.16';  
  GNUTLS_X509EXT_OID_SAN = '2.5.29.17';  
  GNUTLS_X509EXT_OID_IAN = '2.5.29.18';  
  GNUTLS_X509EXT_OID_BASIC_CONSTRAINTS = '2.5.29.19';  
  GNUTLS_X509EXT_OID_NAME_CONSTRAINTS = '2.5.29.30';  
  GNUTLS_X509EXT_OID_CRL_DIST_POINTS = '2.5.29.31';  
  GNUTLS_X509EXT_OID_CRT_POLICY = '2.5.29.32';  
  GNUTLS_X509EXT_OID_AUTHORITY_KEY_ID = '2.5.29.35';  
  GNUTLS_X509EXT_OID_EXTENDED_KEY_USAGE = '2.5.29.37';  
  GNUTLS_X509EXT_OID_INHIBIT_ANYPOLICY = '2.5.29.52';  
  GNUTLS_X509EXT_OID_AUTHORITY_INFO_ACCESS = '1.3.6.1.5.5.7.1.1';  
  GNUTLS_X509EXT_OID_PROXY_CRT_INFO = '1.3.6.1.5.5.7.1.14';  
  GNUTLS_X509EXT_OID_TLSFEATURES = '1.3.6.1.5.5.7.1.24';  
  GNUTLS_X509EXT_OID_CT_SCT_V1 = '1.3.6.1.4.1.11129.2.4.2';  
  GNUTLS_X509_OID_POLICY_ANY = '2.5.29.54';  
{ Certificate handling functions.
  }
{*
 * gnutls_certificate_import_flags:
 * @GNUTLS_X509_CRT_LIST_IMPORT_FAIL_IF_EXCEED: Fail if the
 *   certificates in the buffer are more than the space allocated for
 *   certificates. The error code will be %GNUTLS_E_SHORT_MEMORY_BUFFER.
 * @GNUTLS_X509_CRT_LIST_FAIL_IF_UNSORTED: Fail if the certificates
 *   in the buffer are not ordered starting from subject to issuer.
 *   The error code will be %GNUTLS_E_CERTIFICATE_LIST_UNSORTED.
 * @GNUTLS_X509_CRT_LIST_SORT: Sort the certificate chain if unsorted.
 *
 * Enumeration of different certificate import flags.
  }
type
  Pgnutls_certificate_import_flags = ^Tgnutls_certificate_import_flags;
  Tgnutls_certificate_import_flags =  Longint;
  Const
    GNUTLS_X509_CRT_LIST_IMPORT_FAIL_IF_EXCEED = 1;
    GNUTLS_X509_CRT_LIST_FAIL_IF_UNSORTED = 1 shl 1;
    GNUTLS_X509_CRT_LIST_SORT = 1 shl 2;
;

function gnutls_x509_crt_init(cert:Pgnutls_x509_crt_t):longint;cdecl;external;
procedure gnutls_x509_crt_deinit(cert:Tgnutls_x509_crt_t);cdecl;external;
{*
 * gnutls_certificate_import_flags:
 * @GNUTLS_X509_CRT_FLAG_IGNORE_SANITY: Ignore any sanity checks at the
 *   import of the certificate; i.e., ignore checks such as version/field
 *   matching and strict time field checks. Intended to be used for debugging.
 *
 * Enumeration of different certificate flags.
  }
type
  Pgnutls_x509_crt_flags = ^Tgnutls_x509_crt_flags;
  Tgnutls_x509_crt_flags =  Longint;
  Const
    GNUTLS_X509_CRT_FLAG_IGNORE_SANITY = 1;
;

procedure gnutls_x509_crt_set_flags(cert:Tgnutls_x509_crt_t; flags:dword);cdecl;external;
function gnutls_x509_crt_equals(cert1:Tgnutls_x509_crt_t; cert2:Tgnutls_x509_crt_t):dword;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_equals2(cert1:Tgnutls_x509_crt_t; der:Pgnutls_datum_t):dword;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_import(cert:Tgnutls_x509_crt_t; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_list_import2(certs:PPgnutls_x509_crt_t; size:Pdword; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_list_import(certs:Pgnutls_x509_crt_t; cert_max:Pdword; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
{ GNUTLS_PKCS11_OBJ_FLAG_*  }
function gnutls_x509_crt_import_url(crt:Tgnutls_x509_crt_t; url:Pchar; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_list_import_url(certs:PPgnutls_x509_crt_t; size:Pdword; url:Pchar; pin_fn:Tgnutls_pin_callback_t; pin_fn_userdata:pointer; 
           flags:dword):longint;cdecl;external;
function gnutls_x509_crt_export(cert:Tgnutls_x509_crt_t; format:Tgnutls_x509_crt_fmt_t; output_data:pointer; output_data_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crt_export2(cert:Tgnutls_x509_crt_t; format:Tgnutls_x509_crt_fmt_t; out:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crt_get_private_key_usage_period(cert:Tgnutls_x509_crt_t; activation:Ptime_t; expiration:Ptime_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crt_get_issuer_dn(cert:Tgnutls_x509_crt_t; buf:Pchar; buf_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crt_get_issuer_dn2(cert:Tgnutls_x509_crt_t; dn:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crt_get_issuer_dn3(cert:Tgnutls_x509_crt_t; dn:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
function gnutls_x509_crt_get_issuer_dn_oid(cert:Tgnutls_x509_crt_t; indx:dword; oid:pointer; oid_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_get_issuer_dn_by_oid(cert:Tgnutls_x509_crt_t; oid:Pchar; indx:dword; raw_flag:dword; buf:pointer; 
           buf_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crt_get_dn(cert:Tgnutls_x509_crt_t; buf:Pchar; buf_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crt_get_dn2(cert:Tgnutls_x509_crt_t; dn:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crt_get_dn3(cert:Tgnutls_x509_crt_t; dn:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
function gnutls_x509_crt_get_dn_oid(cert:Tgnutls_x509_crt_t; indx:dword; oid:pointer; oid_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_get_dn_by_oid(cert:Tgnutls_x509_crt_t; oid:Pchar; indx:dword; raw_flag:dword; buf:pointer; 
           buf_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_check_hostname(cert:Tgnutls_x509_crt_t; hostname:Pchar):dword;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_check_hostname2(cert:Tgnutls_x509_crt_t; hostname:Pchar; flags:dword):dword;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_check_email(cert:Tgnutls_x509_crt_t; email:Pchar; flags:dword):dword;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_check_ip(cert:Tgnutls_x509_crt_t; ip:Pbyte; ip_size:dword; flags:dword):dword;cdecl;external;
function gnutls_x509_crt_get_signature_algorithm(cert:Tgnutls_x509_crt_t):longint;cdecl;external;
function gnutls_x509_crt_get_signature(cert:Tgnutls_x509_crt_t; sig:Pchar; sizeof_sig:Psize_t):longint;cdecl;external;
function gnutls_x509_crt_get_version(cert:Tgnutls_x509_crt_t):longint;cdecl;external;
function gnutls_x509_crt_get_pk_oid(cert:Tgnutls_x509_crt_t; oid:Pchar; oid_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crt_get_signature_oid(cert:Tgnutls_x509_crt_t; oid:Pchar; oid_size:Psize_t):longint;cdecl;external;
{*
 * gnutls_keyid_flags_t:
 * @GNUTLS_KEYID_USE_SHA1: Use SHA1 as the key ID algorithm (default).
 * @GNUTLS_KEYID_USE_SHA256: Use SHA256 as the key ID algorithm.
 * @GNUTLS_KEYID_USE_SHA512: Use SHA512 as the key ID algorithm.
 * @GNUTLS_KEYID_USE_BEST_KNOWN: Use the best known algorithm to calculate key ID. Using that option will make your program behavior depend on the version of gnutls linked with. That option has a cap of 64-bytes key IDs.
 *
 * Enumeration of different flags for the key ID functions.
 
  }
type
  Pgnutls_keyid_flags_t = ^Tgnutls_keyid_flags_t;
  Tgnutls_keyid_flags_t =  Longint;
  Const
    GNUTLS_KEYID_USE_SHA1 = 0;
    GNUTLS_KEYID_USE_SHA256 = 1 shl 0;
    GNUTLS_KEYID_USE_SHA512 = 1 shl 1;
    GNUTLS_KEYID_USE_BEST_KNOWN = 1 shl 30;
;

function gnutls_x509_crt_get_key_id(crt:Tgnutls_x509_crt_t; flags:dword; output_data:Pbyte; output_data_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crt_set_private_key_usage_period(crt:Tgnutls_x509_crt_t; activation:Ttime_t; expiration:Ttime_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_authority_key_id(cert:Tgnutls_x509_crt_t; id:pointer; id_size:Tsize_t):longint;cdecl;external;
function gnutls_x509_crt_get_authority_key_id(cert:Tgnutls_x509_crt_t; id:pointer; id_size:Psize_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crt_get_authority_key_gn_serial(cert:Tgnutls_x509_crt_t; seq:dword; alt:pointer; alt_size:Psize_t; alt_type:Pdword; 
           serial:pointer; serial_size:Psize_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crt_get_subject_key_id(cert:Tgnutls_x509_crt_t; ret:pointer; ret_size:Psize_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crt_get_subject_unique_id(crt:Tgnutls_x509_crt_t; buf:Pchar; buf_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crt_get_issuer_unique_id(crt:Tgnutls_x509_crt_t; buf:Pchar; buf_size:Psize_t):longint;cdecl;external;
procedure gnutls_x509_crt_set_pin_function(crt:Tgnutls_x509_crt_t; fn:Tgnutls_pin_callback_t; userdata:pointer);cdecl;external;
{*
   * gnutls_info_access_what_t:
   * @GNUTLS_IA_ACCESSMETHOD_OID: Get accessMethod OID.
   * @GNUTLS_IA_ACCESSLOCATION_GENERALNAME_TYPE: Get accessLocation name type.
   * @GNUTLS_IA_URI: Get accessLocation URI value.
   * @GNUTLS_IA_OCSP_URI: get accessLocation URI value for OCSP.
   * @GNUTLS_IA_CAISSUERS_URI: get accessLocation URI value for caIssuers.
   *
   * Enumeration of types for the @what parameter of
   * gnutls_x509_crt_get_authority_info_access().
    }
{ use 100-108 for the generalName types, populate as needed  }
{ quick-access variants that match both OID and name type.  }
type
  Pgnutls_info_access_what_t = ^Tgnutls_info_access_what_t;
  Tgnutls_info_access_what_t =  Longint;
  Const
    GNUTLS_IA_ACCESSMETHOD_OID = 1;
    GNUTLS_IA_ACCESSLOCATION_GENERALNAME_TYPE = 2;
    GNUTLS_IA_URI = 106;
    GNUTLS_IA_UNKNOWN = 10000;
    GNUTLS_IA_OCSP_URI = 10006;
    GNUTLS_IA_CAISSUERS_URI = 10106;
;

function gnutls_x509_crt_get_authority_info_access(crt:Tgnutls_x509_crt_t; seq:dword; what:longint; data:Pgnutls_datum_t; critical:Pdword):longint;cdecl;external;
type
  Pgnutls_x509_name_constraints_t = ^Tgnutls_x509_name_constraints_t;
  Tgnutls_x509_name_constraints_t = Pgnutls_name_constraints_st;
(* Const before type ignored *)

function gnutls_x509_name_constraints_check(nc:Tgnutls_x509_name_constraints_t; _type:Tgnutls_x509_subject_alt_name_t; name:Pgnutls_datum_t):dword;cdecl;external;
function gnutls_x509_name_constraints_check_crt(nc:Tgnutls_x509_name_constraints_t; _type:Tgnutls_x509_subject_alt_name_t; crt:Tgnutls_x509_crt_t):dword;cdecl;external;
function gnutls_x509_name_constraints_init(nc:Pgnutls_x509_name_constraints_t):longint;cdecl;external;
procedure gnutls_x509_name_constraints_deinit(nc:Tgnutls_x509_name_constraints_t);cdecl;external;
const
  GNUTLS_EXT_FLAG_APPEND = 1;  
  GNUTLS_NAME_CONSTRAINTS_FLAG_APPEND = GNUTLS_EXT_FLAG_APPEND;  

function gnutls_x509_crt_get_name_constraints(crt:Tgnutls_x509_crt_t; nc:Tgnutls_x509_name_constraints_t; flags:dword; critical:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_name_constraints_add_permitted(nc:Tgnutls_x509_name_constraints_t; _type:Tgnutls_x509_subject_alt_name_t; name:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_name_constraints_add_excluded(nc:Tgnutls_x509_name_constraints_t; _type:Tgnutls_x509_subject_alt_name_t; name:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crt_set_name_constraints(crt:Tgnutls_x509_crt_t; nc:Tgnutls_x509_name_constraints_t; critical:dword):longint;cdecl;external;
function gnutls_x509_name_constraints_get_permitted(nc:Tgnutls_x509_name_constraints_t; idx:dword; _type:Pdword; name:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_name_constraints_get_excluded(nc:Tgnutls_x509_name_constraints_t; idx:dword; _type:Pdword; name:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_cidr_to_rfc5280(cidr:Pchar; cidr_rfc5280:Pgnutls_datum_t):longint;cdecl;external;
const
  GNUTLS_CRL_REASON_SUPERSEEDED = GNUTLS_CRL_REASON_SUPERSEDED;  
{*
   * gnutls_x509_crl_reason_flags_t:
   * @GNUTLS_CRL_REASON_PRIVILEGE_WITHDRAWN: The privileges were withdrawn from the owner.
   * @GNUTLS_CRL_REASON_CERTIFICATE_HOLD: The certificate is on hold.
   * @GNUTLS_CRL_REASON_CESSATION_OF_OPERATION: The end-entity is no longer operating.
   * @GNUTLS_CRL_REASON_SUPERSEDED: There is a newer certificate of the owner.
   * @GNUTLS_CRL_REASON_AFFILIATION_CHANGED: The end-entity affiliation has changed.
   * @GNUTLS_CRL_REASON_CA_COMPROMISE: The CA was compromised.
   * @GNUTLS_CRL_REASON_KEY_COMPROMISE: The certificate's key was compromised.
   * @GNUTLS_CRL_REASON_UNUSED: The key was never used.
   * @GNUTLS_CRL_REASON_AA_COMPROMISE: AA compromised.
   *
   * Enumeration of types for the CRL revocation reasons. 
    }
type
  Pgnutls_x509_crl_reason_flags_t = ^Tgnutls_x509_crl_reason_flags_t;
  Tgnutls_x509_crl_reason_flags_t =  Longint;
  Const
    GNUTLS_CRL_REASON_UNSPECIFIED = 0;
    GNUTLS_CRL_REASON_PRIVILEGE_WITHDRAWN = 1;
    GNUTLS_CRL_REASON_CERTIFICATE_HOLD = 2;
    GNUTLS_CRL_REASON_CESSATION_OF_OPERATION = 4;
    GNUTLS_CRL_REASON_SUPERSEDED = 8;
    GNUTLS_CRL_REASON_AFFILIATION_CHANGED = 16;
    GNUTLS_CRL_REASON_CA_COMPROMISE = 32;
    GNUTLS_CRL_REASON_KEY_COMPROMISE = 64;
    GNUTLS_CRL_REASON_UNUSED = 128;
    GNUTLS_CRL_REASON_AA_COMPROMISE = 32768;
;

function gnutls_x509_crt_get_crl_dist_points(cert:Tgnutls_x509_crt_t; seq:dword; ret:pointer; ret_size:Psize_t; reason_flags:Pdword; 
           critical:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_crl_dist_points2(crt:Tgnutls_x509_crt_t; _type:Tgnutls_x509_subject_alt_name_t; data:pointer; data_size:dword; reason_flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_crl_dist_points(crt:Tgnutls_x509_crt_t; _type:Tgnutls_x509_subject_alt_name_t; data_string:pointer; reason_flags:dword):longint;cdecl;external;
function gnutls_x509_crt_cpy_crl_dist_points(dst:Tgnutls_x509_crt_t; src:Tgnutls_x509_crt_t):longint;cdecl;external;
function gnutls_x509_crl_sign(crl:Tgnutls_x509_crl_t; issuer:Tgnutls_x509_crt_t; issuer_key:Tgnutls_x509_privkey_t):longint;cdecl;external;
function gnutls_x509_crl_sign2(crl:Tgnutls_x509_crl_t; issuer:Tgnutls_x509_crt_t; issuer_key:Tgnutls_x509_privkey_t; dig:Tgnutls_digest_algorithm_t; flags:dword):longint;cdecl;external;
function gnutls_x509_crt_get_activation_time(cert:Tgnutls_x509_crt_t):Ttime_t;cdecl;external;
{ This macro is deprecated and defunc; do not use  }
{ was #define dname def_expr }
function GNUTLS_X509_NO_WELL_DEFINED_EXPIRATION : Ttime_t;  

function gnutls_x509_crt_get_expiration_time(cert:Tgnutls_x509_crt_t):Ttime_t;cdecl;external;
function gnutls_x509_crt_get_serial(cert:Tgnutls_x509_crt_t; result:pointer; result_size:Psize_t):longint;cdecl;external;
type
  Pgnutls_x509_spki_t = ^Tgnutls_x509_spki_t;
  Tgnutls_x509_spki_t = Pgnutls_x509_spki_st;

function gnutls_x509_spki_init(spki:Pgnutls_x509_spki_t):longint;cdecl;external;
procedure gnutls_x509_spki_deinit(spki:Tgnutls_x509_spki_t);cdecl;external;
function gnutls_x509_spki_get_rsa_pss_params(spki:Tgnutls_x509_spki_t; dig:Pgnutls_digest_algorithm_t; salt_size:Pdword):longint;cdecl;external;
procedure gnutls_x509_spki_set_rsa_pss_params(spki:Tgnutls_x509_spki_t; dig:Tgnutls_digest_algorithm_t; salt_size:dword);cdecl;external;
function gnutls_x509_crt_get_pk_algorithm(cert:Tgnutls_x509_crt_t; bits:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_spki(crt:Tgnutls_x509_crt_t; spki:Tgnutls_x509_spki_t; flags:dword):longint;cdecl;external;
function gnutls_x509_crt_get_spki(cert:Tgnutls_x509_crt_t; spki:Tgnutls_x509_spki_t; flags:dword):longint;cdecl;external;
function gnutls_x509_crt_get_pk_rsa_raw(crt:Tgnutls_x509_crt_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crt_get_pk_dsa_raw(crt:Tgnutls_x509_crt_t; p:Pgnutls_datum_t; q:Pgnutls_datum_t; g:Pgnutls_datum_t; y:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crt_get_pk_ecc_raw(crt:Tgnutls_x509_crt_t; curve:Pgnutls_ecc_curve_t; x:Pgnutls_datum_t; y:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crt_get_pk_gost_raw(crt:Tgnutls_x509_crt_t; curve:Pgnutls_ecc_curve_t; digest:Pgnutls_digest_algorithm_t; paramset:Pgnutls_gost_paramset_t; x:Pgnutls_datum_t; 
           y:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crt_get_subject_alt_name(cert:Tgnutls_x509_crt_t; seq:dword; san:pointer; san_size:Psize_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crt_get_subject_alt_name2(cert:Tgnutls_x509_crt_t; seq:dword; san:pointer; san_size:Psize_t; san_type:Pdword; 
           critical:Pdword):longint;cdecl;external;
function gnutls_x509_crt_get_subject_alt_othername_oid(cert:Tgnutls_x509_crt_t; seq:dword; oid:pointer; oid_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crt_get_issuer_alt_name(cert:Tgnutls_x509_crt_t; seq:dword; ian:pointer; ian_size:Psize_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crt_get_issuer_alt_name2(cert:Tgnutls_x509_crt_t; seq:dword; ian:pointer; ian_size:Psize_t; ian_type:Pdword; 
           critical:Pdword):longint;cdecl;external;
function gnutls_x509_crt_get_issuer_alt_othername_oid(cert:Tgnutls_x509_crt_t; seq:dword; ret:pointer; ret_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crt_get_ca_status(cert:Tgnutls_x509_crt_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crt_get_basic_constraints(cert:Tgnutls_x509_crt_t; critical:Pdword; ca:Pdword; pathlen:Plongint):longint;cdecl;external;
{ The key_usage flags are defined in gnutls.h. They are the
 * GNUTLS_KEY_* definitions.
  }
function gnutls_x509_crt_get_key_usage(cert:Tgnutls_x509_crt_t; key_usage:Pdword; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crt_set_key_usage(crt:Tgnutls_x509_crt_t; usage:dword):longint;cdecl;external;
function gnutls_x509_crt_set_authority_info_access(crt:Tgnutls_x509_crt_t; what:longint; data:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crt_get_inhibit_anypolicy(cert:Tgnutls_x509_crt_t; skipcerts:Pdword; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crt_set_inhibit_anypolicy(crt:Tgnutls_x509_crt_t; skipcerts:dword):longint;cdecl;external;
function gnutls_x509_crt_get_proxy(cert:Tgnutls_x509_crt_t; critical:Pdword; pathlen:Plongint; policyLanguage:PPchar; policy:PPchar; 
           sizeof_policy:Psize_t):longint;cdecl;external;
type
  Pgnutls_x509_tlsfeatures_t = ^Tgnutls_x509_tlsfeatures_t;
  Tgnutls_x509_tlsfeatures_t = Pgnutls_x509_tlsfeatures_st;

function gnutls_x509_tlsfeatures_init(features:Pgnutls_x509_tlsfeatures_t):longint;cdecl;external;
procedure gnutls_x509_tlsfeatures_deinit(para1:Tgnutls_x509_tlsfeatures_t);cdecl;external;
function gnutls_x509_tlsfeatures_get(f:Tgnutls_x509_tlsfeatures_t; idx:dword; feature:Pdword):longint;cdecl;external;
function gnutls_x509_crt_set_tlsfeatures(crt:Tgnutls_x509_crt_t; features:Tgnutls_x509_tlsfeatures_t):longint;cdecl;external;
function gnutls_x509_crt_get_tlsfeatures(cert:Tgnutls_x509_crt_t; features:Tgnutls_x509_tlsfeatures_t; flags:dword; critical:Pdword):longint;cdecl;external;
function gnutls_x509_tlsfeatures_check_crt(feat:Tgnutls_x509_tlsfeatures_t; crt:Tgnutls_x509_crt_t):dword;cdecl;external;
const
  GNUTLS_MAX_QUALIFIERS = 8;  
{*
   * gnutls_x509_qualifier_t:
   * @GNUTLS_X509_QUALIFIER_UNKNOWN: Unknown qualifier.
   * @GNUTLS_X509_QUALIFIER_URI: A URL
   * @GNUTLS_X509_QUALIFIER_NOICE: A text notice.
   *
   * Enumeration of types for the X.509 qualifiers, of the certificate policy extension. 
    }
type
  Pgnutls_x509_qualifier_t = ^Tgnutls_x509_qualifier_t;
  Tgnutls_x509_qualifier_t =  Longint;
  Const
    GNUTLS_X509_QUALIFIER_UNKNOWN = 0;
    GNUTLS_X509_QUALIFIER_URI = 1;
    GNUTLS_X509_QUALIFIER_NOTICE = 2;
;
type
  Pgnutls_x509_policy_st = ^Tgnutls_x509_policy_st;
  Tgnutls_x509_policy_st = record
      oid : Pchar;
      qualifiers : dword;
      qualifier : array[0..(GNUTLS_MAX_QUALIFIERS)-1] of record
          _type : Tgnutls_x509_qualifier_t;
          data : Pchar;
          size : dword;
        end;
    end;

procedure gnutls_x509_policy_release(policy:Pgnutls_x509_policy_st);cdecl;external;
function gnutls_x509_crt_get_policy(crt:Tgnutls_x509_crt_t; indx:dword; policy:Pgnutls_x509_policy_st; critical:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_policy(crt:Tgnutls_x509_crt_t; policy:Pgnutls_x509_policy_st; critical:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_dn_oid_known(oid:Pchar):longint;cdecl;external;
const
  GNUTLS_X509_DN_OID_RETURN_OID = 1;  
(* Const before type ignored *)
(* Const before type ignored *)

function gnutls_x509_dn_oid_name(oid:Pchar; flags:dword):Pchar;cdecl;external;
{ Read extensions by OID.  }
function gnutls_x509_crt_get_extension_oid(cert:Tgnutls_x509_crt_t; indx:dword; oid:pointer; oid_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_get_extension_by_oid(cert:Tgnutls_x509_crt_t; oid:Pchar; indx:dword; buf:pointer; buf_size:Psize_t; 
           critical:Pdword):longint;cdecl;external;
function gnutls_x509_crq_get_signature_algorithm(crq:Tgnutls_x509_crq_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crq_get_extension_by_oid2(crq:Tgnutls_x509_crq_t; oid:Pchar; indx:dword; output:Pgnutls_datum_t; critical:Pdword):longint;cdecl;external;
{ Read extensions by sequence number.  }
function gnutls_x509_crt_get_extension_info(cert:Tgnutls_x509_crt_t; indx:dword; oid:pointer; oid_size:Psize_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crt_get_extension_data(cert:Tgnutls_x509_crt_t; indx:dword; data:pointer; sizeof_data:Psize_t):longint;cdecl;external;
function gnutls_x509_crt_get_extension_data2(cert:Tgnutls_x509_crt_t; indx:dword; data:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crt_set_extension_by_oid(crt:Tgnutls_x509_crt_t; oid:Pchar; buf:pointer; sizeof_buf:Tsize_t; critical:dword):longint;cdecl;external;
{ X.509 Certificate writing.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crt_set_dn(crt:Tgnutls_x509_crt_t; dn:Pchar; err:PPchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crt_set_dn_by_oid(crt:Tgnutls_x509_crt_t; oid:Pchar; raw_flag:dword; name:pointer; sizeof_name:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crt_set_issuer_dn_by_oid(crt:Tgnutls_x509_crt_t; oid:Pchar; raw_flag:dword; name:pointer; sizeof_name:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crt_set_issuer_dn(crt:Tgnutls_x509_crt_t; dn:Pchar; err:PPchar):longint;cdecl;external;
function gnutls_x509_crt_set_version(crt:Tgnutls_x509_crt_t; version:dword):longint;cdecl;external;
function gnutls_x509_crt_set_key(crt:Tgnutls_x509_crt_t; key:Tgnutls_x509_privkey_t):longint;cdecl;external;
function gnutls_x509_crt_set_ca_status(crt:Tgnutls_x509_crt_t; ca:dword):longint;cdecl;external;
function gnutls_x509_crt_set_basic_constraints(crt:Tgnutls_x509_crt_t; ca:dword; pathLenConstraint:longint):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_subject_unique_id(cert:Tgnutls_x509_crt_t; id:pointer; id_size:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_issuer_unique_id(cert:Tgnutls_x509_crt_t; id:pointer; id_size:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_subject_alternative_name(crt:Tgnutls_x509_crt_t; _type:Tgnutls_x509_subject_alt_name_t; data_string:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_subject_alt_name(crt:Tgnutls_x509_crt_t; _type:Tgnutls_x509_subject_alt_name_t; data:pointer; data_size:dword; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crt_set_subject_alt_othername(crt:Tgnutls_x509_crt_t; oid:Pchar; data:pointer; data_size:dword; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_issuer_alt_name(crt:Tgnutls_x509_crt_t; _type:Tgnutls_x509_subject_alt_name_t; data:pointer; data_size:dword; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crt_set_issuer_alt_othername(crt:Tgnutls_x509_crt_t; oid:Pchar; data:pointer; data_size:dword; flags:dword):longint;cdecl;external;
function gnutls_x509_crt_sign(crt:Tgnutls_x509_crt_t; issuer:Tgnutls_x509_crt_t; issuer_key:Tgnutls_x509_privkey_t):longint;cdecl;external;
function gnutls_x509_crt_sign2(crt:Tgnutls_x509_crt_t; issuer:Tgnutls_x509_crt_t; issuer_key:Tgnutls_x509_privkey_t; dig:Tgnutls_digest_algorithm_t; flags:dword):longint;cdecl;external;
function gnutls_x509_crt_set_activation_time(cert:Tgnutls_x509_crt_t; act_time:Ttime_t):longint;cdecl;external;
function gnutls_x509_crt_set_expiration_time(cert:Tgnutls_x509_crt_t; exp_time:Ttime_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_serial(cert:Tgnutls_x509_crt_t; serial:pointer; serial_size:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_subject_key_id(cert:Tgnutls_x509_crt_t; id:pointer; id_size:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_proxy_dn(crt:Tgnutls_x509_crt_t; eecrt:Tgnutls_x509_crt_t; raw_flag:dword; name:pointer; sizeof_name:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crt_set_proxy(crt:Tgnutls_x509_crt_t; pathLenConstraint:longint; policyLanguage:Pchar; policy:Pchar; sizeof_policy:Tsize_t):longint;cdecl;external;
function gnutls_x509_crt_print(cert:Tgnutls_x509_crt_t; format:Tgnutls_certificate_print_formats_t; out:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crl_print(crl:Tgnutls_x509_crl_t; format:Tgnutls_certificate_print_formats_t; out:Pgnutls_datum_t):longint;cdecl;external;
{ Access to internal Certificate fields.
	  }
function gnutls_x509_crt_get_raw_issuer_dn(cert:Tgnutls_x509_crt_t; start:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crt_get_raw_dn(cert:Tgnutls_x509_crt_t; start:Pgnutls_datum_t):longint;cdecl;external;
{ RDN handling.
  }
(* Const before type ignored *)
function gnutls_x509_rdn_get(idn:Pgnutls_datum_t; buf:Pchar; sizeof_buf:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_rdn_get2(idn:Pgnutls_datum_t; str:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_rdn_get_oid(idn:Pgnutls_datum_t; indx:dword; buf:pointer; sizeof_buf:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_rdn_get_by_oid(idn:Pgnutls_datum_t; oid:Pchar; indx:dword; raw_flag:dword; buf:pointer; 
           sizeof_buf:Psize_t):longint;cdecl;external;
type
  Pgnutls_x509_dn_t = ^Tgnutls_x509_dn_t;
  Tgnutls_x509_dn_t = Pgnutls_x509_dn_st;

  Pgnutls_x509_ava_st = ^Tgnutls_x509_ava_st;
  Tgnutls_x509_ava_st = record
      oid : Tgnutls_datum_t;
      value : Tgnutls_datum_t;
      value_tag : dword;
    end;

function gnutls_x509_crt_get_subject(cert:Tgnutls_x509_crt_t; dn:Pgnutls_x509_dn_t):longint;cdecl;external;
function gnutls_x509_crt_get_issuer(cert:Tgnutls_x509_crt_t; dn:Pgnutls_x509_dn_t):longint;cdecl;external;
function gnutls_x509_dn_get_rdn_ava(dn:Tgnutls_x509_dn_t; irdn:longint; iava:longint; ava:Pgnutls_x509_ava_st):longint;cdecl;external;
function gnutls_x509_dn_get_str(dn:Tgnutls_x509_dn_t; str:Pgnutls_datum_t):longint;cdecl;external;
const
  GNUTLS_X509_DN_FLAG_COMPAT = 1;  

function gnutls_x509_dn_get_str2(dn:Tgnutls_x509_dn_t; str:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_dn_set_str(dn:Tgnutls_x509_dn_t; str:Pchar; err:PPchar):longint;cdecl;external;
function gnutls_x509_dn_init(dn:Pgnutls_x509_dn_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_dn_import(dn:Tgnutls_x509_dn_t; data:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_dn_export(dn:Tgnutls_x509_dn_t; format:Tgnutls_x509_crt_fmt_t; output_data:pointer; output_data_size:Psize_t):longint;cdecl;external;
function gnutls_x509_dn_export2(dn:Tgnutls_x509_dn_t; format:Tgnutls_x509_crt_fmt_t; out:Pgnutls_datum_t):longint;cdecl;external;
procedure gnutls_x509_dn_deinit(dn:Tgnutls_x509_dn_t);cdecl;external;
{ CRL handling functions.
  }
function gnutls_x509_crl_init(crl:Pgnutls_x509_crl_t):longint;cdecl;external;
procedure gnutls_x509_crl_deinit(crl:Tgnutls_x509_crl_t);cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crl_import(crl:Tgnutls_x509_crl_t; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
function gnutls_x509_crl_export(crl:Tgnutls_x509_crl_t; format:Tgnutls_x509_crt_fmt_t; output_data:pointer; output_data_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crl_export2(crl:Tgnutls_x509_crl_t; format:Tgnutls_x509_crt_fmt_t; out:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crl_get_raw_issuer_dn(crl:Tgnutls_x509_crl_t; dn:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crl_get_issuer_dn(crl:Tgnutls_x509_crl_t; buf:Pchar; sizeof_buf:Psize_t):longint;cdecl;external;
function gnutls_x509_crl_get_issuer_dn2(crl:Tgnutls_x509_crl_t; dn:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crl_get_issuer_dn3(crl:Tgnutls_x509_crl_t; dn:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crl_get_issuer_dn_by_oid(crl:Tgnutls_x509_crl_t; oid:Pchar; indx:dword; raw_flag:dword; buf:pointer; 
           sizeof_buf:Psize_t):longint;cdecl;external;
function gnutls_x509_crl_get_dn_oid(crl:Tgnutls_x509_crl_t; indx:dword; oid:pointer; sizeof_oid:Psize_t):longint;cdecl;external;
function gnutls_x509_crl_get_signature_algorithm(crl:Tgnutls_x509_crl_t):longint;cdecl;external;
function gnutls_x509_crl_get_signature(crl:Tgnutls_x509_crl_t; sig:Pchar; sizeof_sig:Psize_t):longint;cdecl;external;
function gnutls_x509_crl_get_version(crl:Tgnutls_x509_crl_t):longint;cdecl;external;
function gnutls_x509_crl_get_signature_oid(crl:Tgnutls_x509_crl_t; oid:Pchar; oid_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crl_get_this_update(crl:Tgnutls_x509_crl_t):Ttime_t;cdecl;external;
function gnutls_x509_crl_get_next_update(crl:Tgnutls_x509_crl_t):Ttime_t;cdecl;external;
function gnutls_x509_crl_get_crt_count(crl:Tgnutls_x509_crl_t):longint;cdecl;external;
function gnutls_x509_crl_get_crt_serial(crl:Tgnutls_x509_crl_t; indx:dword; serial:Pbyte; serial_size:Psize_t; t:Ptime_t):longint;cdecl;external;
type
  Pgnutls_x509_crl_iter_t = ^Tgnutls_x509_crl_iter_t;
  Tgnutls_x509_crl_iter_t = Pgnutls_x509_crl_iter;

function gnutls_x509_crl_iter_crt_serial(crl:Tgnutls_x509_crl_t; para2:Pgnutls_x509_crl_iter_t; serial:Pbyte; serial_size:Psize_t; t:Ptime_t):longint;cdecl;external;
procedure gnutls_x509_crl_iter_deinit(para1:Tgnutls_x509_crl_iter_t);cdecl;external;
const
  gnutls_x509_crl_get_certificate_count = gnutls_x509_crl_get_crt_count;  
  gnutls_x509_crl_get_certificate = gnutls_x509_crl_get_crt_serial;  

function gnutls_x509_crl_check_issuer(crl:Tgnutls_x509_crl_t; issuer:Tgnutls_x509_crt_t):dword;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crl_list_import2(crls:PPgnutls_x509_crl_t; size:Pdword; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crl_list_import(crls:Pgnutls_x509_crl_t; crl_max:Pdword; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; flags:dword):longint;cdecl;external;
{ CRL writing.
  }
function gnutls_x509_crl_set_version(crl:Tgnutls_x509_crl_t; version:dword):longint;cdecl;external;
function gnutls_x509_crl_set_this_update(crl:Tgnutls_x509_crl_t; act_time:Ttime_t):longint;cdecl;external;
function gnutls_x509_crl_set_next_update(crl:Tgnutls_x509_crl_t; exp_time:Ttime_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crl_set_crt_serial(crl:Tgnutls_x509_crl_t; serial:pointer; serial_size:Tsize_t; revocation_time:Ttime_t):longint;cdecl;external;
function gnutls_x509_crl_set_crt(crl:Tgnutls_x509_crl_t; crt:Tgnutls_x509_crt_t; revocation_time:Ttime_t):longint;cdecl;external;
function gnutls_x509_crl_get_authority_key_id(crl:Tgnutls_x509_crl_t; id:pointer; id_size:Psize_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crl_get_authority_key_gn_serial(crl:Tgnutls_x509_crl_t; seq:dword; alt:pointer; alt_size:Psize_t; alt_type:Pdword; 
           serial:pointer; serial_size:Psize_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crl_get_number(crl:Tgnutls_x509_crl_t; ret:pointer; ret_size:Psize_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crl_get_extension_oid(crl:Tgnutls_x509_crl_t; indx:dword; oid:pointer; sizeof_oid:Psize_t):longint;cdecl;external;
function gnutls_x509_crl_get_extension_info(crl:Tgnutls_x509_crl_t; indx:dword; oid:pointer; sizeof_oid:Psize_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crl_get_extension_data(crl:Tgnutls_x509_crl_t; indx:dword; data:pointer; sizeof_data:Psize_t):longint;cdecl;external;
function gnutls_x509_crl_get_extension_data2(crl:Tgnutls_x509_crl_t; indx:dword; data:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crl_set_authority_key_id(crl:Tgnutls_x509_crl_t; id:pointer; id_size:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crl_set_number(crl:Tgnutls_x509_crl_t; nr:pointer; nr_size:Tsize_t):longint;cdecl;external;
{ X.509 Certificate verification functions.
  }
{*
 * gnutls_certificate_verify_flags:
 * @GNUTLS_VERIFY_DISABLE_CA_SIGN: If set a signer does not have to be
 *   a certificate authority. This flag should normally be disabled,
 *   unless you know what this means.
 * @GNUTLS_VERIFY_DISABLE_TRUSTED_TIME_CHECKS: If set a signer in the trusted
 *   list is never checked for expiration or activation.
 * @GNUTLS_VERIFY_DO_NOT_ALLOW_X509_V1_CA_CRT: Do not allow trusted CA
 *   certificates that have version 1.  This option is to be used
 *   to deprecate all certificates of version 1.
 * @GNUTLS_VERIFY_DO_NOT_ALLOW_SAME: If a certificate is not signed by
 *   anyone trusted but exists in the trusted CA list do not treat it
 *   as trusted.
 * @GNUTLS_VERIFY_ALLOW_UNSORTED_CHAIN: A certificate chain is tolerated
 *   if unsorted (the case with many TLS servers out there). This is the
 *   default since GnuTLS 3.1.4.
 * @GNUTLS_VERIFY_DO_NOT_ALLOW_UNSORTED_CHAIN: Do not tolerate an unsorted
 *   certificate chain.
 * @GNUTLS_VERIFY_ALLOW_ANY_X509_V1_CA_CRT: Allow CA certificates that
 *   have version 1 (both root and intermediate). This might be
 *   dangerous since those haven't the basicConstraints
 *   extension. 
 * @GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD2: Allow certificates to be signed
 *   using the broken MD2 algorithm.
 * @GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD5: Allow certificates to be signed
 *   using the broken MD5 algorithm.
 * @GNUTLS_VERIFY_ALLOW_SIGN_WITH_SHA1: Allow certificates to be signed
 *   using the broken SHA1 hash algorithm.
 * @GNUTLS_VERIFY_ALLOW_BROKEN: Allow certificates to be signed
 *   using any broken algorithm.
 * @GNUTLS_VERIFY_DISABLE_TIME_CHECKS: Disable checking of activation
 *   and expiration validity periods of certificate chains. Don't set
 *   this unless you understand the security implications.
 * @GNUTLS_VERIFY_DISABLE_CRL_CHECKS: Disable checking for validity
 *   using certificate revocation lists or the available OCSP data.
 * @GNUTLS_VERIFY_DO_NOT_ALLOW_WILDCARDS: When including a hostname
 *   check in the verification, do not consider any wildcards.
 * @GNUTLS_VERIFY_DO_NOT_ALLOW_IP_MATCHES: When verifying a hostname
 *   prevent textual IP addresses from matching IP addresses in the
 *   certificate. Treat the input only as a DNS name.
 * @GNUTLS_VERIFY_USE_TLS1_RSA: This indicates that a (raw) RSA signature is provided
 *   as in the TLS 1.0 protocol. Not all functions accept this flag.
 * @GNUTLS_VERIFY_IGNORE_UNKNOWN_CRIT_EXTENSIONS: This signals the verification
 *   process, not to fail on unknown critical extensions.
 * @GNUTLS_VERIFY_RSA_PSS_FIXED_SALT_LENGTH: Disallow RSA-PSS signatures made
 *   with mismatching salt length with digest length, as mandated in RFC 8446
 *   4.2.3.
 *
 * Enumeration of different certificate verify flags. Additional
 * verification profiles can be set using GNUTLS_PROFILE_TO_VFLAGS()
 * and %gnutls_certificate_verification_profiles_t.
  }
{ cannot exceed 2^24 due to GNUTLS_PROFILE_TO_VFLAGS()  }
type
  Pgnutls_certificate_verify_flags = ^Tgnutls_certificate_verify_flags;
  Tgnutls_certificate_verify_flags =  Longint;
  Const
    GNUTLS_VERIFY_DISABLE_CA_SIGN = 1 shl 0;
    GNUTLS_VERIFY_DO_NOT_ALLOW_IP_MATCHES = 1 shl 1;
    GNUTLS_VERIFY_DO_NOT_ALLOW_SAME = 1 shl 2;
    GNUTLS_VERIFY_ALLOW_ANY_X509_V1_CA_CRT = 1 shl 3;
    GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD2 = 1 shl 4;
    GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD5 = 1 shl 5;
    GNUTLS_VERIFY_DISABLE_TIME_CHECKS = 1 shl 6;
    GNUTLS_VERIFY_DISABLE_TRUSTED_TIME_CHECKS = 1 shl 7;
    GNUTLS_VERIFY_DO_NOT_ALLOW_X509_V1_CA_CRT = 1 shl 8;
    GNUTLS_VERIFY_DISABLE_CRL_CHECKS = 1 shl 9;
    GNUTLS_VERIFY_ALLOW_UNSORTED_CHAIN = 1 shl 10;
    GNUTLS_VERIFY_DO_NOT_ALLOW_UNSORTED_CHAIN = 1 shl 11;
    GNUTLS_VERIFY_DO_NOT_ALLOW_WILDCARDS = 1 shl 12;
    GNUTLS_VERIFY_USE_TLS1_RSA = 1 shl 13;
    GNUTLS_VERIFY_IGNORE_UNKNOWN_CRIT_EXTENSIONS = 1 shl 14;
    GNUTLS_VERIFY_ALLOW_SIGN_WITH_SHA1 = 1 shl 15;
    GNUTLS_VERIFY_RSA_PSS_FIXED_SALT_LENGTH = 1 shl 16;
;
  GNUTLS_VERIFY_ALLOW_BROKEN = GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD2 or GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD5;  
{*
 * gnutls_certificate_verification_profiles_t:
 * @GNUTLS_PROFILE_UNKNOWN: An invalid/unknown profile.
 * @GNUTLS_PROFILE_VERY_WEAK: A verification profile that
 *  corresponds to @GNUTLS_SEC_PARAM_VERY_WEAK (64 bits)
 * @GNUTLS_PROFILE_LOW: A verification profile that
 *  corresponds to @GNUTLS_SEC_PARAM_LOW (80 bits)
 * @GNUTLS_PROFILE_LEGACY: A verification profile that
 *  corresponds to @GNUTLS_SEC_PARAM_LEGACY (96 bits)
 * @GNUTLS_PROFILE_MEDIUM: A verification profile that
 *  corresponds to @GNUTLS_SEC_PARAM_MEDIUM (112 bits)
 * @GNUTLS_PROFILE_HIGH: A verification profile that
 *  corresponds to @GNUTLS_SEC_PARAM_HIGH (128 bits)
 * @GNUTLS_PROFILE_ULTRA: A verification profile that
 *  corresponds to @GNUTLS_SEC_PARAM_ULTRA (192 bits)
 * @GNUTLS_PROFILE_FUTURE: A verification profile that
 *  corresponds to @GNUTLS_SEC_PARAM_FUTURE (256 bits)
 * @GNUTLS_PROFILE_SUITEB128: A verification profile that
 *  applies the SUITEB128 rules
 * @GNUTLS_PROFILE_SUITEB192: A verification profile that
 *  applies the SUITEB192 rules
 *
 * Enumeration of different certificate verification profiles.
  }
{GNUTLS_PROFILE_MAX=255  }
type
  Pgnutls_certificate_verification_profiles_t = ^Tgnutls_certificate_verification_profiles_t;
  Tgnutls_certificate_verification_profiles_t =  Longint;
  Const
    GNUTLS_PROFILE_UNKNOWN = 0;
    GNUTLS_PROFILE_VERY_WEAK = 1;
    GNUTLS_PROFILE_LOW = 2;
    GNUTLS_PROFILE_LEGACY = 4;
    GNUTLS_PROFILE_MEDIUM = 5;
    GNUTLS_PROFILE_HIGH = 6;
    GNUTLS_PROFILE_ULTRA = 7;
    GNUTLS_PROFILE_FUTURE = 8;
    GNUTLS_PROFILE_SUITEB128 = 32;
    GNUTLS_PROFILE_SUITEB192 = 33;
;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GNUTLS_PROFILE_TO_VFLAGS(x : longint) : longint;

const
  GNUTLS_VFLAGS_PROFILE_MASK = $ff000000;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GNUTLS_VFLAGS_TO_PROFILE(x : longint) : longint;

(* Const before type ignored *)
function gnutls_certificate_verification_profile_get_name(id:Tgnutls_certificate_verification_profiles_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_verification_profile_get_id(name:Pchar):Tgnutls_certificate_verification_profiles_t;cdecl;external;
function gnutls_x509_crt_check_issuer(cert:Tgnutls_x509_crt_t; issuer:Tgnutls_x509_crt_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crt_list_verify(cert_list:Pgnutls_x509_crt_t; cert_list_length:dword; CA_list:Pgnutls_x509_crt_t; CA_list_length:dword; CRL_list:Pgnutls_x509_crl_t; 
           CRL_list_length:dword; flags:dword; verify:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_verify(cert:Tgnutls_x509_crt_t; CA_list:Pgnutls_x509_crt_t; CA_list_length:dword; flags:dword; verify:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crl_verify(crl:Tgnutls_x509_crl_t; CA_list:Pgnutls_x509_crt_t; CA_list_length:dword; flags:dword; verify:Pdword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crt_verify_data2(crt:Tgnutls_x509_crt_t; algo:Tgnutls_sign_algorithm_t; flags:dword; data:Pgnutls_datum_t; signature:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_check_revocation(cert:Tgnutls_x509_crt_t; crl_list:Pgnutls_x509_crl_t; crl_list_length:dword):longint;cdecl;external;
function gnutls_x509_crt_get_fingerprint(cert:Tgnutls_x509_crt_t; algo:Tgnutls_digest_algorithm_t; buf:pointer; buf_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crt_get_key_purpose_oid(cert:Tgnutls_x509_crt_t; indx:dword; oid:pointer; oid_size:Psize_t; critical:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_key_purpose_oid(cert:Tgnutls_x509_crt_t; oid:pointer; critical:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_check_key_purpose(cert:Tgnutls_x509_crt_t; purpose:Pchar; flags:dword):dword;cdecl;external;
{ Private key handling.
  }
{ Flags for the gnutls_x509_privkey_export_pkcs8() function.
  }
const
  GNUTLS_PKCS8_PLAIN = GNUTLS_PKCS_PLAIN;  
  GNUTLS_PKCS8_USE_PKCS12_3DES = GNUTLS_PKCS_PKCS12_3DES;  
  GNUTLS_PKCS8_USE_PKCS12_ARCFOUR = GNUTLS_PKCS_PKCS12_ARCFOUR;  
  GNUTLS_PKCS8_USE_PKCS12_RC2_40 = GNUTLS_PKCS_PKCS12_RC2_40;  
{*
 * gnutls_pkcs_encrypt_flags_t:
 * @GNUTLS_PKCS_PLAIN: Unencrypted private key.
 * @GNUTLS_PKCS_NULL_PASSWORD: Some schemas distinguish between an empty and a NULL password.
 * @GNUTLS_PKCS_PKCS12_3DES: PKCS-12 3DES.
 * @GNUTLS_PKCS_PKCS12_ARCFOUR: PKCS-12 ARCFOUR.
 * @GNUTLS_PKCS_PKCS12_RC2_40: PKCS-12 RC2-40.
 * @GNUTLS_PKCS_PBES2_3DES: PBES2 3DES.
 * @GNUTLS_PKCS_PBES2_AES_128: PBES2 AES-128.
 * @GNUTLS_PKCS_PBES2_AES_192: PBES2 AES-192.
 * @GNUTLS_PKCS_PBES2_AES_256: PBES2 AES-256.
 * @GNUTLS_PKCS_PBES2_DES: PBES2 single DES.
 * @GNUTLS_PKCS_PBES1_DES_MD5: PBES1 with single DES; for compatibility with openssl only.
 * @GNUTLS_PKCS_PBES2_GOST_TC26Z: PBES2 GOST 28147-89 CFB with TC26-Z S-box.
 * @GNUTLS_PKCS_PBES2_GOST_CPA: PBES2 GOST 28147-89 CFB with CryptoPro-A S-box.
 * @GNUTLS_PKCS_PBES2_GOST_CPB: PBES2 GOST 28147-89 CFB with CryptoPro-B S-box.
 * @GNUTLS_PKCS_PBES2_GOST_CPC: PBES2 GOST 28147-89 CFB with CryptoPro-C S-box.
 * @GNUTLS_PKCS_PBES2_GOST_CPD: PBES2 GOST 28147-89 CFB with CryptoPro-D S-box.
 *
 * Enumeration of different PKCS encryption flags.
  }
type
  Pgnutls_pkcs_encrypt_flags_t = ^Tgnutls_pkcs_encrypt_flags_t;
  Tgnutls_pkcs_encrypt_flags_t =  Longint;
  Const
    GNUTLS_PKCS_PLAIN = 1;
    GNUTLS_PKCS_PKCS12_3DES = 1 shl 1;
    GNUTLS_PKCS_PKCS12_ARCFOUR = 1 shl 2;
    GNUTLS_PKCS_PKCS12_RC2_40 = 1 shl 3;
    GNUTLS_PKCS_PBES2_3DES = 1 shl 4;
    GNUTLS_PKCS_PBES2_AES_128 = 1 shl 5;
    GNUTLS_PKCS_PBES2_AES_192 = 1 shl 6;
    GNUTLS_PKCS_PBES2_AES_256 = 1 shl 7;
    GNUTLS_PKCS_NULL_PASSWORD = 1 shl 8;
    GNUTLS_PKCS_PBES2_DES = 1 shl 9;
    GNUTLS_PKCS_PBES1_DES_MD5 = 1 shl 10;
    GNUTLS_PKCS_PBES2_GOST_TC26Z = 1 shl 11;
    GNUTLS_PKCS_PBES2_GOST_CPA = 1 shl 12;
    GNUTLS_PKCS_PBES2_GOST_CPB = 1 shl 13;
    GNUTLS_PKCS_PBES2_GOST_CPC = 1 shl 14;
    GNUTLS_PKCS_PBES2_GOST_CPD = 1 shl 15;
;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GNUTLS_PKCS_CIPHER_MASK(x : longint) : Tx;

const
  GNUTLS_PKCS_USE_PKCS12_3DES = GNUTLS_PKCS_PKCS12_3DES;  
  GNUTLS_PKCS_USE_PKCS12_ARCFOUR = GNUTLS_PKCS_PKCS12_ARCFOUR;  
  GNUTLS_PKCS_USE_PKCS12_RC2_40 = GNUTLS_PKCS_PKCS12_RC2_40;  
  GNUTLS_PKCS_USE_PBES2_3DES = GNUTLS_PKCS_PBES2_3DES;  
  GNUTLS_PKCS_USE_PBES2_AES_128 = GNUTLS_PKCS_PBES2_AES_128;  
  GNUTLS_PKCS_USE_PBES2_AES_192 = GNUTLS_PKCS_PBES2_AES_192;  
  GNUTLS_PKCS_USE_PBES2_AES_256 = GNUTLS_PKCS_PBES2_AES_256;  
  GNUTLS_PKCS_USE_PBES2_GOST_TC26Z = GNUTLS_PKCS_PBES2_GOST_TC26Z;  
  GNUTLS_PKCS_USE_PBES2_GOST_CPA = GNUTLS_PKCS_PBES2_GOST_CPA;  
  GNUTLS_PKCS_USE_PBES2_GOST_CPB = GNUTLS_PKCS_PBES2_GOST_CPB;  
  GNUTLS_PKCS_USE_PBES2_GOST_CPC = GNUTLS_PKCS_PBES2_GOST_CPC;  
  GNUTLS_PKCS_USE_PBES2_GOST_CPD = GNUTLS_PKCS_PBES2_GOST_CPD;  
(* Const before type ignored *)

function gnutls_pkcs_schema_get_name(schema:dword):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs_schema_get_oid(schema:dword):Pchar;cdecl;external;
function gnutls_x509_privkey_init(key:Pgnutls_x509_privkey_t):longint;cdecl;external;
procedure gnutls_x509_privkey_deinit(key:Tgnutls_x509_privkey_t);cdecl;external;
function gnutls_x509_privkey_sec_param(key:Tgnutls_x509_privkey_t):Tgnutls_sec_param_t;cdecl;external;
procedure gnutls_x509_privkey_set_pin_function(key:Tgnutls_x509_privkey_t; fn:Tgnutls_pin_callback_t; userdata:pointer);cdecl;external;
function gnutls_x509_privkey_cpy(dst:Tgnutls_x509_privkey_t; src:Tgnutls_x509_privkey_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_privkey_import(key:Tgnutls_x509_privkey_t; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_privkey_import_pkcs8(key:Tgnutls_x509_privkey_t; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; password:Pchar; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_privkey_import_openssl(key:Tgnutls_x509_privkey_t; data:Pgnutls_datum_t; password:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs8_info(data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; schema:Pdword; cipher:Pdword; salt:pointer; 
           salt_size:Pdword; iter_count:Pdword; oid:PPchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_privkey_import2(key:Tgnutls_x509_privkey_t; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; password:Pchar; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_privkey_import_rsa_raw(key:Tgnutls_x509_privkey_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t; d:Pgnutls_datum_t; p:Pgnutls_datum_t; 
           q:Pgnutls_datum_t; u:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_privkey_import_rsa_raw2(key:Tgnutls_x509_privkey_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t; d:Pgnutls_datum_t; p:Pgnutls_datum_t; 
           q:Pgnutls_datum_t; u:Pgnutls_datum_t; e1:Pgnutls_datum_t; e2:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_privkey_import_ecc_raw(key:Tgnutls_x509_privkey_t; curve:Tgnutls_ecc_curve_t; x:Pgnutls_datum_t; y:Pgnutls_datum_t; k:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_privkey_import_gost_raw(key:Tgnutls_x509_privkey_t; curve:Tgnutls_ecc_curve_t; digest:Tgnutls_digest_algorithm_t; paramset:Tgnutls_gost_paramset_t; x:Pgnutls_datum_t; 
           y:Pgnutls_datum_t; k:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_privkey_fix(key:Tgnutls_x509_privkey_t):longint;cdecl;external;
function gnutls_x509_privkey_export_dsa_raw(key:Tgnutls_x509_privkey_t; p:Pgnutls_datum_t; q:Pgnutls_datum_t; g:Pgnutls_datum_t; y:Pgnutls_datum_t; 
           x:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_privkey_import_dsa_raw(key:Tgnutls_x509_privkey_t; p:Pgnutls_datum_t; q:Pgnutls_datum_t; g:Pgnutls_datum_t; y:Pgnutls_datum_t; 
           x:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_privkey_import_dh_raw(key:Tgnutls_x509_privkey_t; params:Tgnutls_dh_params_t; y:Pgnutls_datum_t; x:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_privkey_get_pk_algorithm(key:Tgnutls_x509_privkey_t):longint;cdecl;external;
function gnutls_x509_privkey_get_pk_algorithm2(key:Tgnutls_x509_privkey_t; bits:Pdword):longint;cdecl;external;
function gnutls_x509_privkey_get_spki(key:Tgnutls_x509_privkey_t; spki:Tgnutls_x509_spki_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_privkey_set_spki(key:Tgnutls_x509_privkey_t; spki:Tgnutls_x509_spki_t; flags:dword):longint;cdecl;external;
function gnutls_x509_privkey_get_key_id(key:Tgnutls_x509_privkey_t; flags:dword; output_data:Pbyte; output_data_size:Psize_t):longint;cdecl;external;
function gnutls_x509_privkey_generate(key:Tgnutls_x509_privkey_t; algo:Tgnutls_pk_algorithm_t; bits:dword; flags:dword):longint;cdecl;external;
procedure gnutls_x509_privkey_set_flags(key:Tgnutls_x509_privkey_t; flags:dword);cdecl;external;
{*
 * gnutls_keygen_types_t:
 * @GNUTLS_KEYGEN_SEED: Specifies the seed to be used in key generation.
 * @GNUTLS_KEYGEN_DIGEST: The size field specifies the hash algorithm to be used in key generation.
 * @GNUTLS_KEYGEN_SPKI: data points to a %gnutls_x509_spki_t structure; it is not used after the key generation call.
 * @GNUTLS_KEYGEN_DH: data points to a %gnutls_dh_params_t structure; it is not used after the key generation call.
 *
 * Enumeration of different key generation data options.
  }
type
  Pgnutls_keygen_types_t = ^Tgnutls_keygen_types_t;
  Tgnutls_keygen_types_t =  Longint;
  Const
    GNUTLS_KEYGEN_SEED = 1;
    GNUTLS_KEYGEN_DIGEST = 2;
    GNUTLS_KEYGEN_SPKI = 3;
    GNUTLS_KEYGEN_DH = 4;
;
type
  Pgnutls_keygen_data_st = ^Tgnutls_keygen_data_st;
  Tgnutls_keygen_data_st = record
      _type : Tgnutls_keygen_types_t;
      data : Pbyte;
      size : dword;
    end;
(* Const before type ignored *)

function gnutls_x509_privkey_generate2(key:Tgnutls_x509_privkey_t; algo:Tgnutls_pk_algorithm_t; bits:dword; flags:dword; data:Pgnutls_keygen_data_st; 
           data_size:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_privkey_verify_seed(key:Tgnutls_x509_privkey_t; para2:Tgnutls_digest_algorithm_t; seed:pointer; seed_size:Tsize_t):longint;cdecl;external;
function gnutls_x509_privkey_get_seed(key:Tgnutls_x509_privkey_t; para2:Pgnutls_digest_algorithm_t; seed:pointer; seed_size:Psize_t):longint;cdecl;external;
function gnutls_x509_privkey_verify_params(key:Tgnutls_x509_privkey_t):longint;cdecl;external;
function gnutls_x509_privkey_export(key:Tgnutls_x509_privkey_t; format:Tgnutls_x509_crt_fmt_t; output_data:pointer; output_data_size:Psize_t):longint;cdecl;external;
function gnutls_x509_privkey_export2(key:Tgnutls_x509_privkey_t; format:Tgnutls_x509_crt_fmt_t; out:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_privkey_export_pkcs8(key:Tgnutls_x509_privkey_t; format:Tgnutls_x509_crt_fmt_t; password:Pchar; flags:dword; output_data:pointer; 
           output_data_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_privkey_export2_pkcs8(key:Tgnutls_x509_privkey_t; format:Tgnutls_x509_crt_fmt_t; password:Pchar; flags:dword; out:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_privkey_export_rsa_raw2(key:Tgnutls_x509_privkey_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t; d:Pgnutls_datum_t; p:Pgnutls_datum_t; 
           q:Pgnutls_datum_t; u:Pgnutls_datum_t; e1:Pgnutls_datum_t; e2:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_privkey_export_rsa_raw(key:Tgnutls_x509_privkey_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t; d:Pgnutls_datum_t; p:Pgnutls_datum_t; 
           q:Pgnutls_datum_t; u:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_privkey_export_ecc_raw(key:Tgnutls_x509_privkey_t; curve:Pgnutls_ecc_curve_t; x:Pgnutls_datum_t; y:Pgnutls_datum_t; k:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_privkey_export_gost_raw(key:Tgnutls_x509_privkey_t; curve:Pgnutls_ecc_curve_t; digest:Pgnutls_digest_algorithm_t; paramset:Pgnutls_gost_paramset_t; x:Pgnutls_datum_t; 
           y:Pgnutls_datum_t; k:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_privkey_sign_data(key:Tgnutls_x509_privkey_t; digest:Tgnutls_digest_algorithm_t; flags:dword; data:Pgnutls_datum_t; signature:pointer; 
           signature_size:Psize_t):longint;cdecl;external;
{ Certificate request stuff.
  }
function gnutls_x509_crq_sign(crq:Tgnutls_x509_crq_t; key:Tgnutls_x509_privkey_t):longint;cdecl;external;
function gnutls_x509_crq_sign2(crq:Tgnutls_x509_crq_t; key:Tgnutls_x509_privkey_t; dig:Tgnutls_digest_algorithm_t; flags:dword):longint;cdecl;external;
function gnutls_x509_crq_print(crq:Tgnutls_x509_crq_t; format:Tgnutls_certificate_print_formats_t; out:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crq_verify(crq:Tgnutls_x509_crq_t; flags:dword):longint;cdecl;external;
function gnutls_x509_crq_init(crq:Pgnutls_x509_crq_t):longint;cdecl;external;
procedure gnutls_x509_crq_deinit(crq:Tgnutls_x509_crq_t);cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crq_import(crq:Tgnutls_x509_crq_t; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
function gnutls_x509_crq_get_private_key_usage_period(cert:Tgnutls_x509_crq_t; activation:Ptime_t; expiration:Ptime_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crq_get_dn(crq:Tgnutls_x509_crq_t; buf:Pchar; sizeof_buf:Psize_t):longint;cdecl;external;
function gnutls_x509_crq_get_dn2(crq:Tgnutls_x509_crq_t; dn:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crq_get_dn3(crq:Tgnutls_x509_crq_t; dn:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
function gnutls_x509_crq_get_dn_oid(crq:Tgnutls_x509_crq_t; indx:dword; oid:pointer; sizeof_oid:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crq_get_dn_by_oid(crq:Tgnutls_x509_crq_t; oid:Pchar; indx:dword; raw_flag:dword; buf:pointer; 
           sizeof_buf:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crq_set_dn(crq:Tgnutls_x509_crq_t; dn:Pchar; err:PPchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crq_set_dn_by_oid(crq:Tgnutls_x509_crq_t; oid:Pchar; raw_flag:dword; data:pointer; sizeof_data:dword):longint;cdecl;external;
function gnutls_x509_crq_set_version(crq:Tgnutls_x509_crq_t; version:dword):longint;cdecl;external;
function gnutls_x509_crq_get_version(crq:Tgnutls_x509_crq_t):longint;cdecl;external;
function gnutls_x509_crq_set_key(crq:Tgnutls_x509_crq_t; key:Tgnutls_x509_privkey_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crq_set_extension_by_oid(crq:Tgnutls_x509_crq_t; oid:Pchar; buf:pointer; sizeof_buf:Tsize_t; critical:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crq_set_challenge_password(crq:Tgnutls_x509_crq_t; pass:Pchar):longint;cdecl;external;
function gnutls_x509_crq_get_challenge_password(crq:Tgnutls_x509_crq_t; pass:Pchar; sizeof_pass:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crq_set_attribute_by_oid(crq:Tgnutls_x509_crq_t; oid:Pchar; buf:pointer; sizeof_buf:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crq_get_attribute_by_oid(crq:Tgnutls_x509_crq_t; oid:Pchar; indx:dword; buf:pointer; sizeof_buf:Psize_t):longint;cdecl;external;
function gnutls_x509_crq_export(crq:Tgnutls_x509_crq_t; format:Tgnutls_x509_crt_fmt_t; output_data:pointer; output_data_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crq_export2(crq:Tgnutls_x509_crq_t; format:Tgnutls_x509_crt_fmt_t; out:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crt_set_crq(crt:Tgnutls_x509_crt_t; crq:Tgnutls_x509_crq_t):longint;cdecl;external;
function gnutls_x509_crt_set_crq_extensions(crt:Tgnutls_x509_crt_t; crq:Tgnutls_x509_crq_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_set_crq_extension_by_oid(crt:Tgnutls_x509_crt_t; crq:Tgnutls_x509_crq_t; oid:Pchar; flags:dword):longint;cdecl;external;
function gnutls_x509_crq_set_private_key_usage_period(crq:Tgnutls_x509_crq_t; activation:Ttime_t; expiration:Ttime_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crq_set_key_rsa_raw(crq:Tgnutls_x509_crq_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crq_set_subject_alt_name(crq:Tgnutls_x509_crq_t; nt:Tgnutls_x509_subject_alt_name_t; data:pointer; data_size:dword; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_crq_set_subject_alt_othername(crq:Tgnutls_x509_crq_t; oid:Pchar; data:pointer; data_size:dword; flags:dword):longint;cdecl;external;
function gnutls_x509_crq_set_key_usage(crq:Tgnutls_x509_crq_t; usage:dword):longint;cdecl;external;
function gnutls_x509_crq_set_basic_constraints(crq:Tgnutls_x509_crq_t; ca:dword; pathLenConstraint:longint):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crq_set_key_purpose_oid(crq:Tgnutls_x509_crq_t; oid:pointer; critical:dword):longint;cdecl;external;
function gnutls_x509_crq_get_key_purpose_oid(crq:Tgnutls_x509_crq_t; indx:dword; oid:pointer; sizeof_oid:Psize_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crq_get_extension_data(crq:Tgnutls_x509_crq_t; indx:dword; data:pointer; sizeof_data:Psize_t):longint;cdecl;external;
function gnutls_x509_crq_get_extension_data2(crq:Tgnutls_x509_crq_t; indx:dword; data:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crq_get_extension_info(crq:Tgnutls_x509_crq_t; indx:dword; oid:pointer; sizeof_oid:Psize_t; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crq_get_attribute_data(crq:Tgnutls_x509_crq_t; indx:dword; data:pointer; sizeof_data:Psize_t):longint;cdecl;external;
function gnutls_x509_crq_get_attribute_info(crq:Tgnutls_x509_crq_t; indx:dword; oid:pointer; sizeof_oid:Psize_t):longint;cdecl;external;
function gnutls_x509_crq_get_pk_algorithm(crq:Tgnutls_x509_crq_t; bits:Pdword):longint;cdecl;external;
function gnutls_x509_crq_get_spki(crq:Tgnutls_x509_crq_t; spki:Tgnutls_x509_spki_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crq_set_spki(crq:Tgnutls_x509_crq_t; spki:Tgnutls_x509_spki_t; flags:dword):longint;cdecl;external;
function gnutls_x509_crq_get_signature_oid(crq:Tgnutls_x509_crq_t; oid:Pchar; oid_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crq_get_pk_oid(crq:Tgnutls_x509_crq_t; oid:Pchar; oid_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crq_get_key_id(crq:Tgnutls_x509_crq_t; flags:dword; output_data:Pbyte; output_data_size:Psize_t):longint;cdecl;external;
function gnutls_x509_crq_get_key_rsa_raw(crq:Tgnutls_x509_crq_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_crq_get_key_usage(crq:Tgnutls_x509_crq_t; key_usage:Pdword; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crq_get_basic_constraints(crq:Tgnutls_x509_crq_t; critical:Pdword; ca:Pdword; pathlen:Plongint):longint;cdecl;external;
function gnutls_x509_crq_get_subject_alt_name(crq:Tgnutls_x509_crq_t; seq:dword; ret:pointer; ret_size:Psize_t; ret_type:Pdword; 
           critical:Pdword):longint;cdecl;external;
function gnutls_x509_crq_get_subject_alt_othername_oid(crq:Tgnutls_x509_crq_t; seq:dword; ret:pointer; ret_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crq_get_extension_by_oid(crq:Tgnutls_x509_crq_t; oid:Pchar; indx:dword; buf:pointer; sizeof_buf:Psize_t; 
           critical:Pdword):longint;cdecl;external;
function gnutls_x509_crq_get_tlsfeatures(crq:Tgnutls_x509_crq_t; features:Tgnutls_x509_tlsfeatures_t; flags:dword; critical:Pdword):longint;cdecl;external;
function gnutls_x509_crq_set_tlsfeatures(crq:Tgnutls_x509_crq_t; features:Tgnutls_x509_tlsfeatures_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crt_get_extension_by_oid2(cert:Tgnutls_x509_crt_t; oid:Pchar; indx:dword; output:Pgnutls_datum_t; critical:Pdword):longint;cdecl;external;
type
  Pgnutls_x509_trust_list_t = ^Tgnutls_x509_trust_list_t;
  Tgnutls_x509_trust_list_t = Pgnutls_x509_trust_list_st;

  Pgnutls_x509_trust_list_iter_t = ^Tgnutls_x509_trust_list_iter_t;
  Tgnutls_x509_trust_list_iter_t = Pgnutls_x509_trust_list_iter;

function gnutls_x509_trust_list_init(list:Pgnutls_x509_trust_list_t; size:dword):longint;cdecl;external;
procedure gnutls_x509_trust_list_deinit(list:Tgnutls_x509_trust_list_t; all:dword);cdecl;external;
function gnutls_x509_trust_list_get_issuer(list:Tgnutls_x509_trust_list_t; cert:Tgnutls_x509_crt_t; issuer:Pgnutls_x509_crt_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_trust_list_get_issuer_by_dn(list:Tgnutls_x509_trust_list_t; dn:Pgnutls_datum_t; issuer:Pgnutls_x509_crt_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_trust_list_get_issuer_by_subject_key_id(list:Tgnutls_x509_trust_list_t; dn:Pgnutls_datum_t; spki:Pgnutls_datum_t; issuer:Pgnutls_x509_crt_t; flags:dword):longint;cdecl;external;
{*
 * gnutls_trust_list_flags_t:
 * @GNUTLS_TL_VERIFY_CRL: If any CRLs are provided they will be verified for validity
 *   prior to be added. The CA certificates that will be used for verification are the
 *   ones already added in the trusted list.
 * @GNUTLS_TL_USE_IN_TLS: Internal flag used by GnuTLS. If provided the trust list
 *   structure will cache a copy of CA DNs to be used in the certificate request
 *   TLS message.
 * @GNUTLS_TL_NO_DUPLICATES: If this flag is specified, a function adding certificates
 *   will check and eliminate any duplicates.
 * @GNUTLS_TL_NO_DUPLICATE_KEY: If this flag is specified, a certificate sharing the
 *   same key as a previously added on will not be added.
 * @GNUTLS_TL_GET_COPY: The semantics of this flag are documented to the functions which
 *   are applicable. In general, on returned value, the function will provide a copy
 *   if this flag is provided, rather than a pointer to internal data.
 * @GNUTLS_TL_FAIL_ON_INVALID_CRL: If an CRL is added which cannot be validated return
 *   an error instead of ignoring (must be used with %GNUTLS_TL_VERIFY_CRL).
 *
 * Enumeration of different certificate trust list flags.
  }
type
  Pgnutls_trust_list_flags_t = ^Tgnutls_trust_list_flags_t;
  Tgnutls_trust_list_flags_t =  Longint;
  Const
    GNUTLS_TL_VERIFY_CRL = 1;
    GNUTLS_TL_USE_IN_TLS = 1 shl 1;
    GNUTLS_TL_NO_DUPLICATES = 1 shl 2;
    GNUTLS_TL_NO_DUPLICATE_KEY = 1 shl 3;
    GNUTLS_TL_GET_COPY = 1 shl 4;
    GNUTLS_TL_FAIL_ON_INVALID_CRL = 1 shl 5;
;
  GNUTLS_TL_VERIFY_CRL = 1;  
  GNUTLS_TL_USE_IN_TLS = 1 shl 1;  
  GNUTLS_TL_NO_DUPLICATES = 1 shl 2;  
  GNUTLS_TL_NO_DUPLICATE_KEY = 1 shl 3;  
  GNUTLS_TL_GET_COPY = 1 shl 4;  
  GNUTLS_TL_FAIL_ON_INVALID_CRL = 1 shl 5;  
(* Const before type ignored *)

function gnutls_x509_trust_list_add_cas(list:Tgnutls_x509_trust_list_t; clist:Pgnutls_x509_crt_t; clist_size:dword; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_trust_list_remove_cas(list:Tgnutls_x509_trust_list_t; clist:Pgnutls_x509_crt_t; clist_size:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_trust_list_add_named_crt(list:Tgnutls_x509_trust_list_t; cert:Tgnutls_x509_crt_t; name:pointer; name_size:Tsize_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_trust_list_add_crls(list:Tgnutls_x509_trust_list_t; crl_list:Pgnutls_x509_crl_t; crl_size:dword; flags:dword; verification_flags:dword):longint;cdecl;external;
function gnutls_x509_trust_list_iter_get_ca(list:Tgnutls_x509_trust_list_t; iter:Pgnutls_x509_trust_list_iter_t; crt:Pgnutls_x509_crt_t):longint;cdecl;external;
procedure gnutls_x509_trust_list_iter_deinit(iter:Tgnutls_x509_trust_list_iter_t);cdecl;external;
{ xxxxxxxxxxxxxxxxxxxx }
{ The issuer if verification failed
					   * because of him. might be null.
					    }
{ The CRL that caused verification failure 
									 * if any. Might be null.
									  }
type

  Tgnutls_verify_output_function = function (cert:Tgnutls_x509_crt_t; issuer:Tgnutls_x509_crt_t; crl:Tgnutls_x509_crl_t; verification_output:dword):longint;cdecl;

procedure gnutls_session_set_verify_output_function(session:Tgnutls_session_t; func:Pgnutls_verify_output_function);cdecl;external;
(* Const before type ignored *)
function gnutls_x509_trust_list_verify_named_crt(list:Tgnutls_x509_trust_list_t; cert:Tgnutls_x509_crt_t; name:pointer; name_size:Tsize_t; flags:dword; 
           verify:Pdword; func:Tgnutls_verify_output_function):longint;cdecl;external;
function gnutls_x509_trust_list_verify_crt2(list:Tgnutls_x509_trust_list_t; cert_list:Pgnutls_x509_crt_t; cert_list_size:dword; data:Pgnutls_typed_vdata_st; elements:dword; 
           flags:dword; voutput:Pdword; func:Tgnutls_verify_output_function):longint;cdecl;external;
function gnutls_x509_trust_list_verify_crt(list:Tgnutls_x509_trust_list_t; cert_list:Pgnutls_x509_crt_t; cert_list_size:dword; flags:dword; verify:Pdword; 
           func:Tgnutls_verify_output_function):longint;cdecl;external;
{ trust list convenience functions  }
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_trust_list_add_trust_mem(list:Tgnutls_x509_trust_list_t; cas:Pgnutls_datum_t; crls:Pgnutls_datum_t; _type:Tgnutls_x509_crt_fmt_t; tl_flags:dword; 
           tl_vflags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_trust_list_add_trust_file(list:Tgnutls_x509_trust_list_t; ca_file:Pchar; crl_file:Pchar; _type:Tgnutls_x509_crt_fmt_t; tl_flags:dword; 
           tl_vflags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_trust_list_add_trust_dir(list:Tgnutls_x509_trust_list_t; ca_dir:Pchar; crl_dir:Pchar; _type:Tgnutls_x509_crt_fmt_t; tl_flags:dword; 
           tl_vflags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_trust_list_remove_trust_file(list:Tgnutls_x509_trust_list_t; ca_file:Pchar; _type:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_trust_list_remove_trust_mem(list:Tgnutls_x509_trust_list_t; cas:Pgnutls_datum_t; _type:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
function gnutls_x509_trust_list_add_system_trust(list:Tgnutls_x509_trust_list_t; tl_flags:dword; tl_vflags:dword):longint;cdecl;external;
{ xxxxxxxxxxxx }
(* Const before type ignored *)
type

  Tgnutls_x509_trust_list_getissuer_function = function (list:Tgnutls_x509_trust_list_t; cert:Tgnutls_x509_crt_t; issuers:PPgnutls_x509_crt_t; issuers_size:Pdword):longint;cdecl;

procedure gnutls_x509_trust_list_set_getissuer_function(tlist:Tgnutls_x509_trust_list_t; func:Pgnutls_x509_trust_list_getissuer_function);cdecl;external;
procedure gnutls_x509_trust_list_set_ptr(tlist:Tgnutls_x509_trust_list_t; ptr:pointer);cdecl;external;
function gnutls_x509_trust_list_get_ptr(tlist:Tgnutls_x509_trust_list_t):pointer;cdecl;external;
procedure gnutls_certificate_set_trust_list(res:Tgnutls_certificate_credentials_t; tlist:Tgnutls_x509_trust_list_t; flags:dword);cdecl;external;
procedure gnutls_certificate_get_trust_list(res:Tgnutls_certificate_credentials_t; tlist:Pgnutls_x509_trust_list_t);cdecl;external;
type
  Pgnutls_x509_ext_st = ^Tgnutls_x509_ext_st;
  Tgnutls_x509_ext_st = record
      oid : Pchar;
      critical : dword;
      data : Tgnutls_datum_t;
    end;

procedure gnutls_x509_ext_deinit(ext:Pgnutls_x509_ext_st);cdecl;external;
function gnutls_x509_ext_print(exts:Pgnutls_x509_ext_st; exts_size:dword; format:Tgnutls_certificate_print_formats_t; out:Pgnutls_datum_t):longint;cdecl;external;
{$include <gnutls/pkcs7.h>}
{ C++ end of extern C conditionnal removed }
{$endif}
{ GNUTLS_X509_H  }

implementation

{ was #define dname def_expr }
function GNUTLS_X509_NO_WELL_DEFINED_EXPIRATION : Ttime_t;
  begin
    GNUTLS_X509_NO_WELL_DEFINED_EXPIRATION:=Ttime_t(4294197631);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GNUTLS_PROFILE_TO_VFLAGS(x : longint) : longint;
begin
  GNUTLS_PROFILE_TO_VFLAGS:=(dword(x)) shl 24;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GNUTLS_VFLAGS_TO_PROFILE(x : longint) : longint;
begin
  GNUTLS_VFLAGS_TO_PROFILE:=((dword(x)) shr 24) and $ff;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GNUTLS_PKCS_CIPHER_MASK(x : longint) : Tx;
begin
  GNUTLS_PKCS_CIPHER_MASK:=Tx(@( not (GNUTLS_PKCS_NULL_PASSWORD)));
end;


end.

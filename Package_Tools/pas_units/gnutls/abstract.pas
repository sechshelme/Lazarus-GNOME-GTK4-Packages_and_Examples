unit abstract;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2010-2012 Free Software Foundation, Inc.
 * Copyright (C) 2015-2017 Red Hat, Inc.
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
{$ifndef GNUTLS_ABSTRACT_H}
{$define GNUTLS_ABSTRACT_H}
{$include <gnutls/gnutls.h>}
{$include <gnutls/x509.h>}
{$include <gnutls/pkcs11.h>}
{$include <gnutls/openpgp.h>}
{$include <gnutls/tpm.h>}
{ C++ extern C conditionnal removed }
{ Public key operations  }

const
  GNUTLS_PUBKEY_VERIFY_FLAG_TLS_RSA = GNUTLS_PUBKEY_VERIFY_FLAG_TLS1_RSA;  
{*
 * gnutls_pubkey_flags:
 * @GNUTLS_PUBKEY_DISABLE_CALLBACKS: The following flag disables call to PIN callbacks. Only
 *   relevant to TPM keys.
 * @GNUTLS_PUBKEY_GET_OPENPGP_FINGERPRINT: request an OPENPGP fingerprint instead of the default.
 *
 * Enumeration of different certificate import flags.
  }
type
  Pgnutls_pubkey_flags = ^Tgnutls_pubkey_flags;
  Tgnutls_pubkey_flags =  Longint;
  Const
    GNUTLS_PUBKEY_DISABLE_CALLBACKS = 1 shl 2;
    GNUTLS_PUBKEY_GET_OPENPGP_FINGERPRINT = 1 shl 3;
;
  Tgnutls_pubkey_flags_t = Tgnutls_pubkey_flags;
  Pgnutls_pubkey_flags_t = ^Tgnutls_pubkey_flags_t;
{*
 * gnutls_abstract_export_flags:
 * @GNUTLS_EXPORT_FLAG_NO_LZ: do not prepend a leading zero to exported values
 *
 * Enumeration of different certificate import flags.
  }
type
  Pgnutls_abstract_export_flags = ^Tgnutls_abstract_export_flags;
  Tgnutls_abstract_export_flags =  Longint;
  Const
    GNUTLS_EXPORT_FLAG_NO_LZ = 1;
;
  Tgnutls_abstract_export_flags_t = Tgnutls_abstract_export_flags;
  Pgnutls_abstract_export_flags_t = ^Tgnutls_abstract_export_flags_t;
  GNUTLS_PUBKEY_VERIFY_FLAG_TLS1_RSA = GNUTLS_VERIFY_USE_TLS1_RSA;  
type

  Tgnutls_privkey_sign_func = function (key:Tgnutls_privkey_t; userdata:pointer; raw_data:Pgnutls_datum_t; signature:Pgnutls_datum_t):longint;cdecl;

  Tgnutls_privkey_decrypt_func = function (key:Tgnutls_privkey_t; userdata:pointer; ciphertext:Pgnutls_datum_t; plaintext:Pgnutls_datum_t):longint;cdecl;

  Tgnutls_privkey_decrypt_func2 = function (key:Tgnutls_privkey_t; userdata:pointer; ciphertext:Pgnutls_datum_t; plaintext:Pbyte; plaintext_size:Tsize_t):longint;cdecl;
{ to be called to sign pre-hashed data. The input will be
 * the output of the hash (such as SHA256) corresponding to
 * the signature algorithm. The algorithm GNUTLS_SIGN_RSA_RAW
 * will be provided when RSA PKCS#1 DigestInfo structure is provided
 * as data (when this is called from a TLS 1.0 or 1.1 session).
  }

  Tgnutls_privkey_sign_hash_func = function (key:Tgnutls_privkey_t; algo:Tgnutls_sign_algorithm_t; userdata:pointer; flags:dword; hash:Pgnutls_datum_t; 
               signature:Pgnutls_datum_t):longint;cdecl;
{ to be called to sign data. The input data will be
 * the data to be signed (and hashed), with the provided
 * signature algorithm. This function is used for algorithms
 * like ed25519 which cannot take pre-hashed data as input.
  }

  Tgnutls_privkey_sign_data_func = function (key:Tgnutls_privkey_t; algo:Tgnutls_sign_algorithm_t; userdata:pointer; flags:dword; data:Pgnutls_datum_t; 
               signature:Pgnutls_datum_t):longint;cdecl;

  Tgnutls_privkey_deinit_func = procedure (key:Tgnutls_privkey_t; userdata:pointer);cdecl;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GNUTLS_SIGN_ALGO_TO_FLAGS(sig : longint) : dword;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GNUTLS_FLAGS_TO_SIGN_ALGO(flags : longint) : dword;

{ Should return the public key algorithm (gnutls_pk_algorithm_t)  }
const
  GNUTLS_PRIVKEY_INFO_PK_ALGO = 1;  
{ Should return the preferred signature algorithm (gnutls_sign_algorithm_t) or 0.  }
  GNUTLS_PRIVKEY_INFO_SIGN_ALGO = 1 shl 1;  
{ Should return true (1) or false (0) if the provided sign algorithm
 * (obtained with GNUTLS_FLAGS_TO_SIGN_ALGO) is supported.
  }
  GNUTLS_PRIVKEY_INFO_HAVE_SIGN_ALGO = 1 shl 2;  
{ Should return the number of bits of the public key algorithm (required for RSA-PSS)
 * It is the value that should be returned by gnutls_pubkey_get_pk_algorithm()  }
  GNUTLS_PRIVKEY_INFO_PK_ALGO_BITS = 1 shl 3;  
{ returns information on the public key associated with userdata  }
type

  Tgnutls_privkey_info_func = function (key:Tgnutls_privkey_t; flags:dword; userdata:pointer):longint;cdecl;

function gnutls_pubkey_init(key:Pgnutls_pubkey_t):longint;cdecl;external libgnutls;
procedure gnutls_pubkey_deinit(key:Tgnutls_pubkey_t);cdecl;external libgnutls;
function gnutls_pubkey_verify_params(key:Tgnutls_pubkey_t):longint;cdecl;external libgnutls;
procedure gnutls_pubkey_set_pin_function(key:Tgnutls_pubkey_t; fn:Tgnutls_pin_callback_t; userdata:pointer);cdecl;external libgnutls;
function gnutls_pubkey_get_pk_algorithm(key:Tgnutls_pubkey_t; bits:Pdword):longint;cdecl;external libgnutls;
function gnutls_pubkey_set_spki(key:Tgnutls_pubkey_t; spki:Tgnutls_x509_spki_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_get_spki(key:Tgnutls_pubkey_t; spki:Tgnutls_x509_spki_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_x509(key:Tgnutls_pubkey_t; crt:Tgnutls_x509_crt_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_x509_crq(key:Tgnutls_pubkey_t; crq:Tgnutls_x509_crq_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_pkcs11(key:Tgnutls_pubkey_t; obj:Tgnutls_pkcs11_obj_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_openpgp(key:Tgnutls_pubkey_t; crt:Tgnutls_openpgp_crt_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_openpgp_raw(pkey:Tgnutls_pubkey_t; data:Pgnutls_datum_t; format:Tgnutls_openpgp_crt_fmt_t; keyid:Tgnutls_openpgp_keyid_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_x509_raw(pkey:Tgnutls_pubkey_t; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_privkey(key:Tgnutls_pubkey_t; pkey:Tgnutls_privkey_t; usage:dword; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_tpm_url(pkey:Tgnutls_pubkey_t; url:Pchar; srk_password:Pchar; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_url(key:Tgnutls_pubkey_t; url:Pchar; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_tpm_raw(pkey:Tgnutls_pubkey_t; fdata:Pgnutls_datum_t; format:Tgnutls_tpmkey_fmt_t; srk_password:Pchar; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_get_preferred_hash_algorithm(key:Tgnutls_pubkey_t; hash:Pgnutls_digest_algorithm_t; mand:Pdword):longint;cdecl;external libgnutls;
const
  gnutls_pubkey_get_pk_rsa_raw = gnutls_pubkey_export_rsa_raw;  

function gnutls_pubkey_export_rsa_raw(key:Tgnutls_pubkey_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_export_rsa_raw2(key:Tgnutls_pubkey_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t; flags:dword):longint;cdecl;external libgnutls;
const
  gnutls_pubkey_get_pk_dsa_raw = gnutls_pubkey_export_dsa_raw;  

function gnutls_pubkey_export_dsa_raw(key:Tgnutls_pubkey_t; p:Pgnutls_datum_t; q:Pgnutls_datum_t; g:Pgnutls_datum_t; y:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_export_dsa_raw2(key:Tgnutls_pubkey_t; p:Pgnutls_datum_t; q:Pgnutls_datum_t; g:Pgnutls_datum_t; y:Pgnutls_datum_t; 
           flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_export_dh_raw(key:Tgnutls_pubkey_t; params:Tgnutls_dh_params_t; y:Pgnutls_datum_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_export_ecc_raw2(key:Tgnutls_pubkey_t; curve:Pgnutls_ecc_curve_t; x:Pgnutls_datum_t; y:Pgnutls_datum_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_export_gost_raw2(key:Tgnutls_pubkey_t; curve:Pgnutls_ecc_curve_t; digest:Pgnutls_digest_algorithm_t; paramset:Pgnutls_gost_paramset_t; x:Pgnutls_datum_t; 
           y:Pgnutls_datum_t; flags:dword):longint;cdecl;external libgnutls;
const
  gnutls_pubkey_get_pk_ecc_raw = gnutls_pubkey_export_ecc_raw;  

function gnutls_pubkey_export_ecc_raw(key:Tgnutls_pubkey_t; curve:Pgnutls_ecc_curve_t; x:Pgnutls_datum_t; y:Pgnutls_datum_t):longint;cdecl;external libgnutls;
const
  gnutls_pubkey_get_pk_ecc_x962 = gnutls_pubkey_export_ecc_x962;  

function gnutls_pubkey_export_ecc_x962(key:Tgnutls_pubkey_t; parameters:Pgnutls_datum_t; ecpoint:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_export(key:Tgnutls_pubkey_t; format:Tgnutls_x509_crt_fmt_t; output_data:pointer; output_data_size:Psize_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_export2(key:Tgnutls_pubkey_t; format:Tgnutls_x509_crt_fmt_t; out:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_get_key_id(key:Tgnutls_pubkey_t; flags:dword; output_data:Pbyte; output_data_size:Psize_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_get_openpgp_key_id(key:Tgnutls_pubkey_t; flags:dword; output_data:Pbyte; output_data_size:Psize_t; subkey:Pdword):longint;cdecl;external libgnutls;
function gnutls_pubkey_get_key_usage(key:Tgnutls_pubkey_t; usage:Pdword):longint;cdecl;external libgnutls;
function gnutls_pubkey_set_key_usage(key:Tgnutls_pubkey_t; usage:dword):longint;cdecl;external libgnutls;
function gnutls_pubkey_import(key:Tgnutls_pubkey_t; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t):longint;cdecl;external libgnutls;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pubkey_import_pkcs11_url(key,url,flags : longint) : longint;

function gnutls_pubkey_import_dsa_raw(key:Tgnutls_pubkey_t; p:Pgnutls_datum_t; q:Pgnutls_datum_t; g:Pgnutls_datum_t; y:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_dh_raw(key:Tgnutls_pubkey_t; params:Tgnutls_dh_params_t; y:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_rsa_raw(key:Tgnutls_pubkey_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_ecc_x962(key:Tgnutls_pubkey_t; parameters:Pgnutls_datum_t; ecpoint:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_ecc_raw(key:Tgnutls_pubkey_t; curve:Tgnutls_ecc_curve_t; x:Pgnutls_datum_t; y:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_import_gost_raw(key:Tgnutls_pubkey_t; curve:Tgnutls_ecc_curve_t; digest:Tgnutls_digest_algorithm_t; paramset:Tgnutls_gost_paramset_t; x:Pgnutls_datum_t; 
           y:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_encrypt_data(key:Tgnutls_pubkey_t; flags:dword; plaintext:Pgnutls_datum_t; ciphertext:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_x509_crt_set_pubkey(crt:Tgnutls_x509_crt_t; key:Tgnutls_pubkey_t):longint;cdecl;external libgnutls;
function gnutls_x509_crq_set_pubkey(crq:Tgnutls_x509_crq_t; key:Tgnutls_pubkey_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_verify_hash2(key:Tgnutls_pubkey_t; algo:Tgnutls_sign_algorithm_t; flags:dword; hash:Pgnutls_datum_t; signature:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_verify_data2(pubkey:Tgnutls_pubkey_t; algo:Tgnutls_sign_algorithm_t; flags:dword; data:Pgnutls_datum_t; signature:Pgnutls_datum_t):longint;cdecl;external libgnutls;
{ Private key operations  }
function gnutls_privkey_init(key:Pgnutls_privkey_t):longint;cdecl;external libgnutls;
procedure gnutls_privkey_deinit(key:Tgnutls_privkey_t);cdecl;external libgnutls;
{ macros to allow specifying a subgroup and group size in gnutls_privkey_generate()
 * and gnutls_x509_privkey_generate()  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GNUTLS_SUBGROUP_TO_BITS(group,subgroup : longint) : dword;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GNUTLS_BITS_TO_SUBGROUP(bits : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GNUTLS_BITS_TO_GROUP(bits : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GNUTLS_BITS_HAVE_SUBGROUP(bits : longint) : Tbits;

function gnutls_privkey_generate(key:Tgnutls_privkey_t; algo:Tgnutls_pk_algorithm_t; bits:dword; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_generate2(pkey:Tgnutls_privkey_t; algo:Tgnutls_pk_algorithm_t; bits:dword; flags:dword; data:Pgnutls_keygen_data_st; 
           data_size:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_set_spki(key:Tgnutls_privkey_t; spki:Tgnutls_x509_spki_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_get_spki(key:Tgnutls_privkey_t; spki:Tgnutls_x509_spki_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_verify_seed(key:Tgnutls_privkey_t; para2:Tgnutls_digest_algorithm_t; seed:pointer; seed_size:Tsize_t):longint;cdecl;external libgnutls;
function gnutls_privkey_get_seed(key:Tgnutls_privkey_t; para2:Pgnutls_digest_algorithm_t; seed:pointer; seed_size:Psize_t):longint;cdecl;external libgnutls;
function gnutls_privkey_verify_params(key:Tgnutls_privkey_t):longint;cdecl;external libgnutls;
procedure gnutls_privkey_set_flags(key:Tgnutls_privkey_t; flags:dword);cdecl;external libgnutls;
procedure gnutls_privkey_set_pin_function(key:Tgnutls_privkey_t; fn:Tgnutls_pin_callback_t; userdata:pointer);cdecl;external libgnutls;
function gnutls_privkey_get_pk_algorithm(key:Tgnutls_privkey_t; bits:Pdword):longint;cdecl;external libgnutls;
function gnutls_privkey_get_type(key:Tgnutls_privkey_t):Tgnutls_privkey_type_t;cdecl;external libgnutls;
function gnutls_privkey_status(key:Tgnutls_privkey_t):longint;cdecl;external libgnutls;
{*
 * gnutls_privkey_flags:
 * @GNUTLS_PRIVKEY_SIGN_FLAG_TLS1_RSA: Make an RSA signature on the hashed data as in the TLS protocol.
 * @GNUTLS_PRIVKEY_SIGN_FLAG_RSA_PSS: Make an RSA signature on the hashed data with the PSS padding.
 * @GNUTLS_PRIVKEY_FLAG_REPRODUCIBLE: Make a signature on the hashed data with reproducible parameters.
 *   For RSA-PSS, that means to use empty salt instead of random value. To
 *   verify a signature created using this flag, the corresponding SPKI needs
 *   to be set on the public key. Use gnutls_pubkey_set_spki() for that.
 *   For ECDSA/DSA, it uses the deterministic construction of random parameter
 *   according to RFC 6979. Note that this only supports the NIST curves and DSA
 *   subgroup bits up to 512.
 * @GNUTLS_PRIVKEY_IMPORT_AUTO_RELEASE: When importing a private key, automatically
 *   release it when the structure it was imported is released.
 * @GNUTLS_PRIVKEY_IMPORT_COPY: Copy required values during import.
 * @GNUTLS_PRIVKEY_DISABLE_CALLBACKS: The following flag disables call to PIN callbacks etc.
 *   Only relevant to TPM keys.
 * @GNUTLS_PRIVKEY_FLAG_PROVABLE: When generating a key involving prime numbers, use provable primes; a seed may be required.
 * @GNUTLS_PRIVKEY_FLAG_CA: The generated private key is going to be used as a CA (relevant for RSA-PSS keys).
 * @GNUTLS_PRIVKEY_FLAG_EXPORT_COMPAT: Keys generated or imported as provable require an extended format which cannot be read by previous versions
 *   of gnutls or other applications. By setting this flag the key will be exported in a backwards compatible way,
 *   even if the information about the seed used will be lost.
 * @GNUTLS_PRIVKEY_FLAG_RSA_PSS_FIXED_SALT_LENGTH: When making an RSA-PSS
 *   signature, use the salt whose length is equal to the digest length, as
 *   mandated in RFC 8446 4.2.3.
 *
 * Enumeration of different certificate import flags.
  }
type
  Pgnutls_privkey_flags = ^Tgnutls_privkey_flags;
  Tgnutls_privkey_flags =  Longint;
  Const
    GNUTLS_PRIVKEY_IMPORT_AUTO_RELEASE = 1;
    GNUTLS_PRIVKEY_IMPORT_COPY = 1 shl 1;
    GNUTLS_PRIVKEY_DISABLE_CALLBACKS = 1 shl 2;
    GNUTLS_PRIVKEY_SIGN_FLAG_TLS1_RSA = 1 shl 4;
    GNUTLS_PRIVKEY_FLAG_PROVABLE = 1 shl 5;
    GNUTLS_PRIVKEY_FLAG_EXPORT_COMPAT = 1 shl 6;
    GNUTLS_PRIVKEY_SIGN_FLAG_RSA_PSS = 1 shl 7;
    GNUTLS_PRIVKEY_FLAG_REPRODUCIBLE = 1 shl 8;
    GNUTLS_PRIVKEY_FLAG_CA = 1 shl 9;
    GNUTLS_PRIVKEY_FLAG_RSA_PSS_FIXED_SALT_LENGTH = 1 shl 10;
;
  Tgnutls_privkey_flags_t = Tgnutls_privkey_flags;
  Pgnutls_privkey_flags_t = ^Tgnutls_privkey_flags_t;

function gnutls_privkey_import_pkcs11(pkey:Tgnutls_privkey_t; key:Tgnutls_pkcs11_privkey_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_import_x509(pkey:Tgnutls_privkey_t; key:Tgnutls_x509_privkey_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_import_openpgp(pkey:Tgnutls_privkey_t; key:Tgnutls_openpgp_privkey_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_export_x509(pkey:Tgnutls_privkey_t; key:Pgnutls_x509_privkey_t):longint;cdecl;external libgnutls;
function gnutls_privkey_export_openpgp(pkey:Tgnutls_privkey_t; key:Pgnutls_openpgp_privkey_t):longint;cdecl;external libgnutls;
function gnutls_privkey_export_pkcs11(pkey:Tgnutls_privkey_t; key:Pgnutls_pkcs11_privkey_t):longint;cdecl;external libgnutls;
function gnutls_privkey_import_openpgp_raw(pkey:Tgnutls_privkey_t; data:Pgnutls_datum_t; format:Tgnutls_openpgp_crt_fmt_t; keyid:Tgnutls_openpgp_keyid_t; password:Pchar):longint;cdecl;external libgnutls;
function gnutls_privkey_import_x509_raw(pkey:Tgnutls_privkey_t; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; password:Pchar; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_import_tpm_raw(pkey:Tgnutls_privkey_t; fdata:Pgnutls_datum_t; format:Tgnutls_tpmkey_fmt_t; srk_password:Pchar; key_password:Pchar; 
           flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_import_tpm_url(pkey:Tgnutls_privkey_t; url:Pchar; srk_password:Pchar; key_password:Pchar; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_import_url(key:Tgnutls_privkey_t; url:Pchar; flags:dword):longint;cdecl;external libgnutls;
{$if 0}
{ for documentation purposes  }

function gnutls_privkey_import_pkcs11_url(key:Tgnutls_privkey_t; url:Pchar):longint;cdecl;external libgnutls;
{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gnutls_privkey_import_pkcs11_url(key,url : longint) : longint;

function gnutls_privkey_import_ext(pkey:Tgnutls_privkey_t; pk:Tgnutls_pk_algorithm_t; userdata:pointer; sign_func:Tgnutls_privkey_sign_func; decrypt_func:Tgnutls_privkey_decrypt_func; 
           flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_import_ext2(pkey:Tgnutls_privkey_t; pk:Tgnutls_pk_algorithm_t; userdata:pointer; sign_func:Tgnutls_privkey_sign_func; decrypt_func:Tgnutls_privkey_decrypt_func; 
           deinit_func:Tgnutls_privkey_deinit_func; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_import_ext3(pkey:Tgnutls_privkey_t; userdata:pointer; sign_func:Tgnutls_privkey_sign_func; decrypt_func:Tgnutls_privkey_decrypt_func; deinit_func:Tgnutls_privkey_deinit_func; 
           info_func:Tgnutls_privkey_info_func; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_import_ext4(pkey:Tgnutls_privkey_t; userdata:pointer; sign_data_func:Tgnutls_privkey_sign_data_func; sign_hash_func:Tgnutls_privkey_sign_hash_func; decrypt_func:Tgnutls_privkey_decrypt_func; 
           deinit_func:Tgnutls_privkey_deinit_func; info_func:Tgnutls_privkey_info_func; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_import_dsa_raw(key:Tgnutls_privkey_t; p:Pgnutls_datum_t; q:Pgnutls_datum_t; g:Pgnutls_datum_t; y:Pgnutls_datum_t; 
           x:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_privkey_import_dh_raw(key:Tgnutls_privkey_t; params:Tgnutls_dh_params_t; y:Pgnutls_datum_t; x:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_privkey_import_rsa_raw(key:Tgnutls_privkey_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t; d:Pgnutls_datum_t; p:Pgnutls_datum_t; 
           q:Pgnutls_datum_t; u:Pgnutls_datum_t; e1:Pgnutls_datum_t; e2:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_privkey_import_ecc_raw(key:Tgnutls_privkey_t; curve:Tgnutls_ecc_curve_t; x:Pgnutls_datum_t; y:Pgnutls_datum_t; k:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_privkey_import_gost_raw(key:Tgnutls_privkey_t; curve:Tgnutls_ecc_curve_t; digest:Tgnutls_digest_algorithm_t; paramset:Tgnutls_gost_paramset_t; x:Pgnutls_datum_t; 
           y:Pgnutls_datum_t; k:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_privkey_sign_data(signer:Tgnutls_privkey_t; hash:Tgnutls_digest_algorithm_t; flags:dword; data:Pgnutls_datum_t; signature:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_privkey_sign_data2(signer:Tgnutls_privkey_t; algo:Tgnutls_sign_algorithm_t; flags:dword; data:Pgnutls_datum_t; signature:Pgnutls_datum_t):longint;cdecl;external libgnutls;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_privkey_sign_raw_data(key,flags,data,sig : longint) : longint;

function gnutls_privkey_sign_hash(signer:Tgnutls_privkey_t; hash_algo:Tgnutls_digest_algorithm_t; flags:dword; hash_data:Pgnutls_datum_t; signature:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_privkey_sign_hash2(signer:Tgnutls_privkey_t; algo:Tgnutls_sign_algorithm_t; flags:dword; hash_data:Pgnutls_datum_t; signature:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_privkey_decrypt_data(key:Tgnutls_privkey_t; flags:dword; ciphertext:Pgnutls_datum_t; plaintext:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_privkey_decrypt_data2(key:Tgnutls_privkey_t; flags:dword; ciphertext:Pgnutls_datum_t; plaintext:Pbyte; plaintext_size:Tsize_t):longint;cdecl;external libgnutls;
function gnutls_privkey_export_rsa_raw(key:Tgnutls_privkey_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t; d:Pgnutls_datum_t; p:Pgnutls_datum_t; 
           q:Pgnutls_datum_t; u:Pgnutls_datum_t; e1:Pgnutls_datum_t; e2:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_privkey_export_rsa_raw2(key:Tgnutls_privkey_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t; d:Pgnutls_datum_t; p:Pgnutls_datum_t; 
           q:Pgnutls_datum_t; u:Pgnutls_datum_t; e1:Pgnutls_datum_t; e2:Pgnutls_datum_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_export_dsa_raw(key:Tgnutls_privkey_t; p:Pgnutls_datum_t; q:Pgnutls_datum_t; g:Pgnutls_datum_t; y:Pgnutls_datum_t; 
           x:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_privkey_export_dsa_raw2(key:Tgnutls_privkey_t; p:Pgnutls_datum_t; q:Pgnutls_datum_t; g:Pgnutls_datum_t; y:Pgnutls_datum_t; 
           x:Pgnutls_datum_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_export_dh_raw(key:Tgnutls_privkey_t; params:Tgnutls_dh_params_t; y:Pgnutls_datum_t; x:Pgnutls_datum_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_export_ecc_raw(key:Tgnutls_privkey_t; curve:Pgnutls_ecc_curve_t; x:Pgnutls_datum_t; y:Pgnutls_datum_t; k:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_privkey_export_ecc_raw2(key:Tgnutls_privkey_t; curve:Pgnutls_ecc_curve_t; x:Pgnutls_datum_t; y:Pgnutls_datum_t; k:Pgnutls_datum_t; 
           flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_export_gost_raw2(key:Tgnutls_privkey_t; curve:Pgnutls_ecc_curve_t; digest:Pgnutls_digest_algorithm_t; paramset:Pgnutls_gost_paramset_t; x:Pgnutls_datum_t; 
           y:Pgnutls_datum_t; k:Pgnutls_datum_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_privkey_derive_secret(privkey:Tgnutls_privkey_t; pubkey:Tgnutls_pubkey_t; nonce:Pgnutls_datum_t; secret:Pgnutls_datum_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_x509_crt_privkey_sign(crt:Tgnutls_x509_crt_t; issuer:Tgnutls_x509_crt_t; issuer_key:Tgnutls_privkey_t; dig:Tgnutls_digest_algorithm_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_x509_crl_privkey_sign(crl:Tgnutls_x509_crl_t; issuer:Tgnutls_x509_crt_t; issuer_key:Tgnutls_privkey_t; dig:Tgnutls_digest_algorithm_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_x509_crq_privkey_sign(crq:Tgnutls_x509_crq_t; key:Tgnutls_privkey_t; dig:Tgnutls_digest_algorithm_t; flags:dword):longint;cdecl;external libgnutls;
{*
 * gnutls_pcert_st:
 * @pubkey: public key of parsed certificate.
 * @cert: certificate itself of parsed certificate
 * @type: type of certificate, a #gnutls_certificate_type_t type.
 *
 * A parsed certificate.
  }
type
  Pgnutls_pcert_st = ^Tgnutls_pcert_st;
  Tgnutls_pcert_st = record
      pubkey : Tgnutls_pubkey_t;
      cert : Tgnutls_datum_t;
      _type : Tgnutls_certificate_type_t;
    end;
{ This flag is unused/ignored  }

const
  GNUTLS_PCERT_NO_CERT = 1;  

function gnutls_pcert_import_x509(pcert:Pgnutls_pcert_st; crt:Tgnutls_x509_crt_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pcert_import_x509_list(pcert:Pgnutls_pcert_st; crt:Pgnutls_x509_crt_t; ncrt:Pdword; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pcert_export_x509(pcert:Pgnutls_pcert_st; crt:Pgnutls_x509_crt_t):longint;cdecl;external libgnutls;
function gnutls_pcert_list_import_x509_raw(pcerts:Pgnutls_pcert_st; pcert_max:Pdword; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pcert_list_import_x509_file(pcert_list:Pgnutls_pcert_st; pcert_list_size:Pdword; file:Pchar; format:Tgnutls_x509_crt_fmt_t; pin_fn:Tgnutls_pin_callback_t; 
           pin_fn_userdata:pointer; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pcert_import_x509_raw(pcert:Pgnutls_pcert_st; cert:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pcert_import_openpgp_raw(pcert:Pgnutls_pcert_st; cert:Pgnutls_datum_t; format:Tgnutls_openpgp_crt_fmt_t; keyid:Tgnutls_openpgp_keyid_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pcert_import_openpgp(pcert:Pgnutls_pcert_st; crt:Tgnutls_openpgp_crt_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pcert_export_openpgp(pcert:Pgnutls_pcert_st; crt:Pgnutls_openpgp_crt_t):longint;cdecl;external libgnutls;
procedure gnutls_pcert_deinit(pcert:Pgnutls_pcert_st);cdecl;external libgnutls;
function gnutls_pcert_import_rawpk(pcert:Pgnutls_pcert_st; key:Tgnutls_pubkey_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pcert_import_rawpk_raw(pcert:Pgnutls_pcert_st; rawpubkey:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; key_usage:dword; flags:dword):longint;cdecl;external libgnutls;
{ For certificate credentials  }
{ This is the same as gnutls_certificate_retrieve_function()
	 * but retrieves a gnutls_pcert_st which requires much less processing
	 * within the library.
	  }
{xxxxxxxxxxxxxxxxxxx }
type

  Tgnutls_certificate_retrieve_function2 = function (para1:Tgnutls_session_t; req_ca_rdn:Pgnutls_datum_t; nreqs:longint; pk_algos:Pgnutls_pk_algorithm_t; pk_algos_length:longint; 
               para6:PPgnutls_pcert_st; pcert_length:Pdword; privkey:Pgnutls_privkey_t):longint;cdecl;

procedure gnutls_certificate_set_retrieve_function2(cred:Tgnutls_certificate_credentials_t; func:Pgnutls_certificate_retrieve_function2);cdecl;external libgnutls;
{ set to 1  }
{ other fields may be added if version is > 1  }
type
  Pgnutls_cert_retr_st = ^Tgnutls_cert_retr_st;
  Tgnutls_cert_retr_st = record
      version : dword;cdecl;
      cred : Tgnutls_certificate_credentials_t;
      req_ca_rdn : Pgnutls_datum_t;
      nreqs : dword;
      pk_algos : Pgnutls_pk_algorithm_t;
      pk_algos_length : dword;
      padding : array[0..63] of byte;
    end;

{ When the callback sets this value, gnutls will deinitialize the given
 * values after use  }

const
  GNUTLS_CERT_RETR_DEINIT_ALL = 1;  
{xxxxxxxxxxxxxxxxxxxxxxxxxxxxx }
type

  Tgnutls_certificate_retrieve_function3 = function (para1:Tgnutls_session_t; info:Pgnutls_cert_retr_st; certs:PPgnutls_pcert_st; certs_length:Pdword; ocsp:PPgnutls_ocsp_data_st; 
               ocsp_length:Pdword; privkey:Pgnutls_privkey_t; flags:Pdword):longint;cdecl;

procedure gnutls_certificate_set_retrieve_function3(cred:Tgnutls_certificate_credentials_t; func:Pgnutls_certificate_retrieve_function3);cdecl;external libgnutls;
function gnutls_certificate_set_key(res:Tgnutls_certificate_credentials_t; names:PPchar; names_size:longint; pcert_list:Pgnutls_pcert_st; pcert_list_size:longint; 
           key:Tgnutls_privkey_t):longint;cdecl;external libgnutls;
function gnutls_pubkey_print(pubkey:Tgnutls_pubkey_t; format:Tgnutls_certificate_print_formats_t; out:Pgnutls_datum_t):longint;cdecl;external libgnutls;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GNUTLS_ABSTRACT_H  }

// === Konventiert am: 9-7-25 13:39:24 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GNUTLS_SIGN_ALGO_TO_FLAGS(sig : longint) : dword;
begin
  GNUTLS_SIGN_ALGO_TO_FLAGS:=dword(sig shl 20);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GNUTLS_FLAGS_TO_SIGN_ALGO(flags : longint) : dword;
begin
  GNUTLS_FLAGS_TO_SIGN_ALGO:=dword(flags shr 20);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pubkey_import_pkcs11_url(key,url,flags : longint) : longint;
begin
  gnutls_pubkey_import_pkcs11_url:=gnutls_pubkey_import_url(key,url,flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GNUTLS_SUBGROUP_TO_BITS(group,subgroup : longint) : dword;
begin
  GNUTLS_SUBGROUP_TO_BITS:=dword((subgroup shl 16) or group);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GNUTLS_BITS_TO_SUBGROUP(bits : longint) : longint;
begin
  GNUTLS_BITS_TO_SUBGROUP:=(bits shr 16) and $FFFF;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GNUTLS_BITS_TO_GROUP(bits : longint) : longint;
begin
  GNUTLS_BITS_TO_GROUP:=bits and $FFFF;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GNUTLS_BITS_HAVE_SUBGROUP(bits : longint) : Tbits;
begin
  GNUTLS_BITS_HAVE_SUBGROUP:=Tbits(@($FFFF0000));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_privkey_import_pkcs11_url(key,url : longint) : longint;
begin
  gnutls_privkey_import_pkcs11_url:=gnutls_privkey_import_url(key,url,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_privkey_sign_raw_data(key,flags,data,sig : longint) : longint;
begin
  gnutls_privkey_sign_raw_data:=gnutls_privkey_sign_hash(key,0,GNUTLS_PRIVKEY_SIGN_FLAG_TLS1_RSA,data,sig);
end;


end.

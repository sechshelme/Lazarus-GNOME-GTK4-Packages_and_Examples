
unit gnutls;
interface

{
  Automatically converted by H2Pas 1.0.0 from gnutls.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gnutls.h
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
Pgiovec_t  = ^giovec_t;
Pgnutls_alert_description_t  = ^gnutls_alert_description_t;
Pgnutls_alert_level_t  = ^gnutls_alert_level_t;
Pgnutls_alloc_function  = ^gnutls_alloc_function;
Pgnutls_alpn_flags_t  = ^gnutls_alpn_flags_t;
Pgnutls_anon_client_credentials_st  = ^gnutls_anon_client_credentials_st;
Pgnutls_anon_client_credentials_t  = ^gnutls_anon_client_credentials_t;
Pgnutls_anon_server_credentials_st  = ^gnutls_anon_server_credentials_st;
Pgnutls_anon_server_credentials_t  = ^gnutls_anon_server_credentials_t;
Pgnutls_anti_replay_st  = ^gnutls_anti_replay_st;
Pgnutls_anti_replay_t  = ^gnutls_anti_replay_t;
Pgnutls_buffer_st  = ^gnutls_buffer_st;
Pgnutls_buffer_t  = ^gnutls_buffer_t;
Pgnutls_calloc_function  = ^gnutls_calloc_function;
Pgnutls_certificate_client_credentials  = ^gnutls_certificate_client_credentials;
Pgnutls_certificate_credentials_st  = ^gnutls_certificate_credentials_st;
Pgnutls_certificate_credentials_t  = ^gnutls_certificate_credentials_t;
Pgnutls_certificate_flags  = ^gnutls_certificate_flags;
Pgnutls_certificate_print_formats  = ^gnutls_certificate_print_formats;
Pgnutls_certificate_print_formats_t  = ^gnutls_certificate_print_formats_t;
Pgnutls_certificate_request_t  = ^gnutls_certificate_request_t;
Pgnutls_certificate_retrieve_function  = ^gnutls_certificate_retrieve_function;
Pgnutls_certificate_server_credentials  = ^gnutls_certificate_server_credentials;
Pgnutls_certificate_status_t  = ^gnutls_certificate_status_t;
Pgnutls_certificate_type_t  = ^gnutls_certificate_type_t;
Pgnutls_certificate_verify_function  = ^gnutls_certificate_verify_function;
Pgnutls_channel_binding_t  = ^gnutls_channel_binding_t;
Pgnutls_cipher_algorithm  = ^gnutls_cipher_algorithm;
Pgnutls_cipher_algorithm_t  = ^gnutls_cipher_algorithm_t;
Pgnutls_close_request_t  = ^gnutls_close_request_t;
Pgnutls_compression_method_t  = ^gnutls_compression_method_t;
Pgnutls_credentials_type_t  = ^gnutls_credentials_type_t;
Pgnutls_ctype_target_t  = ^gnutls_ctype_target_t;
Pgnutls_datum_t  = ^gnutls_datum_t;
Pgnutls_dh_params_int  = ^gnutls_dh_params_int;
Pgnutls_dh_params_t  = ^gnutls_dh_params_t;
Pgnutls_digest_algorithm_t  = ^gnutls_digest_algorithm_t;
Pgnutls_ecc_curve_t  = ^gnutls_ecc_curve_t;
Pgnutls_ext_flags_t  = ^gnutls_ext_flags_t;
Pgnutls_ext_parse_type_t  = ^gnutls_ext_parse_type_t;
Pgnutls_ext_priv_data_t  = ^gnutls_ext_priv_data_t;
Pgnutls_fips140_context_st  = ^gnutls_fips140_context_st;
Pgnutls_fips140_context_t  = ^gnutls_fips140_context_t;
Pgnutls_fips140_operation_state_t  = ^gnutls_fips140_operation_state_t;
Pgnutls_fips_mode_t  = ^gnutls_fips_mode_t;
Pgnutls_gost_paramset_t  = ^gnutls_gost_paramset_t;
Pgnutls_group_t  = ^gnutls_group_t;
Pgnutls_handshake_description_t  = ^gnutls_handshake_description_t;
Pgnutls_init_flags_t  = ^gnutls_init_flags_t;
Pgnutls_kx_algorithm_t  = ^gnutls_kx_algorithm_t;
Pgnutls_library_config_st  = ^gnutls_library_config_st;
Pgnutls_mac_algorithm_t  = ^gnutls_mac_algorithm_t;
Pgnutls_ocsp_data_st  = ^gnutls_ocsp_data_st;
Pgnutls_openpgp_crt_int  = ^gnutls_openpgp_crt_int;
Pgnutls_openpgp_crt_status_t  = ^gnutls_openpgp_crt_status_t;
Pgnutls_openpgp_crt_t  = ^gnutls_openpgp_crt_t;
Pgnutls_openpgp_keyring_int  = ^gnutls_openpgp_keyring_int;
Pgnutls_openpgp_keyring_t  = ^gnutls_openpgp_keyring_t;
Pgnutls_openpgp_privkey_int  = ^gnutls_openpgp_privkey_int;
Pgnutls_openpgp_privkey_t  = ^gnutls_openpgp_privkey_t;
Pgnutls_packet_t  = ^gnutls_packet_t;
Pgnutls_params_function  = ^gnutls_params_function;
Pgnutls_params_st  = ^gnutls_params_st;
Pgnutls_params_type_t  = ^gnutls_params_type_t;
Pgnutls_pin_flag_t  = ^gnutls_pin_flag_t;
Pgnutls_pk_algorithm_t  = ^gnutls_pk_algorithm_t;
Pgnutls_pkcs11_privkey_st  = ^gnutls_pkcs11_privkey_st;
Pgnutls_pkcs11_privkey_t  = ^gnutls_pkcs11_privkey_t;
Pgnutls_priority_st  = ^gnutls_priority_st;
Pgnutls_priority_t  = ^gnutls_priority_t;
Pgnutls_privkey_st  = ^gnutls_privkey_st;
Pgnutls_privkey_t  = ^gnutls_privkey_t;
Pgnutls_privkey_type_t  = ^gnutls_privkey_type_t;
Pgnutls_protocol_t  = ^gnutls_protocol_t;
Pgnutls_psk_client_credentials_function  = ^gnutls_psk_client_credentials_function;
Pgnutls_psk_client_credentials_function2  = ^gnutls_psk_client_credentials_function2;
Pgnutls_psk_client_credentials_function3  = ^gnutls_psk_client_credentials_function3;
Pgnutls_psk_client_credentials_st  = ^gnutls_psk_client_credentials_st;
Pgnutls_psk_client_credentials_t  = ^gnutls_psk_client_credentials_t;
Pgnutls_psk_key_flags  = ^gnutls_psk_key_flags;
Pgnutls_psk_server_credentials_function  = ^gnutls_psk_server_credentials_function;
Pgnutls_psk_server_credentials_function2  = ^gnutls_psk_server_credentials_function2;
Pgnutls_psk_server_credentials_function3  = ^gnutls_psk_server_credentials_function3;
Pgnutls_psk_server_credentials_st  = ^gnutls_psk_server_credentials_st;
Pgnutls_psk_server_credentials_t  = ^gnutls_psk_server_credentials_t;
Pgnutls_pubkey_st  = ^gnutls_pubkey_st;
Pgnutls_pubkey_t  = ^gnutls_pubkey_t;
Pgnutls_random_art  = ^gnutls_random_art;
Pgnutls_random_art_t  = ^gnutls_random_art_t;
Pgnutls_range_st  = ^gnutls_range_st;
Pgnutls_realloc_function  = ^gnutls_realloc_function;
Pgnutls_record_encryption_level_t  = ^gnutls_record_encryption_level_t;
Pgnutls_retr2_st  = ^gnutls_retr2_st;
Pgnutls_rsa_params_t  = ^gnutls_rsa_params_t;
Pgnutls_sec_param_t  = ^gnutls_sec_param_t;
Pgnutls_server_name_type_t  = ^gnutls_server_name_type_t;
Pgnutls_session_flags_t  = ^gnutls_session_flags_t;
Pgnutls_session_int  = ^gnutls_session_int;
Pgnutls_session_t  = ^gnutls_session_t;
Pgnutls_sign_algorithm_t  = ^gnutls_sign_algorithm_t;
Pgnutls_srp_client_credentials_function  = ^gnutls_srp_client_credentials_function;
Pgnutls_srp_client_credentials_st  = ^gnutls_srp_client_credentials_st;
Pgnutls_srp_client_credentials_t  = ^gnutls_srp_client_credentials_t;
Pgnutls_srp_server_credentials_function  = ^gnutls_srp_server_credentials_function;
Pgnutls_srp_server_credentials_st  = ^gnutls_srp_server_credentials_st;
Pgnutls_srp_server_credentials_t  = ^gnutls_srp_server_credentials_t;
Pgnutls_srtp_profile_t  = ^gnutls_srtp_profile_t;
Pgnutls_supplemental_data_format_type_t  = ^gnutls_supplemental_data_format_type_t;
Pgnutls_tdb_int  = ^gnutls_tdb_int;
Pgnutls_tdb_t  = ^gnutls_tdb_t;
Pgnutls_transport_ktls_enable_flags_t  = ^gnutls_transport_ktls_enable_flags_t;
Pgnutls_transport_ptr_t  = ^gnutls_transport_ptr_t;
Pgnutls_typed_vdata_st  = ^gnutls_typed_vdata_st;
Pgnutls_vdata_types_t  = ^gnutls_vdata_types_t;
Pgnutls_x509_crl_int  = ^gnutls_x509_crl_int;
Pgnutls_x509_crl_t  = ^gnutls_x509_crl_t;
Pgnutls_x509_crq_int  = ^gnutls_x509_crq_int;
Pgnutls_x509_crq_t  = ^gnutls_x509_crq_t;
Pgnutls_x509_crt_fmt_t  = ^gnutls_x509_crt_fmt_t;
Pgnutls_x509_crt_int  = ^gnutls_x509_crt_int;
Pgnutls_x509_crt_t  = ^gnutls_x509_crt_t;
Pgnutls_x509_privkey_int  = ^gnutls_x509_privkey_int;
Pgnutls_x509_privkey_t  = ^gnutls_x509_privkey_t;
Pgnutls_x509_subject_alt_name_t  = ^gnutls_x509_subject_alt_name_t;
Plongint  = ^longint;
Pmbuffer_st  = ^mbuffer_st;
Poff_t  = ^off_t;
Psize_t  = ^size_t;
Ptime_t  = ^time_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- c -*-
 * Copyright (C) 2000-2016 Free Software Foundation, Inc.
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
{ This file contains the types and prototypes for all the
 * high level functionality of the gnutls main library.
 *
 * If the optional C++ binding was built, it is available in
 * gnutls/gnutlsxx.h.
 *
 * The openssl compatibility layer (which is under the GNU GPL
 * license) is in gnutls/openssl.h.
 *
 * The low level cipher functionality is in gnutls/crypto.h.
  }
{$ifndef GNUTLS_GNUTLS_H}
{$define GNUTLS_GNUTLS_H}
{ Get ssize_t.  }
{$include <sys/types.h>}
{ Get size_t.  }
{$include <stddef.h>}
{ Get time_t.  }
{$include <time.h>}
{ C++ extern C conditionnal removed }

const
  GNUTLS_VERSION = '3.8.3';  
{ clang-format off  }
  GNUTLS_VERSION_MAJOR = 3;  
  GNUTLS_VERSION_MINOR = 8;  
  GNUTLS_VERSION_PATCH = 3;  
  GNUTLS_VERSION_NUMBER = $030803;  
{ clang-format on  }
  GNUTLS_CIPHER_RIJNDAEL_128_CBC = GNUTLS_CIPHER_AES_128_CBC;  
  GNUTLS_CIPHER_RIJNDAEL_256_CBC = GNUTLS_CIPHER_AES_256_CBC;  
  GNUTLS_CIPHER_RIJNDAEL_CBC = GNUTLS_CIPHER_AES_128_CBC;  
  GNUTLS_CIPHER_ARCFOUR = GNUTLS_CIPHER_ARCFOUR_128;  
{ Use the following definition globally in your program to disable
 * implicit initialization of gnutls. 
xxxxxxxxxxxxxxxxxxxxx }
{
#define GNUTLS_SKIP_GLOBAL_INIT             \
	int _gnutls_global_init_skip(void); \
	int _gnutls_global_init_skip(void)  \
	                                   \
		return 1;                   \
	
 }
{*
 * gnutls_cipher_algorithm_t:
 * @GNUTLS_CIPHER_UNKNOWN: Value to identify an unknown/unsupported algorithm.
 * @GNUTLS_CIPHER_NULL: The NULL (identity) encryption algorithm.
 * @GNUTLS_CIPHER_ARCFOUR_128: ARCFOUR stream cipher with 128-bit keys.
 * @GNUTLS_CIPHER_3DES_CBC: 3DES in CBC mode.
 * @GNUTLS_CIPHER_AES_128_CBC: AES in CBC mode with 128-bit keys.
 * @GNUTLS_CIPHER_AES_192_CBC: AES in CBC mode with 192-bit keys.
 * @GNUTLS_CIPHER_AES_256_CBC: AES in CBC mode with 256-bit keys.
 * @GNUTLS_CIPHER_AES_128_CFB8: AES in CFB8 mode with 128-bit keys.
 * @GNUTLS_CIPHER_AES_192_CFB8: AES in CFB8 mode with 192-bit keys.
 * @GNUTLS_CIPHER_AES_256_CFB8: AES in CFB8 mode with 256-bit keys.
 * @GNUTLS_CIPHER_ARCFOUR_40: ARCFOUR stream cipher with 40-bit keys.
 * @GNUTLS_CIPHER_CAMELLIA_128_CBC: Camellia in CBC mode with 128-bit keys.
 * @GNUTLS_CIPHER_CAMELLIA_192_CBC: Camellia in CBC mode with 192-bit keys.
 * @GNUTLS_CIPHER_CAMELLIA_256_CBC: Camellia in CBC mode with 256-bit keys.
 * @GNUTLS_CIPHER_RC2_40_CBC: RC2 in CBC mode with 40-bit keys.
 * @GNUTLS_CIPHER_DES_CBC: DES in CBC mode (56-bit keys).
 * @GNUTLS_CIPHER_AES_128_GCM: AES in GCM mode with 128-bit keys (AEAD).
 * @GNUTLS_CIPHER_AES_256_GCM: AES in GCM mode with 256-bit keys (AEAD).
 * @GNUTLS_CIPHER_AES_128_CCM: AES in CCM mode with 128-bit keys (AEAD).
 * @GNUTLS_CIPHER_AES_256_CCM: AES in CCM mode with 256-bit keys (AEAD).
 * @GNUTLS_CIPHER_AES_128_CCM_8: AES in CCM mode with 64-bit tag and 128-bit keys (AEAD).
 * @GNUTLS_CIPHER_AES_256_CCM_8: AES in CCM mode with 64-bit tag and 256-bit keys (AEAD).
 * @GNUTLS_CIPHER_CAMELLIA_128_GCM: CAMELLIA in GCM mode with 128-bit keys (AEAD).
 * @GNUTLS_CIPHER_CAMELLIA_256_GCM: CAMELLIA in GCM mode with 256-bit keys (AEAD).
 * @GNUTLS_CIPHER_SALSA20_256: Salsa20 with 256-bit keys.
 * @GNUTLS_CIPHER_ESTREAM_SALSA20_256: Estream's Salsa20 variant with 256-bit keys.
 * @GNUTLS_CIPHER_CHACHA20_32: Chacha20 cipher with 96-bit nonces and 32-bit block counters.
 * @GNUTLS_CIPHER_CHACHA20_64: Chacha20 cipher with 64-bit nonces and 64-bit block counters.
 * @GNUTLS_CIPHER_CHACHA20_POLY1305: The Chacha20 cipher with the Poly1305 authenticator (AEAD).
 * @GNUTLS_CIPHER_GOST28147_TC26Z_CFB: GOST 28147-89 (Magma) cipher in CFB mode with TC26 Z S-box.
 * @GNUTLS_CIPHER_GOST28147_CPA_CFB: GOST 28147-89 (Magma) cipher in CFB mode with CryptoPro A S-box.
 * @GNUTLS_CIPHER_GOST28147_CPB_CFB: GOST 28147-89 (Magma) cipher in CFB mode with CryptoPro B S-box.
 * @GNUTLS_CIPHER_GOST28147_CPC_CFB: GOST 28147-89 (Magma) cipher in CFB mode with CryptoPro C S-box.
 * @GNUTLS_CIPHER_GOST28147_CPD_CFB: GOST 28147-89 (Magma) cipher in CFB mode with CryptoPro D S-box.
 * @GNUTLS_CIPHER_AES_128_XTS: AES in XTS mode with 128-bit key + 128bit tweak key.
 * @GNUTLS_CIPHER_AES_256_XTS: AES in XTS mode with 256-bit key + 256bit tweak key.
 *                             Note that the XTS ciphers are message oriented.
 *                             The whole message needs to be provided with a single call, because
 *                             cipher-stealing requires to know where the message actually terminates
 *                             in order to be able to compute where the stealing occurs.
 * @GNUTLS_CIPHER_GOST28147_TC26Z_CNT: GOST 28147-89 (Magma) cipher in CNT mode with TC26 Z S-box.
 * @GNUTLS_CIPHER_MAGMA_CTR_ACPKM: GOST R 34.12-2015 (Magma) cipher in CTR-ACPKM mode.
 * @GNUTLS_CIPHER_KUZNYECHIK_CTR_ACPKM: GOST R 34.12-2015 (Kuznyechik) cipher in CTR-ACPKM mode.
 * @GNUTLS_CIPHER_IDEA_PGP_CFB: IDEA in CFB mode (placeholder - unsupported).
 * @GNUTLS_CIPHER_3DES_PGP_CFB: 3DES in CFB mode (placeholder - unsupported).
 * @GNUTLS_CIPHER_CAST5_PGP_CFB: CAST5 in CFB mode (placeholder - unsupported).
 * @GNUTLS_CIPHER_BLOWFISH_PGP_CFB: Blowfish in CFB mode (placeholder - unsupported).
 * @GNUTLS_CIPHER_SAFER_SK128_PGP_CFB: Safer-SK in CFB mode with 128-bit keys (placeholder - unsupported).
 * @GNUTLS_CIPHER_AES128_PGP_CFB: AES in CFB mode with 128-bit keys (placeholder - unsupported).
 * @GNUTLS_CIPHER_AES192_PGP_CFB: AES in CFB mode with 192-bit keys (placeholder - unsupported).
 * @GNUTLS_CIPHER_AES256_PGP_CFB: AES in CFB mode with 256-bit keys (placeholder - unsupported).
 * @GNUTLS_CIPHER_TWOFISH_PGP_CFB: Twofish in CFB mode (placeholder - unsupported).
 * @GNUTLS_CIPHER_AES_128_SIV: AES in SIV mode with 128-bit key.
 * @GNUTLS_CIPHER_AES_256_SIV: AES in SIV mode with 256-bit key.
 *                             Note that the SIV ciphers can only be used with
 *                             the AEAD interface, and the IV plays a role as
 *                             the authentication tag while it is prepended to
 *                             the cipher text.
 * @GNUTLS_CIPHER_AES_192_GCM: AES in GCM mode with 192-bit keys (AEAD).
 * @GNUTLS_CIPHER_AES_128_SIV_GCM: AES in SIV-GCM mode with 128-bit key.
 * @GNUTLS_CIPHER_AES_256_SIV_GCM: AES in SIV-GCM mode with 256-bit key.
 *
 * Enumeration of different symmetric encryption algorithms.
  }
{ used only for PGP internals. Ignored in TLS/SSL
	  }
type
  Pgnutls_cipher_algorithm = ^Tgnutls_cipher_algorithm;
  Tgnutls_cipher_algorithm =  Longint;
  Const
    GNUTLS_CIPHER_UNKNOWN = 0;
    GNUTLS_CIPHER_NULL = 1;
    GNUTLS_CIPHER_ARCFOUR_128 = 2;
    GNUTLS_CIPHER_3DES_CBC = 3;
    GNUTLS_CIPHER_AES_128_CBC = 4;
    GNUTLS_CIPHER_AES_256_CBC = 5;
    GNUTLS_CIPHER_ARCFOUR_40 = 6;
    GNUTLS_CIPHER_CAMELLIA_128_CBC = 7;
    GNUTLS_CIPHER_CAMELLIA_256_CBC = 8;
    GNUTLS_CIPHER_AES_192_CBC = 9;
    GNUTLS_CIPHER_AES_128_GCM = 10;
    GNUTLS_CIPHER_AES_256_GCM = 11;
    GNUTLS_CIPHER_CAMELLIA_192_CBC = 12;
    GNUTLS_CIPHER_SALSA20_256 = 13;
    GNUTLS_CIPHER_ESTREAM_SALSA20_256 = 14;
    GNUTLS_CIPHER_CAMELLIA_128_GCM = 15;
    GNUTLS_CIPHER_CAMELLIA_256_GCM = 16;
    GNUTLS_CIPHER_RC2_40_CBC = 17;
    GNUTLS_CIPHER_DES_CBC = 18;
    GNUTLS_CIPHER_AES_128_CCM = 19;
    GNUTLS_CIPHER_AES_256_CCM = 20;
    GNUTLS_CIPHER_AES_128_CCM_8 = 21;
    GNUTLS_CIPHER_AES_256_CCM_8 = 22;
    GNUTLS_CIPHER_CHACHA20_POLY1305 = 23;
    GNUTLS_CIPHER_GOST28147_TC26Z_CFB = 24;
    GNUTLS_CIPHER_GOST28147_CPA_CFB = 25;
    GNUTLS_CIPHER_GOST28147_CPB_CFB = 26;
    GNUTLS_CIPHER_GOST28147_CPC_CFB = 27;
    GNUTLS_CIPHER_GOST28147_CPD_CFB = 28;
    GNUTLS_CIPHER_AES_128_CFB8 = 29;
    GNUTLS_CIPHER_AES_192_CFB8 = 30;
    GNUTLS_CIPHER_AES_256_CFB8 = 31;
    GNUTLS_CIPHER_AES_128_XTS = 32;
    GNUTLS_CIPHER_AES_256_XTS = 33;
    GNUTLS_CIPHER_GOST28147_TC26Z_CNT = 34;
    GNUTLS_CIPHER_CHACHA20_64 = 35;
    GNUTLS_CIPHER_CHACHA20_32 = 36;
    GNUTLS_CIPHER_AES_128_SIV = 37;
    GNUTLS_CIPHER_AES_256_SIV = 38;
    GNUTLS_CIPHER_AES_192_GCM = 39;
    GNUTLS_CIPHER_MAGMA_CTR_ACPKM = 40;
    GNUTLS_CIPHER_KUZNYECHIK_CTR_ACPKM = 41;
    GNUTLS_CIPHER_AES_128_SIV_GCM = 42;
    GNUTLS_CIPHER_AES_256_SIV_GCM = 43;
    GNUTLS_CIPHER_IDEA_PGP_CFB = 200;
    GNUTLS_CIPHER_3DES_PGP_CFB = 201;
    GNUTLS_CIPHER_CAST5_PGP_CFB = 202;
    GNUTLS_CIPHER_BLOWFISH_PGP_CFB = 203;
    GNUTLS_CIPHER_SAFER_SK128_PGP_CFB = 204;
    GNUTLS_CIPHER_AES128_PGP_CFB = 205;
    GNUTLS_CIPHER_AES192_PGP_CFB = 206;
    GNUTLS_CIPHER_AES256_PGP_CFB = 207;
    GNUTLS_CIPHER_TWOFISH_PGP_CFB = 208;
;
  Tgnutls_cipher_algorithm_t = Tgnutls_cipher_algorithm;
  Pgnutls_cipher_algorithm_t = ^Tgnutls_cipher_algorithm_t;
{*
 * gnutls_kx_algorithm_t:
 * @GNUTLS_KX_UNKNOWN: Unknown key-exchange algorithm.
 * @GNUTLS_KX_RSA: RSA key-exchange algorithm.
 * @GNUTLS_KX_DHE_DSS: DHE-DSS key-exchange algorithm.
 * @GNUTLS_KX_DHE_RSA: DHE-RSA key-exchange algorithm.
 * @GNUTLS_KX_ECDHE_RSA: ECDHE-RSA key-exchange algorithm.
 * @GNUTLS_KX_ECDHE_ECDSA: ECDHE-ECDSA key-exchange algorithm.
 * @GNUTLS_KX_ANON_DH: Anon-DH key-exchange algorithm.
 * @GNUTLS_KX_ANON_ECDH: Anon-ECDH key-exchange algorithm.
 * @GNUTLS_KX_SRP: SRP key-exchange algorithm.
 * @GNUTLS_KX_RSA_EXPORT: RSA-EXPORT key-exchange algorithm (defunc).
 * @GNUTLS_KX_SRP_RSA: SRP-RSA key-exchange algorithm.
 * @GNUTLS_KX_SRP_DSS: SRP-DSS key-exchange algorithm.
 * @GNUTLS_KX_PSK: PSK key-exchange algorithm.
 * @GNUTLS_KX_DHE_PSK: DHE-PSK key-exchange algorithm.
 * @GNUTLS_KX_ECDHE_PSK: ECDHE-PSK key-exchange algorithm.
 * @GNUTLS_KX_RSA_PSK: RSA-PSK key-exchange algorithm.
 * @GNUTLS_KX_VKO_GOST_12: VKO GOST R 34.10-2012 key-exchange algorithm.
 *
 * Enumeration of different key exchange algorithms.
  }
type
  Pgnutls_kx_algorithm_t = ^Tgnutls_kx_algorithm_t;
  Tgnutls_kx_algorithm_t =  Longint;
  Const
    GNUTLS_KX_UNKNOWN = 0;
    GNUTLS_KX_RSA = 1;
    GNUTLS_KX_DHE_DSS = 2;
    GNUTLS_KX_DHE_RSA = 3;
    GNUTLS_KX_ANON_DH = 4;
    GNUTLS_KX_SRP = 5;
    GNUTLS_KX_RSA_EXPORT = 6;
    GNUTLS_KX_SRP_RSA = 7;
    GNUTLS_KX_SRP_DSS = 8;
    GNUTLS_KX_PSK = 9;
    GNUTLS_KX_DHE_PSK = 10;
    GNUTLS_KX_ANON_ECDH = 11;
    GNUTLS_KX_ECDHE_RSA = 12;
    GNUTLS_KX_ECDHE_ECDSA = 13;
    GNUTLS_KX_ECDHE_PSK = 14;
    GNUTLS_KX_RSA_PSK = 15;
    GNUTLS_KX_VKO_GOST_12 = 16;
;
{*
 * gnutls_params_type_t:
 * @GNUTLS_PARAMS_RSA_EXPORT: Session RSA-EXPORT parameters (defunc).
 * @GNUTLS_PARAMS_DH: Session Diffie-Hellman parameters.
 * @GNUTLS_PARAMS_ECDH: Session Elliptic-Curve Diffie-Hellman parameters.
 *
 * Enumeration of different TLS session parameter types.
  }
type
  Pgnutls_params_type_t = ^Tgnutls_params_type_t;
  Tgnutls_params_type_t =  Longint;
  Const
    GNUTLS_PARAMS_RSA_EXPORT = 1;
    GNUTLS_PARAMS_DH = 2;
    GNUTLS_PARAMS_ECDH = 3;
;
{*
 * gnutls_credentials_type_t:
 * @GNUTLS_CRD_CERTIFICATE: Certificate credential.
 * @GNUTLS_CRD_ANON: Anonymous credential.
 * @GNUTLS_CRD_SRP: SRP credential.
 * @GNUTLS_CRD_PSK: PSK credential.
 * @GNUTLS_CRD_IA: IA credential.
 *
 * Enumeration of different credential types.
  }
type
  Pgnutls_credentials_type_t = ^Tgnutls_credentials_type_t;
  Tgnutls_credentials_type_t =  Longint;
  Const
    GNUTLS_CRD_CERTIFICATE = 1;
    GNUTLS_CRD_ANON = 2;
    GNUTLS_CRD_SRP = 3;
    GNUTLS_CRD_PSK = 4;
    GNUTLS_CRD_IA = 5;
;
  GNUTLS_MAC_SHA = GNUTLS_MAC_SHA1;  
  GNUTLS_DIG_SHA = GNUTLS_DIG_SHA1;  
{*
 * gnutls_mac_algorithm_t:
 * @GNUTLS_MAC_UNKNOWN: Unknown MAC algorithm.
 * @GNUTLS_MAC_NULL: NULL MAC algorithm (empty output).
 * @GNUTLS_MAC_MD5: HMAC-MD5 algorithm.
 * @GNUTLS_MAC_SHA1: HMAC-SHA-1 algorithm.
 * @GNUTLS_MAC_RMD160: HMAC-RMD160 algorithm.
 * @GNUTLS_MAC_MD2: HMAC-MD2 algorithm.
 * @GNUTLS_MAC_SHA256: HMAC-SHA-256 algorithm.
 * @GNUTLS_MAC_SHA384: HMAC-SHA-384 algorithm.
 * @GNUTLS_MAC_SHA512: HMAC-SHA-512 algorithm.
 * @GNUTLS_MAC_SHA224: HMAC-SHA-224 algorithm.
 * @GNUTLS_MAC_MD5_SHA1: Combined MD5+SHA1 MAC placeholder.
 * @GNUTLS_MAC_GOSTR_94: HMAC GOST R 34.11-94 algorithm.
 * @GNUTLS_MAC_STREEBOG_256: HMAC GOST R 34.11-2001 (Streebog) algorithm, 256 bit.
 * @GNUTLS_MAC_STREEBOG_512: HMAC GOST R 34.11-2001 (Streebog) algorithm, 512 bit.
 * @GNUTLS_MAC_AEAD: MAC implicit through AEAD cipher.
 * @GNUTLS_MAC_UMAC_96: The UMAC-96 MAC algorithm (requires nonce).
 * @GNUTLS_MAC_UMAC_128: The UMAC-128 MAC algorithm (requires nonce).
 * @GNUTLS_MAC_AES_CMAC_128: The AES-CMAC-128 MAC algorithm.
 * @GNUTLS_MAC_AES_CMAC_256: The AES-CMAC-256 MAC algorithm.
 * @GNUTLS_MAC_AES_GMAC_128: The AES-GMAC-128 MAC algorithm (requires nonce).
 * @GNUTLS_MAC_AES_GMAC_192: The AES-GMAC-192 MAC algorithm (requires nonce).
 * @GNUTLS_MAC_AES_GMAC_256: The AES-GMAC-256 MAC algorithm (requires nonce).
 * @GNUTLS_MAC_SHA3_224: Reserved; unimplemented.
 * @GNUTLS_MAC_SHA3_256: Reserved; unimplemented.
 * @GNUTLS_MAC_SHA3_384: Reserved; unimplemented.
 * @GNUTLS_MAC_SHA3_512: Reserved; unimplemented.
 * @GNUTLS_MAC_GOST28147_TC26Z_IMIT: The GOST 28147-89 working in IMIT mode with TC26 Z S-box.
 * @GNUTLS_MAC_SHAKE_128: Reserved; unimplemented.
 * @GNUTLS_MAC_SHAKE_256: Reserved; unimplemented.
 * @GNUTLS_MAC_MAGMA_OMAC: GOST R 34.12-2015 (Magma) in OMAC (CMAC) mode.
 * @GNUTLS_MAC_KUZNYECHIK_OMAC: GOST R 34.12-2015 (Kuznyechik) in OMAC (CMAC) mode.
 *
 * Enumeration of different Message Authentication Code (MAC)
 * algorithms.
  }
{ reserved: no implementation  }
{ reserved: no implementation  }
{ reserved: no implementation  }
{ reserved: no implementation  }
{ reserved: no implementation  }
{ If you add anything here, make sure you align with
	   gnutls_digest_algorithm_t.  }
{ indicates that MAC is on the cipher  }
type
  Pgnutls_mac_algorithm_t = ^Tgnutls_mac_algorithm_t;
  Tgnutls_mac_algorithm_t =  Longint;
  Const
    GNUTLS_MAC_UNKNOWN = 0;
    GNUTLS_MAC_NULL = 1;
    GNUTLS_MAC_MD5 = 2;
    GNUTLS_MAC_SHA1 = 3;
    GNUTLS_MAC_RMD160 = 4;
    GNUTLS_MAC_MD2 = 5;
    GNUTLS_MAC_SHA256 = 6;
    GNUTLS_MAC_SHA384 = 7;
    GNUTLS_MAC_SHA512 = 8;
    GNUTLS_MAC_SHA224 = 9;
    GNUTLS_MAC_SHA3_224 = 10;
    GNUTLS_MAC_SHA3_256 = 11;
    GNUTLS_MAC_SHA3_384 = 12;
    GNUTLS_MAC_SHA3_512 = 13;
    GNUTLS_MAC_MD5_SHA1 = 14;
    GNUTLS_MAC_GOSTR_94 = 15;
    GNUTLS_MAC_STREEBOG_256 = 16;
    GNUTLS_MAC_STREEBOG_512 = 17;
    GNUTLS_MAC_AEAD = 200;
    GNUTLS_MAC_UMAC_96 = 201;
    GNUTLS_MAC_UMAC_128 = 202;
    GNUTLS_MAC_AES_CMAC_128 = 203;
    GNUTLS_MAC_AES_CMAC_256 = 204;
    GNUTLS_MAC_AES_GMAC_128 = 205;
    GNUTLS_MAC_AES_GMAC_192 = 206;
    GNUTLS_MAC_AES_GMAC_256 = 207;
    GNUTLS_MAC_GOST28147_TC26Z_IMIT = 208;
    GNUTLS_MAC_SHAKE_128 = 209;
    GNUTLS_MAC_SHAKE_256 = 210;
    GNUTLS_MAC_MAGMA_OMAC = 211;
    GNUTLS_MAC_KUZNYECHIK_OMAC = 212;
;
{*
 * gnutls_digest_algorithm_t:
 * @GNUTLS_DIG_UNKNOWN: Unknown hash algorithm.
 * @GNUTLS_DIG_NULL: NULL hash algorithm (empty output).
 * @GNUTLS_DIG_MD5: MD5 algorithm.
 * @GNUTLS_DIG_SHA1: SHA-1 algorithm.
 * @GNUTLS_DIG_RMD160: RMD160 algorithm.
 * @GNUTLS_DIG_MD2: MD2 algorithm.
 * @GNUTLS_DIG_SHA256: SHA-256 algorithm.
 * @GNUTLS_DIG_SHA384: SHA-384 algorithm.
 * @GNUTLS_DIG_SHA512: SHA-512 algorithm.
 * @GNUTLS_DIG_SHA224: SHA-224 algorithm.
 * @GNUTLS_DIG_SHA3_224: SHA3-224 algorithm.
 * @GNUTLS_DIG_SHA3_256: SHA3-256 algorithm.
 * @GNUTLS_DIG_SHA3_384: SHA3-384 algorithm.
 * @GNUTLS_DIG_SHA3_512: SHA3-512 algorithm.
 * @GNUTLS_DIG_MD5_SHA1: Combined MD5+SHA1 algorithm.
 * @GNUTLS_DIG_GOSTR_94: GOST R 34.11-94 algorithm.
 * @GNUTLS_DIG_STREEBOG_256: GOST R 34.11-2001 (Streebog) algorithm, 256 bit.
 * @GNUTLS_DIG_STREEBOG_512: GOST R 34.11-2001 (Streebog) algorithm, 512 bit.
 * @GNUTLS_DIG_SHAKE_128: Reserved; unimplemented.
 * @GNUTLS_DIG_SHAKE_256: Reserved; unimplemented.
 *
 * Enumeration of different digest (hash) algorithms.
  }
{ If you add anything here, make sure you align with
	       gnutls_mac_algorithm_t.  }
type
  Pgnutls_digest_algorithm_t = ^Tgnutls_digest_algorithm_t;
  Tgnutls_digest_algorithm_t =  Longint;
  Const
    GNUTLS_DIG_UNKNOWN = GNUTLS_MAC_UNKNOWN;
    GNUTLS_DIG_NULL = GNUTLS_MAC_NULL;
    GNUTLS_DIG_MD5 = GNUTLS_MAC_MD5;
    GNUTLS_DIG_SHA1 = GNUTLS_MAC_SHA1;
    GNUTLS_DIG_RMD160 = GNUTLS_MAC_RMD160;
    GNUTLS_DIG_MD2 = GNUTLS_MAC_MD2;
    GNUTLS_DIG_SHA256 = GNUTLS_MAC_SHA256;
    GNUTLS_DIG_SHA384 = GNUTLS_MAC_SHA384;
    GNUTLS_DIG_SHA512 = GNUTLS_MAC_SHA512;
    GNUTLS_DIG_SHA224 = GNUTLS_MAC_SHA224;
    GNUTLS_DIG_SHA3_224 = GNUTLS_MAC_SHA3_224;
    GNUTLS_DIG_SHA3_256 = GNUTLS_MAC_SHA3_256;
    GNUTLS_DIG_SHA3_384 = GNUTLS_MAC_SHA3_384;
    GNUTLS_DIG_SHA3_512 = GNUTLS_MAC_SHA3_512;
    GNUTLS_DIG_MD5_SHA1 = GNUTLS_MAC_MD5_SHA1;
    GNUTLS_DIG_GOSTR_94 = GNUTLS_MAC_GOSTR_94;
    GNUTLS_DIG_STREEBOG_256 = GNUTLS_MAC_STREEBOG_256;
    GNUTLS_DIG_STREEBOG_512 = GNUTLS_MAC_STREEBOG_512;
    GNUTLS_DIG_SHAKE_128 = GNUTLS_MAC_SHAKE_128;
    GNUTLS_DIG_SHAKE_256 = GNUTLS_MAC_SHAKE_256;
;
{ exported for other gnutls headers. This is the maximum number of
   * algorithms (ciphers, kx or macs).
    }
  GNUTLS_MAX_ALGORITHM_NUM = 128;  
  GNUTLS_MAX_SESSION_ID_SIZE = 32;  
{*
 * gnutls_compression_method_t:
 * @GNUTLS_COMP_UNKNOWN: Unknown compression method.
 * @GNUTLS_COMP_NULL: The NULL compression method (no compression).
 * @GNUTLS_COMP_DEFLATE: The DEFLATE compression method from zlib.
 * @GNUTLS_COMP_ZLIB: Same as %GNUTLS_COMP_DEFLATE.
 * @GNUTLS_COMP_BROTLI: Brotli compression method.
 * @GNUTLS_COMP_ZSTD: Zstandard compression method.
 *
 * Enumeration of different TLS compression methods.
  }
type
  Pgnutls_compression_method_t = ^Tgnutls_compression_method_t;
  Tgnutls_compression_method_t =  Longint;
  Const
    GNUTLS_COMP_UNKNOWN = 0;
    GNUTLS_COMP_NULL = 1;
    GNUTLS_COMP_DEFLATE = 2;
    GNUTLS_COMP_ZLIB = GNUTLS_COMP_DEFLATE;
    GNUTLS_COMP_BROTLI = 3;
    GNUTLS_COMP_ZSTD = 4;
;
{*
 * gnutls_init_flags_t:
 *
 * @GNUTLS_SERVER: Connection end is a server.
 * @GNUTLS_CLIENT: Connection end is a client.
 * @GNUTLS_DATAGRAM: Connection is datagram oriented (DTLS). Since 3.0.0.
 * @GNUTLS_NONBLOCK: Connection should not block. Since 3.0.0.
 * @GNUTLS_NO_SIGNAL: In systems where SIGPIPE is delivered on send, it will be disabled. That flag has effect in systems which support the MSG_NOSIGNAL sockets flag (since 3.4.2).
 * @GNUTLS_NO_DEFAULT_EXTENSIONS: Do not enable any TLS extensions by default such as session tickets and OCSP certificate status request (since 3.1.2). As TLS 1.2 and later require extensions this option is considered obsolete and should not be used.
 * @GNUTLS_NO_REPLAY_PROTECTION: Disable any replay protection in DTLS. This must only be used if  replay protection is achieved using other means. Since 3.2.2.
 * @GNUTLS_ALLOW_ID_CHANGE: Allow the peer to replace its certificate, or change its ID during a rehandshake. This change is often used in attacks and thus prohibited by default. Since 3.5.0.
 * @GNUTLS_ENABLE_FALSE_START: Enable the TLS false start on client side if the negotiated ciphersuites allow it. This will enable sending data prior to the handshake being complete, and may introduce a risk of crypto failure when combined with certain key exchanged; for that GnuTLS may not enable that option in ciphersuites that are known to be not safe for false start. Since 3.5.0.
 * @GNUTLS_ENABLE_EARLY_START: Under TLS1.3 allow the server to return earlier than the full handshake
 *   finish; similarly to false start the handshake will be completed once data are received by the
 *   client, while the server is able to transmit sooner. This is not enabled by default as it could
 *   break certain existing server assumptions and use-cases. Since 3.6.4.
 * @GNUTLS_ENABLE_EARLY_DATA: Under TLS1.3 allow the server to receive early data sent as part of the initial ClientHello (0-RTT).
 *   This can also be used to explicitly indicate that the client will send early data.
 *   This is not enabled by default as early data has weaker security properties than other data. Since 3.6.5.
 * @GNUTLS_FORCE_CLIENT_CERT: When in client side and only a single cert is specified, send that certificate irrespective of the issuers expected by the server. Since 3.5.0.
 * @GNUTLS_NO_TICKETS: Flag to indicate that the session should not use resumption with session tickets.
 * @GNUTLS_NO_TICKETS_TLS12: Flag to indicate that the session should not use resumption with session tickets. This flag only has effect if TLS 1.2 is used.
 * @GNUTLS_KEY_SHARE_TOP3: Generate key shares for the top-3 different groups which are enabled.
 *   That is, as each group is associated with a key type (EC, finite field, x25519), generate
 *   three keys using %GNUTLS_PK_DH, %GNUTLS_PK_EC, %GNUTLS_PK_ECDH_X25519 if all of them are enabled.
 * @GNUTLS_KEY_SHARE_TOP2: Generate key shares for the top-2 different groups which are enabled.
 *   For example (ECDH + x25519). This is the default.
 * @GNUTLS_KEY_SHARE_TOP: Generate key share for the first group which is enabled.
 *   For example x25519. This option is the most performant for client (less CPU spent
 *   generating keys), but if the server doesn't support the advertised option it may
 *   result to more roundtrips needed to discover the server's choice.
 * @GNUTLS_NO_AUTO_REKEY: Disable auto-rekeying under TLS1.3. If this option is not specified
 *   gnutls will force a rekey after 2^24 records have been sent.
 * @GNUTLS_POST_HANDSHAKE_AUTH: Enable post handshake authentication for server and client. When set and
 *   a server requests authentication after handshake %GNUTLS_E_REAUTH_REQUEST will be returned
 *   by gnutls_record_recv(). A client should then call gnutls_reauth() to re-authenticate.
 * @GNUTLS_SAFE_PADDING_CHECK: Flag to indicate that the TLS 1.3 padding check will be done in a
 *   safe way which doesn't leak the pad size based on GnuTLS processing time. This is of use to
 *   applications which hide the length of transferred data via the TLS1.3 padding mechanism and
 *   are already taking steps to hide the data processing time. This comes at a performance
 *   penalty.
 * @GNUTLS_AUTO_REAUTH: Enable transparent re-authentication in client side when the server
 *    requests to. That is, reauthentication is handled within gnutls_record_recv(), and
 *    the %GNUTLS_E_REHANDSHAKE or %GNUTLS_E_REAUTH_REQUEST are not returned. This must be
 *    enabled with %GNUTLS_POST_HANDSHAKE_AUTH for TLS1.3. Enabling this flag requires to restore
 *    interrupted calls to gnutls_record_recv() based on the output of gnutls_record_get_direction(),
 *    since gnutls_record_recv() could be interrupted when sending when this flag is enabled.
 *    Note this flag may not be used if you are using the same session for sending and receiving
 *    in different threads.
 * @GNUTLS_ENABLE_RAWPK: Allows raw public-keys to be negotiated during the handshake. Since 3.6.6.
 * @GNUTLS_NO_AUTO_SEND_TICKET: Under TLS1.3 disable auto-sending of
 *    session tickets during the handshake.
 * @GNUTLS_NO_END_OF_EARLY_DATA: Under TLS1.3 suppress sending EndOfEarlyData message. Since 3.7.2.
 * @GNUTLS_NO_STATUS_REQUEST: Prevents client from including the "status_request" TLS extension
 *    in the client hello, thus disabling the receival of certificate status information. Since 3.8.0.
 *
 * Enumeration of different flags for gnutls_init() function. All the flags
 * can be combined except @GNUTLS_SERVER and @GNUTLS_CLIENT which are mutually
 * exclusive.
 *
 * The key share options relate to the TLS 1.3 key share extension
 * which is a speculative key generation expecting that the server
 * would support the generated key.
  }
type
  Pgnutls_init_flags_t = ^Tgnutls_init_flags_t;
  Tgnutls_init_flags_t =  Longint;
  Const
    GNUTLS_SERVER = 1;
    GNUTLS_CLIENT = 1 shl 1;
    GNUTLS_DATAGRAM = 1 shl 2;
    GNUTLS_NONBLOCK = 1 shl 3;
    GNUTLS_NO_DEFAULT_EXTENSIONS = 1 shl 4;
    GNUTLS_NO_REPLAY_PROTECTION = 1 shl 5;
    GNUTLS_NO_SIGNAL = 1 shl 6;
    GNUTLS_ALLOW_ID_CHANGE = 1 shl 7;
    GNUTLS_ENABLE_FALSE_START = 1 shl 8;
    GNUTLS_FORCE_CLIENT_CERT = 1 shl 9;
    GNUTLS_NO_TICKETS = 1 shl 10;
    GNUTLS_KEY_SHARE_TOP = 1 shl 11;
    GNUTLS_KEY_SHARE_TOP2 = 1 shl 12;
    GNUTLS_KEY_SHARE_TOP3 = 1 shl 13;
    GNUTLS_POST_HANDSHAKE_AUTH = 1 shl 14;
    GNUTLS_NO_AUTO_REKEY = 1 shl 15;
    GNUTLS_SAFE_PADDING_CHECK = 1 shl 16;
    GNUTLS_ENABLE_EARLY_START = 1 shl 17;
    GNUTLS_ENABLE_RAWPK = 1 shl 18;
    GNUTLS_AUTO_REAUTH = 1 shl 19;
    GNUTLS_ENABLE_EARLY_DATA = 1 shl 20;
    GNUTLS_NO_AUTO_SEND_TICKET = 1 shl 21;
    GNUTLS_NO_END_OF_EARLY_DATA = 1 shl 22;
    GNUTLS_NO_TICKETS_TLS12 = 1 shl 23;
    GNUTLS_NO_STATUS_REQUEST = 1 shl 24;
;
{ compatibility defines (previous versions of gnutls
 * used defines instead of enumerated values).  }
  GNUTLS_SERVER = 1;  
  GNUTLS_CLIENT = 1 shl 1;  
  GNUTLS_DATAGRAM = 1 shl 2;  
  GNUTLS_NONBLOCK = 1 shl 3;  
  GNUTLS_NO_DEFAULT_EXTENSIONS = 1 shl 4;  
  GNUTLS_NO_REPLAY_PROTECTION = 1 shl 5;  
  GNUTLS_NO_SIGNAL = 1 shl 6;  
  GNUTLS_ALLOW_ID_CHANGE = 1 shl 7;  
  GNUTLS_ENABLE_FALSE_START = 1 shl 8;  
  GNUTLS_FORCE_CLIENT_CERT = 1 shl 9;  
  GNUTLS_NO_TICKETS = 1 shl 10;  
  GNUTLS_ENABLE_CERT_TYPE_NEG = 0;  
{ Here for compatibility reasons }
{ Keep backward compatibility  }
  GNUTLS_NO_EXTENSIONS = GNUTLS_NO_DEFAULT_EXTENSIONS;  
{*
 * gnutls_alert_level_t:
 * @GNUTLS_AL_WARNING: Alert of warning severity.
 * @GNUTLS_AL_FATAL: Alert of fatal severity.
 *
 * Enumeration of different TLS alert severities.
  }
type
  Pgnutls_alert_level_t = ^Tgnutls_alert_level_t;
  Tgnutls_alert_level_t =  Longint;
  Const
    GNUTLS_AL_WARNING = 1;
    GNUTLS_AL_FATAL = 2;
;
{*
 * gnutls_alert_description_t:
 * @GNUTLS_A_CLOSE_NOTIFY: Close notify.
 * @GNUTLS_A_UNEXPECTED_MESSAGE: Unexpected message.
 * @GNUTLS_A_BAD_RECORD_MAC: Bad record MAC.
 * @GNUTLS_A_DECRYPTION_FAILED: Decryption failed.
 * @GNUTLS_A_RECORD_OVERFLOW: Record overflow.
 * @GNUTLS_A_DECOMPRESSION_FAILURE: Decompression failed.
 * @GNUTLS_A_HANDSHAKE_FAILURE: Handshake failed.
 * @GNUTLS_A_SSL3_NO_CERTIFICATE: No certificate.
 * @GNUTLS_A_BAD_CERTIFICATE: Certificate is bad.
 * @GNUTLS_A_UNSUPPORTED_CERTIFICATE: Certificate is not supported.
 * @GNUTLS_A_CERTIFICATE_REVOKED: Certificate was revoked.
 * @GNUTLS_A_CERTIFICATE_EXPIRED: Certificate is expired.
 * @GNUTLS_A_CERTIFICATE_UNKNOWN: Unknown certificate.
 * @GNUTLS_A_ILLEGAL_PARAMETER: Illegal parameter.
 * @GNUTLS_A_UNKNOWN_CA: CA is unknown.
 * @GNUTLS_A_ACCESS_DENIED: Access was denied.
 * @GNUTLS_A_DECODE_ERROR: Decode error.
 * @GNUTLS_A_DECRYPT_ERROR: Decrypt error.
 * @GNUTLS_A_EXPORT_RESTRICTION: Export restriction.
 * @GNUTLS_A_PROTOCOL_VERSION: Error in protocol version.
 * @GNUTLS_A_INSUFFICIENT_SECURITY: Insufficient security.
 * @GNUTLS_A_INTERNAL_ERROR: Internal error.
 * @GNUTLS_A_INAPPROPRIATE_FALLBACK: Inappropriate fallback,
 * @GNUTLS_A_USER_CANCELED: User canceled.
 * @GNUTLS_A_NO_RENEGOTIATION: No renegotiation is allowed.
 * @GNUTLS_A_MISSING_EXTENSION: An extension was expected but was not seen
 * @GNUTLS_A_UNSUPPORTED_EXTENSION: An unsupported extension was
 *   sent.
 * @GNUTLS_A_CERTIFICATE_UNOBTAINABLE: Could not retrieve the
 *   specified certificate.
 * @GNUTLS_A_UNRECOGNIZED_NAME: The server name sent was not
 *   recognized.
 * @GNUTLS_A_UNKNOWN_PSK_IDENTITY: The SRP/PSK username is missing
 *   or not known.
 * @GNUTLS_A_CERTIFICATE_REQUIRED: Certificate is required.
 * @GNUTLS_A_NO_APPLICATION_PROTOCOL: The ALPN protocol requested is
 *   not supported by the peer.
 *
 * Enumeration of different TLS alerts.
  }
type
  Pgnutls_alert_description_t = ^Tgnutls_alert_description_t;
  Tgnutls_alert_description_t =  Longint;
  Const
    GNUTLS_A_CLOSE_NOTIFY = 0;
    GNUTLS_A_UNEXPECTED_MESSAGE = 10;
    GNUTLS_A_BAD_RECORD_MAC = 20;
    GNUTLS_A_DECRYPTION_FAILED = 21;
    GNUTLS_A_RECORD_OVERFLOW = 22;
    GNUTLS_A_DECOMPRESSION_FAILURE = 30;
    GNUTLS_A_HANDSHAKE_FAILURE = 40;
    GNUTLS_A_SSL3_NO_CERTIFICATE = 41;
    GNUTLS_A_BAD_CERTIFICATE = 42;
    GNUTLS_A_UNSUPPORTED_CERTIFICATE = 43;
    GNUTLS_A_CERTIFICATE_REVOKED = 44;
    GNUTLS_A_CERTIFICATE_EXPIRED = 45;
    GNUTLS_A_CERTIFICATE_UNKNOWN = 46;
    GNUTLS_A_ILLEGAL_PARAMETER = 47;
    GNUTLS_A_UNKNOWN_CA = 48;
    GNUTLS_A_ACCESS_DENIED = 49;
    GNUTLS_A_DECODE_ERROR = 50;
    GNUTLS_A_DECRYPT_ERROR = 51;
    GNUTLS_A_EXPORT_RESTRICTION = 60;
    GNUTLS_A_PROTOCOL_VERSION = 70;
    GNUTLS_A_INSUFFICIENT_SECURITY = 71;
    GNUTLS_A_INTERNAL_ERROR = 80;
    GNUTLS_A_INAPPROPRIATE_FALLBACK = 86;
    GNUTLS_A_USER_CANCELED = 90;
    GNUTLS_A_NO_RENEGOTIATION = 100;
    GNUTLS_A_MISSING_EXTENSION = 109;
    GNUTLS_A_UNSUPPORTED_EXTENSION = 110;
    GNUTLS_A_CERTIFICATE_UNOBTAINABLE = 111;
    GNUTLS_A_UNRECOGNIZED_NAME = 112;
    GNUTLS_A_UNKNOWN_PSK_IDENTITY = 115;
    GNUTLS_A_CERTIFICATE_REQUIRED = 116;
    GNUTLS_A_NO_APPLICATION_PROTOCOL = 120;
    GNUTLS_A_MAX = GNUTLS_A_NO_APPLICATION_PROTOCOL;
;
{*
 * gnutls_handshake_description_t:
 * @GNUTLS_HANDSHAKE_HELLO_REQUEST: Hello request.
 * @GNUTLS_HANDSHAKE_HELLO_VERIFY_REQUEST: DTLS Hello verify request.
 * @GNUTLS_HANDSHAKE_CLIENT_HELLO: Client hello.
 * @GNUTLS_HANDSHAKE_SERVER_HELLO: Server hello.
 * @GNUTLS_HANDSHAKE_END_OF_EARLY_DATA: End of early data.
 * @GNUTLS_HANDSHAKE_HELLO_RETRY_REQUEST: Hello retry request.
 * @GNUTLS_HANDSHAKE_NEW_SESSION_TICKET: New session ticket.
 * @GNUTLS_HANDSHAKE_CERTIFICATE_PKT: Certificate packet.
 * @GNUTLS_HANDSHAKE_SERVER_KEY_EXCHANGE: Server key exchange.
 * @GNUTLS_HANDSHAKE_CERTIFICATE_REQUEST: Certificate request.
 * @GNUTLS_HANDSHAKE_SERVER_HELLO_DONE: Server hello done.
 * @GNUTLS_HANDSHAKE_CERTIFICATE_VERIFY: Certificate verify.
 * @GNUTLS_HANDSHAKE_CLIENT_KEY_EXCHANGE: Client key exchange.
 * @GNUTLS_HANDSHAKE_FINISHED: Finished.
 * @GNUTLS_HANDSHAKE_CERTIFICATE_STATUS: Certificate status (OCSP).
 * @GNUTLS_HANDSHAKE_KEY_UPDATE: TLS1.3 key update message.
 * @GNUTLS_HANDSHAKE_COMPRESSED_CERTIFICATE_PKT: Compressed certificate packet.
 * @GNUTLS_HANDSHAKE_SUPPLEMENTAL: Supplemental.
 * @GNUTLS_HANDSHAKE_CHANGE_CIPHER_SPEC: Change Cipher Spec.
 * @GNUTLS_HANDSHAKE_CLIENT_HELLO_V2: SSLv2 Client Hello.
 * @GNUTLS_HANDSHAKE_ENCRYPTED_EXTENSIONS: Encrypted extensions message.
 *
 * Enumeration of different TLS handshake packets.
  }
type
  Pgnutls_handshake_description_t = ^Tgnutls_handshake_description_t;
  Tgnutls_handshake_description_t =  Longint;
  Const
    GNUTLS_HANDSHAKE_HELLO_REQUEST = 0;
    GNUTLS_HANDSHAKE_CLIENT_HELLO = 1;
    GNUTLS_HANDSHAKE_SERVER_HELLO = 2;
    GNUTLS_HANDSHAKE_HELLO_VERIFY_REQUEST = 3;
    GNUTLS_HANDSHAKE_NEW_SESSION_TICKET = 4;
    GNUTLS_HANDSHAKE_END_OF_EARLY_DATA = 5;
    GNUTLS_HANDSHAKE_ENCRYPTED_EXTENSIONS = 8;
    GNUTLS_HANDSHAKE_CERTIFICATE_PKT = 11;
    GNUTLS_HANDSHAKE_SERVER_KEY_EXCHANGE = 12;
    GNUTLS_HANDSHAKE_CERTIFICATE_REQUEST = 13;
    GNUTLS_HANDSHAKE_SERVER_HELLO_DONE = 14;
    GNUTLS_HANDSHAKE_CERTIFICATE_VERIFY = 15;
    GNUTLS_HANDSHAKE_CLIENT_KEY_EXCHANGE = 16;
    GNUTLS_HANDSHAKE_FINISHED = 20;
    GNUTLS_HANDSHAKE_CERTIFICATE_STATUS = 22;
    GNUTLS_HANDSHAKE_SUPPLEMENTAL = 23;
    GNUTLS_HANDSHAKE_KEY_UPDATE = 24;
    GNUTLS_HANDSHAKE_COMPRESSED_CERTIFICATE_PKT = 25;
    GNUTLS_HANDSHAKE_CHANGE_CIPHER_SPEC = 254;
    GNUTLS_HANDSHAKE_CLIENT_HELLO_V2 = 1024;
    GNUTLS_HANDSHAKE_HELLO_RETRY_REQUEST = 1025;
;

{ was #define dname def_expr }
function GNUTLS_HANDSHAKE_ANY : dword;  

(* Const before type ignored *)
function gnutls_handshake_description_get_name(_type:Tgnutls_handshake_description_t):Pchar;cdecl;external;
{*
 * gnutls_certificate_status_t:
 * @GNUTLS_CERT_INVALID: The certificate is not signed by one of the
 *   known authorities or the signature is invalid (deprecated by the flags 
 *   %GNUTLS_CERT_SIGNATURE_FAILURE and %GNUTLS_CERT_SIGNER_NOT_FOUND).
 * @GNUTLS_CERT_SIGNATURE_FAILURE: The signature verification failed.
 * @GNUTLS_CERT_REVOKED: Certificate is revoked by its authority.  In X.509 this will be
 *   set only if CRLs are checked.
 * @GNUTLS_CERT_SIGNER_NOT_FOUND: The certificate's issuer is not known. 
 *   This is the case if the issuer is not included in the trusted certificate list.
 * @GNUTLS_CERT_SIGNER_NOT_CA: The certificate's signer was not a CA. This
 *   may happen if this was a version 1 certificate, which is common with
 *   some CAs, or a version 3 certificate without the basic constrains extension.
 * @GNUTLS_CERT_SIGNER_CONSTRAINTS_FAILURE: The certificate's signer constraints were
 *   violated.
 * @GNUTLS_CERT_INSECURE_ALGORITHM:  The certificate was signed using an insecure
 *   algorithm such as MD2 or MD5. These algorithms have been broken and
 *   should not be trusted.
 * @GNUTLS_CERT_NOT_ACTIVATED: The certificate is not yet activated.
 * @GNUTLS_CERT_EXPIRED: The certificate has expired.
 * @GNUTLS_CERT_REVOCATION_DATA_SUPERSEDED: The revocation data are old and have been superseded.
 * @GNUTLS_CERT_REVOCATION_DATA_ISSUED_IN_FUTURE: The revocation data have a future issue date.
 * @GNUTLS_CERT_UNEXPECTED_OWNER: The owner is not the expected one.
 * @GNUTLS_CERT_MISMATCH: The certificate presented isn't the expected one (TOFU)
 * @GNUTLS_CERT_PURPOSE_MISMATCH: The certificate or an intermediate does not match the intended purpose (extended key usage).
 * @GNUTLS_CERT_MISSING_OCSP_STATUS: The certificate requires the server to send the certificate status, but no status was received.
 * @GNUTLS_CERT_INVALID_OCSP_STATUS: The received OCSP status response is invalid.
 * @GNUTLS_CERT_UNKNOWN_CRIT_EXTENSIONS: The certificate has extensions marked as critical which are not supported.
 *
 * Enumeration of certificate status codes.  Note that the status
 * bits may have different meanings in OpenPGP keys and X.509
 * certificate verification.
  }
type
  Pgnutls_certificate_status_t = ^Tgnutls_certificate_status_t;
  Tgnutls_certificate_status_t =  Longint;
  Const
    GNUTLS_CERT_INVALID = 1 shl 1;
    GNUTLS_CERT_REVOKED = 1 shl 5;
    GNUTLS_CERT_SIGNER_NOT_FOUND = 1 shl 6;
    GNUTLS_CERT_SIGNER_NOT_CA = 1 shl 7;
    GNUTLS_CERT_INSECURE_ALGORITHM = 1 shl 8;
    GNUTLS_CERT_NOT_ACTIVATED = 1 shl 9;
    GNUTLS_CERT_EXPIRED = 1 shl 10;
    GNUTLS_CERT_SIGNATURE_FAILURE = 1 shl 11;
    GNUTLS_CERT_REVOCATION_DATA_SUPERSEDED = 1 shl 12;
    GNUTLS_CERT_UNEXPECTED_OWNER = 1 shl 14;
    GNUTLS_CERT_REVOCATION_DATA_ISSUED_IN_FUTURE = 1 shl 15;
    GNUTLS_CERT_SIGNER_CONSTRAINTS_FAILURE = 1 shl 16;
    GNUTLS_CERT_MISMATCH = 1 shl 17;
    GNUTLS_CERT_PURPOSE_MISMATCH = 1 shl 18;
    GNUTLS_CERT_MISSING_OCSP_STATUS = 1 shl 19;
    GNUTLS_CERT_INVALID_OCSP_STATUS = 1 shl 20;
    GNUTLS_CERT_UNKNOWN_CRIT_EXTENSIONS = 1 shl 21;
;
{*
 * gnutls_certificate_request_t:
 * @GNUTLS_CERT_IGNORE: Ignore certificate.
 * @GNUTLS_CERT_REQUEST: Request certificate.
 * @GNUTLS_CERT_REQUIRE: Require certificate.
 *
 * Enumeration of certificate request types.
  }
type
  Pgnutls_certificate_request_t = ^Tgnutls_certificate_request_t;
  Tgnutls_certificate_request_t =  Longint;
  Const
    GNUTLS_CERT_IGNORE = 0;
    GNUTLS_CERT_REQUEST = 1;
    GNUTLS_CERT_REQUIRE = 2;
;
{*
 * gnutls_openpgp_crt_status_t:
 * @GNUTLS_OPENPGP_CERT: Send entire certificate.
 * @GNUTLS_OPENPGP_CERT_FINGERPRINT: Send only certificate fingerprint.
 *
 * Enumeration of ways to send OpenPGP certificate.
  }
type
  Pgnutls_openpgp_crt_status_t = ^Tgnutls_openpgp_crt_status_t;
  Tgnutls_openpgp_crt_status_t =  Longint;
  Const
    GNUTLS_OPENPGP_CERT = 0;
    GNUTLS_OPENPGP_CERT_FINGERPRINT = 1;
;
{*
 * gnutls_close_request_t:
 * @GNUTLS_SHUT_RDWR: Disallow further receives/sends.
 * @GNUTLS_SHUT_WR: Disallow further sends.
 *
 * Enumeration of how TLS session should be terminated.  See gnutls_bye().
  }
type
  Pgnutls_close_request_t = ^Tgnutls_close_request_t;
  Tgnutls_close_request_t =  Longint;
  Const
    GNUTLS_SHUT_RDWR = 0;
    GNUTLS_SHUT_WR = 1;
;
{*
 * gnutls_protocol_t:
 * @GNUTLS_SSL3: SSL version 3.0.
 * @GNUTLS_TLS1_0: TLS version 1.0.
 * @GNUTLS_TLS1: Same as %GNUTLS_TLS1_0.
 * @GNUTLS_TLS1_1: TLS version 1.1.
 * @GNUTLS_TLS1_2: TLS version 1.2.
 * @GNUTLS_TLS1_3: TLS version 1.3.
 * @GNUTLS_DTLS1_0: DTLS version 1.0.
 * @GNUTLS_DTLS1_2: DTLS version 1.2.
 * @GNUTLS_DTLS0_9: DTLS version 0.9 (Cisco AnyConnect / OpenSSL 0.9.8e).
 * @GNUTLS_TLS_VERSION_MAX: Maps to the highest supported TLS version.
 * @GNUTLS_DTLS_VERSION_MAX: Maps to the highest supported DTLS version.
 * @GNUTLS_VERSION_UNKNOWN: Unknown SSL/TLS version.
 *
 * Enumeration of different SSL/TLS protocol versions.
  }
{ 201  }
{ change it to 0xffff  }
type
  Pgnutls_protocol_t = ^Tgnutls_protocol_t;
  Tgnutls_protocol_t =  Longint;
  Const
    GNUTLS_SSL3 = 1;
    GNUTLS_TLS1_0 = 2;
    GNUTLS_TLS1 = GNUTLS_TLS1_0;
    GNUTLS_TLS1_1 = 3;
    GNUTLS_TLS1_2 = 4;
    GNUTLS_TLS1_3 = 5;
    GNUTLS_DTLS0_9 = 200;
    GNUTLS_DTLS1_0 = 201;
    GNUTLS_DTLS1_2 = 202;
    GNUTLS_DTLS_VERSION_MIN = GNUTLS_DTLS0_9;
    GNUTLS_DTLS_VERSION_MAX = GNUTLS_DTLS1_2;
    GNUTLS_TLS_VERSION_MAX = GNUTLS_TLS1_3;
    GNUTLS_VERSION_UNKNOWN = $ff;
;
  GNUTLS_CRT_RAW = GNUTLS_CRT_RAWPK;  
{*
 * gnutls_certificate_type_t:
 * @GNUTLS_CRT_UNKNOWN: Unknown certificate type.
 * @GNUTLS_CRT_X509: X.509 Certificate.
 * @GNUTLS_CRT_OPENPGP: OpenPGP certificate.
 * @GNUTLS_CRT_RAWPK: Raw public-key (SubjectPublicKeyInfo)
 *
 * Enumeration of different certificate types.
  }
type
  Pgnutls_certificate_type_t = ^Tgnutls_certificate_type_t;
  Tgnutls_certificate_type_t =  Longint;
  Const
    GNUTLS_CRT_UNKNOWN = 0;
    GNUTLS_CRT_X509 = 1;
    GNUTLS_CRT_OPENPGP = 2;
    GNUTLS_CRT_RAWPK = 3;
    GNUTLS_CRT_MAX = GNUTLS_CRT_RAWPK;
;
{*
 * gnutls_x509_crt_fmt_t:
 * @GNUTLS_X509_FMT_DER: X.509 certificate in DER format (binary).
 * @GNUTLS_X509_FMT_PEM: X.509 certificate in PEM format (text).
 *
 * Enumeration of different certificate encoding formats.
  }
type
  Pgnutls_x509_crt_fmt_t = ^Tgnutls_x509_crt_fmt_t;
  Tgnutls_x509_crt_fmt_t =  Longint;
  Const
    GNUTLS_X509_FMT_DER = 0;
    GNUTLS_X509_FMT_PEM = 1;
;
{*
 * gnutls_certificate_print_formats_t:
 * @GNUTLS_CRT_PRINT_FULL: Full information about certificate.
 * @GNUTLS_CRT_PRINT_FULL_NUMBERS: Full information about certificate and include easy to parse public key parameters.
 * @GNUTLS_CRT_PRINT_COMPACT: Information about certificate name in one line, plus identification of the public key.
 * @GNUTLS_CRT_PRINT_ONELINE: Information about certificate in one line.
 * @GNUTLS_CRT_PRINT_UNSIGNED_FULL: All info for an unsigned certificate.
 *
 * Enumeration of different certificate printing variants.
  }
type
  Pgnutls_certificate_print_formats = ^Tgnutls_certificate_print_formats;
  Tgnutls_certificate_print_formats =  Longint;
  Const
    GNUTLS_CRT_PRINT_FULL = 0;
    GNUTLS_CRT_PRINT_ONELINE = 1;
    GNUTLS_CRT_PRINT_UNSIGNED_FULL = 2;
    GNUTLS_CRT_PRINT_COMPACT = 3;
    GNUTLS_CRT_PRINT_FULL_NUMBERS = 4;
;
  Tgnutls_certificate_print_formats_t = Tgnutls_certificate_print_formats;
  Pgnutls_certificate_print_formats_t = ^Tgnutls_certificate_print_formats_t;
  GNUTLS_PK_ECC = GNUTLS_PK_ECDSA;  
  GNUTLS_PK_EC = GNUTLS_PK_ECDSA;  
  GNUTLS_PK_ECDHX = GNUTLS_PK_ECDH_X25519;  
{*
 * gnutls_pk_algorithm_t:
 * @GNUTLS_PK_UNKNOWN: Unknown public-key algorithm.
 * @GNUTLS_PK_RSA: RSA public-key algorithm.
 * @GNUTLS_PK_RSA_PSS: RSA public-key algorithm, with PSS padding.
 * @GNUTLS_PK_DSA: DSA public-key algorithm.
 * @GNUTLS_PK_DH: Diffie-Hellman algorithm. Used to generate parameters.
 * @GNUTLS_PK_ECDSA: Elliptic curve algorithm. These parameters are compatible with the ECDSA and ECDH algorithm.
 * @GNUTLS_PK_ECDH_X25519: Elliptic curve algorithm, restricted to ECDH as per rfc7748.
 * @GNUTLS_PK_EDDSA_ED25519: Edwards curve Digital signature algorithm. Used with SHA512 on signatures.
 * @GNUTLS_PK_GOST_01: GOST R 34.10-2001 algorithm per rfc5832.
 * @GNUTLS_PK_GOST_12_256: GOST R 34.10-2012 algorithm, 256-bit key per rfc7091.
 * @GNUTLS_PK_GOST_12_512: GOST R 34.10-2012 algorithm, 512-bit key per rfc7091.
 * @GNUTLS_PK_ECDH_X448: Elliptic curve algorithm, restricted to ECDH as per rfc7748.
 * @GNUTLS_PK_EDDSA_ED448: Edwards curve Digital signature algorithm. Used with SHAKE256 on signatures.
 *
 * Enumeration of different public-key algorithms.
  }
type
  Pgnutls_pk_algorithm_t = ^Tgnutls_pk_algorithm_t;
  Tgnutls_pk_algorithm_t =  Longint;
  Const
    GNUTLS_PK_UNKNOWN = 0;
    GNUTLS_PK_RSA = 1;
    GNUTLS_PK_DSA = 2;
    GNUTLS_PK_DH = 3;
    GNUTLS_PK_ECDSA = 4;
    GNUTLS_PK_ECDH_X25519 = 5;
    GNUTLS_PK_RSA_PSS = 6;
    GNUTLS_PK_EDDSA_ED25519 = 7;
    GNUTLS_PK_GOST_01 = 8;
    GNUTLS_PK_GOST_12_256 = 9;
    GNUTLS_PK_GOST_12_512 = 10;
    GNUTLS_PK_ECDH_X448 = 11;
    GNUTLS_PK_EDDSA_ED448 = 12;
    GNUTLS_PK_MAX = GNUTLS_PK_EDDSA_ED448;
;
(* Const before type ignored *)

function gnutls_pk_algorithm_get_name(algorithm:Tgnutls_pk_algorithm_t):Pchar;cdecl;external;
{*
 * gnutls_sign_algorithm_t:
 * @GNUTLS_SIGN_UNKNOWN: Unknown signature algorithm.
 * @GNUTLS_SIGN_RSA_RAW: Digital signature algorithm RSA with DigestInfo formatted data
 * @GNUTLS_SIGN_RSA_SHA1: Digital signature algorithm RSA with SHA-1
 * @GNUTLS_SIGN_RSA_SHA: Same as %GNUTLS_SIGN_RSA_SHA1.
 * @GNUTLS_SIGN_DSA_SHA1: Digital signature algorithm DSA with SHA-1
 * @GNUTLS_SIGN_DSA_SHA224: Digital signature algorithm DSA with SHA-224
 * @GNUTLS_SIGN_DSA_SHA256: Digital signature algorithm DSA with SHA-256
 * @GNUTLS_SIGN_DSA_SHA384: Digital signature algorithm DSA with SHA-384
 * @GNUTLS_SIGN_DSA_SHA512: Digital signature algorithm DSA with SHA-512
 * @GNUTLS_SIGN_DSA_SHA: Same as %GNUTLS_SIGN_DSA_SHA1.
 * @GNUTLS_SIGN_RSA_MD5: Digital signature algorithm RSA with MD5.
 * @GNUTLS_SIGN_RSA_MD2: Digital signature algorithm RSA with MD2.
 * @GNUTLS_SIGN_RSA_RMD160: Digital signature algorithm RSA with RMD-160.
 * @GNUTLS_SIGN_RSA_SHA256: Digital signature algorithm RSA with SHA-256.
 * @GNUTLS_SIGN_RSA_SHA384: Digital signature algorithm RSA with SHA-384.
 * @GNUTLS_SIGN_RSA_SHA512: Digital signature algorithm RSA with SHA-512.
 * @GNUTLS_SIGN_RSA_SHA224: Digital signature algorithm RSA with SHA-224.
 * @GNUTLS_SIGN_ECDSA_SHA1: ECDSA with SHA1.
 * @GNUTLS_SIGN_ECDSA_SHA224: Digital signature algorithm ECDSA with SHA-224.
 * @GNUTLS_SIGN_ECDSA_SHA256: Digital signature algorithm ECDSA with SHA-256.
 * @GNUTLS_SIGN_ECDSA_SHA384: Digital signature algorithm ECDSA with SHA-384.
 * @GNUTLS_SIGN_ECDSA_SHA512: Digital signature algorithm ECDSA with SHA-512.
 * @GNUTLS_SIGN_ECDSA_SECP256R1_SHA256: Digital signature algorithm ECDSA-SECP256R1 with SHA-256 (used in TLS 1.3 but not PKIX).
 * @GNUTLS_SIGN_ECDSA_SECP384R1_SHA384: Digital signature algorithm ECDSA-SECP384R1 with SHA-384 (used in TLS 1.3 but not PKIX).
 * @GNUTLS_SIGN_ECDSA_SECP521R1_SHA512: Digital signature algorithm ECDSA-SECP521R1 with SHA-512 (used in TLS 1.3 but not PKIX).
 * @GNUTLS_SIGN_ECDSA_SHA3_224: Digital signature algorithm ECDSA with SHA3-224.
 * @GNUTLS_SIGN_ECDSA_SHA3_256: Digital signature algorithm ECDSA with SHA3-256.
 * @GNUTLS_SIGN_ECDSA_SHA3_384: Digital signature algorithm ECDSA with SHA3-384.
 * @GNUTLS_SIGN_ECDSA_SHA3_512: Digital signature algorithm ECDSA with SHA3-512.
 * @GNUTLS_SIGN_DSA_SHA3_224: Digital signature algorithm DSA with SHA3-224.
 * @GNUTLS_SIGN_DSA_SHA3_256: Digital signature algorithm DSA with SHA3-256.
 * @GNUTLS_SIGN_DSA_SHA3_384: Digital signature algorithm DSA with SHA3-384.
 * @GNUTLS_SIGN_DSA_SHA3_512: Digital signature algorithm DSA with SHA3-512.
 * @GNUTLS_SIGN_RSA_SHA3_224: Digital signature algorithm RSA with SHA3-224.
 * @GNUTLS_SIGN_RSA_SHA3_256: Digital signature algorithm RSA with SHA3-256.
 * @GNUTLS_SIGN_RSA_SHA3_384: Digital signature algorithm RSA with SHA3-384.
 * @GNUTLS_SIGN_RSA_SHA3_512: Digital signature algorithm RSA with SHA3-512.
 * @GNUTLS_SIGN_RSA_PSS_RSAE_SHA256: Digital signature algorithm RSA with SHA-256,
 *      with PSS padding (RSA PKCS#1 1.5 certificate). This signature is identical
 *      to #GNUTLS_SIGN_RSA_PSS_SHA256, but they are distinct as the TLS1.3 protocol
 *      treats them differently.
 * @GNUTLS_SIGN_RSA_PSS_RSAE_SHA384: Digital signature algorithm RSA with SHA-384,
 *      with PSS padding (RSA PKCS#1 1.5 certificate). This signature is identical
 *      to #GNUTLS_SIGN_RSA_PSS_SHA384, but they are distinct as the TLS1.3 protocol
 *      treats them differently.
 * @GNUTLS_SIGN_RSA_PSS_RSAE_SHA512: Digital signature algorithm RSA with SHA-512,
 *      with PSS padding (RSA PKCS#1 1.5 certificate). This signature is identical
 *      to #GNUTLS_SIGN_RSA_PSS_SHA512, but they are distinct as the TLS1.3 protocol
 *      treats them differently.
 * @GNUTLS_SIGN_RSA_PSS_SHA256: Digital signature algorithm RSA with SHA-256, with PSS padding (RSA-PSS certificate).
 * @GNUTLS_SIGN_RSA_PSS_SHA384: Digital signature algorithm RSA with SHA-384, with PSS padding (RSA-PSS certificate).
 * @GNUTLS_SIGN_RSA_PSS_SHA512: Digital signature algorithm RSA with SHA-512, with PSS padding (RSA-PSS certificate).
 * @GNUTLS_SIGN_EDDSA_ED25519: Digital signature algorithm EdDSA with Ed25519 curve.
 * @GNUTLS_SIGN_GOST_94: Digital signature algorithm GOST R 34.10-2001 with GOST R 34.11-94
 * @GNUTLS_SIGN_GOST_256: Digital signature algorithm GOST R 34.10-2012 with GOST R 34.11-2012 256 bit
 * @GNUTLS_SIGN_GOST_512: Digital signature algorithm GOST R 34.10-2012 with GOST R 34.11-2012 512 bit
 * @GNUTLS_SIGN_EDDSA_ED448: Digital signature algorithm EdDSA with Ed448 curve.
 *
 * Enumeration of different digital signature algorithms.
  }
type
  Pgnutls_sign_algorithm_t = ^Tgnutls_sign_algorithm_t;
  Tgnutls_sign_algorithm_t =  Longint;
  Const
    GNUTLS_SIGN_UNKNOWN = 0;
    GNUTLS_SIGN_RSA_SHA1 = 1;
    GNUTLS_SIGN_RSA_SHA = GNUTLS_SIGN_RSA_SHA1;
    GNUTLS_SIGN_DSA_SHA1 = 2;
    GNUTLS_SIGN_DSA_SHA = GNUTLS_SIGN_DSA_SHA1;
    GNUTLS_SIGN_RSA_MD5 = 3;
    GNUTLS_SIGN_RSA_MD2 = 4;
    GNUTLS_SIGN_RSA_RMD160 = 5;
    GNUTLS_SIGN_RSA_SHA256 = 6;
    GNUTLS_SIGN_RSA_SHA384 = 7;
    GNUTLS_SIGN_RSA_SHA512 = 8;
    GNUTLS_SIGN_RSA_SHA224 = 9;
    GNUTLS_SIGN_DSA_SHA224 = 10;
    GNUTLS_SIGN_DSA_SHA256 = 11;
    GNUTLS_SIGN_ECDSA_SHA1 = 12;
    GNUTLS_SIGN_ECDSA_SHA224 = 13;
    GNUTLS_SIGN_ECDSA_SHA256 = 14;
    GNUTLS_SIGN_ECDSA_SHA384 = 15;
    GNUTLS_SIGN_ECDSA_SHA512 = 16;
    GNUTLS_SIGN_DSA_SHA384 = 17;
    GNUTLS_SIGN_DSA_SHA512 = 18;
    GNUTLS_SIGN_ECDSA_SHA3_224 = 20;
    GNUTLS_SIGN_ECDSA_SHA3_256 = 21;
    GNUTLS_SIGN_ECDSA_SHA3_384 = 22;
    GNUTLS_SIGN_ECDSA_SHA3_512 = 23;
    GNUTLS_SIGN_DSA_SHA3_224 = 24;
    GNUTLS_SIGN_DSA_SHA3_256 = 25;
    GNUTLS_SIGN_DSA_SHA3_384 = 26;
    GNUTLS_SIGN_DSA_SHA3_512 = 27;
    GNUTLS_SIGN_RSA_SHA3_224 = 28;
    GNUTLS_SIGN_RSA_SHA3_256 = 29;
    GNUTLS_SIGN_RSA_SHA3_384 = 30;
    GNUTLS_SIGN_RSA_SHA3_512 = 31;
    GNUTLS_SIGN_RSA_PSS_SHA256 = 32;
    GNUTLS_SIGN_RSA_PSS_SHA384 = 33;
    GNUTLS_SIGN_RSA_PSS_SHA512 = 34;
    GNUTLS_SIGN_EDDSA_ED25519 = 35;
    GNUTLS_SIGN_RSA_RAW = 36;
    GNUTLS_SIGN_ECDSA_SECP256R1_SHA256 = 37;
    GNUTLS_SIGN_ECDSA_SECP384R1_SHA384 = 38;
    GNUTLS_SIGN_ECDSA_SECP521R1_SHA512 = 39;
    GNUTLS_SIGN_RSA_PSS_RSAE_SHA256 = 40;
    GNUTLS_SIGN_RSA_PSS_RSAE_SHA384 = 41;
    GNUTLS_SIGN_RSA_PSS_RSAE_SHA512 = 42;
    GNUTLS_SIGN_GOST_94 = 43;
    GNUTLS_SIGN_GOST_256 = 44;
    GNUTLS_SIGN_GOST_512 = 45;
    GNUTLS_SIGN_EDDSA_ED448 = 46;
    GNUTLS_SIGN_MAX = GNUTLS_SIGN_EDDSA_ED448;
;
{*
 * gnutls_ecc_curve_t:
 * @GNUTLS_ECC_CURVE_INVALID: Cannot be known
 * @GNUTLS_ECC_CURVE_SECP192R1: the SECP192R1 curve
 * @GNUTLS_ECC_CURVE_SECP224R1: the SECP224R1 curve
 * @GNUTLS_ECC_CURVE_SECP256R1: the SECP256R1 curve
 * @GNUTLS_ECC_CURVE_SECP384R1: the SECP384R1 curve
 * @GNUTLS_ECC_CURVE_SECP521R1: the SECP521R1 curve
 * @GNUTLS_ECC_CURVE_X25519: the X25519 curve (ECDH only)
 * @GNUTLS_ECC_CURVE_ED25519: the Ed25519 curve
 * @GNUTLS_ECC_CURVE_GOST256CPA: GOST R 34.10 CryptoPro 256 A curve
 * @GNUTLS_ECC_CURVE_GOST256CPB: GOST R 34.10 CryptoPro 256 B curve
 * @GNUTLS_ECC_CURVE_GOST256CPC: GOST R 34.10 CryptoPro 256 C curve
 * @GNUTLS_ECC_CURVE_GOST256CPXA: GOST R 34.10 CryptoPro 256 XchA curve
 * @GNUTLS_ECC_CURVE_GOST256CPXB: GOST R 34.10 CryptoPro 256 XchB curve
 * @GNUTLS_ECC_CURVE_GOST512A: GOST R 34.10 TC26 512 A curve
 * @GNUTLS_ECC_CURVE_GOST512B: GOST R 34.10 TC26 512 B curve
 * @GNUTLS_ECC_CURVE_GOST512C: GOST R 34.10 TC26 512 C curve
 * @GNUTLS_ECC_CURVE_GOST256A: GOST R 34.10 TC26 256 A curve
 * @GNUTLS_ECC_CURVE_GOST256B: GOST R 34.10 TC26 256 B curve
 * @GNUTLS_ECC_CURVE_GOST256C: GOST R 34.10 TC26 256 C curve
 * @GNUTLS_ECC_CURVE_GOST256D: GOST R 34.10 TC26 256 D curve
 * @GNUTLS_ECC_CURVE_X448: the X448 curve (ECDH only)
 * @GNUTLS_ECC_CURVE_ED448: the Ed448 curve
 *
 * Enumeration of ECC curves.
  }
type
  Pgnutls_ecc_curve_t = ^Tgnutls_ecc_curve_t;
  Tgnutls_ecc_curve_t =  Longint;
  Const
    GNUTLS_ECC_CURVE_INVALID = 0;
    GNUTLS_ECC_CURVE_SECP224R1 = 1;
    GNUTLS_ECC_CURVE_SECP256R1 = 2;
    GNUTLS_ECC_CURVE_SECP384R1 = 3;
    GNUTLS_ECC_CURVE_SECP521R1 = 4;
    GNUTLS_ECC_CURVE_SECP192R1 = 5;
    GNUTLS_ECC_CURVE_X25519 = 6;
    GNUTLS_ECC_CURVE_ED25519 = 7;
    GNUTLS_ECC_CURVE_GOST256CPA = 8;
    GNUTLS_ECC_CURVE_GOST256CPB = 9;
    GNUTLS_ECC_CURVE_GOST256CPC = 10;
    GNUTLS_ECC_CURVE_GOST256CPXA = 11;
    GNUTLS_ECC_CURVE_GOST256CPXB = 12;
    GNUTLS_ECC_CURVE_GOST512A = 13;
    GNUTLS_ECC_CURVE_GOST512B = 14;
    GNUTLS_ECC_CURVE_GOST512C = 15;
    GNUTLS_ECC_CURVE_GOST256A = 16;
    GNUTLS_ECC_CURVE_GOST256B = 17;
    GNUTLS_ECC_CURVE_GOST256C = 18;
    GNUTLS_ECC_CURVE_GOST256D = 19;
    GNUTLS_ECC_CURVE_X448 = 20;
    GNUTLS_ECC_CURVE_ED448 = 21;
    GNUTLS_ECC_CURVE_MAX = GNUTLS_ECC_CURVE_ED448;
;
{*
 * gnutls_group_t:
 * @GNUTLS_GROUP_INVALID: Indicates unknown/invalid group
 * @GNUTLS_GROUP_SECP192R1: the SECP192R1 curve group (legacy, only for TLS 1.2 compatibility)
 * @GNUTLS_GROUP_SECP224R1: the SECP224R1 curve group (legacy, only for TLS 1.2 compatibility)
 * @GNUTLS_GROUP_SECP256R1: the SECP256R1 curve group
 * @GNUTLS_GROUP_SECP384R1: the SECP384R1 curve group
 * @GNUTLS_GROUP_SECP521R1: the SECP521R1 curve group
 * @GNUTLS_GROUP_X25519: the X25519 curve group
 * @GNUTLS_GROUP_GC256A: the GOST R 34.10 TC26 256 A curve group
 * @GNUTLS_GROUP_GC256B: the GOST R 34.10 TC26 256 B curve group
 * @GNUTLS_GROUP_GC256C: the GOST R 34.10 TC26 256 C curve group
 * @GNUTLS_GROUP_GC256D: the GOST R 34.10 TC26 256 D curve group
 * @GNUTLS_GROUP_GC512A: the GOST R 34.10 TC26 512 A curve group
 * @GNUTLS_GROUP_GC512B: the GOST R 34.10 TC26 512 B curve group
 * @GNUTLS_GROUP_GC512C: the GOST R 34.10 TC26 512 C curve group
 * @GNUTLS_GROUP_FFDHE2048: the FFDHE2048 group
 * @GNUTLS_GROUP_FFDHE3072: the FFDHE3072 group
 * @GNUTLS_GROUP_FFDHE4096: the FFDHE4096 group
 * @GNUTLS_GROUP_FFDHE6144: the FFDHE6144 group
 * @GNUTLS_GROUP_FFDHE8192: the FFDHE8192 group
 * @GNUTLS_GROUP_X448: the X448 curve group
 *
 * Enumeration of supported groups. It is intended to be backwards
 * compatible with the enumerations in %gnutls_ecc_curve_t for the groups
 * which are valid elliptic curves.
  }
type
  Pgnutls_group_t = ^Tgnutls_group_t;
  Tgnutls_group_t =  Longint;
  Const
    GNUTLS_GROUP_INVALID = 0;
    GNUTLS_GROUP_SECP192R1 = GNUTLS_ECC_CURVE_SECP192R1;
    GNUTLS_GROUP_SECP224R1 = GNUTLS_ECC_CURVE_SECP224R1;
    GNUTLS_GROUP_SECP256R1 = GNUTLS_ECC_CURVE_SECP256R1;
    GNUTLS_GROUP_SECP384R1 = GNUTLS_ECC_CURVE_SECP384R1;
    GNUTLS_GROUP_SECP521R1 = GNUTLS_ECC_CURVE_SECP521R1;
    GNUTLS_GROUP_X25519 = GNUTLS_ECC_CURVE_X25519;
    GNUTLS_GROUP_X448 = GNUTLS_ECC_CURVE_X448;
    GNUTLS_GROUP_GC256A = GNUTLS_ECC_CURVE_GOST256A;
    GNUTLS_GROUP_GC256B = GNUTLS_ECC_CURVE_GOST256B;
    GNUTLS_GROUP_GC256C = GNUTLS_ECC_CURVE_GOST256C;
    GNUTLS_GROUP_GC256D = GNUTLS_ECC_CURVE_GOST256D;
    GNUTLS_GROUP_GC512A = GNUTLS_ECC_CURVE_GOST512A;
    GNUTLS_GROUP_GC512B = GNUTLS_ECC_CURVE_GOST512B;
    GNUTLS_GROUP_GC512C = GNUTLS_ECC_CURVE_GOST512C;
    GNUTLS_GROUP_FFDHE2048 = 256;
    GNUTLS_GROUP_FFDHE3072 = 257;
    GNUTLS_GROUP_FFDHE4096 = 258;
    GNUTLS_GROUP_FFDHE8192 = 259;
    GNUTLS_GROUP_FFDHE6144 = 260;
    GNUTLS_GROUP_MAX = GNUTLS_GROUP_FFDHE6144;
;
{ macros to allow specifying a specific curve in gnutls_privkey_generate()
 * and gnutls_x509_privkey_generate()  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GNUTLS_CURVE_TO_BITS(curve : longint) : dword;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GNUTLS_BITS_TO_CURVE(bits : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GNUTLS_BITS_ARE_CURVE(bits : longint) : longint;

{*
 * gnutls_sec_param_t:
 * @GNUTLS_SEC_PARAM_UNKNOWN: Cannot be known
 * @GNUTLS_SEC_PARAM_INSECURE: Less than 42 bits of security
 * @GNUTLS_SEC_PARAM_EXPORT: 42 bits of security
 * @GNUTLS_SEC_PARAM_VERY_WEAK: 64 bits of security
 * @GNUTLS_SEC_PARAM_WEAK: 72 bits of security
 * @GNUTLS_SEC_PARAM_LOW: 80 bits of security
 * @GNUTLS_SEC_PARAM_LEGACY: 96 bits of security
 * @GNUTLS_SEC_PARAM_MEDIUM: 112 bits of security (used to be %GNUTLS_SEC_PARAM_NORMAL)
 * @GNUTLS_SEC_PARAM_HIGH: 128 bits of security
 * @GNUTLS_SEC_PARAM_ULTRA: 192 bits of security
 * @GNUTLS_SEC_PARAM_FUTURE: 256 bits of security
 *
 * Enumeration of security parameters for passive attacks.
  }
type
  Pgnutls_sec_param_t = ^Tgnutls_sec_param_t;
  Tgnutls_sec_param_t =  Longint;
  Const
    GNUTLS_SEC_PARAM_UNKNOWN = 0;
    GNUTLS_SEC_PARAM_INSECURE = 5;
    GNUTLS_SEC_PARAM_EXPORT = 10;
    GNUTLS_SEC_PARAM_VERY_WEAK = 15;
    GNUTLS_SEC_PARAM_WEAK = 20;
    GNUTLS_SEC_PARAM_LOW = 25;
    GNUTLS_SEC_PARAM_LEGACY = 30;
    GNUTLS_SEC_PARAM_MEDIUM = 35;
    GNUTLS_SEC_PARAM_HIGH = 40;
    GNUTLS_SEC_PARAM_ULTRA = 45;
    GNUTLS_SEC_PARAM_FUTURE = 50;
    GNUTLS_SEC_PARAM_MAX = GNUTLS_SEC_PARAM_FUTURE;
;
{ old name  }
  GNUTLS_SEC_PARAM_NORMAL = GNUTLS_SEC_PARAM_MEDIUM;  
{*
 * gnutls_channel_binding_t:
 * @GNUTLS_CB_TLS_UNIQUE: "tls-unique" (RFC 5929) channel binding
 * @GNUTLS_CB_TLS_SERVER_END_POINT: "tls-server-end-point" (RFC 5929) channel binding
 * @GNUTLS_CB_TLS_EXPORTER: "tls-exporter" (RFC 9266) channel binding
 *
 * Enumeration of supported channel binding types.
  }
type
  Pgnutls_channel_binding_t = ^Tgnutls_channel_binding_t;
  Tgnutls_channel_binding_t =  Longint;
  Const
    GNUTLS_CB_TLS_UNIQUE = 0;
    GNUTLS_CB_TLS_SERVER_END_POINT = 1;
    GNUTLS_CB_TLS_EXPORTER = 2;
;
{*
 * gnutls_gost_paramset_t:
 * @GNUTLS_GOST_PARAMSET_UNKNOWN: Unknown/default parameter set
 * @GNUTLS_GOST_PARAMSET_TC26_Z: Specified by TC26, see rfc7836
 * @GNUTLS_GOST_PARAMSET_CP_A: CryptoPro-A, see rfc4357
 * @GNUTLS_GOST_PARAMSET_CP_B: CryptoPro-B, see rfc4357
 * @GNUTLS_GOST_PARAMSET_CP_C: CryptoPro-C, see rfc4357
 * @GNUTLS_GOST_PARAMSET_CP_D: CryptoPro-D, see rfc4357
 *
 * Enumeration of different GOST 28147 parameter sets.
  }
type
  Pgnutls_gost_paramset_t = ^Tgnutls_gost_paramset_t;
  Tgnutls_gost_paramset_t =  Longint;
  Const
    GNUTLS_GOST_PARAMSET_UNKNOWN = 0;
    GNUTLS_GOST_PARAMSET_TC26_Z = 1;
    GNUTLS_GOST_PARAMSET_CP_A = 2;
    GNUTLS_GOST_PARAMSET_CP_B = 3;
    GNUTLS_GOST_PARAMSET_CP_C = 4;
    GNUTLS_GOST_PARAMSET_CP_D = 5;
;
{*
 * gnutls_ctype_target_t:
 * @GNUTLS_CTYPE_CLIENT: for requesting client certificate type values.
 * @GNUTLS_CTYPE_SERVER: for requesting server certificate type values.
 * @GNUTLS_CTYPE_OURS: for requesting our certificate type values.
 * @GNUTLS_CTYPE_PEERS: for requesting the peers' certificate type values.
 *
 * Enumeration of certificate type targets with respect to asymmetric
 * certificate types as specified in RFC7250 and P2P connection set up
 * as specified in draft-vanrein-tls-symmetry-02.
  }
type
  Pgnutls_ctype_target_t = ^Tgnutls_ctype_target_t;
  Tgnutls_ctype_target_t =  Longint;
  Const
    GNUTLS_CTYPE_CLIENT = 0;
    GNUTLS_CTYPE_SERVER = 1;
    GNUTLS_CTYPE_OURS = 2;
    GNUTLS_CTYPE_PEERS = 3;
;
{ If you want to change this, then also change the define in
 * gnutls_int.h, and recompile.
  }
type
  Pgnutls_transport_ptr_t = ^Tgnutls_transport_ptr_t;
  Tgnutls_transport_ptr_t = pointer;
  Pgnutls_session_int = ^Tgnutls_session_int;
  Tgnutls_session_int = record
      {undefined structure}
    end;


  Pgnutls_session_t = ^Tgnutls_session_t;
  Tgnutls_session_t = Pgnutls_session_int;
  Pgnutls_dh_params_int = ^Tgnutls_dh_params_int;
  Tgnutls_dh_params_int = record
      {undefined structure}
    end;


  Pgnutls_dh_params_t = ^Tgnutls_dh_params_t;
  Tgnutls_dh_params_t = Pgnutls_dh_params_int;
{ XXX ugly.  }
  Pgnutls_x509_privkey_int = ^Tgnutls_x509_privkey_int;
  Tgnutls_x509_privkey_int = record
      {undefined structure}
    end;


  Pgnutls_rsa_params_t = ^Tgnutls_rsa_params_t;
  Tgnutls_rsa_params_t = Pgnutls_x509_privkey_int;
  Pgnutls_priority_st = ^Tgnutls_priority_st;
  Tgnutls_priority_st = record
      {undefined structure}
    end;


  Pgnutls_priority_t = ^Tgnutls_priority_t;
  Tgnutls_priority_t = Pgnutls_priority_st;

  Pgnutls_datum_t = ^Tgnutls_datum_t;
  Tgnutls_datum_t = record
      data : Pbyte;
      size : dword;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

  Pgnutls_library_config_st = ^Tgnutls_library_config_st;
  Tgnutls_library_config_st = record
      name : Pchar;
      value : Pchar;
    end;

  Pgnutls_params_st = ^Tgnutls_params_st;
  Tgnutls_params_st = record
      _type : Tgnutls_params_type_t;
      params : record
          case longint of
            0 : ( dh : Tgnutls_dh_params_t );
            1 : ( rsa_export : Tgnutls_rsa_params_t );
          end;
      deinit : longint;
    end;
{ xxxxxxxxxxxxxxxxxxxxxxxxxxx }
{typedef int gnutls_params_function(gnutls_session_t, gnutls_params_type_t,				   gnutls_params_st *); }
{ internal functions  }

function gnutls_init(session:Pgnutls_session_t; flags:dword):longint;cdecl;external;
procedure gnutls_deinit(session:Tgnutls_session_t);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _gnutls_deinit(x : longint) : longint;

function gnutls_bye(session:Tgnutls_session_t; how:Tgnutls_close_request_t):longint;cdecl;external;
function gnutls_handshake(session:Tgnutls_session_t):longint;cdecl;external;
function gnutls_reauth(session:Tgnutls_session_t; flags:dword):longint;cdecl;external;
{ was #define dname def_expr }
function GNUTLS_DEFAULT_HANDSHAKE_TIMEOUT : dword;  

{ was #define dname def_expr }
function GNUTLS_INDEFINITE_TIMEOUT : dword;  

procedure gnutls_handshake_set_timeout(session:Tgnutls_session_t; ms:dword);cdecl;external;
function gnutls_rehandshake(session:Tgnutls_session_t):longint;cdecl;external;
const
  GNUTLS_KU_PEER = 1;  

function gnutls_session_key_update(session:Tgnutls_session_t; flags:dword):longint;cdecl;external;
function gnutls_alert_get(session:Tgnutls_session_t):Tgnutls_alert_description_t;cdecl;external;
function gnutls_alert_send(session:Tgnutls_session_t; level:Tgnutls_alert_level_t; desc:Tgnutls_alert_description_t):longint;cdecl;external;
function gnutls_alert_send_appropriate(session:Tgnutls_session_t; err:longint):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_alert_get_name(alert:Tgnutls_alert_description_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_alert_get_strname(alert:Tgnutls_alert_description_t):Pchar;cdecl;external;
function gnutls_pk_bits_to_sec_param(algo:Tgnutls_pk_algorithm_t; bits:dword):Tgnutls_sec_param_t;cdecl;external;
(* Const before type ignored *)
function gnutls_sec_param_get_name(param:Tgnutls_sec_param_t):Pchar;cdecl;external;
function gnutls_sec_param_to_pk_bits(algo:Tgnutls_pk_algorithm_t; param:Tgnutls_sec_param_t):dword;cdecl;external;
function gnutls_sec_param_to_symmetric_bits(param:Tgnutls_sec_param_t):dword;cdecl;external;
{ Elliptic curves  }
(* Const before type ignored *)
function gnutls_ecc_curve_get_name(curve:Tgnutls_ecc_curve_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_ecc_curve_get_oid(curve:Tgnutls_ecc_curve_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_group_get_name(group:Tgnutls_group_t):Pchar;cdecl;external;
function gnutls_ecc_curve_get_size(curve:Tgnutls_ecc_curve_t):longint;cdecl;external;
function gnutls_ecc_curve_get(session:Tgnutls_session_t):Tgnutls_ecc_curve_t;cdecl;external;
function gnutls_group_get(session:Tgnutls_session_t):Tgnutls_group_t;cdecl;external;
{ get information on the current session  }
function gnutls_cipher_get(session:Tgnutls_session_t):Tgnutls_cipher_algorithm_t;cdecl;external;
function gnutls_early_cipher_get(session:Tgnutls_session_t):Tgnutls_cipher_algorithm_t;cdecl;external;
function gnutls_kx_get(session:Tgnutls_session_t):Tgnutls_kx_algorithm_t;cdecl;external;
function gnutls_mac_get(session:Tgnutls_session_t):Tgnutls_mac_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_prf_hash_get(session:Tgnutls_session_t):Tgnutls_digest_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_early_prf_hash_get(session:Tgnutls_session_t):Tgnutls_digest_algorithm_t;cdecl;external;
function gnutls_certificate_type_get(session:Tgnutls_session_t):Tgnutls_certificate_type_t;cdecl;external;
function gnutls_certificate_type_get2(session:Tgnutls_session_t; target:Tgnutls_ctype_target_t):Tgnutls_certificate_type_t;cdecl;external;
function gnutls_sign_algorithm_get(session:Tgnutls_session_t):longint;cdecl;external;
function gnutls_sign_algorithm_get_client(session:Tgnutls_session_t):longint;cdecl;external;
function gnutls_sign_algorithm_get_requested(session:Tgnutls_session_t; indx:Tsize_t; algo:Pgnutls_sign_algorithm_t):longint;cdecl;external;
{ the name of the specified algorithms  }
(* Const before type ignored *)
function gnutls_cipher_get_name(algorithm:Tgnutls_cipher_algorithm_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_mac_get_name(algorithm:Tgnutls_mac_algorithm_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_digest_get_name(algorithm:Tgnutls_digest_algorithm_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_digest_get_oid(algorithm:Tgnutls_digest_algorithm_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_kx_get_name(algorithm:Tgnutls_kx_algorithm_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_type_get_name(_type:Tgnutls_certificate_type_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_pk_get_name(algorithm:Tgnutls_pk_algorithm_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_pk_get_oid(algorithm:Tgnutls_pk_algorithm_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_sign_get_name(algorithm:Tgnutls_sign_algorithm_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_sign_get_oid(sign:Tgnutls_sign_algorithm_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_gost_paramset_get_name(param:Tgnutls_gost_paramset_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_gost_paramset_get_oid(param:Tgnutls_gost_paramset_t):Pchar;cdecl;external;
function gnutls_cipher_get_key_size(algorithm:Tgnutls_cipher_algorithm_t):Tsize_t;cdecl;external;
function gnutls_mac_get_key_size(algorithm:Tgnutls_mac_algorithm_t):Tsize_t;cdecl;external;
function gnutls_sign_is_secure(algorithm:Tgnutls_sign_algorithm_t):dword;cdecl;external;
{ It is possible that a signature algorithm is ok to use for short-lived
 * data (e.g., to sign a TLS session), but not for data that are long-lived
 * like certificates. This flag is about checking the security of the algorithm
 * for long-lived data.  }
const
  GNUTLS_SIGN_FLAG_SECURE_FOR_CERTS = 1;  

function gnutls_sign_is_secure2(algorithm:Tgnutls_sign_algorithm_t; flags:dword):dword;cdecl;external;
function gnutls_sign_get_hash_algorithm(sign:Tgnutls_sign_algorithm_t):Tgnutls_digest_algorithm_t;cdecl;external;
function gnutls_sign_get_pk_algorithm(sign:Tgnutls_sign_algorithm_t):Tgnutls_pk_algorithm_t;cdecl;external;
function gnutls_pk_to_sign(pk:Tgnutls_pk_algorithm_t; hash:Tgnutls_digest_algorithm_t):Tgnutls_sign_algorithm_t;cdecl;external;
function gnutls_sign_supports_pk_algorithm(sign:Tgnutls_sign_algorithm_t; pk:Tgnutls_pk_algorithm_t):dword;cdecl;external;
const
  gnutls_sign_algorithm_get_name = gnutls_sign_get_name;  
(* Const before type ignored *)

function gnutls_mac_get_id(name:Pchar):Tgnutls_mac_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_digest_get_id(name:Pchar):Tgnutls_digest_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_cipher_get_id(name:Pchar):Tgnutls_cipher_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_kx_get_id(name:Pchar):Tgnutls_kx_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_protocol_get_id(name:Pchar):Tgnutls_protocol_t;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_type_get_id(name:Pchar):Tgnutls_certificate_type_t;cdecl;external;
(* Const before type ignored *)
function gnutls_pk_get_id(name:Pchar):Tgnutls_pk_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_sign_get_id(name:Pchar):Tgnutls_sign_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_ecc_curve_get_id(name:Pchar):Tgnutls_ecc_curve_t;cdecl;external;
function gnutls_ecc_curve_get_pk(curve:Tgnutls_ecc_curve_t):Tgnutls_pk_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_group_get_id(name:Pchar):Tgnutls_group_t;cdecl;external;
(* Const before type ignored *)
function gnutls_oid_to_digest(oid:Pchar):Tgnutls_digest_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_oid_to_mac(oid:Pchar):Tgnutls_mac_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_oid_to_pk(oid:Pchar):Tgnutls_pk_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_oid_to_sign(oid:Pchar):Tgnutls_sign_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_oid_to_ecc_curve(oid:Pchar):Tgnutls_ecc_curve_t;cdecl;external;
(* Const before type ignored *)
function gnutls_oid_to_gost_paramset(oid:Pchar):Tgnutls_gost_paramset_t;cdecl;external;
{ list supported algorithms  }
(* Const before type ignored *)
function gnutls_ecc_curve_list:Pgnutls_ecc_curve_t;cdecl;external;
(* Const before type ignored *)
function gnutls_group_list:Pgnutls_group_t;cdecl;external;
(* Const before type ignored *)
function gnutls_cipher_list:Pgnutls_cipher_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_mac_list:Pgnutls_mac_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_digest_list:Pgnutls_digest_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_protocol_list:Pgnutls_protocol_t;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_type_list:Pgnutls_certificate_type_t;cdecl;external;
(* Const before type ignored *)
function gnutls_kx_list:Pgnutls_kx_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_pk_list:Pgnutls_pk_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_sign_list:Pgnutls_sign_algorithm_t;cdecl;external;
(* Const before type ignored *)
function gnutls_cipher_suite_info(idx:Tsize_t; cs_id:Pbyte; kx:Pgnutls_kx_algorithm_t; cipher:Pgnutls_cipher_algorithm_t; mac:Pgnutls_mac_algorithm_t; 
           min_version:Pgnutls_protocol_t):Pchar;cdecl;external;
{ functions for run-time enablement of algorithms  }
function gnutls_ecc_curve_set_enabled(curve:Tgnutls_ecc_curve_t; enabled:dword):longint;cdecl;external;
function gnutls_sign_set_secure(sign:Tgnutls_sign_algorithm_t; secure:dword):longint;cdecl;external;
function gnutls_sign_set_secure_for_certs(sign:Tgnutls_sign_algorithm_t; secure:dword):longint;cdecl;external;
function gnutls_digest_set_secure(dig:Tgnutls_digest_algorithm_t; secure:dword):longint;cdecl;external;
function gnutls_protocol_set_enabled(version:Tgnutls_protocol_t; enabled:dword):longint;cdecl;external;
{ error functions  }
function gnutls_error_is_fatal(error:longint):longint;cdecl;external;
function gnutls_error_to_alert(err:longint; level:Plongint):longint;cdecl;external;
procedure gnutls_perror(error:longint);cdecl;external;
(* Const before type ignored *)
function gnutls_strerror(error:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_strerror_name(error:longint):Pchar;cdecl;external;
{ Semi-internal functions.
  }
procedure gnutls_handshake_set_private_extensions(session:Tgnutls_session_t; allow:longint);cdecl;external;
(* Const before type ignored *)
function gnutls_handshake_set_random(session:Tgnutls_session_t; random:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_handshake_get_last_out(session:Tgnutls_session_t):Tgnutls_handshake_description_t;cdecl;external;
function gnutls_handshake_get_last_in(session:Tgnutls_session_t):Tgnutls_handshake_description_t;cdecl;external;
{ Record layer functions.
  }
const
  GNUTLS_HEARTBEAT_WAIT = 1;  

function gnutls_heartbeat_ping(session:Tgnutls_session_t; data_size:Tsize_t; max_tries:dword; flags:dword):longint;cdecl;external;
function gnutls_heartbeat_pong(session:Tgnutls_session_t; flags:dword):longint;cdecl;external;
procedure gnutls_record_set_timeout(session:Tgnutls_session_t; ms:dword);cdecl;external;
procedure gnutls_record_disable_padding(session:Tgnutls_session_t);cdecl;external;
procedure gnutls_record_cork(session:Tgnutls_session_t);cdecl;external;
const
  GNUTLS_RECORD_WAIT = 1;  

function gnutls_record_uncork(session:Tgnutls_session_t; flags:dword):longint;cdecl;external;
function gnutls_record_discard_queued(session:Tgnutls_session_t):Tsize_t;cdecl;external;
function gnutls_record_get_state(session:Tgnutls_session_t; read:dword; mac_key:Pgnutls_datum_t; IV:Pgnutls_datum_t; cipher_key:Pgnutls_datum_t; 
           seq_number:array[0..7] of byte):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_record_set_state(session:Tgnutls_session_t; read:dword; seq_number:array[0..7] of byte):longint;cdecl;external;
type
  Pgnutls_range_st = ^Tgnutls_range_st;
  Tgnutls_range_st = record
      low : Tsize_t;
      high : Tsize_t;
    end;
(* Const before type ignored *)

function gnutls_range_split(session:Tgnutls_session_t; orig:Pgnutls_range_st; small_range:Pgnutls_range_st; rem_range:Pgnutls_range_st):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_record_send(session:Tgnutls_session_t; data:pointer; data_size:Tsize_t):Tssize_t;cdecl;external;
(* Const before type ignored *)
function gnutls_record_send2(session:Tgnutls_session_t; data:pointer; data_size:Tsize_t; pad:Tsize_t; flags:dword):Tssize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_record_send_range(session:Tgnutls_session_t; data:pointer; data_size:Tsize_t; range:Pgnutls_range_st):Tssize_t;cdecl;external;
function gnutls_record_send_file(session:Tgnutls_session_t; fd:longint; offset:Poff_t; count:Tsize_t):Tssize_t;cdecl;external;
function gnutls_record_recv(session:Tgnutls_session_t; data:pointer; data_size:Tsize_t):Tssize_t;cdecl;external;
type
  Pgnutls_packet_t = ^Tgnutls_packet_t;
  Tgnutls_packet_t = Pmbuffer_st;

function gnutls_record_recv_packet(session:Tgnutls_session_t; packet:Pgnutls_packet_t):Tssize_t;cdecl;external;
procedure gnutls_packet_get(packet:Tgnutls_packet_t; data:Pgnutls_datum_t; sequence:Pbyte);cdecl;external;
procedure gnutls_packet_deinit(packet:Tgnutls_packet_t);cdecl;external;
const
  gnutls_read = gnutls_record_recv;  
  gnutls_write = gnutls_record_send;  

function gnutls_record_recv_seq(session:Tgnutls_session_t; data:pointer; data_size:Tsize_t; seq:Pbyte):Tssize_t;cdecl;external;
function gnutls_record_overhead_size(session:Tgnutls_session_t):Tsize_t;cdecl;external;
function gnutls_est_record_overhead_size(version:Tgnutls_protocol_t; cipher:Tgnutls_cipher_algorithm_t; mac:Tgnutls_mac_algorithm_t; comp:Tgnutls_compression_method_t; flags:dword):Tsize_t;cdecl;external;
procedure gnutls_session_enable_compatibility_mode(session:Tgnutls_session_t);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_record_set_max_empty_records(session,x : longint) : longint;

function gnutls_record_can_use_length_hiding(session:Tgnutls_session_t):dword;cdecl;external;
function gnutls_record_get_direction(session:Tgnutls_session_t):longint;cdecl;external;
function gnutls_record_get_max_size(session:Tgnutls_session_t):Tsize_t;cdecl;external;
function gnutls_record_set_max_size(session:Tgnutls_session_t; size:Tsize_t):Tssize_t;cdecl;external;
function gnutls_record_set_max_recv_size(session:Tgnutls_session_t; size:Tsize_t):Tssize_t;cdecl;external;
function gnutls_record_check_pending(session:Tgnutls_session_t):Tsize_t;cdecl;external;
function gnutls_record_check_corked(session:Tgnutls_session_t):Tsize_t;cdecl;external;
function gnutls_record_get_max_early_data_size(session:Tgnutls_session_t):Tsize_t;cdecl;external;
function gnutls_record_set_max_early_data_size(session:Tgnutls_session_t; size:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_record_send_early_data(session:Tgnutls_session_t; data:pointer; length:Tsize_t):Tssize_t;cdecl;external;
function gnutls_record_recv_early_data(session:Tgnutls_session_t; data:pointer; data_size:Tsize_t):Tssize_t;cdecl;external;
procedure gnutls_session_force_valid(session:Tgnutls_session_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_prf(session:Tgnutls_session_t; label_size:Tsize_t; _label:Pchar; server_random_first:longint; extra_size:Tsize_t; 
           extra:Pchar; outsize:Tsize_t; out:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_prf_rfc5705(session:Tgnutls_session_t; label_size:Tsize_t; _label:Pchar; context_size:Tsize_t; context:Pchar; 
           outsize:Tsize_t; out:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_prf_early(session:Tgnutls_session_t; label_size:Tsize_t; _label:Pchar; context_size:Tsize_t; context:Pchar; 
           outsize:Tsize_t; out:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_prf_raw(session:Tgnutls_session_t; label_size:Tsize_t; _label:Pchar; seed_size:Tsize_t; seed:Pchar; 
           outsize:Tsize_t; out:Pchar):longint;cdecl;external;
{*
 * gnutls_server_name_type_t:
 * @GNUTLS_NAME_DNS: Domain Name System name type.
 *
 * Enumeration of different server name types.
  }
type
  Pgnutls_server_name_type_t = ^Tgnutls_server_name_type_t;
  Tgnutls_server_name_type_t =  Longint;
  Const
    GNUTLS_NAME_DNS = 1;
;
(* Const before type ignored *)

function gnutls_server_name_set(session:Tgnutls_session_t; _type:Tgnutls_server_name_type_t; name:pointer; name_length:Tsize_t):longint;cdecl;external;
function gnutls_server_name_get(session:Tgnutls_session_t; data:pointer; data_length:Psize_t; _type:Pdword; indx:dword):longint;cdecl;external;
function gnutls_heartbeat_get_timeout(session:Tgnutls_session_t):dword;cdecl;external;
procedure gnutls_heartbeat_set_timeouts(session:Tgnutls_session_t; retrans_timeout:dword; total_timeout:dword);cdecl;external;
const
  GNUTLS_HB_PEER_ALLOWED_TO_SEND = 1;  
  GNUTLS_HB_PEER_NOT_ALLOWED_TO_SEND = 1 shl 1;  
{ Heartbeat  }

procedure gnutls_heartbeat_enable(session:Tgnutls_session_t; _type:dword);cdecl;external;
const
  GNUTLS_HB_LOCAL_ALLOWED_TO_SEND = 1 shl 2;  

function gnutls_heartbeat_allowed(session:Tgnutls_session_t; _type:dword):dword;cdecl;external;
{ Safe renegotiation  }
function gnutls_safe_renegotiation_status(session:Tgnutls_session_t):dword;cdecl;external;
function gnutls_session_ext_master_secret_status(session:Tgnutls_session_t):dword;cdecl;external;
function gnutls_session_etm_status(session:Tgnutls_session_t):dword;cdecl;external;
{*
 * gnutls_session_flags_t:
 * @GNUTLS_SFLAGS_SAFE_RENEGOTIATION: Safe renegotiation (RFC5746) was used
 * @GNUTLS_SFLAGS_EXT_MASTER_SECRET: The extended master secret (RFC7627) extension was used
 * @GNUTLS_SFLAGS_ETM: The encrypt then MAC (RFC7366) extension was used
 * @GNUTLS_SFLAGS_RFC7919: The RFC7919 Diffie-Hellman parameters were negotiated
 * @GNUTLS_SFLAGS_HB_LOCAL_SEND: The heartbeat negotiation allows the local side to send heartbeat messages
 * @GNUTLS_SFLAGS_HB_PEER_SEND: The heartbeat negotiation allows the peer to send heartbeat messages
 * @GNUTLS_SFLAGS_FALSE_START: False start was used in this client session.
 * @GNUTLS_SFLAGS_SESSION_TICKET: A session ticket has been received by the server.
 * @GNUTLS_SFLAGS_POST_HANDSHAKE_AUTH: Indicates client capability for post-handshake auth; set only on server side.
 * @GNUTLS_SFLAGS_EARLY_START: The TLS1.3 server session returned early.
 * @GNUTLS_SFLAGS_EARLY_DATA: The TLS1.3 early data has been received by the server.
 * @GNUTLS_SFLAGS_CLI_REQUESTED_OCSP: Set when the client has requested OCSP staple during handshake.
 * @GNUTLS_SFLAGS_SERV_REQUESTED_OCSP: Set when the server has requested OCSP staple during handshake.
 *
 * Enumeration of different session parameters.
  }
type
  Pgnutls_session_flags_t = ^Tgnutls_session_flags_t;
  Tgnutls_session_flags_t =  Longint;
  Const
    GNUTLS_SFLAGS_SAFE_RENEGOTIATION = 1;
    GNUTLS_SFLAGS_EXT_MASTER_SECRET = 1 shl 1;
    GNUTLS_SFLAGS_ETM = 1 shl 2;
    GNUTLS_SFLAGS_HB_LOCAL_SEND = 1 shl 3;
    GNUTLS_SFLAGS_HB_PEER_SEND = 1 shl 4;
    GNUTLS_SFLAGS_FALSE_START = 1 shl 5;
    GNUTLS_SFLAGS_RFC7919 = 1 shl 6;
    GNUTLS_SFLAGS_SESSION_TICKET = 1 shl 7;
    GNUTLS_SFLAGS_POST_HANDSHAKE_AUTH = 1 shl 8;
    GNUTLS_SFLAGS_EARLY_START = 1 shl 9;
    GNUTLS_SFLAGS_EARLY_DATA = 1 shl 10;
    GNUTLS_SFLAGS_CLI_REQUESTED_OCSP = 1 shl 11;
    GNUTLS_SFLAGS_SERV_REQUESTED_OCSP = 1 shl 12;
;

function gnutls_session_get_flags(session:Tgnutls_session_t):dword;cdecl;external;
{*
 * gnutls_supplemental_data_format_type_t:
 * @GNUTLS_SUPPLEMENTAL_UNKNOWN: Unknown data format
 *
 * Enumeration of different supplemental data types (RFC 4680).
  }
type
  Pgnutls_supplemental_data_format_type_t = ^Tgnutls_supplemental_data_format_type_t;
  Tgnutls_supplemental_data_format_type_t =  Longint;
  Const
    GNUTLS_SUPPLEMENTAL_UNKNOWN = 0;
;
(* Const before type ignored *)

function gnutls_supplemental_get_name(_type:Tgnutls_supplemental_data_format_type_t):Pchar;cdecl;external;
{ SessionTicket, RFC 5077.  }
function gnutls_session_ticket_key_generate(key:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_session_ticket_enable_client(session:Tgnutls_session_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_session_ticket_enable_server(session:Tgnutls_session_t; key:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_session_ticket_send(session:Tgnutls_session_t; nr:dword; flags:dword):longint;cdecl;external;
{ SRTP, RFC 5764  }
{*
 * gnutls_srtp_profile_t:
 * @GNUTLS_SRTP_AES128_CM_HMAC_SHA1_80: 128 bit AES with a 80 bit HMAC-SHA1
 * @GNUTLS_SRTP_AES128_CM_HMAC_SHA1_32: 128 bit AES with a 32 bit HMAC-SHA1
 * @GNUTLS_SRTP_NULL_HMAC_SHA1_80: NULL cipher with a 80 bit HMAC-SHA1
 * @GNUTLS_SRTP_NULL_HMAC_SHA1_32: NULL cipher with a 32 bit HMAC-SHA1
 * @GNUTLS_SRTP_AEAD_AES_128_GCM: 128 bit AES with GCM
 * @GNUTLS_SRTP_AEAD_AES_256_GCM: 256 bit AES with GCM
 *
 * Enumeration of different SRTP protection profiles.
  }
type
  Pgnutls_srtp_profile_t = ^Tgnutls_srtp_profile_t;
  Tgnutls_srtp_profile_t =  Longint;
  Const
    GNUTLS_SRTP_AES128_CM_HMAC_SHA1_80 = $0001;
    GNUTLS_SRTP_AES128_CM_HMAC_SHA1_32 = $0002;
    GNUTLS_SRTP_NULL_HMAC_SHA1_80 = $0005;
    GNUTLS_SRTP_NULL_HMAC_SHA1_32 = $0006;
    GNUTLS_SRTP_AEAD_AES_128_GCM = $0007;
    GNUTLS_SRTP_AEAD_AES_256_GCM = $0008;
;

function gnutls_srtp_set_profile(session:Tgnutls_session_t; profile:Tgnutls_srtp_profile_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_srtp_set_profile_direct(session:Tgnutls_session_t; profiles:Pchar; err_pos:PPchar):longint;cdecl;external;
function gnutls_srtp_get_selected_profile(session:Tgnutls_session_t; profile:Pgnutls_srtp_profile_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_srtp_get_profile_name(profile:Tgnutls_srtp_profile_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_srtp_get_profile_id(name:Pchar; profile:Pgnutls_srtp_profile_t):longint;cdecl;external;
function gnutls_srtp_get_keys(session:Tgnutls_session_t; key_material:pointer; key_material_size:dword; client_key:Pgnutls_datum_t; client_salt:Pgnutls_datum_t; 
           server_key:Pgnutls_datum_t; server_salt:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_srtp_set_mki(session:Tgnutls_session_t; mki:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_srtp_get_mki(session:Tgnutls_session_t; mki:Pgnutls_datum_t):longint;cdecl;external;
{ COMPRESS_CERTIFICATE extension, RFC8879  }
function gnutls_compress_certificate_get_selected_method(session:Tgnutls_session_t):Tgnutls_compression_method_t;cdecl;external;
(* Const before type ignored *)
function gnutls_compress_certificate_set_methods(session:Tgnutls_session_t; methods:Pgnutls_compression_method_t; methods_len:Tsize_t):longint;cdecl;external;
{ ALPN TLS extension  }
{*
 * gnutls_alpn_flags_t:
 * @GNUTLS_ALPN_MANDATORY: Require ALPN negotiation. The connection will be
 *   aborted if no matching ALPN protocol is found.
 * @GNUTLS_ALPN_SERVER_PRECEDENCE: The choices set by the server
 *   will take precedence over the client's.
 *
 * Enumeration of different ALPN flags. These are used by gnutls_alpn_set_protocols().
  }
type
  Pgnutls_alpn_flags_t = ^Tgnutls_alpn_flags_t;
  Tgnutls_alpn_flags_t =  Longint;
  Const
    GNUTLS_ALPN_MANDATORY = 1;
    GNUTLS_ALPN_SERVER_PRECEDENCE = 1 shl 1;
;
  GNUTLS_ALPN_MAND = GNUTLS_ALPN_MANDATORY;  

function gnutls_alpn_get_selected_protocol(session:Tgnutls_session_t; protocol:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_alpn_set_protocols(session:Tgnutls_session_t; protocols:Pgnutls_datum_t; protocols_size:dword; flags:dword):longint;cdecl;external;
function gnutls_key_generate(key:Pgnutls_datum_t; key_size:dword):longint;cdecl;external;
const
  GNUTLS_PRIORITY_INIT_DEF_APPEND = 1;  
(* Const before type ignored *)
(* Const before type ignored *)

function gnutls_priority_init(priority_cache:Pgnutls_priority_t; priorities:Pchar; err_pos:PPchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_priority_init2(priority_cache:Pgnutls_priority_t; priorities:Pchar; err_pos:PPchar; flags:dword):longint;cdecl;external;
procedure gnutls_priority_deinit(priority_cache:Tgnutls_priority_t);cdecl;external;
function gnutls_priority_get_cipher_suite_index(pcache:Tgnutls_priority_t; idx:dword; sidx:Pdword):longint;cdecl;external;
const
  GNUTLS_PRIORITY_LIST_INIT_KEYWORDS = 1;  
  GNUTLS_PRIORITY_LIST_SPECIAL = 2;  
(* Const before type ignored *)

function gnutls_priority_string_list(iter:dword; flags:dword):Pchar;cdecl;external;
function gnutls_priority_set(session:Tgnutls_session_t; priority:Tgnutls_priority_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_priority_set_direct(session:Tgnutls_session_t; priorities:Pchar; err_pos:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_priority_certificate_type_list(pcache:Tgnutls_priority_t; list:PPdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_priority_certificate_type_list2(pcache:Tgnutls_priority_t; list:PPdword; target:Tgnutls_ctype_target_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_priority_sign_list(pcache:Tgnutls_priority_t; list:PPdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_priority_protocol_list(pcache:Tgnutls_priority_t; list:PPdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_priority_ecc_curve_list(pcache:Tgnutls_priority_t; list:PPdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_priority_group_list(pcache:Tgnutls_priority_t; list:PPdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_priority_kx_list(pcache:Tgnutls_priority_t; list:PPdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_priority_cipher_list(pcache:Tgnutls_priority_t; list:PPdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_priority_mac_list(pcache:Tgnutls_priority_t; list:PPdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_get_system_config_file:Pchar;cdecl;external;
function gnutls_set_default_priority(session:Tgnutls_session_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_set_default_priority_append(session:Tgnutls_session_t; add_prio:Pchar; err_pos:PPchar; flags:dword):longint;cdecl;external;
{ Returns the name of a cipher suite  }
(* Const before type ignored *)
function gnutls_cipher_suite_get_name(kx_algorithm:Tgnutls_kx_algorithm_t; cipher_algorithm:Tgnutls_cipher_algorithm_t; mac_algorithm:Tgnutls_mac_algorithm_t):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_ciphersuite_get(session:Tgnutls_session_t):Pchar;cdecl;external;
{ get the currently used protocol version  }
function gnutls_protocol_get_version(session:Tgnutls_session_t):Tgnutls_protocol_t;cdecl;external;
(* Const before type ignored *)
function gnutls_protocol_get_name(version:Tgnutls_protocol_t):Pchar;cdecl;external;
{ get/set session
  }
(* Const before type ignored *)
function gnutls_session_set_data(session:Tgnutls_session_t; session_data:pointer; session_data_size:Tsize_t):longint;cdecl;external;
function gnutls_session_get_data(session:Tgnutls_session_t; session_data:pointer; session_data_size:Psize_t):longint;cdecl;external;
function gnutls_session_get_data2(session:Tgnutls_session_t; data:Pgnutls_datum_t):longint;cdecl;external;
procedure gnutls_session_get_random(session:Tgnutls_session_t; client:Pgnutls_datum_t; server:Pgnutls_datum_t);cdecl;external;
procedure gnutls_session_get_master_secret(session:Tgnutls_session_t; secret:Pgnutls_datum_t);cdecl;external;
function gnutls_session_get_desc(session:Tgnutls_session_t):Pchar;cdecl;external;
{ xxxxxxxxxxxxxxxxxxxxxx }
{typedef int gnutls_certificate_verify_function(gnutls_session_t); }
procedure gnutls_session_set_verify_function(session:Tgnutls_session_t; func:Pgnutls_certificate_verify_function);cdecl;external;
{*
 * gnutls_vdata_types_t:
 * @GNUTLS_DT_UNKNOWN: Unknown data type.
 * @GNUTLS_DT_DNS_HOSTNAME: The data contain a null-terminated DNS hostname; the hostname will be 
 *   matched using the RFC6125 rules. If the data contain a textual IP (v4 or v6) address it will
 *   be marched against the IPAddress Alternative name, unless the verification flag %GNUTLS_VERIFY_DO_NOT_ALLOW_IP_MATCHES
 *   is specified.
 * @GNUTLS_DT_IP_ADDRESS: The data contain a raw IP address (4 or 16 bytes). If will be matched
 *   against the IPAddress Alternative name; option available since 3.6.0.
 * @GNUTLS_DT_RFC822NAME: The data contain a null-terminated email address; the email will be
 *   matched against the RFC822Name Alternative name of the certificate, or the EMAIL DN component if the
 *   former isn't available. Prior to matching the email address will be converted to ACE
 *   (ASCII-compatible-encoding).
 * @GNUTLS_DT_KEY_PURPOSE_OID: The data contain a null-terminated key purpose OID. It will be matched
 *   against the certificate's Extended Key Usage extension.
 *
 * Enumeration of different typed-data options. They are used as input to certificate
 * verification functions to provide information about the name and purpose of the
 * certificate. Only a single option of a type can be provided to the relevant functions
 * (i.e., options %GNUTLS_DT_DNS_HOSTNAME, %GNUTLS_DT_IP_ADDRESS and
 * %GNUTLS_DT_RFC822NAME cannot be combined).
  }
type
  Pgnutls_vdata_types_t = ^Tgnutls_vdata_types_t;
  Tgnutls_vdata_types_t =  Longint;
  Const
    GNUTLS_DT_UNKNOWN = 0;
    GNUTLS_DT_DNS_HOSTNAME = 1;
    GNUTLS_DT_KEY_PURPOSE_OID = 2;
    GNUTLS_DT_RFC822NAME = 3;
    GNUTLS_DT_IP_ADDRESS = 4;
;
type
  Pgnutls_typed_vdata_st = ^Tgnutls_typed_vdata_st;
  Tgnutls_typed_vdata_st = record
      _type : Tgnutls_vdata_types_t;
      data : Pbyte;
      size : dword;
    end;
(* Const before type ignored *)

procedure gnutls_session_set_verify_cert(session:Tgnutls_session_t; hostname:Pchar; flags:dword);cdecl;external;
procedure gnutls_session_set_verify_cert2(session:Tgnutls_session_t; data:Pgnutls_typed_vdata_st; elements:dword; flags:dword);cdecl;external;
function gnutls_session_get_verify_cert_status(para1:Tgnutls_session_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_session_set_premaster(session:Tgnutls_session_t; entity:dword; version:Tgnutls_protocol_t; kx:Tgnutls_kx_algorithm_t; cipher:Tgnutls_cipher_algorithm_t; 
           mac:Tgnutls_mac_algorithm_t; comp:Tgnutls_compression_method_t; master:Pgnutls_datum_t; session_id:Pgnutls_datum_t):longint;cdecl;external;
{ returns the session ID  }
const
  GNUTLS_MAX_SESSION_ID = 32;  

function gnutls_session_get_id(session:Tgnutls_session_t; session_id:pointer; session_id_size:Psize_t):longint;cdecl;external;
function gnutls_session_get_id2(session:Tgnutls_session_t; session_id:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_session_set_id(session:Tgnutls_session_t; sid:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_session_channel_binding(session:Tgnutls_session_t; cbtype:Tgnutls_channel_binding_t; cb:Pgnutls_datum_t):longint;cdecl;external;
{ checks if this session is a resumed one
  }
function gnutls_session_is_resumed(session:Tgnutls_session_t):longint;cdecl;external;
function gnutls_session_resumption_requested(session:Tgnutls_session_t):longint;cdecl;external;
type

  Tgnutls_db_store_func = function (para1:pointer; key:Tgnutls_datum_t; data:Tgnutls_datum_t):longint;cdecl;

  Tgnutls_db_remove_func = function (para1:pointer; key:Tgnutls_datum_t):longint;cdecl;

  Tgnutls_db_retr_func = function (para1:pointer; key:Tgnutls_datum_t):Tgnutls_datum_t;cdecl;

procedure gnutls_db_set_cache_expiration(session:Tgnutls_session_t; seconds:longint);cdecl;external;
function gnutls_db_get_default_cache_expiration:dword;cdecl;external;
procedure gnutls_db_remove_session(session:Tgnutls_session_t);cdecl;external;
procedure gnutls_db_set_retrieve_function(session:Tgnutls_session_t; retr_func:Tgnutls_db_retr_func);cdecl;external;
procedure gnutls_db_set_remove_function(session:Tgnutls_session_t; rem_func:Tgnutls_db_remove_func);cdecl;external;
procedure gnutls_db_set_store_function(session:Tgnutls_session_t; store_func:Tgnutls_db_store_func);cdecl;external;
procedure gnutls_db_set_ptr(session:Tgnutls_session_t; ptr:pointer);cdecl;external;
function gnutls_db_get_ptr(session:Tgnutls_session_t):pointer;cdecl;external;
function gnutls_db_check_entry(session:Tgnutls_session_t; session_entry:Tgnutls_datum_t):longint;cdecl;external;
function gnutls_db_check_entry_time(entry:Pgnutls_datum_t):Ttime_t;cdecl;external;
function gnutls_db_check_entry_expire_time(entry:Pgnutls_datum_t):Ttime_t;cdecl;external;
const
  GNUTLS_HOOK_POST = 1;  
  GNUTLS_HOOK_PRE = 0;  
  GNUTLS_HOOK_BOTH = -(1);  
{*
 * gnutls_handshake_hook_func:
 * @session: the current session
 * @htype: the type of the handshake message (%gnutls_handshake_description_t)
 * @when: non zero if this is a post-process/generation call and zero otherwise
 * @incoming: non zero if this is an incoming message and zero if this is an outgoing message
 * @msg: the (const) data of the handshake message without the handshake headers.
 *
 * Function prototype for handshake hooks. It is set using
 * gnutls_handshake_set_hook_function().
 *
 * Returns: Non zero on error.
  }
(* Const before type ignored *)
type

  Tgnutls_handshake_hook_func = function (para1:Tgnutls_session_t; htype:dword; when:dword; incoming:dword; msg:Pgnutls_datum_t):longint;cdecl;

procedure gnutls_handshake_set_hook_function(session:Tgnutls_session_t; htype:dword; when:longint; func:Tgnutls_handshake_hook_func);cdecl;external;
const
  gnutls_handshake_post_client_hello_func = gnutls_handshake_simple_hook_func;  
type

  Tgnutls_handshake_simple_hook_func = function (para1:Tgnutls_session_t):longint;cdecl;

procedure gnutls_handshake_set_post_client_hello_function(session:Tgnutls_session_t; func:Tgnutls_handshake_simple_hook_func);cdecl;external;
procedure gnutls_handshake_set_max_packet_length(session:Tgnutls_session_t; max:Tsize_t);cdecl;external;
{ returns libgnutls version (call it with a NULL argument)
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_check_version(req_version:Pchar):Pchar;cdecl;external;
{ A macro which will allow optimizing out calls to gnutls_check_version()
 * when the version being compiled with is sufficient.
 * Used as:
 *   if (gnutls_check_version_numerc(3,3,16)) 
  }
{ xxxxxxxxxxxxxxxxxxxxxxx }
{
#define gnutls_check_version_numeric(a, b, c)                            \
	((GNUTLS_VERSION_MAJOR >= (a)) &&                                \
	 ((GNUTLS_VERSION_NUMBER >= (((a) << 16) + ((b) << 8) + (c))) || \
	  gnutls_check_version(#a "." #b "." #c)))
 }
{ Functions for setting/clearing credentials
  }
procedure gnutls_credentials_clear(session:Tgnutls_session_t);cdecl;external;
{ cred is a structure defined by the kx algorithm
  }
function gnutls_credentials_set(session:Tgnutls_session_t; _type:Tgnutls_credentials_type_t; cred:pointer):longint;cdecl;external;
function gnutls_credentials_get(session:Tgnutls_session_t; _type:Tgnutls_credentials_type_t; cred:Ppointer):longint;cdecl;external;
const
  gnutls_cred_set = gnutls_credentials_set;  
{ x.509 types  }
type
  Pgnutls_pubkey_st = ^Tgnutls_pubkey_st;
  Tgnutls_pubkey_st = record
      {undefined structure}
    end;


  Pgnutls_pubkey_t = ^Tgnutls_pubkey_t;
  Tgnutls_pubkey_t = Pgnutls_pubkey_st;
  Pgnutls_privkey_st = ^Tgnutls_privkey_st;
  Tgnutls_privkey_st = record
      {undefined structure}
    end;


  Pgnutls_privkey_t = ^Tgnutls_privkey_t;
  Tgnutls_privkey_t = Pgnutls_privkey_st;
  Pgnutls_x509_privkey_int = ^Tgnutls_x509_privkey_int;
  Tgnutls_x509_privkey_int = record
      {undefined structure}
    end;


  Pgnutls_x509_privkey_t = ^Tgnutls_x509_privkey_t;
  Tgnutls_x509_privkey_t = Pgnutls_x509_privkey_int;
  Pgnutls_x509_crl_int = ^Tgnutls_x509_crl_int;
  Tgnutls_x509_crl_int = record
      {undefined structure}
    end;


  Pgnutls_x509_crl_t = ^Tgnutls_x509_crl_t;
  Tgnutls_x509_crl_t = Pgnutls_x509_crl_int;
  Pgnutls_x509_crt_int = ^Tgnutls_x509_crt_int;
  Tgnutls_x509_crt_int = record
      {undefined structure}
    end;


  Pgnutls_x509_crt_t = ^Tgnutls_x509_crt_t;
  Tgnutls_x509_crt_t = Pgnutls_x509_crt_int;
  Pgnutls_x509_crq_int = ^Tgnutls_x509_crq_int;
  Tgnutls_x509_crq_int = record
      {undefined structure}
    end;


  Pgnutls_x509_crq_t = ^Tgnutls_x509_crq_t;
  Tgnutls_x509_crq_t = Pgnutls_x509_crq_int;
  Pgnutls_openpgp_keyring_int = ^Tgnutls_openpgp_keyring_int;
  Tgnutls_openpgp_keyring_int = record
      {undefined structure}
    end;


  Pgnutls_openpgp_keyring_t = ^Tgnutls_openpgp_keyring_t;
  Tgnutls_openpgp_keyring_t = Pgnutls_openpgp_keyring_int;
{ Credential structures - used in gnutls_credentials_set();  }
  Pgnutls_certificate_credentials_st = ^Tgnutls_certificate_credentials_st;
  Tgnutls_certificate_credentials_st = record
      {undefined structure}
    end;


  Pgnutls_certificate_credentials_t = ^Tgnutls_certificate_credentials_t;
  Tgnutls_certificate_credentials_t = Pgnutls_certificate_credentials_st;

  Pgnutls_certificate_server_credentials = ^Tgnutls_certificate_server_credentials;
  Tgnutls_certificate_server_credentials = Tgnutls_certificate_credentials_t;

  Pgnutls_certificate_client_credentials = ^Tgnutls_certificate_client_credentials;
  Tgnutls_certificate_client_credentials = Tgnutls_certificate_credentials_t;

  Pgnutls_anon_server_credentials_t = ^Tgnutls_anon_server_credentials_t;
  Tgnutls_anon_server_credentials_t = Pgnutls_anon_server_credentials_st;

  Pgnutls_anon_client_credentials_t = ^Tgnutls_anon_client_credentials_t;
  Tgnutls_anon_client_credentials_t = Pgnutls_anon_client_credentials_st;

procedure gnutls_anon_free_server_credentials(sc:Tgnutls_anon_server_credentials_t);cdecl;external;
function gnutls_anon_allocate_server_credentials(sc:Pgnutls_anon_server_credentials_t):longint;cdecl;external;
procedure gnutls_anon_set_server_dh_params(res:Tgnutls_anon_server_credentials_t; dh_params:Tgnutls_dh_params_t);cdecl;external;
function gnutls_anon_set_server_known_dh_params(res:Tgnutls_anon_server_credentials_t; sec_param:Tgnutls_sec_param_t):longint;cdecl;external;
procedure gnutls_anon_set_server_params_function(res:Tgnutls_anon_server_credentials_t; func:Pgnutls_params_function);cdecl;external;
procedure gnutls_anon_free_client_credentials(sc:Tgnutls_anon_client_credentials_t);cdecl;external;
function gnutls_anon_allocate_client_credentials(sc:Pgnutls_anon_client_credentials_t):longint;cdecl;external;
{ CERTFILE is an x509 certificate in PEM form.
 * KEYFILE is a pkcs-1 private key in PEM form (for RSA keys).
  }
procedure gnutls_certificate_free_credentials(sc:Tgnutls_certificate_credentials_t);cdecl;external;
function gnutls_certificate_allocate_credentials(res:Pgnutls_certificate_credentials_t):longint;cdecl;external;
function gnutls_certificate_get_issuer(sc:Tgnutls_certificate_credentials_t; cert:Tgnutls_x509_crt_t; issuer:Pgnutls_x509_crt_t; flags:dword):longint;cdecl;external;
function gnutls_certificate_get_crt_raw(sc:Tgnutls_certificate_credentials_t; idx1:dword; idx2:dword; cert:Pgnutls_datum_t):longint;cdecl;external;
procedure gnutls_certificate_free_keys(sc:Tgnutls_certificate_credentials_t);cdecl;external;
procedure gnutls_certificate_free_cas(sc:Tgnutls_certificate_credentials_t);cdecl;external;
procedure gnutls_certificate_free_ca_names(sc:Tgnutls_certificate_credentials_t);cdecl;external;
procedure gnutls_certificate_free_crls(sc:Tgnutls_certificate_credentials_t);cdecl;external;
procedure gnutls_certificate_set_dh_params(res:Tgnutls_certificate_credentials_t; dh_params:Tgnutls_dh_params_t);cdecl;external;
function gnutls_certificate_set_known_dh_params(res:Tgnutls_certificate_credentials_t; sec_param:Tgnutls_sec_param_t):longint;cdecl;external;
procedure gnutls_certificate_set_verify_flags(res:Tgnutls_certificate_credentials_t; flags:dword);cdecl;external;
function gnutls_certificate_get_verify_flags(res:Tgnutls_certificate_credentials_t):dword;cdecl;external;
{*
 * gnutls_certificate_flags:
 * @GNUTLS_CERTIFICATE_SKIP_KEY_CERT_MATCH: Skip the key and certificate matching check.
 * @GNUTLS_CERTIFICATE_API_V2: If set the gnutls_certificate_set_*key* functions will return an index of the added key pair instead of zero.
 * @GNUTLS_CERTIFICATE_SKIP_OCSP_RESPONSE_CHECK: If set, the gnutls_certificate_set_ocsp_status_request_file
 *    function, will not check whether the response set matches any of the certificates.
 * @GNUTLS_CERTIFICATE_VERIFY_CRLS: This will enable CRL verification when added in the certificate structure.
 *    When used, it requires CAs to be added before CRLs.
 *
 * Enumeration of different certificate credentials flags.
  }
type
  Pgnutls_certificate_flags = ^Tgnutls_certificate_flags;
  Tgnutls_certificate_flags =  Longint;
  Const
    GNUTLS_CERTIFICATE_SKIP_KEY_CERT_MATCH = 1;
    GNUTLS_CERTIFICATE_API_V2 = 1 shl 1;
    GNUTLS_CERTIFICATE_SKIP_OCSP_RESPONSE_CHECK = 1 shl 2;
    GNUTLS_CERTIFICATE_VERIFY_CRLS = 1 shl 3;
;

procedure gnutls_certificate_set_flags(para1:Tgnutls_certificate_credentials_t; flags:dword);cdecl;external;
procedure gnutls_certificate_set_verify_limits(res:Tgnutls_certificate_credentials_t; max_bits:dword; max_depth:dword);cdecl;external;
function gnutls_certificate_set_x509_system_trust(cred:Tgnutls_certificate_credentials_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_set_x509_trust_file(cred:Tgnutls_certificate_credentials_t; cafile:Pchar; _type:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_set_x509_trust_dir(cred:Tgnutls_certificate_credentials_t; ca_dir:Pchar; _type:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_set_x509_trust_mem(res:Tgnutls_certificate_credentials_t; ca:Pgnutls_datum_t; _type:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_set_x509_crl_file(res:Tgnutls_certificate_credentials_t; crlfile:Pchar; _type:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_set_x509_crl_mem(res:Tgnutls_certificate_credentials_t; CRL:Pgnutls_datum_t; _type:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_certificate_set_x509_key_file(res:Tgnutls_certificate_credentials_t; certfile:Pchar; keyfile:Pchar; _type:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_certificate_set_x509_key_file2(res:Tgnutls_certificate_credentials_t; certfile:Pchar; keyfile:Pchar; _type:Tgnutls_x509_crt_fmt_t; pass:Pchar; 
           flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_certificate_set_x509_key_mem(res:Tgnutls_certificate_credentials_t; cert:Pgnutls_datum_t; key:Pgnutls_datum_t; _type:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_certificate_set_x509_key_mem2(res:Tgnutls_certificate_credentials_t; cert:Pgnutls_datum_t; key:Pgnutls_datum_t; _type:Tgnutls_x509_crt_fmt_t; pass:Pchar; 
           flags:dword):longint;cdecl;external;
procedure gnutls_certificate_send_x509_rdn_sequence(session:Tgnutls_session_t; status:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_certificate_set_x509_simple_pkcs12_file(res:Tgnutls_certificate_credentials_t; pkcs12file:Pchar; _type:Tgnutls_x509_crt_fmt_t; password:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_certificate_set_x509_simple_pkcs12_mem(res:Tgnutls_certificate_credentials_t; p12blob:Pgnutls_datum_t; _type:Tgnutls_x509_crt_fmt_t; password:Pchar):longint;cdecl;external;
{ New functions to allow setting already parsed X.509 stuff.
  }
function gnutls_certificate_set_x509_key(res:Tgnutls_certificate_credentials_t; cert_list:Pgnutls_x509_crt_t; cert_list_size:longint; key:Tgnutls_x509_privkey_t):longint;cdecl;external;
function gnutls_certificate_set_x509_trust(res:Tgnutls_certificate_credentials_t; ca_list:Pgnutls_x509_crt_t; ca_list_size:longint):longint;cdecl;external;
function gnutls_certificate_set_x509_crl(res:Tgnutls_certificate_credentials_t; crl_list:Pgnutls_x509_crl_t; crl_list_size:longint):longint;cdecl;external;
function gnutls_certificate_get_x509_key(res:Tgnutls_certificate_credentials_t; index:dword; key:Pgnutls_x509_privkey_t):longint;cdecl;external;
function gnutls_certificate_get_x509_crt(res:Tgnutls_certificate_credentials_t; index:dword; crt_list:PPgnutls_x509_crt_t; crt_list_size:Pdword):longint;cdecl;external;
{ OCSP status request extension, RFC 6066  }
type

  Tgnutls_status_request_ocsp_func = function (session:Tgnutls_session_t; ptr:pointer; ocsp_response:Pgnutls_datum_t):longint;cdecl;

procedure gnutls_certificate_set_ocsp_status_request_function(res:Tgnutls_certificate_credentials_t; ocsp_func:Tgnutls_status_request_ocsp_func; ptr:pointer);cdecl;external;
function gnutls_certificate_set_ocsp_status_request_function2(res:Tgnutls_certificate_credentials_t; idx:dword; ocsp_func:Tgnutls_status_request_ocsp_func; ptr:pointer):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_set_ocsp_status_request_file(res:Tgnutls_certificate_credentials_t; response_file:Pchar; idx:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_set_ocsp_status_request_file2(res:Tgnutls_certificate_credentials_t; response_file:Pchar; idx:dword; fmt:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_set_ocsp_status_request_mem(res:Tgnutls_certificate_credentials_t; resp:Pgnutls_datum_t; idx:dword; fmt:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
{ must be zero  }
type
  Pgnutls_ocsp_data_st = ^Tgnutls_ocsp_data_st;
  Tgnutls_ocsp_data_st = record
      version : dword;
      response : Tgnutls_datum_t;
      exptime : Ttime_t;
      padding : array[0..31] of byte;
    end;

function gnutls_certificate_get_ocsp_expiration(sc:Tgnutls_certificate_credentials_t; idx:dword; oidx:longint; flags:dword):Ttime_t;cdecl;external;
function gnutls_ocsp_status_request_enable_client(session:Tgnutls_session_t; responder_id:Pgnutls_datum_t; responder_id_size:Tsize_t; request_extensions:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_ocsp_status_request_get(session:Tgnutls_session_t; response:Pgnutls_datum_t):longint;cdecl;external;
const
  GNUTLS_OCSP_SR_IS_AVAIL = 1;  

function gnutls_ocsp_status_request_is_checked(session:Tgnutls_session_t; flags:dword):dword;cdecl;external;
function gnutls_ocsp_status_request_get2(session:Tgnutls_session_t; idx:dword; response:Pgnutls_datum_t):longint;cdecl;external;
{ RAW public key functions (RFC7250)  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_certificate_set_rawpk_key_mem(cred:Tgnutls_certificate_credentials_t; spki:Pgnutls_datum_t; pkey:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; pass:Pchar; 
           key_usage:dword; names:PPchar; names_length:dword; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_certificate_set_rawpk_key_file(cred:Tgnutls_certificate_credentials_t; rawpkfile:Pchar; privkeyfile:Pchar; format:Tgnutls_x509_crt_fmt_t; pass:Pchar; 
           key_usage:dword; names:PPchar; names_length:dword; privkey_flags:dword; pkcs11_flags:dword):longint;cdecl;external;
{ global state functions
  }
function gnutls_global_init:longint;cdecl;external;
procedure gnutls_global_deinit;cdecl;external;
(* Const before type ignored *)
function gnutls_get_library_config:Pgnutls_library_config_st;cdecl;external;
{*
 * gnutls_time_func:
 * @t: where to store time.
 *
 * Function prototype for time()-like function.  Set with
 * gnutls_global_set_time_function().
 *
 * Returns: Number of seconds since the epoch, or (time_t)-1 on errors.
  }
type

  Tgnutls_time_func = function (t:Ptime_t):Ttime_t;cdecl;

  Tmutex_init_func = function (mutex:Ppointer):longint;cdecl;

  Tmutex_lock_func = function (mutex:Ppointer):longint;cdecl;

  Tmutex_unlock_func = function (mutex:Ppointer):longint;cdecl;

  Tmutex_deinit_func = function (mutex:Ppointer):longint;cdecl;

procedure gnutls_global_set_mutex(init:Tmutex_init_func; deinit:Tmutex_deinit_func; lock:Tmutex_lock_func; unlock:Tmutex_unlock_func);cdecl;external;
type
  Pgnutls_alloc_function = ^Tgnutls_alloc_function;
  Tgnutls_alloc_function = function (para1:Tsize_t):pointer;cdecl;

  Pgnutls_calloc_function = ^Tgnutls_calloc_function;
  Tgnutls_calloc_function = function (para1:Tsize_t; para2:Tsize_t):pointer;cdecl;
(* Const before type ignored *)

  Tgnutls_is_secure_function = function (para1:pointer):longint;cdecl;

  Tgnutls_free_function = procedure (para1:pointer);cdecl;

  Pgnutls_realloc_function = ^Tgnutls_realloc_function;
  Tgnutls_realloc_function = function (para1:pointer; para2:Tsize_t):pointer;cdecl;

procedure gnutls_global_set_time_function(time_func:Tgnutls_time_func);cdecl;external;
{ For use in callbacks  }
  var
    gnutls_malloc : Tgnutls_alloc_function;cvar;external;
    gnutls_realloc : Tgnutls_realloc_function;cvar;external;
    gnutls_calloc : Tgnutls_calloc_function;cvar;external;
    gnutls_free : Tgnutls_free_function;cvar;external;
{$ifdef GNUTLS_INTERNAL_BUILD}
{#define gnutls_free(a) gnutls_free((void *)(a)), a = NULL }
{$endif}
(* Const before type ignored *)
  var
    gnutls_strdup : function (para1:Pchar):Pchar;cvar;external;
{ a variant of memset that doesn't get optimized out  }

procedure gnutls_memset(data:pointer; c:longint; size:Tsize_t);cdecl;external;
{ constant time memcmp  }
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_memcmp(s1:pointer; s2:pointer; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
type

  Tgnutls_log_func = procedure (para1:longint; para2:Pchar);cdecl;
(* Const before type ignored *)

  Tgnutls_audit_log_func = procedure (para1:Tgnutls_session_t; para2:Pchar);cdecl;

procedure gnutls_global_set_log_function(log_func:Tgnutls_log_func);cdecl;external;
procedure gnutls_global_set_audit_log_function(log_func:Tgnutls_audit_log_func);cdecl;external;
procedure gnutls_global_set_log_level(level:longint);cdecl;external;
{*
 * gnutls_keylog_func:
 * @session: the current session
 * @label: the keylog label
 * @secret: the (const) data of the derived secret.
 *
 * Function prototype for keylog hooks. It is set using
 * gnutls_session_set_keylog_function().
 *
 * Returns: Non zero on error.
 * Since: 3.6.13
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  Tgnutls_keylog_func = function (session:Tgnutls_session_t; _label:Pchar; secret:Pgnutls_datum_t):longint;cdecl;
(* Const before type ignored *)

function gnutls_session_get_keylog_function(session:Tgnutls_session_t):Tgnutls_keylog_func;cdecl;external;
procedure gnutls_session_set_keylog_function(session:Tgnutls_session_t; func:Tgnutls_keylog_func);cdecl;external;
{ Diffie-Hellman parameter handling.
  }
function gnutls_dh_params_init(dh_params:Pgnutls_dh_params_t):longint;cdecl;external;
procedure gnutls_dh_params_deinit(dh_params:Tgnutls_dh_params_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_dh_params_import_raw(dh_params:Tgnutls_dh_params_t; prime:Pgnutls_datum_t; generator:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_dh_params_import_dsa(dh_params:Tgnutls_dh_params_t; key:Tgnutls_x509_privkey_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_dh_params_import_raw2(dh_params:Tgnutls_dh_params_t; prime:Pgnutls_datum_t; generator:Pgnutls_datum_t; key_bits:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_dh_params_import_raw3(dh_params:Tgnutls_dh_params_t; prime:Pgnutls_datum_t; q:Pgnutls_datum_t; generator:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_dh_params_import_pkcs3(params:Tgnutls_dh_params_t; pkcs3_params:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t):longint;cdecl;external;
function gnutls_dh_params_generate2(params:Tgnutls_dh_params_t; bits:dword):longint;cdecl;external;
function gnutls_dh_params_export_pkcs3(params:Tgnutls_dh_params_t; format:Tgnutls_x509_crt_fmt_t; params_data:Pbyte; params_data_size:Psize_t):longint;cdecl;external;
function gnutls_dh_params_export2_pkcs3(params:Tgnutls_dh_params_t; format:Tgnutls_x509_crt_fmt_t; out:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_dh_params_export_raw(params:Tgnutls_dh_params_t; prime:Pgnutls_datum_t; generator:Pgnutls_datum_t; bits:Pdword):longint;cdecl;external;
function gnutls_dh_params_cpy(dst:Tgnutls_dh_params_t; src:Tgnutls_dh_params_t):longint;cdecl;external;
{ Session stuff
  }
{ clang-format off  }
{$include <sys/uio.h>}
type
  Tiovec = Tgiovec_t;
{ clang-format on  }

  Tgnutls_pull_func = function (para1:Tgnutls_transport_ptr_t; para2:pointer; para3:Tsize_t):Tssize_t;cdecl;
(* Const before type ignored *)

  Tgnutls_push_func = function (para1:Tgnutls_transport_ptr_t; para2:pointer; para3:Tsize_t):Tssize_t;cdecl;

function gnutls_system_recv_timeout(ptr:Tgnutls_transport_ptr_t; ms:dword):longint;cdecl;external;
type

  Tgnutls_pull_timeout_func = function (para1:Tgnutls_transport_ptr_t; ms:dword):longint;cdecl;
(* Const before type ignored *)

  Tgnutls_vec_push_func = function (para1:Tgnutls_transport_ptr_t; iov:Pgiovec_t; iovcnt:longint):Tssize_t;cdecl;

  Tgnutls_errno_func = function (para1:Tgnutls_transport_ptr_t):longint;cdecl;
{$if 0}
{ This will be defined as macro.  }

procedure gnutls_transport_set_int(session:Tgnutls_session_t; r:longint);cdecl;external;
{$endif}

procedure gnutls_transport_set_int2(session:Tgnutls_session_t; r:longint; s:longint);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_transport_set_int(s,i : longint) : longint;

procedure gnutls_transport_get_int2(session:Tgnutls_session_t; r:Plongint; s:Plongint);cdecl;external;
function gnutls_transport_get_int(session:Tgnutls_session_t):longint;cdecl;external;
procedure gnutls_transport_set_ptr(session:Tgnutls_session_t; ptr:Tgnutls_transport_ptr_t);cdecl;external;
procedure gnutls_transport_set_ptr2(session:Tgnutls_session_t; recv_ptr:Tgnutls_transport_ptr_t; send_ptr:Tgnutls_transport_ptr_t);cdecl;external;
function gnutls_transport_get_ptr(session:Tgnutls_session_t):Tgnutls_transport_ptr_t;cdecl;external;
procedure gnutls_transport_get_ptr2(session:Tgnutls_session_t; recv_ptr:Pgnutls_transport_ptr_t; send_ptr:Pgnutls_transport_ptr_t);cdecl;external;
procedure gnutls_transport_set_vec_push_function(session:Tgnutls_session_t; vec_func:Tgnutls_vec_push_func);cdecl;external;
procedure gnutls_transport_set_push_function(session:Tgnutls_session_t; push_func:Tgnutls_push_func);cdecl;external;
procedure gnutls_transport_set_pull_function(session:Tgnutls_session_t; pull_func:Tgnutls_pull_func);cdecl;external;
procedure gnutls_transport_set_pull_timeout_function(session:Tgnutls_session_t; func:Tgnutls_pull_timeout_func);cdecl;external;
procedure gnutls_transport_set_errno_function(session:Tgnutls_session_t; errno_func:Tgnutls_errno_func);cdecl;external;
procedure gnutls_transport_set_errno(session:Tgnutls_session_t; err:longint);cdecl;external;
{ session specific
  }
procedure gnutls_session_set_ptr(session:Tgnutls_session_t; ptr:pointer);cdecl;external;
function gnutls_session_get_ptr(session:Tgnutls_session_t):pointer;cdecl;external;
procedure gnutls_openpgp_send_cert(session:Tgnutls_session_t; status:Tgnutls_openpgp_crt_status_t);cdecl;external;
{ This function returns the hash of the given data.
  }
(* Const before type ignored *)
function gnutls_fingerprint(algo:Tgnutls_digest_algorithm_t; data:Pgnutls_datum_t; result:pointer; result_size:Psize_t):longint;cdecl;external;
{*
 * gnutls_random_art_t:
 * @GNUTLS_RANDOM_ART_OPENSSH: OpenSSH-style random art.
 *
 * Enumeration of different random art types.
  }
type
  Pgnutls_random_art = ^Tgnutls_random_art;
  Tgnutls_random_art =  Longint;
  Const
    GNUTLS_RANDOM_ART_OPENSSH = 1;
;
  Tgnutls_random_art_t = Tgnutls_random_art;
  Pgnutls_random_art_t = ^Tgnutls_random_art_t;
(* Const before type ignored *)

function gnutls_random_art(_type:Tgnutls_random_art_t; key_type:Pchar; key_size:dword; fpr:pointer; fpr_size:Tsize_t; 
           art:Pgnutls_datum_t):longint;cdecl;external;
{ IDNA  }
const
  GNUTLS_IDNA_FORCE_2008 = 1 shl 1;  
(* Const before type ignored *)

function gnutls_idna_map(input:Pchar; ilen:dword; out:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_idna_reverse_map(input:Pchar; ilen:dword; out:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
{ SRP
  }
type
  Pgnutls_srp_server_credentials_t = ^Tgnutls_srp_server_credentials_t;
  Tgnutls_srp_server_credentials_t = Pgnutls_srp_server_credentials_st;

  Pgnutls_srp_client_credentials_t = ^Tgnutls_srp_client_credentials_t;
  Tgnutls_srp_client_credentials_t = Pgnutls_srp_client_credentials_st;

procedure gnutls_srp_free_client_credentials(sc:Tgnutls_srp_client_credentials_t);cdecl;external;
function gnutls_srp_allocate_client_credentials(sc:Pgnutls_srp_client_credentials_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_srp_set_client_credentials(res:Tgnutls_srp_client_credentials_t; username:Pchar; password:Pchar):longint;cdecl;external;
procedure gnutls_srp_free_server_credentials(sc:Tgnutls_srp_server_credentials_t);cdecl;external;
function gnutls_srp_allocate_server_credentials(sc:Pgnutls_srp_server_credentials_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_srp_set_server_credentials_file(res:Tgnutls_srp_server_credentials_t; password_file:Pchar; password_conf_file:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_srp_server_get_username(session:Tgnutls_session_t):Pchar;cdecl;external;
procedure gnutls_srp_set_prime_bits(session:Tgnutls_session_t; bits:dword);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_srp_verifier(username:Pchar; password:Pchar; salt:Pgnutls_datum_t; generator:Pgnutls_datum_t; prime:Pgnutls_datum_t; 
           res:Pgnutls_datum_t):longint;cdecl;external;
{ The static parameters defined in draft-ietf-tls-srp-05
 * Those should be used as input to gnutls_srp_verifier().
  }
(* Const before type ignored *)
  var
    gnutls_srp_8192_group_prime : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_srp_8192_group_generator : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_srp_4096_group_prime : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_srp_4096_group_generator : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_srp_3072_group_prime : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_srp_3072_group_generator : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_srp_2048_group_prime : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_srp_2048_group_generator : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_srp_1536_group_prime : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_srp_1536_group_generator : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_srp_1024_group_prime : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_srp_1024_group_generator : Tgnutls_datum_t;cvar;external;
{ The static parameters defined in rfc7919
  }
(* Const before type ignored *)
    gnutls_ffdhe_8192_group_prime : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_8192_group_q : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_8192_group_generator : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_8192_key_bits : dword;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_6144_group_prime : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_6144_group_q : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_6144_group_generator : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_6144_key_bits : dword;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_4096_group_prime : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_4096_group_q : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_4096_group_generator : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_4096_key_bits : dword;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_3072_group_prime : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_3072_group_q : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_3072_group_generator : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_3072_key_bits : dword;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_2048_group_prime : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_2048_group_q : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_2048_group_generator : Tgnutls_datum_t;cvar;external;
(* Const before type ignored *)
    gnutls_ffdhe_2048_key_bits : dword;cvar;external;
{ xxxxxxxxxxxxxxxxxxxxx }
{
typedef int gnutls_srp_server_credentials_function(gnutls_session_t,
						   const char *username,
						   gnutls_datum_t *salt,
						   gnutls_datum_t *verifier,
						   gnutls_datum_t *generator,
						   gnutls_datum_t *prime);
 }

procedure gnutls_srp_set_server_credentials_function(cred:Tgnutls_srp_server_credentials_t; func:Pgnutls_srp_server_credentials_function);cdecl;external;
{ xxxxxxxxxxxxxx }
{typedef int gnutls_srp_client_credentials_function(gnutls_session_t, char **,						   char **); }
procedure gnutls_srp_set_client_credentials_function(cred:Tgnutls_srp_client_credentials_t; func:Pgnutls_srp_client_credentials_function);cdecl;external;
(* Const before type ignored *)
function gnutls_srp_base64_encode(data:Pgnutls_datum_t; result:Pchar; result_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_srp_base64_encode2(data:Pgnutls_datum_t; result:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_srp_base64_decode(b64_data:Pgnutls_datum_t; result:Pchar; result_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_srp_base64_decode2(b64_data:Pgnutls_datum_t; result:Pgnutls_datum_t):longint;cdecl;external;
const
  gnutls_srp_base64_encode_alloc = gnutls_srp_base64_encode2;  
  gnutls_srp_base64_decode_alloc = gnutls_srp_base64_decode2;  
(* Const before type ignored *)

procedure gnutls_srp_set_server_fake_salt_seed(sc:Tgnutls_srp_server_credentials_t; seed:Pgnutls_datum_t; salt_length:dword);cdecl;external;
{ PSK stuff  }
type
  Pgnutls_psk_server_credentials_t = ^Tgnutls_psk_server_credentials_t;
  Tgnutls_psk_server_credentials_t = Pgnutls_psk_server_credentials_st;

  Pgnutls_psk_client_credentials_t = ^Tgnutls_psk_client_credentials_t;
  Tgnutls_psk_client_credentials_t = Pgnutls_psk_client_credentials_st;
{*
 * gnutls_psk_key_flags:
 * @GNUTLS_PSK_KEY_RAW: PSK-key in raw format.
 * @GNUTLS_PSK_KEY_HEX: PSK-key in hex format.
 * @GNUTLS_PSK_KEY_EXT: PSK-key is external and to be imported.
 *
 * Enumeration of different PSK key flags.
  }

  Pgnutls_psk_key_flags = ^Tgnutls_psk_key_flags;
  Tgnutls_psk_key_flags =  Longint;
  Const
    GNUTLS_PSK_KEY_RAW = 0;
    GNUTLS_PSK_KEY_HEX = 1 shl 0;
    GNUTLS_PSK_KEY_EXT = 1 shl 1;
;

procedure gnutls_psk_free_client_credentials(sc:Tgnutls_psk_client_credentials_t);cdecl;external;
function gnutls_psk_allocate_client_credentials(sc:Pgnutls_psk_client_credentials_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_psk_set_client_credentials(res:Tgnutls_psk_client_credentials_t; username:Pchar; key:Pgnutls_datum_t; flags:Tgnutls_psk_key_flags):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_psk_set_client_credentials2(res:Tgnutls_psk_client_credentials_t; username:Pgnutls_datum_t; key:Pgnutls_datum_t; flags:Tgnutls_psk_key_flags):longint;cdecl;external;
procedure gnutls_psk_free_server_credentials(sc:Tgnutls_psk_server_credentials_t);cdecl;external;
function gnutls_psk_allocate_server_credentials(sc:Pgnutls_psk_server_credentials_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_psk_set_server_credentials_file(res:Tgnutls_psk_server_credentials_t; password_file:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_psk_set_server_credentials_hint(res:Tgnutls_psk_server_credentials_t; hint:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_psk_server_get_username(session:Tgnutls_session_t):Pchar;cdecl;external;
function gnutls_psk_server_get_username2(session:Tgnutls_session_t; out:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_psk_client_get_hint(session:Tgnutls_session_t):Pchar;cdecl;external;
{ xxxxxxxxxxxxxxxxx }
{typedef int gnutls_psk_server_credentials_function(gnutls_session_t,						   const char *username,						   gnutls_datum_t*key); }
{typedef int gnutls_psk_server_credentials_function2(	gnutls_session_t, const gnutls_datum_t *username, gnutls_datum_t *key); }
{typedef int gnutls_psk_server_credentials_function3(	gnutls_session_t, const gnutls_datum_t *username, gnutls_datum_t *key,	gnutls_psk_key_flags *flags); }
procedure gnutls_psk_set_server_credentials_function(cred:Tgnutls_psk_server_credentials_t; func:Pgnutls_psk_server_credentials_function);cdecl;external;
procedure gnutls_psk_set_server_credentials_function2(cred:Tgnutls_psk_server_credentials_t; func:Pgnutls_psk_server_credentials_function2);cdecl;external;
procedure gnutls_psk_set_server_credentials_function3(cred:Tgnutls_psk_server_credentials_t; func:Pgnutls_psk_server_credentials_function3);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_psk_format_imported_identity(identity:Pgnutls_datum_t; context:Pgnutls_datum_t; version:Tgnutls_protocol_t; hash:Tgnutls_digest_algorithm_t; imported_identity:Pgnutls_datum_t):longint;cdecl;external;
{ xxxxxxxxxxxxxxxxxxxx }
{typedef int gnutls_psk_client_credentials_function(gnutls_session_t,						   char **username,						   gnutls_datum_t *key); }
{typedef int gnutls_psk_client_credentials_function2(gnutls_session_t,						    gnutls_datum_t *username,						    gnutls_datum_t *key); }
{typedef int gnutls_psk_client_credentials_function3(	gnutls_session_t, gnutls_datum_t *username, gnutls_datum_t *key,	gnutls_psk_key_flags *flags); }
procedure gnutls_psk_set_client_credentials_function(cred:Tgnutls_psk_client_credentials_t; func:Pgnutls_psk_client_credentials_function);cdecl;external;
procedure gnutls_psk_set_client_credentials_function2(cred:Tgnutls_psk_client_credentials_t; func:Pgnutls_psk_client_credentials_function2);cdecl;external;
procedure gnutls_psk_set_client_credentials_function3(cred:Tgnutls_psk_client_credentials_t; func:Pgnutls_psk_client_credentials_function3);cdecl;external;
(* Const before type ignored *)
function gnutls_hex_encode(data:Pgnutls_datum_t; result:Pchar; result_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_hex_decode(hex_data:Pgnutls_datum_t; result:pointer; result_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_hex_encode2(data:Pgnutls_datum_t; result:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_hex_decode2(data:Pgnutls_datum_t; result:Pgnutls_datum_t):longint;cdecl;external;
procedure gnutls_psk_set_server_dh_params(res:Tgnutls_psk_server_credentials_t; dh_params:Tgnutls_dh_params_t);cdecl;external;
function gnutls_psk_set_server_known_dh_params(res:Tgnutls_psk_server_credentials_t; sec_param:Tgnutls_sec_param_t):longint;cdecl;external;
procedure gnutls_psk_set_server_params_function(res:Tgnutls_psk_server_credentials_t; func:Pgnutls_params_function);cdecl;external;
{*
 * gnutls_x509_subject_alt_name_t:
 * @GNUTLS_SAN_DNSNAME: DNS-name SAN.
 * @GNUTLS_SAN_RFC822NAME: E-mail address SAN.
 * @GNUTLS_SAN_URI: URI SAN.
 * @GNUTLS_SAN_IPADDRESS: IP address SAN.
 * @GNUTLS_SAN_OTHERNAME: OtherName SAN.
 * @GNUTLS_SAN_DN: DN SAN.
 * @GNUTLS_SAN_REGISTERED_ID: RegisteredID.
 * @GNUTLS_SAN_OTHERNAME_XMPP: Virtual SAN, used by certain functions for convenience.
 * @GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL: Virtual SAN, used by certain functions for convenience.
 * @GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL: Virtual SAN, used by certain functions for convenience.
 *
 * Enumeration of different subject alternative names types.
  }
{ The following are "virtual" subject alternative name types, in
	   that they are represented by an otherName value and an OID.
	   Used by gnutls_x509_crt_get_subject_alt_othername_oid.   }
type
  Pgnutls_x509_subject_alt_name_t = ^Tgnutls_x509_subject_alt_name_t;
  Tgnutls_x509_subject_alt_name_t =  Longint;
  Const
    GNUTLS_SAN_DNSNAME = 1;
    GNUTLS_SAN_RFC822NAME = 2;
    GNUTLS_SAN_URI = 3;
    GNUTLS_SAN_IPADDRESS = 4;
    GNUTLS_SAN_OTHERNAME = 5;
    GNUTLS_SAN_DN = 6;
    GNUTLS_SAN_REGISTERED_ID = 7;
    GNUTLS_SAN_MAX = GNUTLS_SAN_REGISTERED_ID;
    GNUTLS_SAN_OTHERNAME_XMPP = 1000;
    GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL = 1001;
    GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL = 1002;
;
type
  Pgnutls_openpgp_crt_int = ^Tgnutls_openpgp_crt_int;
  Tgnutls_openpgp_crt_int = record
      {undefined structure}
    end;


  Pgnutls_openpgp_crt_t = ^Tgnutls_openpgp_crt_t;
  Tgnutls_openpgp_crt_t = Pgnutls_openpgp_crt_int;
  Pgnutls_openpgp_privkey_int = ^Tgnutls_openpgp_privkey_int;
  Tgnutls_openpgp_privkey_int = record
      {undefined structure}
    end;


  Pgnutls_openpgp_privkey_t = ^Tgnutls_openpgp_privkey_t;
  Tgnutls_openpgp_privkey_t = Pgnutls_openpgp_privkey_int;
  Pgnutls_pkcs11_privkey_st = ^Tgnutls_pkcs11_privkey_st;
  Tgnutls_pkcs11_privkey_st = record
      {undefined structure}
    end;


  Pgnutls_pkcs11_privkey_t = ^Tgnutls_pkcs11_privkey_t;
  Tgnutls_pkcs11_privkey_t = Pgnutls_pkcs11_privkey_st;
{*
 * gnutls_privkey_type_t:
 * @GNUTLS_PRIVKEY_X509: X.509 private key, #gnutls_x509_privkey_t.
 * @GNUTLS_PRIVKEY_OPENPGP: OpenPGP private key, #gnutls_openpgp_privkey_t.
 * @GNUTLS_PRIVKEY_PKCS11: PKCS11 private key, #gnutls_pkcs11_privkey_t.
 * @GNUTLS_PRIVKEY_EXT: External private key, operating using callbacks.
 *
 * Enumeration of different private key types.
  }

  Pgnutls_privkey_type_t = ^Tgnutls_privkey_type_t;
  Tgnutls_privkey_type_t =  Longint;
  Const
    GNUTLS_PRIVKEY_X509 = 0;
    GNUTLS_PRIVKEY_OPENPGP = 1;
    GNUTLS_PRIVKEY_PKCS11 = 2;
    GNUTLS_PRIVKEY_EXT = 3;
;
{ one for pgp keys  }
{ if non zero all keys will be deinited  }
type
  Pgnutls_retr2_st = ^Tgnutls_retr2_st;
  Tgnutls_retr2_st = record
      cert_type : Tgnutls_certificate_type_t;
      key_type : Tgnutls_privkey_type_t;
      cert : record
          case longint of
            0 : ( x509 : Pgnutls_x509_crt_t );
            1 : ( pgp : Tgnutls_openpgp_crt_t );
          end;
      ncerts : dword;
      key : record
          case longint of
            0 : ( x509 : Tgnutls_x509_privkey_t );
            1 : ( pgp : Tgnutls_openpgp_privkey_t );
            2 : ( pkcs11 : Tgnutls_pkcs11_privkey_t );
          end;
      deinit_all : dword;
    end;
{ Functions that allow auth_info_t structures handling
    }

function gnutls_auth_get_type(session:Tgnutls_session_t):Tgnutls_credentials_type_t;cdecl;external;
function gnutls_auth_server_get_type(session:Tgnutls_session_t):Tgnutls_credentials_type_t;cdecl;external;
function gnutls_auth_client_get_type(session:Tgnutls_session_t):Tgnutls_credentials_type_t;cdecl;external;
{ DH  }
procedure gnutls_dh_set_prime_bits(session:Tgnutls_session_t; bits:dword);cdecl;external;
function gnutls_dh_get_secret_bits(session:Tgnutls_session_t):longint;cdecl;external;
function gnutls_dh_get_peers_public_bits(session:Tgnutls_session_t):longint;cdecl;external;
function gnutls_dh_get_prime_bits(session:Tgnutls_session_t):longint;cdecl;external;
function gnutls_dh_get_group(session:Tgnutls_session_t; raw_gen:Pgnutls_datum_t; raw_prime:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_dh_get_pubkey(session:Tgnutls_session_t; raw_key:Pgnutls_datum_t):longint;cdecl;external;
{ X509PKI  }
{ These are set on the credentials structure.
    }
{ use gnutls_certificate_set_retrieve_function2() in abstract.h
   * instead. It's much more efficient.
    }
{ xxxxxxxxxxxxxxxxxxxxxxxxxx }
{ typedef int gnutls_certificate_retrieve_function(	gnutls_session_t, const gnutls_datum_t *req_ca_rdn, int nreqs,	const gnutls_pk_algorithm_t *pk_algos, int pk_algos_length,	gnutls_retr2_st *); }
procedure gnutls_certificate_set_retrieve_function(cred:Tgnutls_certificate_credentials_t; func:Pgnutls_certificate_retrieve_function);cdecl;external;
procedure gnutls_certificate_set_verify_function(cred:Tgnutls_certificate_credentials_t; func:Pgnutls_certificate_verify_function);cdecl;external;
procedure gnutls_certificate_server_set_request(session:Tgnutls_session_t; req:Tgnutls_certificate_request_t);cdecl;external;
{ get data from the session
    }
(* Const before type ignored *)
function gnutls_certificate_get_peers(session:Tgnutls_session_t; list_size:Pdword):Pgnutls_datum_t;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_get_ours(session:Tgnutls_session_t):Pgnutls_datum_t;cdecl;external;
function gnutls_certificate_get_peers_subkey_id(session:Tgnutls_session_t; id:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_certificate_activation_time_peers(session:Tgnutls_session_t):Ttime_t;cdecl;external;
function gnutls_certificate_expiration_time_peers(session:Tgnutls_session_t):Ttime_t;cdecl;external;
function gnutls_certificate_client_get_request_status(session:Tgnutls_session_t):dword;cdecl;external;
function gnutls_certificate_verify_peers2(session:Tgnutls_session_t; status:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_certificate_verify_peers3(session:Tgnutls_session_t; hostname:Pchar; status:Pdword):longint;cdecl;external;
function gnutls_certificate_verify_peers(session:Tgnutls_session_t; data:Pgnutls_typed_vdata_st; elements:dword; status:Pdword):longint;cdecl;external;
function gnutls_certificate_verification_status_print(status:dword; _type:Tgnutls_certificate_type_t; out:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_pem_base64_encode(msg:Pchar; data:Pgnutls_datum_t; result:Pchar; result_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_pem_base64_decode(header:Pchar; b64_data:Pgnutls_datum_t; result:Pbyte; result_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_pem_base64_encode2(msg:Pchar; data:Pgnutls_datum_t; result:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_pem_base64_decode2(header:Pchar; b64_data:Pgnutls_datum_t; result:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_base64_encode2(data:Pgnutls_datum_t; result:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_base64_decode2(b64_data:Pgnutls_datum_t; result:Pgnutls_datum_t):longint;cdecl;external;
const
  gnutls_pem_base64_encode_alloc = gnutls_pem_base64_encode2;  
  gnutls_pem_base64_decode_alloc = gnutls_pem_base64_decode2;  
{ key_usage will be an OR of the following values:
    }
{ when the key is to be used for signing:  }
  GNUTLS_KEY_DIGITAL_SIGNATURE = 128;  
  GNUTLS_KEY_NON_REPUDIATION = 64;  
{ when the key is to be used for encryption:  }
  GNUTLS_KEY_KEY_ENCIPHERMENT = 32;  
  GNUTLS_KEY_DATA_ENCIPHERMENT = 16;  
  GNUTLS_KEY_KEY_AGREEMENT = 8;  
  GNUTLS_KEY_KEY_CERT_SIGN = 4;  
  GNUTLS_KEY_CRL_SIGN = 2;  
  GNUTLS_KEY_ENCIPHER_ONLY = 1;  
  GNUTLS_KEY_DECIPHER_ONLY = 32768;  

procedure gnutls_certificate_set_params_function(res:Tgnutls_certificate_credentials_t; func:Pgnutls_params_function);cdecl;external;
procedure gnutls_anon_set_params_function(res:Tgnutls_anon_server_credentials_t; func:Pgnutls_params_function);cdecl;external;
procedure gnutls_psk_set_params_function(res:Tgnutls_psk_server_credentials_t; func:Pgnutls_params_function);cdecl;external;
(* Const before type ignored *)
function gnutls_hex2bin(hex_data:Pchar; hex_size:Tsize_t; bin_data:pointer; bin_size:Psize_t):longint;cdecl;external;
{ Trust on first use (or ssh like) functions  }
{ stores the provided information to a database
    }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type

  Tgnutls_tdb_store_func = function (db_name:Pchar; host:Pchar; service:Pchar; expiration:Ttime_t; pubkey:Pgnutls_datum_t):longint;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Tgnutls_tdb_store_commitment_func = function (db_name:Pchar; host:Pchar; service:Pchar; expiration:Ttime_t; hash_algo:Tgnutls_digest_algorithm_t; 
               hash:Pgnutls_datum_t):longint;cdecl;
{ searches for the provided host/service pair that match the
   * provided public key in the database.  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Tgnutls_tdb_verify_func = function (db_name:Pchar; host:Pchar; service:Pchar; pubkey:Pgnutls_datum_t):longint;cdecl;
  Pgnutls_tdb_int = ^Tgnutls_tdb_int;
  Tgnutls_tdb_int = record
      {undefined structure}
    end;


  Pgnutls_tdb_t = ^Tgnutls_tdb_t;
  Tgnutls_tdb_t = Pgnutls_tdb_int;

function gnutls_tdb_init(tdb:Pgnutls_tdb_t):longint;cdecl;external;
procedure gnutls_tdb_set_store_func(tdb:Tgnutls_tdb_t; store:Tgnutls_tdb_store_func);cdecl;external;
procedure gnutls_tdb_set_store_commitment_func(tdb:Tgnutls_tdb_t; cstore:Tgnutls_tdb_store_commitment_func);cdecl;external;
procedure gnutls_tdb_set_verify_func(tdb:Tgnutls_tdb_t; verify:Tgnutls_tdb_verify_func);cdecl;external;
procedure gnutls_tdb_deinit(tdb:Tgnutls_tdb_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_verify_stored_pubkey(db_name:Pchar; tdb:Tgnutls_tdb_t; host:Pchar; service:Pchar; cert_type:Tgnutls_certificate_type_t; 
           cert:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
const
  GNUTLS_SCOMMIT_FLAG_ALLOW_BROKEN = 1;  
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gnutls_store_commitment(db_name:Pchar; tdb:Tgnutls_tdb_t; host:Pchar; service:Pchar; hash_algo:Tgnutls_digest_algorithm_t; 
           hash:Pgnutls_datum_t; expiration:Ttime_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_store_pubkey(db_name:Pchar; tdb:Tgnutls_tdb_t; host:Pchar; service:Pchar; cert_type:Tgnutls_certificate_type_t; 
           cert:Pgnutls_datum_t; expiration:Ttime_t; flags:dword):longint;cdecl;external;
{ Other helper functions  }
(* Const before type ignored *)
function gnutls_load_file(filename:Pchar; data:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_url_is_supported(url:Pchar):dword;cdecl;external;
{ PIN callback  }
{*
 * gnutls_pin_flag_t:
 * @GNUTLS_PIN_USER: The PIN for the user.
 * @GNUTLS_PIN_SO: The PIN for the security officer (admin).
 * @GNUTLS_PIN_CONTEXT_SPECIFIC: The PIN is for a specific action and key like signing.
 * @GNUTLS_PIN_FINAL_TRY: This is the final try before blocking.
 * @GNUTLS_PIN_COUNT_LOW: Few tries remain before token blocks.
 * @GNUTLS_PIN_WRONG: Last given PIN was not correct.
 *
 * Enumeration of different flags that are input to the PIN function.
  }
type
  Pgnutls_pin_flag_t = ^Tgnutls_pin_flag_t;
  Tgnutls_pin_flag_t =  Longint;
  Const
    GNUTLS_PIN_USER = 1 shl 0;
    GNUTLS_PIN_SO = 1 shl 1;
    GNUTLS_PIN_FINAL_TRY = 1 shl 2;
    GNUTLS_PIN_COUNT_LOW = 1 shl 3;
    GNUTLS_PIN_CONTEXT_SPECIFIC = 1 shl 4;
    GNUTLS_PIN_WRONG = 1 shl 5;
;
  GNUTLS_PKCS11_PIN_USER = GNUTLS_PIN_USER;  
  GNUTLS_PKCS11_PIN_SO = GNUTLS_PIN_SO;  
  GNUTLS_PKCS11_PIN_FINAL_TRY = GNUTLS_PIN_FINAL_TRY;  
  GNUTLS_PKCS11_PIN_COUNT_LOW = GNUTLS_PIN_COUNT_LOW;  
  GNUTLS_PKCS11_PIN_CONTEXT_SPECIFIC = GNUTLS_PIN_CONTEXT_SPECIFIC;  
  GNUTLS_PKCS11_PIN_WRONG = GNUTLS_PIN_WRONG;  
{*
 * gnutls_pin_callback_t:
 * @userdata: user-controlled data from gnutls_pkcs11_set_pin_function().
 * @attempt: pin-attempt counter, initially 0.
 * @token_url: URL of token.
 * @token_label: label of token.
 * @flags: a #gnutls_pin_flag_t flag.
 * @pin: buffer to hold PIN, of size @pin_max.
 * @pin_max: size of @pin buffer.
 *
 * Callback function type for PKCS#11 or TPM PIN entry.  It is set by
 * functions like gnutls_pkcs11_set_pin_function().
 *
 * The callback should provides the PIN code to unlock the token with
 * label @token_label, specified by the URL @token_url.
 *
 * The PIN code, as a NUL-terminated ASCII string, should be copied
 * into the @pin buffer (of maximum size @pin_max), and return 0 to
 * indicate success.  Alternatively, the callback may return a
 * negative gnutls error code to indicate failure and cancel PIN entry
 * (in which case, the contents of the @pin parameter are ignored).
 *
 * When a PIN is required, the callback will be invoked repeatedly
 * (and indefinitely) until either the returned PIN code is correct,
 * the callback returns failure, or the token refuses login (e.g. when
 * the token is locked due to too many incorrect PINs!).  For the
 * first such invocation, the @attempt counter will have value zero;
 * it will increase by one for each subsequent attempt.
 *
 * Returns: %GNUTLS_E_SUCCESS (0) on success or a negative error code on error.
 *
 * Since: 2.12.0
 * }
(* Const before type ignored *)
(* Const before type ignored *)
type

  Tgnutls_pin_callback_t = function (userdata:pointer; attempt:longint; token_url:Pchar; token_label:Pchar; flags:dword; 
               pin:Pchar; pin_max:Tsize_t):longint;cdecl;

procedure gnutls_certificate_set_pin_function(para1:Tgnutls_certificate_credentials_t; fn:Tgnutls_pin_callback_t; userdata:pointer);cdecl;external;
{ Public string related functions  }
type
  Pgnutls_buffer_t = ^Tgnutls_buffer_t;
  Tgnutls_buffer_t = Pgnutls_buffer_st;
(* Const before type ignored *)

function gnutls_buffer_append_data(para1:Tgnutls_buffer_t; data:pointer; data_size:Tsize_t):longint;cdecl;external;
const
  GNUTLS_UTF8_IGNORE_ERRS = 1;  
(* Const before type ignored *)

function gnutls_utf8_password_normalize(password:Pbyte; password_len:dword; out:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
{ Public extensions related functions  }
type
  Pgnutls_ext_priv_data_t = ^Tgnutls_ext_priv_data_t;
  Tgnutls_ext_priv_data_t = pointer;

procedure gnutls_ext_set_data(session:Tgnutls_session_t; _type:dword; para3:Tgnutls_ext_priv_data_t);cdecl;external;
function gnutls_ext_get_data(session:Tgnutls_session_t; _type:dword; para3:Pgnutls_ext_priv_data_t):longint;cdecl;external;
function gnutls_ext_get_current_msg(session:Tgnutls_session_t):dword;cdecl;external;
(* Const before type ignored *)
type

  Tgnutls_ext_recv_func = function (session:Tgnutls_session_t; data:Pbyte; len:Tsize_t):longint;cdecl;

  Tgnutls_ext_send_func = function (session:Tgnutls_session_t; extdata:Tgnutls_buffer_t):longint;cdecl;

  Tgnutls_ext_deinit_data_func = procedure (data:Tgnutls_ext_priv_data_t);cdecl;

  Tgnutls_ext_pack_func = function (data:Tgnutls_ext_priv_data_t; packed_data:Tgnutls_buffer_t):longint;cdecl;

  Tgnutls_ext_unpack_func = function (packed_data:Tgnutls_buffer_t; data:Pgnutls_ext_priv_data_t):longint;cdecl;

const
  GNUTLS_EXT_RAW_FLAG_TLS_CLIENT_HELLO = 1;  
  GNUTLS_EXT_RAW_FLAG_DTLS_CLIENT_HELLO = 1 shl 1;  
(* Const before type ignored *)
type

  Tgnutls_ext_raw_process_func = function (ctx:pointer; tls_id:dword; data:Pbyte; data_size:dword):longint;cdecl;
(* Const before type ignored *)

function gnutls_ext_raw_parse(ctx:pointer; cb:Tgnutls_ext_raw_process_func; data:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
{*
 * gnutls_ext_parse_type_t:
 * @GNUTLS_EXT_NONE: Never to be parsed
 * @GNUTLS_EXT_ANY: Any extension type (should not be used as it is used only internally).
 * @GNUTLS_EXT_VERSION_NEG: Extensions to be parsed first for TLS version negotiation.
 * @GNUTLS_EXT_MANDATORY: Parsed after @GNUTLS_EXT_VERSION_NEG and even when resuming.
 * @GNUTLS_EXT_APPLICATION: Parsed after @GNUTLS_EXT_MANDATORY
 * @GNUTLS_EXT_TLS: TLS-internal extensions, parsed after @GNUTLS_EXT_APPLICATION.
 *
 * Enumeration of different TLS extension parsing phases.  The @gnutls_ext_parse_type_t
 * indicates the time/phase an extension is parsed during Client or Server hello parsing.
 *
  }
type
  Pgnutls_ext_parse_type_t = ^Tgnutls_ext_parse_type_t;
  Tgnutls_ext_parse_type_t =  Longint;
  Const
    GNUTLS_EXT_ANY = 0;
    GNUTLS_EXT_APPLICATION = 1;
    GNUTLS_EXT_TLS = 2;
    GNUTLS_EXT_MANDATORY = 3;
    GNUTLS_EXT_NONE = 4;
    GNUTLS_EXT_VERSION_NEG = 5;
;
{*
 * gnutls_ext_flags_t:
 * @GNUTLS_EXT_FLAG_OVERRIDE_INTERNAL: If specified the extension registered will override the internal; this does not work with extensions existing prior to 3.6.0.
 * @GNUTLS_EXT_FLAG_CLIENT_HELLO: This extension can be present in a client hello
 * @GNUTLS_EXT_FLAG_TLS12_SERVER_HELLO: This extension can be present in a TLS1.2 or earlier server hello
 * @GNUTLS_EXT_FLAG_TLS13_SERVER_HELLO: This extension can be present in a TLS1.3 server hello
 * @GNUTLS_EXT_FLAG_EE: This extension can be present in encrypted extensions message
 * @GNUTLS_EXT_FLAG_HRR: This extension can be present in hello retry request message
 * @GNUTLS_EXT_FLAG_IGNORE_CLIENT_REQUEST: When flag is present, this extension will be send even if the client didn't advertise it. An extension of this type is the Cookie TLS1.3 extension.
 * @GNUTLS_EXT_FLAG_DTLS: This extension can be present under DTLS; otherwise ignored.
 * @GNUTLS_EXT_FLAG_TLS: This extension can be present under TLS; otherwise ignored.
 *
 * Enumeration of different TLS extension registration flags.
  }
{ ENCRYPTED  }
type
  Pgnutls_ext_flags_t = ^Tgnutls_ext_flags_t;
  Tgnutls_ext_flags_t =  Longint;
  Const
    GNUTLS_EXT_FLAG_OVERRIDE_INTERNAL = 1;
    GNUTLS_EXT_FLAG_CLIENT_HELLO = 1 shl 1;
    GNUTLS_EXT_FLAG_TLS12_SERVER_HELLO = 1 shl 2;
    GNUTLS_EXT_FLAG_TLS13_SERVER_HELLO = 1 shl 3;
    GNUTLS_EXT_FLAG_EE = 1 shl 4;
    GNUTLS_EXT_FLAG_HRR = 1 shl 5;
    GNUTLS_EXT_FLAG_IGNORE_CLIENT_REQUEST = 1 shl 6;
    GNUTLS_EXT_FLAG_TLS = 1 shl 7;
    GNUTLS_EXT_FLAG_DTLS = 1 shl 8;
;
{ Register a custom tls extension
  }
(* Const before type ignored *)

function gnutls_ext_register(name:Pchar; _type:longint; parse_point:Tgnutls_ext_parse_type_t; recv_func:Tgnutls_ext_recv_func; send_func:Tgnutls_ext_send_func; 
           deinit_func:Tgnutls_ext_deinit_data_func; pack_func:Tgnutls_ext_pack_func; unpack_func:Tgnutls_ext_unpack_func):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_session_ext_register(para1:Tgnutls_session_t; name:Pchar; _type:longint; parse_point:Tgnutls_ext_parse_type_t; recv_func:Tgnutls_ext_recv_func; 
           send_func:Tgnutls_ext_send_func; deinit_func:Tgnutls_ext_deinit_data_func; pack_func:Tgnutls_ext_pack_func; unpack_func:Tgnutls_ext_unpack_func; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_ext_get_name(ext:dword):Pchar;cdecl;external;
(* Const before type ignored *)
function gnutls_ext_get_name2(session:Tgnutls_session_t; tls_id:dword; parse_point:Tgnutls_ext_parse_type_t):Pchar;cdecl;external;
{ Public supplemental data related functions  }
(* Const before type ignored *)
type

  Tgnutls_supp_recv_func = function (session:Tgnutls_session_t; data:Pbyte; data_size:Tsize_t):longint;cdecl;

  Tgnutls_supp_send_func = function (session:Tgnutls_session_t; buf:Tgnutls_buffer_t):longint;cdecl;
(* Const before type ignored *)

function gnutls_supplemental_register(name:Pchar; _type:Tgnutls_supplemental_data_format_type_t; supp_recv_func:Tgnutls_supp_recv_func; supp_send_func:Tgnutls_supp_send_func):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_session_supplemental_register(session:Tgnutls_session_t; name:Pchar; _type:Tgnutls_supplemental_data_format_type_t; supp_recv_func:Tgnutls_supp_recv_func; supp_send_func:Tgnutls_supp_send_func; 
           flags:dword):longint;cdecl;external;
procedure gnutls_supplemental_recv(session:Tgnutls_session_t; do_recv_supplemental:dword);cdecl;external;
procedure gnutls_supplemental_send(session:Tgnutls_session_t; do_send_supplemental:dword);cdecl;external;
{ Anti-replay related functions  }
type
  Pgnutls_anti_replay_t = ^Tgnutls_anti_replay_t;
  Tgnutls_anti_replay_t = Pgnutls_anti_replay_st;

function gnutls_anti_replay_init(anti_replay:Pgnutls_anti_replay_t):longint;cdecl;external;
procedure gnutls_anti_replay_deinit(anti_replay:Tgnutls_anti_replay_t);cdecl;external;
procedure gnutls_anti_replay_set_window(anti_replay:Tgnutls_anti_replay_t; window:dword);cdecl;external;
procedure gnutls_anti_replay_enable(session:Tgnutls_session_t; anti_replay:Tgnutls_anti_replay_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
type

  Tgnutls_db_add_func = function (para1:pointer; exp_time:Ttime_t; key:Pgnutls_datum_t; data:Pgnutls_datum_t):longint;cdecl;

procedure gnutls_anti_replay_set_add_function(para1:Tgnutls_anti_replay_t; add_func:Tgnutls_db_add_func);cdecl;external;
procedure gnutls_anti_replay_set_ptr(para1:Tgnutls_anti_replay_t; ptr:pointer);cdecl;external;
{*
 * gnutls_record_encryption_level_t:
 * @GNUTLS_ENCRYPTION_LEVEL_INITIAL: initial level that doesn't involve any
 *    encryption
 * @GNUTLS_ENCRYPTION_LEVEL_EARLY: early traffic secret is installed
 * @GNUTLS_ENCRYPTION_LEVEL_HANDSHAKE: handshake traffic secret is installed
 * @GNUTLS_ENCRYPTION_LEVEL_APPLICATION: application traffic secret is installed
 *
 * Enumeration of different levels of record encryption currently in place.
 * This is used by gnutls_handshake_set_read_function() and
 * gnutls_handshake_write().
 *
 * Since: 3.7.0
  }
type
  Pgnutls_record_encryption_level_t = ^Tgnutls_record_encryption_level_t;
  Tgnutls_record_encryption_level_t =  Longint;
  Const
    GNUTLS_ENCRYPTION_LEVEL_INITIAL = 0;
    GNUTLS_ENCRYPTION_LEVEL_EARLY = 1;
    GNUTLS_ENCRYPTION_LEVEL_HANDSHAKE = 2;
    GNUTLS_ENCRYPTION_LEVEL_APPLICATION = 3;
;
{*
 * gnutls_handshake_read_func:
 * @session: the current session
 * @htype: the type of the handshake message (#gnutls_handshake_description_t)
 * @level: #gnutls_record_encryption_level_t
 * @data: the (const) data that was being sent
 * @data_size: the size of data
 *
 * Function prototype for handshake intercepting hooks. It is set using
 * gnutls_handshake_set_read_function().
 *
 * Returns: Non zero on error.
 * Since: 3.7.0
  }
(* Const before type ignored *)
type

  Tgnutls_handshake_read_func = function (session:Tgnutls_session_t; level:Tgnutls_record_encryption_level_t; htype:Tgnutls_handshake_description_t; data:pointer; data_size:Tsize_t):longint;cdecl;

procedure gnutls_handshake_set_read_function(session:Tgnutls_session_t; func:Tgnutls_handshake_read_func);cdecl;external;
(* Const before type ignored *)
function gnutls_handshake_write(session:Tgnutls_session_t; level:Tgnutls_record_encryption_level_t; data:pointer; data_size:Tsize_t):longint;cdecl;external;
{*
 * gnutls_handshake_secret_func:
 * @session: the current session
 * @level: the encryption level
 * @secret_read: the secret used for reading, can be %NULL if not set
 * @secret_write: the secret used for writing, can be %NULL if not set
 * @secret_size: the size of the secrets
 *
 * Function prototype for secret hooks. It is set using
 * gnutls_handshake_set_secret_function().
 *
 * Returns: Non zero on error.
 * Since: 3.7.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  Tgnutls_handshake_secret_func = function (session:Tgnutls_session_t; level:Tgnutls_record_encryption_level_t; secret_read:pointer; secret_write:pointer; secret_size:Tsize_t):longint;cdecl;

procedure gnutls_handshake_set_secret_function(session:Tgnutls_session_t; func:Tgnutls_handshake_secret_func);cdecl;external;
{*
 * gnutls_alert_read_func:
 * @session: the current session
 * @level: #gnutls_record_encryption_level_t
 * @alert_level: the level of the alert
 * @alert_desc: the alert description
 *
 * Function prototype for alert intercepting hooks. It is set using
 * gnutls_alert_set_read_function().
 *
 * Returns: Non zero on error.
 * Since: 3.7.0
  }
type

  Tgnutls_alert_read_func = function (session:Tgnutls_session_t; level:Tgnutls_record_encryption_level_t; alert_level:Tgnutls_alert_level_t; alert_desc:Tgnutls_alert_description_t):longint;cdecl;

procedure gnutls_alert_set_read_function(session:Tgnutls_session_t; func:Tgnutls_alert_read_func);cdecl;external;
{ FIPS140-2 related functions  }
function gnutls_fips140_mode_enabled:dword;cdecl;external;
{*
 * gnutls_fips_mode_t:
 * @GNUTLS_FIPS140_DISABLED: The FIPS140-2 mode is disabled.
 * @GNUTLS_FIPS140_STRICT: The default mode; all forbidden operations will cause an
 *                         operation failure via error code.
 * @GNUTLS_FIPS140_LAX: The library still uses the FIPS140-2 relevant algorithms but all
 *                      forbidden by FIPS140-2 operations are allowed; this is useful when the
 *                      application is aware of the followed security policy, and needs
 *                      to utilize disallowed operations for other reasons (e.g., compatibility).
 * @GNUTLS_FIPS140_LOG: Similarly to %GNUTLS_FIPS140_LAX, it allows forbidden operations; any use of them results
 *                      to a message to the audit callback functions.
 * @GNUTLS_FIPS140_SELFTESTS: A transient state during library initialization. That state
 *			cannot be set or seen by applications.
 *
 * Enumeration of different operational modes under FIPS140-2.
  }
type
  Pgnutls_fips_mode_t = ^Tgnutls_fips_mode_t;
  Tgnutls_fips_mode_t =  Longint;
  Const
    GNUTLS_FIPS140_DISABLED = 0;
    GNUTLS_FIPS140_STRICT = 1;
    GNUTLS_FIPS140_SELFTESTS = 2;
    GNUTLS_FIPS140_LAX = 3;
    GNUTLS_FIPS140_LOG = 4;
;
  GNUTLS_FIPS140_SET_MODE_THREAD = 1;  

procedure gnutls_fips140_set_mode(mode:Tgnutls_fips_mode_t; flags:dword);cdecl;external;
{ xxxxxxxxxxxxxxx }
{
#define GNUTLS_FIPS140_SET_LAX_MODE()                            \
	do                                                      \
		if (gnutls_fips140_mode_enabled())               \
			gnutls_fips140_set_mode(                 \
				GNUTLS_FIPS140_LAX,              \
				GNUTLS_FIPS140_SET_MODE_THREAD); \
	 while (0)

#define GNUTLS_FIPS140_SET_STRICT_MODE()                         \
	do                                                      \
		if (gnutls_fips140_mode_enabled())               \
			gnutls_fips140_set_mode(                 \
				GNUTLS_FIPS140_STRICT,           \
				GNUTLS_FIPS140_SET_MODE_THREAD); \
	 while (0)
 }
type
  Pgnutls_fips140_context_t = ^Tgnutls_fips140_context_t;
  Tgnutls_fips140_context_t = Pgnutls_fips140_context_st;

function gnutls_fips140_context_init(context:Pgnutls_fips140_context_t):longint;cdecl;external;
procedure gnutls_fips140_context_deinit(context:Tgnutls_fips140_context_t);cdecl;external;
{*
 * gnutls_fips140_operation_state_t:
 * @GNUTLS_FIPS140_OP_INITIAL: no previous operation has done
 * @GNUTLS_FIPS140_OP_APPROVED: the previous operation was FIPS approved
 * @GNUTLS_FIPS140_OP_NOT_APPROVED: the previous operation was not FIPS approved
 * @GNUTLS_FIPS140_OP_ERROR: the previous operation caused an error regardless of FIPS
 *
 * The FIPS operation state set by the preceding operation.
 *
 * There are state transition rules among the enum values:
 * - When the context is attached to a thread, it will be set to reset
 *   to the %GNUTLS_FIPS140_OP_INITIAL state
 * - From the %GNUTLS_FIPS140_OP_INITIAL state, the context can
 *   transition to either %GNUTLS_FIPS140_OP_APPROVED,
 *   %GNUTLS_FIPS140_OP_NOT_APPROVED, or %GNUTLS_FIPS140_OP_ERROR
 * - From the %GNUTLS_FIPS140_OP_APPROVED state, the context can
 *   transition to %GNUTLS_FIPS140_OP_NOT_APPROVED
 * - All other transitions are prohibited.
 *
 * Since: 3.7.3
  }
type
  Pgnutls_fips140_operation_state_t = ^Tgnutls_fips140_operation_state_t;
  Tgnutls_fips140_operation_state_t =  Longint;
  Const
    GNUTLS_FIPS140_OP_INITIAL = 0;
    GNUTLS_FIPS140_OP_APPROVED = 1;
    GNUTLS_FIPS140_OP_NOT_APPROVED = 2;
    GNUTLS_FIPS140_OP_ERROR = 3;
;

function gnutls_fips140_get_operation_state(context:Tgnutls_fips140_context_t):Tgnutls_fips140_operation_state_t;cdecl;external;
function gnutls_fips140_push_context(context:Tgnutls_fips140_context_t):longint;cdecl;external;
function gnutls_fips140_pop_context:longint;cdecl;external;
function gnutls_fips140_run_self_tests:longint;cdecl;external;
{*
 * gnutls_transport_ktls_enable_flags_t:
 * @GNUTLS_KTLS_RECV: ktls enabled for recv function.
 * @GNUTLS_KTLS_SEND: ktls enabled for send function.
 * @GNUTLS_KTLS_DUPLEX: ktls enabled for both recv and send functions.
 *
 * Flag enumeration of ktls enable status for recv and send functions.
 * This is used by gnutls_transport_is_ktls_enabled().
 *
 * Since: 3.7.3
  }
type
  Pgnutls_transport_ktls_enable_flags_t = ^Tgnutls_transport_ktls_enable_flags_t;
  Tgnutls_transport_ktls_enable_flags_t =  Longint;
  Const
    GNUTLS_KTLS_RECV = 1 shl 0;
    GNUTLS_KTLS_SEND = 1 shl 1;
    GNUTLS_KTLS_DUPLEX = GNUTLS_KTLS_RECV or GNUTLS_KTLS_SEND;
;

function gnutls_transport_is_ktls_enabled(session:Tgnutls_session_t):Tgnutls_transport_ktls_enable_flags_t;cdecl;external;
{ Gnutls error codes. The mapping to a TLS alert is also shown in
   * comments.
    }
const
  GNUTLS_E_SUCCESS = 0;  
  GNUTLS_E_UNKNOWN_COMPRESSION_ALGORITHM = -(3);  
  GNUTLS_E_UNKNOWN_CIPHER_TYPE = -(6);  
  GNUTLS_E_LARGE_PACKET = -(7);  
{ GNUTLS_A_PROTOCOL_VERSION  }
  GNUTLS_E_UNSUPPORTED_VERSION_PACKET = -(8);  
  GNUTLS_E_TLS_PACKET_DECODING_ERROR = GNUTLS_E_UNEXPECTED_PACKET_LENGTH;  
{ GNUTLS_A_DECODE_ERROR  }
  GNUTLS_E_UNEXPECTED_PACKET_LENGTH = -(9);  
  GNUTLS_E_INVALID_SESSION = -(10);  
  GNUTLS_E_FATAL_ALERT_RECEIVED = -(12);  
{ GNUTLS_A_UNEXPECTED_MESSAGE  }
  GNUTLS_E_UNEXPECTED_PACKET = -(15);  
  GNUTLS_E_WARNING_ALERT_RECEIVED = -(16);  
  GNUTLS_E_ERROR_IN_FINISHED_PACKET = -(18);  
  GNUTLS_E_UNEXPECTED_HANDSHAKE_PACKET = -(19);  
  GNUTLS_E_UNKNOWN_CIPHER_SUITE = -(21);  
{ GNUTLS_A_HANDSHAKE_FAILURE  }
  GNUTLS_E_UNWANTED_ALGORITHM = -(22);  
  GNUTLS_E_MPI_SCAN_FAILED = -(23);  
{ GNUTLS_A_DECRYPTION_FAILED, GNUTLS_A_BAD_RECORD_MAC  }
  GNUTLS_E_DECRYPTION_FAILED = -(24);  
  GNUTLS_E_MEMORY_ERROR = -(25);  
{ GNUTLS_A_DECOMPRESSION_FAILURE  }
  GNUTLS_E_DECOMPRESSION_FAILED = -(26);  
  GNUTLS_E_COMPRESSION_FAILED = -(27);  
  GNUTLS_E_AGAIN = -(28);  
  GNUTLS_E_EXPIRED = -(29);  
  GNUTLS_E_DB_ERROR = -(30);  
  GNUTLS_E_SRP_PWD_ERROR = GNUTLS_E_KEYFILE_ERROR;  
  GNUTLS_E_KEYFILE_ERROR = -(31);  
  GNUTLS_E_INSUFFICIENT_CREDENTIALS = -(32);  
{ for backwards compatibility only  }
  GNUTLS_E_INSUFICIENT_CREDENTIALS = GNUTLS_E_INSUFFICIENT_CREDENTIALS;  
  GNUTLS_E_INSUFFICIENT_CRED = GNUTLS_E_INSUFFICIENT_CREDENTIALS;  
{ for backwards compatibility only  }
  GNUTLS_E_INSUFICIENT_CRED = GNUTLS_E_INSUFFICIENT_CREDENTIALS;  
  GNUTLS_E_HASH_FAILED = -(33);  
  GNUTLS_E_BASE64_DECODING_ERROR = -(34);  
  GNUTLS_E_MPI_PRINT_FAILED = -(35);  
{ GNUTLS_A_NO_RENEGOTIATION  }
  GNUTLS_E_REHANDSHAKE = -(37);  
  GNUTLS_E_GOT_APPLICATION_DATA = -(38);  
  GNUTLS_E_RECORD_LIMIT_REACHED = -(39);  
  GNUTLS_E_ENCRYPTION_FAILED = -(40);  
  GNUTLS_E_PK_ENCRYPTION_FAILED = -(44);  
  GNUTLS_E_PK_DECRYPTION_FAILED = -(45);  
  GNUTLS_E_PK_SIGN_FAILED = -(46);  
  GNUTLS_E_X509_UNSUPPORTED_CRITICAL_EXTENSION = -(47);  
  GNUTLS_E_KEY_USAGE_VIOLATION = -(48);  
{ GNUTLS_A_BAD_CERTIFICATE  }
  GNUTLS_E_NO_CERTIFICATE_FOUND = -(49);  
  GNUTLS_E_INVALID_REQUEST = -(50);  
  GNUTLS_E_SHORT_MEMORY_BUFFER = -(51);  
  GNUTLS_E_INTERRUPTED = -(52);  
  GNUTLS_E_PUSH_ERROR = -(53);  
  GNUTLS_E_PULL_ERROR = -(54);  
{ GNUTLS_A_ILLEGAL_PARAMETER  }
  GNUTLS_E_RECEIVED_ILLEGAL_PARAMETER = -(55);  
  GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE = -(56);  
  GNUTLS_E_PKCS1_WRONG_PAD = -(57);  
  GNUTLS_E_RECEIVED_ILLEGAL_EXTENSION = -(58);  
  GNUTLS_E_INTERNAL_ERROR = -(59);  
  GNUTLS_E_DH_PRIME_UNACCEPTABLE = -(63);  
  GNUTLS_E_FILE_ERROR = -(64);  
  GNUTLS_E_TOO_MANY_EMPTY_PACKETS = -(78);  
  GNUTLS_E_UNKNOWN_PK_ALGORITHM = -(80);  
  GNUTLS_E_TOO_MANY_HANDSHAKE_PACKETS = -(81);  
{ GNUTLS_A_ILLEGAL_PARAMETER  }
  GNUTLS_E_RECEIVED_DISALLOWED_NAME = -(82);  
{ GNUTLS_A_CERTIFICATE_REQUIRED  }
  GNUTLS_E_CERTIFICATE_REQUIRED = -(112);  
{ returned if you need to generate temporary RSA
   * parameters. These are needed for export cipher suites.
    }
  GNUTLS_E_NO_TEMPORARY_RSA_PARAMS = -(84);  
  GNUTLS_E_NO_COMPRESSION_ALGORITHMS = -(86);  
  GNUTLS_E_NO_CIPHER_SUITES = -(87);  
  GNUTLS_E_OPENPGP_GETKEY_FAILED = -(88);  
  GNUTLS_E_PK_SIG_VERIFY_FAILED = -(89);  
  GNUTLS_E_ILLEGAL_SRP_USERNAME = -(90);  
  GNUTLS_E_SRP_PWD_PARSING_ERROR = GNUTLS_E_KEYFILE_PARSING_ERROR;  
  GNUTLS_E_KEYFILE_PARSING_ERROR = -(91);  
  GNUTLS_E_NO_TEMPORARY_DH_PARAMS = -(93);  
{ For certificate and key stuff
    }
  GNUTLS_E_ASN1_ELEMENT_NOT_FOUND = -(67);  
  GNUTLS_E_ASN1_IDENTIFIER_NOT_FOUND = -(68);  
  GNUTLS_E_ASN1_DER_ERROR = -(69);  
  GNUTLS_E_ASN1_VALUE_NOT_FOUND = -(70);  
  GNUTLS_E_ASN1_GENERIC_ERROR = -(71);  
  GNUTLS_E_ASN1_VALUE_NOT_VALID = -(72);  
  GNUTLS_E_ASN1_TAG_ERROR = -(73);  
  GNUTLS_E_ASN1_TAG_IMPLICIT = -(74);  
  GNUTLS_E_ASN1_TYPE_ANY_ERROR = -(75);  
  GNUTLS_E_ASN1_SYNTAX_ERROR = -(76);  
  GNUTLS_E_ASN1_DER_OVERFLOW = -(77);  
  GNUTLS_E_OPENPGP_UID_REVOKED = -(79);  
  GNUTLS_E_CERTIFICATE_ERROR = -(43);  
  GNUTLS_E_X509_CERTIFICATE_ERROR = GNUTLS_E_CERTIFICATE_ERROR;  
  GNUTLS_E_CERTIFICATE_KEY_MISMATCH = -(60);  
{ GNUTLS_A_UNSUPPORTED_CERTIFICATE  }
  GNUTLS_E_UNSUPPORTED_CERTIFICATE_TYPE = -(61);  
  GNUTLS_E_X509_UNKNOWN_SAN = -(62);  
  GNUTLS_E_OPENPGP_FINGERPRINT_UNSUPPORTED = -(94);  
  GNUTLS_E_X509_UNSUPPORTED_ATTRIBUTE = -(95);  
  GNUTLS_E_UNKNOWN_HASH_ALGORITHM = -(96);  
  GNUTLS_E_UNKNOWN_PKCS_CONTENT_TYPE = -(97);  
  GNUTLS_E_UNKNOWN_PKCS_BAG_TYPE = -(98);  
  GNUTLS_E_INVALID_PASSWORD = -(99);  
{ for PKCS #12 MAC  }
  GNUTLS_E_MAC_VERIFY_FAILED = -(100);  
  GNUTLS_E_CONSTRAINT_ERROR = -(101);  
  GNUTLS_E_WARNING_IA_IPHF_RECEIVED = -(102);  
  GNUTLS_E_WARNING_IA_FPHF_RECEIVED = -(103);  
  GNUTLS_E_IA_VERIFY_FAILED = -(104);  
  GNUTLS_E_UNKNOWN_ALGORITHM = -(105);  
  GNUTLS_E_UNSUPPORTED_SIGNATURE_ALGORITHM = -(106);  
  GNUTLS_E_SAFE_RENEGOTIATION_FAILED = -(107);  
  GNUTLS_E_UNSAFE_RENEGOTIATION_DENIED = -(108);  
  GNUTLS_E_UNKNOWN_SRP_USERNAME = -(109);  
  GNUTLS_E_PREMATURE_TERMINATION = -(110);  
  GNUTLS_E_MALFORMED_CIDR = -(111);  
  GNUTLS_E_BASE64_ENCODING_ERROR = -(201);  
{ obsolete  }
  GNUTLS_E_INCOMPATIBLE_GCRYPT_LIBRARY = -(202);  
  GNUTLS_E_INCOMPATIBLE_CRYPTO_LIBRARY = -(202);  
  GNUTLS_E_INCOMPATIBLE_LIBTASN1_LIBRARY = -(203);  
  GNUTLS_E_OPENPGP_KEYRING_ERROR = -(204);  
  GNUTLS_E_X509_UNSUPPORTED_OID = -(205);  
  GNUTLS_E_RANDOM_FAILED = -(206);  
  GNUTLS_E_BASE64_UNEXPECTED_HEADER_ERROR = -(207);  
  GNUTLS_E_OPENPGP_SUBKEY_ERROR = -(208);  
  GNUTLS_E_CRYPTO_ALREADY_REGISTERED = GNUTLS_E_ALREADY_REGISTERED;  
  GNUTLS_E_ALREADY_REGISTERED = -(209);  
  GNUTLS_E_HANDSHAKE_TOO_LARGE = -(210);  
  GNUTLS_E_CRYPTODEV_IOCTL_ERROR = -(211);  
  GNUTLS_E_CRYPTODEV_DEVICE_ERROR = -(212);  
  GNUTLS_E_CHANNEL_BINDING_NOT_AVAILABLE = -(213);  
  GNUTLS_E_BAD_COOKIE = -(214);  
  GNUTLS_E_OPENPGP_PREFERRED_KEY_ERROR = -(215);  
  GNUTLS_E_INCOMPAT_DSA_KEY_WITH_TLS_PROTOCOL = -(216);  
  GNUTLS_E_INSUFFICIENT_SECURITY = -(217);  
  GNUTLS_E_HEARTBEAT_PONG_RECEIVED = -(292);  
  GNUTLS_E_HEARTBEAT_PING_RECEIVED = -(293);  
  GNUTLS_E_UNRECOGNIZED_NAME = -(294);  
{ PKCS11 related  }
  GNUTLS_E_PKCS11_ERROR = -(300);  
  GNUTLS_E_PKCS11_LOAD_ERROR = -(301);  
  GNUTLS_E_PARSING_ERROR = -(302);  
  GNUTLS_E_PKCS11_PIN_ERROR = -(303);  
  GNUTLS_E_PKCS11_SLOT_ERROR = -(305);  
  GNUTLS_E_LOCKING_ERROR = -(306);  
  GNUTLS_E_PKCS11_ATTRIBUTE_ERROR = -(307);  
  GNUTLS_E_PKCS11_DEVICE_ERROR = -(308);  
  GNUTLS_E_PKCS11_DATA_ERROR = -(309);  
  GNUTLS_E_PKCS11_UNSUPPORTED_FEATURE_ERROR = -(310);  
  GNUTLS_E_PKCS11_KEY_ERROR = -(311);  
  GNUTLS_E_PKCS11_PIN_EXPIRED = -(312);  
  GNUTLS_E_PKCS11_PIN_LOCKED = -(313);  
  GNUTLS_E_PKCS11_SESSION_ERROR = -(314);  
  GNUTLS_E_PKCS11_SIGNATURE_ERROR = -(315);  
  GNUTLS_E_PKCS11_TOKEN_ERROR = -(316);  
  GNUTLS_E_PKCS11_USER_ERROR = -(317);  
  GNUTLS_E_CRYPTO_INIT_FAILED = -(318);  
  GNUTLS_E_TIMEDOUT = -(319);  
  GNUTLS_E_USER_ERROR = -(320);  
  GNUTLS_E_ECC_NO_SUPPORTED_CURVES = -(321);  
  GNUTLS_E_ECC_UNSUPPORTED_CURVE = -(322);  
  GNUTLS_E_PKCS11_REQUESTED_OBJECT_NOT_AVAILBLE = -(323);  
  GNUTLS_E_CERTIFICATE_LIST_UNSORTED = -(324);  
{ GNUTLS_A_ILLEGAL_PARAMETER  }
  GNUTLS_E_ILLEGAL_PARAMETER = -(325);  
  GNUTLS_E_NO_PRIORITIES_WERE_SET = -(326);  
  GNUTLS_E_X509_UNSUPPORTED_EXTENSION = -(327);  
  GNUTLS_E_SESSION_EOF = -(328);  
  GNUTLS_E_TPM_ERROR = -(329);  
  GNUTLS_E_TPM_KEY_PASSWORD_ERROR = -(330);  
  GNUTLS_E_TPM_SRK_PASSWORD_ERROR = -(331);  
  GNUTLS_E_TPM_SESSION_ERROR = -(332);  
  GNUTLS_E_TPM_KEY_NOT_FOUND = -(333);  
  GNUTLS_E_TPM_UNINITIALIZED = -(334);  
  GNUTLS_E_TPM_NO_LIB = -(335);  
  GNUTLS_E_NO_CERTIFICATE_STATUS = -(340);  
  GNUTLS_E_OCSP_RESPONSE_ERROR = -(341);  
  GNUTLS_E_RANDOM_DEVICE_ERROR = -(342);  
  GNUTLS_E_AUTH_ERROR = -(343);  
  GNUTLS_E_NO_APPLICATION_PROTOCOL = -(344);  
  GNUTLS_E_SOCKETS_INIT_ERROR = -(345);  
  GNUTLS_E_KEY_IMPORT_FAILED = -(346);  
{GNUTLS_A_INAPPROPRIATE_FALLBACK  }
  GNUTLS_E_INAPPROPRIATE_FALLBACK = -(347);  
  GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR = -(348);  
  GNUTLS_E_PRIVKEY_VERIFICATION_ERROR = -(349);  
{GNUTLS_A_DECODE_ERROR  }
  GNUTLS_E_UNEXPECTED_EXTENSIONS_LENGTH = -(350);  
  GNUTLS_E_ASN1_EMBEDDED_NULL_IN_STRING = -(351);  
  GNUTLS_E_SELF_TEST_ERROR = -(400);  
  GNUTLS_E_NO_SELF_TEST = -(401);  
  GNUTLS_E_LIB_IN_ERROR_STATE = -(402);  
  GNUTLS_E_PK_GENERATION_ERROR = -(403);  
  GNUTLS_E_IDNA_ERROR = -(404);  
  GNUTLS_E_NEED_FALLBACK = -(405);  
  GNUTLS_E_SESSION_USER_ID_CHANGED = -(406);  
  GNUTLS_E_HANDSHAKE_DURING_FALSE_START = -(407);  
  GNUTLS_E_UNAVAILABLE_DURING_HANDSHAKE = -(408);  
  GNUTLS_E_PK_INVALID_PUBKEY = -(409);  
  GNUTLS_E_PK_INVALID_PRIVKEY = -(410);  
  GNUTLS_E_NOT_YET_ACTIVATED = -(411);  
  GNUTLS_E_INVALID_UTF8_STRING = -(412);  
  GNUTLS_E_NO_EMBEDDED_DATA = -(413);  
  GNUTLS_E_INVALID_UTF8_EMAIL = -(414);  
  GNUTLS_E_INVALID_PASSWORD_STRING = -(415);  
  GNUTLS_E_CERTIFICATE_TIME_ERROR = -(416);  
{ GNUTLS_A_RECORD_OVERFLOW  }
  GNUTLS_E_RECORD_OVERFLOW = -(417);  
  GNUTLS_E_ASN1_TIME_ERROR = -(418);  
  GNUTLS_E_INCOMPATIBLE_SIG_WITH_KEY = -(419);  
  GNUTLS_E_PK_INVALID_PUBKEY_PARAMS = -(420);  
  GNUTLS_E_PK_NO_VALIDATION_PARAMS = -(421);  
  GNUTLS_E_OCSP_MISMATCH_WITH_CERTS = -(422);  
  GNUTLS_E_NO_COMMON_KEY_SHARE = -(423);  
  GNUTLS_E_REAUTH_REQUEST = -(424);  
  GNUTLS_E_TOO_MANY_MATCHES = -(425);  
  GNUTLS_E_CRL_VERIFICATION_ERROR = -(426);  
  GNUTLS_E_MISSING_EXTENSION = -(427);  
  GNUTLS_E_DB_ENTRY_EXISTS = -(428);  
  GNUTLS_E_EARLY_DATA_REJECTED = -(429);  
  GNUTLS_E_X509_DUPLICATE_EXTENSION = -(430);  
  GNUTLS_E_UNIMPLEMENTED_FEATURE = -(1250);  
{ Internal errors of the library; will never be returned
 * to a calling application  }
  GNUTLS_E_INT_RET_0 = -(1251);  
  GNUTLS_E_INT_CHECK_AGAIN = -(1252);  
  GNUTLS_E_APPLICATION_ERROR_MAX = -(65000);  
  GNUTLS_E_APPLICATION_ERROR_MIN = -(65500);  
{ C++ end of extern C conditionnal removed }
{$include <gnutls/compat.h>}
{$endif}
{ GNUTLS_GNUTLS_H  }

implementation

{ was #define dname def_expr }
function GNUTLS_HANDSHAKE_ANY : dword;
  begin
    GNUTLS_HANDSHAKE_ANY:=dword(-(1));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GNUTLS_CURVE_TO_BITS(curve : longint) : dword;
begin
  GNUTLS_CURVE_TO_BITS:=dword(((dword(1)) shl 31) or (dword(curve)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GNUTLS_BITS_TO_CURVE(bits : longint) : longint;
begin
  GNUTLS_BITS_TO_CURVE:=(dword(bits)) and $7FFFFFFF;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GNUTLS_BITS_ARE_CURVE(bits : longint) : longint;
begin
  GNUTLS_BITS_ARE_CURVE:=(dword(bits)) and $80000000;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _gnutls_deinit(x : longint) : longint;
begin
  _gnutls_deinit:=gnutls_deinit(x);
end;

{ was #define dname def_expr }
function GNUTLS_DEFAULT_HANDSHAKE_TIMEOUT : dword;
  begin
    GNUTLS_DEFAULT_HANDSHAKE_TIMEOUT:=dword(-(1));
  end;

{ was #define dname def_expr }
function GNUTLS_INDEFINITE_TIMEOUT : dword;
  begin
    GNUTLS_INDEFINITE_TIMEOUT:=dword(-(2));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_record_set_max_empty_records(session,x : longint) : longint;
begin
  gnutls_record_set_max_empty_records:=blublu(x,session);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_transport_set_int(s,i : longint) : longint;
begin
  gnutls_transport_set_int:=gnutls_transport_set_int2(s,i,i);
end;


end.

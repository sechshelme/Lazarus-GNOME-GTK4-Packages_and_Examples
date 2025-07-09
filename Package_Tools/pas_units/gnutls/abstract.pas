unit abstract;

interface

uses
  fp_gnutls, gnutls, x509, pkcs11, openpgp, tpm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  Pgnutls_pubkey_flags = ^Tgnutls_pubkey_flags;
  Tgnutls_pubkey_flags = longint;

const
  GNUTLS_PUBKEY_DISABLE_CALLBACKS = 1 shl 2;
  GNUTLS_PUBKEY_GET_OPENPGP_FINGERPRINT = 1 shl 3;

type
  Tgnutls_pubkey_flags_t = Tgnutls_pubkey_flags;
  Pgnutls_pubkey_flags_t = ^Tgnutls_pubkey_flags_t;

type
  Pgnutls_abstract_export_flags = ^Tgnutls_abstract_export_flags;
  Tgnutls_abstract_export_flags = longint;

const
  GNUTLS_EXPORT_FLAG_NO_LZ = 1;

type
  Tgnutls_abstract_export_flags_t = Tgnutls_abstract_export_flags;
  Pgnutls_abstract_export_flags_t = ^Tgnutls_abstract_export_flags_t;

const
  GNUTLS_PUBKEY_VERIFY_FLAG_TLS1_RSA = GNUTLS_VERIFY_USE_TLS1_RSA;
  GNUTLS_PUBKEY_VERIFY_FLAG_TLS_RSA = GNUTLS_PUBKEY_VERIFY_FLAG_TLS1_RSA;

type
  Tgnutls_privkey_sign_func = function(key: Tgnutls_privkey_t; userdata: pointer; raw_data: Pgnutls_datum_t; signature: Pgnutls_datum_t): longint; cdecl;
  Tgnutls_privkey_decrypt_func = function(key: Tgnutls_privkey_t; userdata: pointer; ciphertext: Pgnutls_datum_t; plaintext: Pgnutls_datum_t): longint; cdecl;
  Tgnutls_privkey_decrypt_func2 = function(key: Tgnutls_privkey_t; userdata: pointer; ciphertext: Pgnutls_datum_t; plaintext: pbyte; plaintext_size: Tsize_t): longint; cdecl;
  Tgnutls_privkey_sign_hash_func = function(key: Tgnutls_privkey_t; algo: Tgnutls_sign_algorithm_t; userdata: pointer; flags: dword; hash: Pgnutls_datum_t; signature: Pgnutls_datum_t): longint; cdecl;
  Tgnutls_privkey_sign_data_func = function(key: Tgnutls_privkey_t; algo: Tgnutls_sign_algorithm_t; userdata: pointer; flags: dword; data: Pgnutls_datum_t; signature: Pgnutls_datum_t): longint; cdecl;
  Tgnutls_privkey_deinit_func = procedure(key: Tgnutls_privkey_t; userdata: pointer); cdecl;

function GNUTLS_SIGN_ALGO_TO_FLAGS(sig: DWord): dword;
function GNUTLS_FLAGS_TO_SIGN_ALGO(flags: DWord): dword;

const
  GNUTLS_PRIVKEY_INFO_PK_ALGO = 1;
  GNUTLS_PRIVKEY_INFO_SIGN_ALGO = 1 shl 1;
  GNUTLS_PRIVKEY_INFO_HAVE_SIGN_ALGO = 1 shl 2;
  GNUTLS_PRIVKEY_INFO_PK_ALGO_BITS = 1 shl 3;

type
  Tgnutls_privkey_info_func = function(key: Tgnutls_privkey_t; flags: dword; userdata: pointer): longint; cdecl;

function gnutls_pubkey_init(key: Pgnutls_pubkey_t): longint; cdecl; external libgnutls;
procedure gnutls_pubkey_deinit(key: Tgnutls_pubkey_t); cdecl; external libgnutls;
function gnutls_pubkey_verify_params(key: Tgnutls_pubkey_t): longint; cdecl; external libgnutls;
procedure gnutls_pubkey_set_pin_function(key: Tgnutls_pubkey_t; fn: Tgnutls_pin_callback_t; userdata: pointer); cdecl; external libgnutls;
function gnutls_pubkey_get_pk_algorithm(key: Tgnutls_pubkey_t; bits: Pdword): longint; cdecl; external libgnutls;
function gnutls_pubkey_set_spki(key: Tgnutls_pubkey_t; spki: Tgnutls_x509_spki_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_get_spki(key: Tgnutls_pubkey_t; spki: Tgnutls_x509_spki_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_x509(key: Tgnutls_pubkey_t; crt: Tgnutls_x509_crt_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_x509_crq(key: Tgnutls_pubkey_t; crq: Tgnutls_x509_crq_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_pkcs11(key: Tgnutls_pubkey_t; obj: Tgnutls_pkcs11_obj_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_openpgp(key: Tgnutls_pubkey_t; crt: Tgnutls_openpgp_crt_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_openpgp_raw(pkey: Tgnutls_pubkey_t; data: Pgnutls_datum_t; format: Tgnutls_openpgp_crt_fmt_t; keyid: Tgnutls_openpgp_keyid_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_x509_raw(pkey: Tgnutls_pubkey_t; data: Pgnutls_datum_t; format: Tgnutls_x509_crt_fmt_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_privkey(key: Tgnutls_pubkey_t; pkey: Tgnutls_privkey_t; usage: dword; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_tpm_url(pkey: Tgnutls_pubkey_t; url: pchar; srk_password: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_url(key: Tgnutls_pubkey_t; url: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_tpm_raw(pkey: Tgnutls_pubkey_t; fdata: Pgnutls_datum_t; format: Tgnutls_tpmkey_fmt_t; srk_password: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_get_preferred_hash_algorithm(key: Tgnutls_pubkey_t; hash: Pgnutls_digest_algorithm_t; mand: Pdword): longint; cdecl; external libgnutls;

function gnutls_pubkey_get_pk_rsa_raw(key: Tgnutls_pubkey_t; m, e: Pgnutls_datum_t): longint; cdecl; external libgnutls name 'gnutls_pubkey_export_rsa_raw';

function gnutls_pubkey_export_rsa_raw(key: Tgnutls_pubkey_t; m: Pgnutls_datum_t; e: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_export_rsa_raw2(key: Tgnutls_pubkey_t; m: Pgnutls_datum_t; e: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;

function gnutls_pubkey_get_pk_dsa_raw(key: Tgnutls_pubkey_t; p, q, g, y: Pgnutls_datum_t): longint; cdecl; external libgnutls name 'gnutls_pubkey_export_dsa_raw';

function gnutls_pubkey_export_dsa_raw(key: Tgnutls_pubkey_t; p: Pgnutls_datum_t; q: Pgnutls_datum_t; g: Pgnutls_datum_t; y: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_export_dsa_raw2(key: Tgnutls_pubkey_t; p: Pgnutls_datum_t; q: Pgnutls_datum_t; g: Pgnutls_datum_t; y: Pgnutls_datum_t;
  flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_export_dh_raw(key: Tgnutls_pubkey_t; params: Tgnutls_dh_params_t; y: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_export_ecc_raw2(key: Tgnutls_pubkey_t; curve: Pgnutls_ecc_curve_t; x: Pgnutls_datum_t; y: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_export_gost_raw2(key: Tgnutls_pubkey_t; curve: Pgnutls_ecc_curve_t; digest: Pgnutls_digest_algorithm_t; paramset: Pgnutls_gost_paramset_t; x: Pgnutls_datum_t;
  y: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;

function gnutls_pubkey_get_pk_ecc_raw(key: Tgnutls_pubkey_t; curve: Pgnutls_ecc_curve_t; x, y: Pgnutls_datum_t): longint; cdecl; external libgnutls name 'gnutls_pubkey_export_ecc_raw';

function gnutls_pubkey_export_ecc_raw(key: Tgnutls_pubkey_t; curve: Pgnutls_ecc_curve_t; x: Pgnutls_datum_t; y: Pgnutls_datum_t): longint; cdecl; external libgnutls;

function gnutls_pubkey_get_pk_ecc_x962(key: Tgnutls_pubkey_t; curve: Pgnutls_ecc_curve_t; x, y: Pgnutls_datum_t): longint; cdecl; external libgnutls name 'gnutls_pubkey_export_ecc_x962';

function gnutls_pubkey_export_ecc_x962(key: Tgnutls_pubkey_t; parameters: Pgnutls_datum_t; ecpoint: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_export(key: Tgnutls_pubkey_t; format: Tgnutls_x509_crt_fmt_t; output_data: pointer; output_data_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_export2(key: Tgnutls_pubkey_t; format: Tgnutls_x509_crt_fmt_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_get_key_id(key: Tgnutls_pubkey_t; flags: dword; output_data: pbyte; output_data_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_get_openpgp_key_id(key: Tgnutls_pubkey_t; flags: dword; output_data: pbyte; output_data_size: Psize_t; subkey: Pdword): longint; cdecl; external libgnutls;
function gnutls_pubkey_get_key_usage(key: Tgnutls_pubkey_t; usage: Pdword): longint; cdecl; external libgnutls;
function gnutls_pubkey_set_key_usage(key: Tgnutls_pubkey_t; usage: dword): longint; cdecl; external libgnutls;
function gnutls_pubkey_import(key: Tgnutls_pubkey_t; data: Pgnutls_datum_t; format: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;

function gnutls_pubkey_import_pkcs11_url(key, url, flags: longint): longint;

function gnutls_pubkey_import_dsa_raw(key: Tgnutls_pubkey_t; p: Pgnutls_datum_t; q: Pgnutls_datum_t; g: Pgnutls_datum_t; y: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_dh_raw(key: Tgnutls_pubkey_t; params: Tgnutls_dh_params_t; y: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_rsa_raw(key: Tgnutls_pubkey_t; m: Pgnutls_datum_t; e: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_ecc_x962(key: Tgnutls_pubkey_t; parameters: Pgnutls_datum_t; ecpoint: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_ecc_raw(key: Tgnutls_pubkey_t; curve: Tgnutls_ecc_curve_t; x: Pgnutls_datum_t; y: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_import_gost_raw(key: Tgnutls_pubkey_t; curve: Tgnutls_ecc_curve_t; digest: Tgnutls_digest_algorithm_t; paramset: Tgnutls_gost_paramset_t; x: Pgnutls_datum_t;
  y: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_encrypt_data(key: Tgnutls_pubkey_t; flags: dword; plaintext: Pgnutls_datum_t; ciphertext: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_crt_set_pubkey(crt: Tgnutls_x509_crt_t; key: Tgnutls_pubkey_t): longint; cdecl; external libgnutls;
function gnutls_x509_crq_set_pubkey(crq: Tgnutls_x509_crq_t; key: Tgnutls_pubkey_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_verify_hash2(key: Tgnutls_pubkey_t; algo: Tgnutls_sign_algorithm_t; flags: dword; hash: Pgnutls_datum_t; signature: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_verify_data2(pubkey: Tgnutls_pubkey_t; algo: Tgnutls_sign_algorithm_t; flags: dword; data: Pgnutls_datum_t; signature: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_privkey_init(key: Pgnutls_privkey_t): longint; cdecl; external libgnutls;
procedure gnutls_privkey_deinit(key: Tgnutls_privkey_t); cdecl; external libgnutls;

function GNUTLS_SUBGROUP_TO_BITS(group, subgroup: longint): dword;
function GNUTLS_BITS_TO_SUBGROUP(bits: DWord): DWord;
function GNUTLS_BITS_TO_GROUP(bits: DWord): DWord;
function GNUTLS_BITS_HAVE_SUBGROUP(bits: DWord): DWord;

function gnutls_privkey_generate(key: Tgnutls_privkey_t; algo: Tgnutls_pk_algorithm_t; bits: dword; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_generate2(pkey: Tgnutls_privkey_t; algo: Tgnutls_pk_algorithm_t; bits: dword; flags: dword; data: Pgnutls_keygen_data_st;
  data_size: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_set_spki(key: Tgnutls_privkey_t; spki: Tgnutls_x509_spki_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_get_spki(key: Tgnutls_privkey_t; spki: Tgnutls_x509_spki_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_verify_seed(key: Tgnutls_privkey_t; para2: Tgnutls_digest_algorithm_t; seed: pointer; seed_size: Tsize_t): longint; cdecl; external libgnutls;
function gnutls_privkey_get_seed(key: Tgnutls_privkey_t; para2: Pgnutls_digest_algorithm_t; seed: pointer; seed_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_privkey_verify_params(key: Tgnutls_privkey_t): longint; cdecl; external libgnutls;
procedure gnutls_privkey_set_flags(key: Tgnutls_privkey_t; flags: dword); cdecl; external libgnutls;
procedure gnutls_privkey_set_pin_function(key: Tgnutls_privkey_t; fn: Tgnutls_pin_callback_t; userdata: pointer); cdecl; external libgnutls;
function gnutls_privkey_get_pk_algorithm(key: Tgnutls_privkey_t; bits: Pdword): longint; cdecl; external libgnutls;
function gnutls_privkey_get_type(key: Tgnutls_privkey_t): Tgnutls_privkey_type_t; cdecl; external libgnutls;
function gnutls_privkey_status(key: Tgnutls_privkey_t): longint; cdecl; external libgnutls;

type
  Pgnutls_privkey_flags = ^Tgnutls_privkey_flags;
  Tgnutls_privkey_flags = longint;

const
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

type
  Tgnutls_privkey_flags_t = Tgnutls_privkey_flags;
  Pgnutls_privkey_flags_t = ^Tgnutls_privkey_flags_t;

function gnutls_privkey_import_pkcs11(pkey: Tgnutls_privkey_t; key: Tgnutls_pkcs11_privkey_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_import_x509(pkey: Tgnutls_privkey_t; key: Tgnutls_x509_privkey_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_import_openpgp(pkey: Tgnutls_privkey_t; key: Tgnutls_openpgp_privkey_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_export_x509(pkey: Tgnutls_privkey_t; key: Pgnutls_x509_privkey_t): longint; cdecl; external libgnutls;
function gnutls_privkey_export_openpgp(pkey: Tgnutls_privkey_t; key: Pgnutls_openpgp_privkey_t): longint; cdecl; external libgnutls;
function gnutls_privkey_export_pkcs11(pkey: Tgnutls_privkey_t; key: Pgnutls_pkcs11_privkey_t): longint; cdecl; external libgnutls;
function gnutls_privkey_import_openpgp_raw(pkey: Tgnutls_privkey_t; data: Pgnutls_datum_t; format: Tgnutls_openpgp_crt_fmt_t; keyid: Tgnutls_openpgp_keyid_t; password: pchar): longint; cdecl; external libgnutls;
function gnutls_privkey_import_x509_raw(pkey: Tgnutls_privkey_t; data: Pgnutls_datum_t; format: Tgnutls_x509_crt_fmt_t; password: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_import_tpm_raw(pkey: Tgnutls_privkey_t; fdata: Pgnutls_datum_t; format: Tgnutls_tpmkey_fmt_t; srk_password: pchar; key_password: pchar;
  flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_import_tpm_url(pkey: Tgnutls_privkey_t; url: pchar; srk_password: pchar; key_password: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_import_url(key: Tgnutls_privkey_t; url: pchar; flags: dword): longint; cdecl; external libgnutls;

function gnutls_privkey_import_pkcs11_url(key, url: longint): longint;

function gnutls_privkey_import_ext(pkey: Tgnutls_privkey_t; pk: Tgnutls_pk_algorithm_t; userdata: pointer; sign_func: Tgnutls_privkey_sign_func; decrypt_func: Tgnutls_privkey_decrypt_func;
  flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_import_ext2(pkey: Tgnutls_privkey_t; pk: Tgnutls_pk_algorithm_t; userdata: pointer; sign_func: Tgnutls_privkey_sign_func; decrypt_func: Tgnutls_privkey_decrypt_func;
  deinit_func: Tgnutls_privkey_deinit_func; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_import_ext3(pkey: Tgnutls_privkey_t; userdata: pointer; sign_func: Tgnutls_privkey_sign_func; decrypt_func: Tgnutls_privkey_decrypt_func; deinit_func: Tgnutls_privkey_deinit_func;
  info_func: Tgnutls_privkey_info_func; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_import_ext4(pkey: Tgnutls_privkey_t; userdata: pointer; sign_data_func: Tgnutls_privkey_sign_data_func; sign_hash_func: Tgnutls_privkey_sign_hash_func; decrypt_func: Tgnutls_privkey_decrypt_func;
  deinit_func: Tgnutls_privkey_deinit_func; info_func: Tgnutls_privkey_info_func; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_import_dsa_raw(key: Tgnutls_privkey_t; p: Pgnutls_datum_t; q: Pgnutls_datum_t; g: Pgnutls_datum_t; y: Pgnutls_datum_t;
  x: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_privkey_import_dh_raw(key: Tgnutls_privkey_t; params: Tgnutls_dh_params_t; y: Pgnutls_datum_t; x: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_privkey_import_rsa_raw(key: Tgnutls_privkey_t; m: Pgnutls_datum_t; e: Pgnutls_datum_t; d: Pgnutls_datum_t; p: Pgnutls_datum_t;
  q: Pgnutls_datum_t; u: Pgnutls_datum_t; e1: Pgnutls_datum_t; e2: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_privkey_import_ecc_raw(key: Tgnutls_privkey_t; curve: Tgnutls_ecc_curve_t; x: Pgnutls_datum_t; y: Pgnutls_datum_t; k: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_privkey_import_gost_raw(key: Tgnutls_privkey_t; curve: Tgnutls_ecc_curve_t; digest: Tgnutls_digest_algorithm_t; paramset: Tgnutls_gost_paramset_t; x: Pgnutls_datum_t;
  y: Pgnutls_datum_t; k: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_privkey_sign_data(signer: Tgnutls_privkey_t; hash: Tgnutls_digest_algorithm_t; flags: dword; data: Pgnutls_datum_t; signature: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_privkey_sign_data2(signer: Tgnutls_privkey_t; algo: Tgnutls_sign_algorithm_t; flags: dword; data: Pgnutls_datum_t; signature: Pgnutls_datum_t): longint; cdecl; external libgnutls;

function gnutls_privkey_sign_raw_data(key, flags, data, sig: longint): longint;

function gnutls_privkey_sign_hash(signer: Tgnutls_privkey_t; hash_algo: Tgnutls_digest_algorithm_t; flags: dword; hash_data: Pgnutls_datum_t; signature: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_privkey_sign_hash2(signer: Tgnutls_privkey_t; algo: Tgnutls_sign_algorithm_t; flags: dword; hash_data: Pgnutls_datum_t; signature: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_privkey_decrypt_data(key: Tgnutls_privkey_t; flags: dword; ciphertext: Pgnutls_datum_t; plaintext: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_privkey_decrypt_data2(key: Tgnutls_privkey_t; flags: dword; ciphertext: Pgnutls_datum_t; plaintext: pbyte; plaintext_size: Tsize_t): longint; cdecl; external libgnutls;
function gnutls_privkey_export_rsa_raw(key: Tgnutls_privkey_t; m: Pgnutls_datum_t; e: Pgnutls_datum_t; d: Pgnutls_datum_t; p: Pgnutls_datum_t;
  q: Pgnutls_datum_t; u: Pgnutls_datum_t; e1: Pgnutls_datum_t; e2: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_privkey_export_rsa_raw2(key: Tgnutls_privkey_t; m: Pgnutls_datum_t; e: Pgnutls_datum_t; d: Pgnutls_datum_t; p: Pgnutls_datum_t;
  q: Pgnutls_datum_t; u: Pgnutls_datum_t; e1: Pgnutls_datum_t; e2: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_export_dsa_raw(key: Tgnutls_privkey_t; p: Pgnutls_datum_t; q: Pgnutls_datum_t; g: Pgnutls_datum_t; y: Pgnutls_datum_t;
  x: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_privkey_export_dsa_raw2(key: Tgnutls_privkey_t; p: Pgnutls_datum_t; q: Pgnutls_datum_t; g: Pgnutls_datum_t; y: Pgnutls_datum_t;
  x: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_export_dh_raw(key: Tgnutls_privkey_t; params: Tgnutls_dh_params_t; y: Pgnutls_datum_t; x: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_export_ecc_raw(key: Tgnutls_privkey_t; curve: Pgnutls_ecc_curve_t; x: Pgnutls_datum_t; y: Pgnutls_datum_t; k: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_privkey_export_ecc_raw2(key: Tgnutls_privkey_t; curve: Pgnutls_ecc_curve_t; x: Pgnutls_datum_t; y: Pgnutls_datum_t; k: Pgnutls_datum_t;
  flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_export_gost_raw2(key: Tgnutls_privkey_t; curve: Pgnutls_ecc_curve_t; digest: Pgnutls_digest_algorithm_t; paramset: Pgnutls_gost_paramset_t; x: Pgnutls_datum_t;
  y: Pgnutls_datum_t; k: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_privkey_derive_secret(privkey: Tgnutls_privkey_t; pubkey: Tgnutls_pubkey_t; nonce: Pgnutls_datum_t; secret: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_crt_privkey_sign(crt: Tgnutls_x509_crt_t; issuer: Tgnutls_x509_crt_t; issuer_key: Tgnutls_privkey_t; dig: Tgnutls_digest_algorithm_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_crl_privkey_sign(crl: Tgnutls_x509_crl_t; issuer: Tgnutls_x509_crt_t; issuer_key: Tgnutls_privkey_t; dig: Tgnutls_digest_algorithm_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_crq_privkey_sign(crq: Tgnutls_x509_crq_t; key: Tgnutls_privkey_t; dig: Tgnutls_digest_algorithm_t; flags: dword): longint; cdecl; external libgnutls;

type
  Tgnutls_pcert_st = record
    pubkey: Tgnutls_pubkey_t;
    cert: Tgnutls_datum_t;
    _type: Tgnutls_certificate_type_t;
  end;
  Pgnutls_pcert_st = ^Tgnutls_pcert_st;
  PPgnutls_pcert_st = ^Pgnutls_pcert_st;

const
  GNUTLS_PCERT_NO_CERT = 1;

function gnutls_pcert_import_x509(pcert: Pgnutls_pcert_st; crt: Tgnutls_x509_crt_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pcert_import_x509_list(pcert: Pgnutls_pcert_st; crt: Pgnutls_x509_crt_t; ncrt: Pdword; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pcert_export_x509(pcert: Pgnutls_pcert_st; crt: Pgnutls_x509_crt_t): longint; cdecl; external libgnutls;
function gnutls_pcert_list_import_x509_raw(pcerts: Pgnutls_pcert_st; pcert_max: Pdword; data: Pgnutls_datum_t; format: Tgnutls_x509_crt_fmt_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pcert_list_import_x509_file(pcert_list: Pgnutls_pcert_st; pcert_list_size: Pdword; file_: pchar; format: Tgnutls_x509_crt_fmt_t; pin_fn: Tgnutls_pin_callback_t;
  pin_fn_userdata: pointer; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pcert_import_x509_raw(pcert: Pgnutls_pcert_st; cert: Pgnutls_datum_t; format: Tgnutls_x509_crt_fmt_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pcert_import_openpgp_raw(pcert: Pgnutls_pcert_st; cert: Pgnutls_datum_t; format: Tgnutls_openpgp_crt_fmt_t; keyid: Tgnutls_openpgp_keyid_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pcert_import_openpgp(pcert: Pgnutls_pcert_st; crt: Tgnutls_openpgp_crt_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pcert_export_openpgp(pcert: Pgnutls_pcert_st; crt: Pgnutls_openpgp_crt_t): longint; cdecl; external libgnutls;
procedure gnutls_pcert_deinit(pcert: Pgnutls_pcert_st); cdecl; external libgnutls;
function gnutls_pcert_import_rawpk(pcert: Pgnutls_pcert_st; key: Tgnutls_pubkey_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pcert_import_rawpk_raw(pcert: Pgnutls_pcert_st; rawpubkey: Pgnutls_datum_t; format: Tgnutls_x509_crt_fmt_t; key_usage: dword; flags: dword): longint; cdecl; external libgnutls;

type
  Tgnutls_certificate_retrieve_function2 = function(para1: Tgnutls_session_t; req_ca_rdn: Pgnutls_datum_t; nreqs: longint; pk_algos: Pgnutls_pk_algorithm_t; pk_algos_length: longint;
    para6: PPgnutls_pcert_st; pcert_length: Pdword; privkey: Pgnutls_privkey_t): longint; cdecl;

procedure gnutls_certificate_set_retrieve_function2(cred: Tgnutls_certificate_credentials_t; func: Tgnutls_certificate_retrieve_function2); cdecl; external libgnutls;

type
  Pgnutls_cert_retr_st = ^Tgnutls_cert_retr_st;

  Tgnutls_cert_retr_st = record
    version: dword;
    cred: Tgnutls_certificate_credentials_t;
    req_ca_rdn: Pgnutls_datum_t;
    nreqs: dword;
    pk_algos: Pgnutls_pk_algorithm_t;
    pk_algos_length: dword;
    padding: array[0..63] of byte;
  end;

const
  GNUTLS_CERT_RETR_DEINIT_ALL = 1;

type
  Tgnutls_certificate_retrieve_function3 = function(para1: Tgnutls_session_t; info: Pgnutls_cert_retr_st; certs: PPgnutls_pcert_st; certs_length: Pdword; ocsp: PPgnutls_ocsp_data_st;
    ocsp_length: Pdword; privkey: Pgnutls_privkey_t; flags: Pdword): longint; cdecl;

procedure gnutls_certificate_set_retrieve_function3(cred: Tgnutls_certificate_credentials_t; func: Tgnutls_certificate_retrieve_function3); cdecl; external libgnutls;
function gnutls_certificate_set_key(res: Tgnutls_certificate_credentials_t; names: PPchar; names_size: longint; pcert_list: Pgnutls_pcert_st; pcert_list_size: longint;
  key: Tgnutls_privkey_t): longint; cdecl; external libgnutls;
function gnutls_pubkey_print(pubkey: Tgnutls_pubkey_t; format: Tgnutls_certificate_print_formats_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls;

// === Konventiert am: 9-7-25 13:39:24 ===


implementation


function GNUTLS_SIGN_ALGO_TO_FLAGS(sig: DWord): dword;
begin
  GNUTLS_SIGN_ALGO_TO_FLAGS := dword(sig shl 20);
end;

function GNUTLS_FLAGS_TO_SIGN_ALGO(flags: DWord): dword;
begin
  GNUTLS_FLAGS_TO_SIGN_ALGO := dword(flags shr 20);
end;

function gnutls_pubkey_import_pkcs11_url(key, url, flags: longint): longint;
begin
  gnutls_pubkey_import_pkcs11_url := gnutls_pubkey_import_url(key, url, flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GNUTLS_SUBGROUP_TO_BITS(group, subgroup: longint): dword;
begin
  GNUTLS_SUBGROUP_TO_BITS := dword((subgroup shl 16) or group);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function GNUTLS_BITS_TO_SUBGROUP(bits: DWord): DWord;
begin
  GNUTLS_BITS_TO_SUBGROUP := (bits shr 16) and $FFFF;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function GNUTLS_BITS_TO_GROUP(bits: DWord): DWord;
begin
  GNUTLS_BITS_TO_GROUP := bits and $FFFF;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GNUTLS_BITS_HAVE_SUBGROUP(bits: DWord): DWord;
begin
  GNUTLS_BITS_HAVE_SUBGROUP := bits and $FFFF0000;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function gnutls_privkey_import_pkcs11_url(key, url: longint): longint;
begin
  gnutls_privkey_import_pkcs11_url := gnutls_privkey_import_url(key, url, 0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function gnutls_privkey_sign_raw_data(key, flags, data, sig: longint): longint;
begin
  gnutls_privkey_sign_raw_data := gnutls_privkey_sign_hash(key, 0, GNUTLS_PRIVKEY_SIGN_FLAG_TLS1_RSA, data, sig);
end;


end.

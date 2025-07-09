unit pkcs12;

interface

uses
  fp_gnutls, gnutls;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgnutls_pkcs12_int = record
  end;
  Tgnutls_pkcs12_t = ^Tgnutls_pkcs12_int;
  Pgnutls_pkcs12_t = ^Tgnutls_pkcs12_t;

  Tgnutls_pkcs12_bag_int = record
  end;
  Tgnutls_pkcs12_bag_t = ^Tgnutls_pkcs12_bag_int;
  Pgnutls_pkcs12_bag_t = ^Tgnutls_pkcs12_bag_t;

function gnutls_pkcs12_init(pkcs12: Pgnutls_pkcs12_t): longint; cdecl; external libgnutls;
procedure gnutls_pkcs12_deinit(pkcs12: Tgnutls_pkcs12_t); cdecl; external libgnutls;
function gnutls_pkcs12_import(pkcs12: Tgnutls_pkcs12_t; data: Pgnutls_datum_t; format: Tgnutls_x509_crt_fmt_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs12_export(pkcs12: Tgnutls_pkcs12_t; format: Tgnutls_x509_crt_fmt_t; output_data: pointer; output_data_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_pkcs12_export2(pkcs12: Tgnutls_pkcs12_t; format: Tgnutls_x509_crt_fmt_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs12_get_bag(pkcs12: Tgnutls_pkcs12_t; indx: longint; bag: Tgnutls_pkcs12_bag_t): longint; cdecl; external libgnutls;
function gnutls_pkcs12_set_bag(pkcs12: Tgnutls_pkcs12_t; bag: Tgnutls_pkcs12_bag_t): longint; cdecl; external libgnutls;
function gnutls_pkcs12_generate_mac(pkcs12: Tgnutls_pkcs12_t; pass: pchar): longint; cdecl; external libgnutls;
function gnutls_pkcs12_generate_mac2(pkcs12: Tgnutls_pkcs12_t; mac: Tgnutls_mac_algorithm_t; pass: pchar): longint; cdecl; external libgnutls;
function gnutls_pkcs12_verify_mac(pkcs12: Tgnutls_pkcs12_t; pass: pchar): longint; cdecl; external libgnutls;
function gnutls_pkcs12_bag_decrypt(bag: Tgnutls_pkcs12_bag_t; pass: pchar): longint; cdecl; external libgnutls;
function gnutls_pkcs12_bag_encrypt(bag: Tgnutls_pkcs12_bag_t; pass: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs12_bag_enc_info(bag: Tgnutls_pkcs12_bag_t; schema: Pdword; cipher: Pdword; salt: pointer; salt_size: Pdword;
  iter_count: Pdword; oid: PPchar): longint; cdecl; external libgnutls;
function gnutls_pkcs12_mac_info(pkcs12: Tgnutls_pkcs12_t; mac: Pdword; salt: pointer; salt_size: Pdword; iter_count: Pdword;
  oid: PPchar): longint; cdecl; external libgnutls;

const
  GNUTLS_PKCS12_SP_INCLUDE_SELF_SIGNED = 1;

function gnutls_pkcs12_simple_parse(p12: Tgnutls_pkcs12_t; password: pchar; key: Pgnutls_x509_privkey_t; chain: PPgnutls_x509_crt_t; chain_len: Pdword;
  extra_certs: PPgnutls_x509_crt_t; extra_certs_len: Pdword; crl: Pgnutls_x509_crl_t; flags: dword): longint; cdecl; external libgnutls;

type
  Pgnutls_pkcs12_bag_type_t = ^Tgnutls_pkcs12_bag_type_t;
  Tgnutls_pkcs12_bag_type_t = longint;

const
  GNUTLS_BAG_EMPTY = 0;
  GNUTLS_BAG_PKCS8_ENCRYPTED_KEY = 1;
  GNUTLS_BAG_PKCS8_KEY = 2;
  GNUTLS_BAG_CERTIFICATE = 3;
  GNUTLS_BAG_CRL = 4;
  GNUTLS_BAG_SECRET = 5;
  GNUTLS_BAG_ENCRYPTED = 10;
  GNUTLS_BAG_UNKNOWN = 20;

function gnutls_pkcs12_bag_get_type(bag: Tgnutls_pkcs12_bag_t; indx: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs12_bag_get_data(bag: Tgnutls_pkcs12_bag_t; indx: dword; data: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs12_bag_set_data(bag: Tgnutls_pkcs12_bag_t; _type: Tgnutls_pkcs12_bag_type_t; data: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs12_bag_set_crl(bag: Tgnutls_pkcs12_bag_t; crl: Tgnutls_x509_crl_t): longint; cdecl; external libgnutls;
function gnutls_pkcs12_bag_set_crt(bag: Tgnutls_pkcs12_bag_t; crt: Tgnutls_x509_crt_t): longint; cdecl; external libgnutls;
function gnutls_pkcs12_bag_set_privkey(bag: Tgnutls_pkcs12_bag_t; privkey: Tgnutls_x509_privkey_t; password: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs12_bag_init(bag: Pgnutls_pkcs12_bag_t): longint; cdecl; external libgnutls;
procedure gnutls_pkcs12_bag_deinit(bag: Tgnutls_pkcs12_bag_t); cdecl; external libgnutls;
function gnutls_pkcs12_bag_get_count(bag: Tgnutls_pkcs12_bag_t): longint; cdecl; external libgnutls;
function gnutls_pkcs12_bag_get_key_id(bag: Tgnutls_pkcs12_bag_t; indx: dword; id: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs12_bag_set_key_id(bag: Tgnutls_pkcs12_bag_t; indx: dword; id: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs12_bag_get_friendly_name(bag: Tgnutls_pkcs12_bag_t; indx: dword; name: PPchar): longint; cdecl; external libgnutls;
function gnutls_pkcs12_bag_set_friendly_name(bag: Tgnutls_pkcs12_bag_t; indx: dword; name: pchar): longint; cdecl; external libgnutls;

// === Konventiert am: 9-7-25 13:39:53 ===


implementation



end.

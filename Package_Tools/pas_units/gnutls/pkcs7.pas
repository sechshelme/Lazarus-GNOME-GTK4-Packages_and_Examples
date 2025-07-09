unit pkcs7;

interface

uses
  fp_gnutls, gnutls, x509;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgnutls_pkcs7_int = record
  end;
  Tgnutls_pkcs7_t = ^Tgnutls_pkcs7_int;
  Pgnutls_pkcs7_t = ^Tgnutls_pkcs7_t;

function gnutls_pkcs7_init(pkcs7: Pgnutls_pkcs7_t): longint; cdecl; external libgnutls;
procedure gnutls_pkcs7_deinit(pkcs7: Tgnutls_pkcs7_t); cdecl; external libgnutls;
function gnutls_pkcs7_import(pkcs7: Tgnutls_pkcs7_t; data: Pgnutls_datum_t; format: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_export(pkcs7: Tgnutls_pkcs7_t; format: Tgnutls_x509_crt_fmt_t; output_data: pointer; output_data_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_export2(pkcs7: Tgnutls_pkcs7_t; format: Tgnutls_x509_crt_fmt_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_get_signature_count(pkcs7: Tgnutls_pkcs7_t): longint; cdecl; external libgnutls;

const
  GNUTLS_PKCS7_EDATA_GET_RAW = 1 shl 24;

function gnutls_pkcs7_get_embedded_data(pkcs7: Tgnutls_pkcs7_t; flags: dword; data: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_get_embedded_data_oid(pkcs7: Tgnutls_pkcs7_t): pchar; cdecl; external libgnutls;
function gnutls_pkcs7_get_crt_count(pkcs7: Tgnutls_pkcs7_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_get_crt_raw(pkcs7: Tgnutls_pkcs7_t; indx: dword; certificate: pointer; certificate_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_set_crt_raw(pkcs7: Tgnutls_pkcs7_t; crt: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_set_crt(pkcs7: Tgnutls_pkcs7_t; crt: Tgnutls_x509_crt_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_delete_crt(pkcs7: Tgnutls_pkcs7_t; indx: longint): longint; cdecl; external libgnutls;
function gnutls_pkcs7_get_crl_raw(pkcs7: Tgnutls_pkcs7_t; indx: dword; crl: pointer; crl_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_get_crl_count(pkcs7: Tgnutls_pkcs7_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_set_crl_raw(pkcs7: Tgnutls_pkcs7_t; crl: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_set_crl(pkcs7: Tgnutls_pkcs7_t; crl: Tgnutls_x509_crl_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_delete_crl(pkcs7: Tgnutls_pkcs7_t; indx: longint): longint; cdecl; external libgnutls;

type
  Tgnutls_pkcs7_attrs_st = record
  end;
  Tgnutls_pkcs7_attrs_t = ^Tgnutls_pkcs7_attrs_st;
  Pgnutls_pkcs7_attrs_t = ^Tgnutls_pkcs7_attrs_t;

  Tgnutls_pkcs7_signature_info_st = record
    algo: Tgnutls_sign_algorithm_t;
    sig: Tgnutls_datum_t;
    issuer_dn: Tgnutls_datum_t;
    signer_serial: Tgnutls_datum_t;
    issuer_keyid: Tgnutls_datum_t;
    signing_time: Ttime_t;
    signed_attrs: Tgnutls_pkcs7_attrs_t;
    unsigned_attrs: Tgnutls_pkcs7_attrs_t;
    pad: array[0..63] of char;
  end;
  Pgnutls_pkcs7_signature_info_st = ^Tgnutls_pkcs7_signature_info_st;

procedure gnutls_pkcs7_signature_info_deinit(info: Pgnutls_pkcs7_signature_info_st); cdecl; external libgnutls;
function gnutls_pkcs7_get_signature_info(pkcs7: Tgnutls_pkcs7_t; idx: dword; info: Pgnutls_pkcs7_signature_info_st): longint; cdecl; external libgnutls;
function gnutls_pkcs7_verify_direct(pkcs7: Tgnutls_pkcs7_t; signer: Tgnutls_x509_crt_t; idx: dword; data: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs7_verify(pkcs7: Tgnutls_pkcs7_t; tl: Tgnutls_x509_trust_list_t; vdata: Pgnutls_typed_vdata_st; vdata_size: dword; idx: dword;
  data: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;

const
  GNUTLS_PKCS7_ATTR_ENCODE_OCTET_STRING = 1;

function gnutls_pkcs7_add_attr(list: Pgnutls_pkcs7_attrs_t; oid: pchar; data: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
procedure gnutls_pkcs7_attrs_deinit(list: Tgnutls_pkcs7_attrs_t); cdecl; external libgnutls;
function gnutls_pkcs7_get_attr(list: Tgnutls_pkcs7_attrs_t; idx: dword; oid: PPchar; data: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;

type
  Pgnutls_pkcs7_sign_flags = ^Tgnutls_pkcs7_sign_flags;
  Tgnutls_pkcs7_sign_flags = longint;

const
  GNUTLS_PKCS7_EMBED_DATA = 1;
  GNUTLS_PKCS7_INCLUDE_TIME = 1 shl 1;
  GNUTLS_PKCS7_INCLUDE_CERT = 1 shl 2;
  GNUTLS_PKCS7_WRITE_SPKI = 1 shl 3;

function gnutls_pkcs7_sign(pkcs7: Tgnutls_pkcs7_t; signer: Tgnutls_x509_crt_t; signer_key: Tgnutls_privkey_t; data: Pgnutls_datum_t; signed_attrs: Tgnutls_pkcs7_attrs_t;
  unsigned_attrs: Tgnutls_pkcs7_attrs_t; dig: Tgnutls_digest_algorithm_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs7_get_crt_raw2(pkcs7: Tgnutls_pkcs7_t; indx: dword; cert: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_get_crl_raw2(pkcs7: Tgnutls_pkcs7_t; indx: dword; crl: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_print(pkcs7: Tgnutls_pkcs7_t; format: Tgnutls_certificate_print_formats_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs7_print_signature_info(info: Pgnutls_pkcs7_signature_info_st; format: Tgnutls_certificate_print_formats_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls;

// === Konventiert am: 9-7-25 13:39:47 ===


implementation



end.

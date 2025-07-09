unit ocsp;

interface

uses
  fp_gnutls, gnutls, x509;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  GNUTLS_OCSP_NONCE = '1.3.6.1.5.5.7.48.1.2';

type
  Pgnutls_ocsp_print_formats_t = ^Tgnutls_ocsp_print_formats_t;
  Tgnutls_ocsp_print_formats_t = longint;

const
  GNUTLS_OCSP_PRINT_FULL = 0;
  GNUTLS_OCSP_PRINT_COMPACT = 1;

type
  Pgnutls_ocsp_resp_status_t = ^Tgnutls_ocsp_resp_status_t;
  Tgnutls_ocsp_resp_status_t = longint;

const
  GNUTLS_OCSP_RESP_SUCCESSFUL = 0;
  GNUTLS_OCSP_RESP_MALFORMEDREQUEST = 1;
  GNUTLS_OCSP_RESP_INTERNALERROR = 2;
  GNUTLS_OCSP_RESP_TRYLATER = 3;
  GNUTLS_OCSP_RESP_SIGREQUIRED = 5;
  GNUTLS_OCSP_RESP_UNAUTHORIZED = 6;

type
  Pgnutls_ocsp_cert_status_t = ^Tgnutls_ocsp_cert_status_t;
  Tgnutls_ocsp_cert_status_t = longint;

const
  GNUTLS_OCSP_CERT_GOOD = 0;
  GNUTLS_OCSP_CERT_REVOKED = 1;
  GNUTLS_OCSP_CERT_UNKNOWN = 2;

type
  Pgnutls_x509_crl_reason_t = ^Tgnutls_x509_crl_reason_t;
  Tgnutls_x509_crl_reason_t = longint;

const
  GNUTLS_X509_CRLREASON_UNSPECIFIED = 0;
  GNUTLS_X509_CRLREASON_KEYCOMPROMISE = 1;
  GNUTLS_X509_CRLREASON_CACOMPROMISE = 2;
  GNUTLS_X509_CRLREASON_AFFILIATIONCHANGED = 3;
  GNUTLS_X509_CRLREASON_SUPERSEDED = 4;
  GNUTLS_X509_CRLREASON_CESSATIONOFOPERATION = 5;
  GNUTLS_X509_CRLREASON_CERTIFICATEHOLD = 6;
  GNUTLS_X509_CRLREASON_REMOVEFROMCRL = 8;
  GNUTLS_X509_CRLREASON_PRIVILEGEWITHDRAWN = 9;
  GNUTLS_X509_CRLREASON_AACOMPROMISE = 10;

type
  Pgnutls_ocsp_verify_reason_t = ^Tgnutls_ocsp_verify_reason_t;
  Tgnutls_ocsp_verify_reason_t = longint;

const
  GNUTLS_OCSP_VERIFY_SIGNER_NOT_FOUND = 1;
  GNUTLS_OCSP_VERIFY_SIGNER_KEYUSAGE_ERROR = 2;
  GNUTLS_OCSP_VERIFY_UNTRUSTED_SIGNER = 4;
  GNUTLS_OCSP_VERIFY_INSECURE_ALGORITHM = 8;
  GNUTLS_OCSP_VERIFY_SIGNATURE_FAILURE = 16;
  GNUTLS_OCSP_VERIFY_CERT_NOT_ACTIVATED = 32;
  GNUTLS_OCSP_VERIFY_CERT_EXPIRED = 64;

type
  Tgnutls_ocsp_req_int = record
  end;
  Tgnutls_ocsp_req_t = ^Tgnutls_ocsp_req_int;
  Pgnutls_ocsp_req_t = ^Tgnutls_ocsp_req_t;

  Tgnutls_ocsp_req_const_t = ^Tgnutls_ocsp_req_int;
  Pgnutls_ocsp_req_const_t = ^Tgnutls_ocsp_req_const_t;

function gnutls_ocsp_req_init(req: Pgnutls_ocsp_req_t): longint; cdecl; external libgnutls;
procedure gnutls_ocsp_req_deinit(req: Tgnutls_ocsp_req_t); cdecl; external libgnutls;
function gnutls_ocsp_req_import(req: Tgnutls_ocsp_req_t; data: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_req_export(req: Tgnutls_ocsp_req_const_t; data: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_req_print(req: Tgnutls_ocsp_req_const_t; format: Tgnutls_ocsp_print_formats_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_req_get_version(req: Tgnutls_ocsp_req_const_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_req_get_cert_id(req: Tgnutls_ocsp_req_const_t; indx: dword; digest: Pgnutls_digest_algorithm_t; issuer_name_hash: Pgnutls_datum_t; issuer_key_hash: Pgnutls_datum_t;
  serial_number: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_req_add_cert_id(req: Tgnutls_ocsp_req_t; digest: Tgnutls_digest_algorithm_t; issuer_name_hash: Pgnutls_datum_t; issuer_key_hash: Pgnutls_datum_t; serial_number: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_req_add_cert(req: Tgnutls_ocsp_req_t; digest: Tgnutls_digest_algorithm_t; issuer: Tgnutls_x509_crt_t; cert: Tgnutls_x509_crt_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_req_get_extension(req: Tgnutls_ocsp_req_const_t; indx: dword; oid: Pgnutls_datum_t; critical: Pdword; data: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_req_set_extension(req: Tgnutls_ocsp_req_t; oid: pchar; critical: dword; data: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_req_get_nonce(req: Tgnutls_ocsp_req_const_t; critical: Pdword; nonce: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_req_set_nonce(req: Tgnutls_ocsp_req_t; critical: dword; nonce: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_req_randomize_nonce(req: Tgnutls_ocsp_req_t): longint; cdecl; external libgnutls;

type
  Tgnutls_ocsp_resp_int = record
  end;
  Tgnutls_ocsp_resp_t = ^Tgnutls_ocsp_resp_int;
  Pgnutls_ocsp_resp_t = ^Tgnutls_ocsp_resp_t;
  PPgnutls_ocsp_resp_t = ^Pgnutls_ocsp_resp_t;

  Pgnutls_ocsp_resp_const_t = ^Tgnutls_ocsp_resp_const_t;
  Tgnutls_ocsp_resp_const_t = ^Tgnutls_ocsp_resp_int;

function gnutls_ocsp_resp_init(resp: Pgnutls_ocsp_resp_t): longint; cdecl; external libgnutls;
procedure gnutls_ocsp_resp_deinit(resp: Tgnutls_ocsp_resp_t); cdecl; external libgnutls;
function gnutls_ocsp_resp_import(resp: Tgnutls_ocsp_resp_t; data: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_import2(resp: Tgnutls_ocsp_resp_t; data: Pgnutls_datum_t; fmt: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_export(resp: Tgnutls_ocsp_resp_const_t; data: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_export2(resp: Tgnutls_ocsp_resp_const_t; data: Pgnutls_datum_t; fmt: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_print(resp: Tgnutls_ocsp_resp_const_t; format: Tgnutls_ocsp_print_formats_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_get_status(resp: Tgnutls_ocsp_resp_const_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_get_response(resp: Tgnutls_ocsp_resp_const_t; response_type_oid: Pgnutls_datum_t; response: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_get_version(resp: Tgnutls_ocsp_resp_const_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_get_responder(resp: Tgnutls_ocsp_resp_const_t; dn: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_get_responder2(resp: Tgnutls_ocsp_resp_const_t; dn: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;

const
  GNUTLS_OCSP_RESP_ID_KEY = 1;
  GNUTLS_OCSP_RESP_ID_DN = 2;

function gnutls_ocsp_resp_get_responder_raw_id(resp: Tgnutls_ocsp_resp_const_t; _type: dword; raw: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_get_produced(resp: Tgnutls_ocsp_resp_const_t): Ttime_t; cdecl; external libgnutls;
function gnutls_ocsp_resp_get_single(resp: Tgnutls_ocsp_resp_const_t; indx: dword; digest: Pgnutls_digest_algorithm_t; issuer_name_hash: Pgnutls_datum_t; issuer_key_hash: Pgnutls_datum_t;
  serial_number: Pgnutls_datum_t; cert_status: Pdword; this_update: Ptime_t; next_update: Ptime_t; revocation_time: Ptime_t;
  revocation_reason: Pdword): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_get_extension(resp: Tgnutls_ocsp_resp_const_t; indx: dword; oid: Pgnutls_datum_t; critical: Pdword; data: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_get_nonce(resp: Tgnutls_ocsp_resp_const_t; critical: Pdword; nonce: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_get_signature_algorithm(resp: Tgnutls_ocsp_resp_const_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_get_signature(resp: Tgnutls_ocsp_resp_const_t; sig: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_get_certs(resp: Tgnutls_ocsp_resp_const_t; certs: PPgnutls_x509_crt_t; ncerts: Psize_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_verify_direct(resp: Tgnutls_ocsp_resp_const_t; issuer: Tgnutls_x509_crt_t; verify: Pdword; flags: dword): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_verify(resp: Tgnutls_ocsp_resp_const_t; trustlist: Tgnutls_x509_trust_list_t; verify: Pdword; flags: dword): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_check_crt(resp: Tgnutls_ocsp_resp_const_t; indx: dword; crt: Tgnutls_x509_crt_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_resp_list_import2(ocsps: PPgnutls_ocsp_resp_t; size: Pdword; resp_data: Pgnutls_datum_t; format: Tgnutls_x509_crt_fmt_t; flags: dword): longint; cdecl; external libgnutls;

// === Konventiert am: 9-7-25 13:39:36 ===


implementation



end.

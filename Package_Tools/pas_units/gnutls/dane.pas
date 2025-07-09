unit dane;

interface

uses
  fp_gnutls, gnutls;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pdane_cert_usage_t = ^Tdane_cert_usage_t;
  Tdane_cert_usage_t = longint;

const
  DANE_CERT_USAGE_CA = 0;
  DANE_CERT_USAGE_EE = 1;
  DANE_CERT_USAGE_LOCAL_CA = 2;
  DANE_CERT_USAGE_LOCAL_EE = 3;

type
  Pdane_cert_type_t = ^Tdane_cert_type_t;
  Tdane_cert_type_t = longint;

const
  DANE_CERT_X509 = 0;
  DANE_CERT_PK = 1;

type
  Pdane_match_type_t = ^Tdane_match_type_t;
  Tdane_match_type_t = longint;

const
  DANE_MATCH_EXACT = 0;
  DANE_MATCH_SHA2_256 = 1;
  DANE_MATCH_SHA2_512 = 2;

type
  Pdane_query_status_t = ^Tdane_query_status_t;
  Tdane_query_status_t = longint;

const
  DANE_QUERY_UNKNOWN = 0;
  DANE_QUERY_DNSSEC_VERIFIED = 1;
  DANE_QUERY_BOGUS = 2;
  DANE_QUERY_NO_DNSSEC = 3;

type
  Tdane_state_st = record
  end;
  Tdane_state_t = ^Tdane_state_st;
  Pdane_state_t = ^Tdane_state_t;

  Tdane_query_st = record
  end;
  Tdane_query_t = ^Tdane_query_st;
  Pdane_query_t = ^Tdane_query_t;

  Pdane_state_flags_t = ^Tdane_state_flags_t;
  Tdane_state_flags_t = longint;

const
  DANE_F_IGNORE_LOCAL_RESOLVER = 1;
  DANE_F_INSECURE = 2;
  DANE_F_IGNORE_DNSSEC = 4;

function dane_state_init(s: Pdane_state_t; flags: dword): longint; cdecl; external libgnutls;
function dane_state_set_dlv_file(s: Tdane_state_t; file_: pchar): longint; cdecl; external libgnutls;
procedure dane_state_deinit(s: Tdane_state_t); cdecl; external libgnutls;
function dane_raw_tlsa(s: Tdane_state_t; r: Pdane_query_t; dane_data: PPchar; dane_data_len: Plongint; secure: longint;
  bogus: longint): longint; cdecl; external libgnutls;
function dane_query_tlsa(s: Tdane_state_t; r: Pdane_query_t; host: pchar; proto: pchar; port: dword): longint; cdecl; external libgnutls;
function dane_query_status(q: Tdane_query_t): Tdane_query_status_t; cdecl; external libgnutls;
function dane_query_entries(q: Tdane_query_t): dword; cdecl; external libgnutls;
function dane_query_data(q: Tdane_query_t; idx: dword; usage: Pdword; _type: Pdword; match: Pdword;
  data: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function dane_query_to_raw_tlsa(q: Tdane_query_t; data_entries: Pdword; dane_data: PPPchar; dane_data_len: PPlongint; secure: Plongint;
  bogus: Plongint): longint; cdecl; external libgnutls;
procedure dane_query_deinit(q: Tdane_query_t); cdecl; external libgnutls;
function dane_cert_type_name(_type: Tdane_cert_type_t): pchar; cdecl; external libgnutls;
function dane_match_type_name(_type: Tdane_match_type_t): pchar; cdecl; external libgnutls;
function dane_cert_usage_name(usage: Tdane_cert_usage_t): pchar; cdecl; external libgnutls;

type
  Pdane_verify_flags_t = ^Tdane_verify_flags_t;
  Tdane_verify_flags_t = longint;

const
  DANE_VFLAG_FAIL_IF_NOT_CHECKED = 1;
  DANE_VFLAG_ONLY_CHECK_EE_USAGE = 1 shl 1;
  DANE_VFLAG_ONLY_CHECK_CA_USAGE = 1 shl 2;

type
  Pdane_verify_status_t = ^Tdane_verify_status_t;
  Tdane_verify_status_t = longint;

const
  DANE_VERIFY_CA_CONSTRAINTS_VIOLATED = 1;
  DANE_VERIFY_CERT_DIFFERS = 1 shl 1;
  DANE_VERIFY_UNKNOWN_DANE_INFO = 1 shl 2;

const
  DANE_VERIFY_CA_CONSTRAINS_VIOLATED = DANE_VERIFY_CA_CONSTRAINTS_VIOLATED;
  DANE_VERIFY_NO_DANE_INFO = DANE_VERIFY_UNKNOWN_DANE_INFO;

function dane_verification_status_print(status: dword; out_: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
function dane_verify_crt_raw(s: Tdane_state_t; chain: Pgnutls_datum_t; chain_size: dword; chain_type: Tgnutls_certificate_type_t; r: Tdane_query_t;
  sflags: dword; vflags: dword; verify: Pdword): longint; cdecl; external libgnutls;
function dane_verify_crt(s: Tdane_state_t; chain: Pgnutls_datum_t; chain_size: dword; chain_type: Tgnutls_certificate_type_t; hostname: pchar;
  proto: pchar; port: dword; sflags: dword; vflags: dword; verify: Pdword): longint; cdecl; external libgnutls;
function dane_verify_session_crt(s: Tdane_state_t; session: Tgnutls_session_t; hostname: pchar; proto: pchar; port: dword;
  sflags: dword; vflags: dword; verify: Pdword): longint; cdecl; external libgnutls;
function dane_strerror(error: longint): pchar; cdecl; external libgnutls;

const
  DANE_E_SUCCESS = 0;
  DANE_E_INITIALIZATION_ERROR = -(1);
  DANE_E_RESOLVING_ERROR = -(2);
  DANE_E_NO_DANE_DATA = -(3);
  DANE_E_RECEIVED_CORRUPT_DATA = -(4);
  DANE_E_INVALID_DNSSEC_SIG = -(5);
  DANE_E_NO_DNSSEC_SIG = -(6);
  DANE_E_MEMORY_ERROR = -(7);
  DANE_E_REQUESTED_DATA_NOT_AVAILABLE = -(8);
  DANE_E_INVALID_REQUEST = -(9);
  DANE_E_PUBKEY_ERROR = -(10);
  DANE_E_NO_CERT = -(11);
  DANE_E_FILE_ERROR = -(12);
  DANE_E_CERT_ERROR = -(13);
  DANE_E_UNKNOWN_DANE_DATA = -(14);

  // === Konventiert am: 9-7-25 13:39:30 ===


implementation



end.

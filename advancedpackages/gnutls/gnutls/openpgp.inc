{$IFDEF read_interface}


type
  Pgnutls_openpgp_crt_fmt = ^Tgnutls_openpgp_crt_fmt;
  Tgnutls_openpgp_crt_fmt = longint;

const
  GNUTLS_OPENPGP_FMT_RAW = 0;
  GNUTLS_OPENPGP_FMT_BASE64 = 1;

type
  Tgnutls_openpgp_crt_fmt_t = Tgnutls_openpgp_crt_fmt;

const
  GNUTLS_OPENPGP_KEYID_SIZE = 8;
  GNUTLS_OPENPGP_V4_FINGERPRINT_SIZE = 20;

type
  Pgnutls_openpgp_keyid_t = ^Tgnutls_openpgp_keyid_t;
  Tgnutls_openpgp_keyid_t = array[0..(GNUTLS_OPENPGP_KEYID_SIZE) - 1] of byte;

function gnutls_openpgp_crt_init(key: Pgnutls_openpgp_crt_t): longint; cdecl; external libgnutls; deprecated;
procedure gnutls_openpgp_crt_deinit(key: Tgnutls_openpgp_crt_t); cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_import(key: Tgnutls_openpgp_crt_t; data: Pgnutls_datum_t; format: Tgnutls_openpgp_crt_fmt_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_export(key: Tgnutls_openpgp_crt_t; format: Tgnutls_openpgp_crt_fmt_t; output_data: pointer; output_data_size: Psize_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_export2(key: Tgnutls_openpgp_crt_t; format: Tgnutls_openpgp_crt_fmt_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_print(cert: Tgnutls_openpgp_crt_t; format: Tgnutls_certificate_print_formats_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls; deprecated;

const
  GNUTLS_OPENPGP_MASTER_KEYID_IDX = MaxInt;

function gnutls_openpgp_crt_get_key_usage(key: Tgnutls_openpgp_crt_t; key_usage: Pdword): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_fingerprint(key: Tgnutls_openpgp_crt_t; fpr: pointer; fprlen: Psize_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_subkey_fingerprint(key: Tgnutls_openpgp_crt_t; idx: dword; fpr: pointer; fprlen: Psize_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_name(key: Tgnutls_openpgp_crt_t; idx: longint; buf: pchar; sizeof_buf: Psize_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_pk_algorithm(key: Tgnutls_openpgp_crt_t; bits: Pdword): Tgnutls_pk_algorithm_t; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_version(key: Tgnutls_openpgp_crt_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_creation_time(key: Tgnutls_openpgp_crt_t): Ttime_t; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_expiration_time(key: Tgnutls_openpgp_crt_t): Ttime_t; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_key_id(key: Tgnutls_openpgp_crt_t; keyid: Tgnutls_openpgp_keyid_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_check_hostname(key: Tgnutls_openpgp_crt_t; hostname: pchar): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_check_hostname2(key: Tgnutls_openpgp_crt_t; hostname: pchar; flags: dword): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_check_email(key: Tgnutls_openpgp_crt_t; email: pchar; flags: dword): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_revoked_status(key: Tgnutls_openpgp_crt_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_subkey_count(key: Tgnutls_openpgp_crt_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_subkey_idx(key: Tgnutls_openpgp_crt_t; keyid: Tgnutls_openpgp_keyid_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_subkey_revoked_status(key: Tgnutls_openpgp_crt_t; idx: dword): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_subkey_pk_algorithm(key: Tgnutls_openpgp_crt_t; idx: dword; bits: Pdword): Tgnutls_pk_algorithm_t; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_subkey_creation_time(key: Tgnutls_openpgp_crt_t; idx: dword): Ttime_t; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_subkey_expiration_time(key: Tgnutls_openpgp_crt_t; idx: dword): Ttime_t; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_subkey_id(key: Tgnutls_openpgp_crt_t; idx: dword; keyid: Tgnutls_openpgp_keyid_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_subkey_usage(key: Tgnutls_openpgp_crt_t; idx: dword; key_usage: Pdword): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_subkey_pk_dsa_raw(crt: Tgnutls_openpgp_crt_t; idx: dword; p: Pgnutls_datum_t; q: Pgnutls_datum_t; g: Pgnutls_datum_t; y: Pgnutls_datum_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_subkey_pk_rsa_raw(crt: Tgnutls_openpgp_crt_t; idx: dword; m: Pgnutls_datum_t; e: Pgnutls_datum_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_pk_dsa_raw(crt: Tgnutls_openpgp_crt_t; p: Pgnutls_datum_t; q: Pgnutls_datum_t; g: Pgnutls_datum_t; y: Pgnutls_datum_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_pk_rsa_raw(crt: Tgnutls_openpgp_crt_t; m: Pgnutls_datum_t; e: Pgnutls_datum_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_preferred_key_id(key: Tgnutls_openpgp_crt_t; keyid: Tgnutls_openpgp_keyid_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_set_preferred_key_id(key: Tgnutls_openpgp_crt_t; keyid: Tgnutls_openpgp_keyid_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_init(key: Pgnutls_openpgp_privkey_t): longint; cdecl; external libgnutls; deprecated;
procedure gnutls_openpgp_privkey_deinit(key: Tgnutls_openpgp_privkey_t); cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_get_pk_algorithm(key: Tgnutls_openpgp_privkey_t; bits: Pdword): Tgnutls_pk_algorithm_t; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_sec_param(key: Tgnutls_openpgp_privkey_t): Tgnutls_sec_param_t; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_import(key: Tgnutls_openpgp_privkey_t; data: Pgnutls_datum_t; format: Tgnutls_openpgp_crt_fmt_t; password: pchar; flags: dword): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_get_fingerprint(key: Tgnutls_openpgp_privkey_t; fpr: pointer; fprlen: Psize_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_get_subkey_fingerprint(key: Tgnutls_openpgp_privkey_t; idx: dword; fpr: pointer; fprlen: Psize_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_get_key_id(key: Tgnutls_openpgp_privkey_t; keyid: Tgnutls_openpgp_keyid_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_get_subkey_count(key: Tgnutls_openpgp_privkey_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_get_subkey_idx(key: Tgnutls_openpgp_privkey_t; keyid: Tgnutls_openpgp_keyid_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_get_subkey_revoked_status(key: Tgnutls_openpgp_privkey_t; idx: dword): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_get_revoked_status(key: Tgnutls_openpgp_privkey_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_get_subkey_pk_algorithm(key: Tgnutls_openpgp_privkey_t; idx: dword; bits: Pdword): Tgnutls_pk_algorithm_t; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_get_subkey_expiration_time(key: Tgnutls_openpgp_privkey_t; idx: dword): Ttime_t; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_get_subkey_id(key: Tgnutls_openpgp_privkey_t; idx: dword; keyid: Tgnutls_openpgp_keyid_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_get_subkey_creation_time(key: Tgnutls_openpgp_privkey_t; idx: dword): Ttime_t; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_export_subkey_dsa_raw(pkey: Tgnutls_openpgp_privkey_t; idx: dword; p: Pgnutls_datum_t; q: Pgnutls_datum_t; g: Pgnutls_datum_t; y: Pgnutls_datum_t; x: Pgnutls_datum_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_export_subkey_rsa_raw(pkey: Tgnutls_openpgp_privkey_t; idx: dword; m: Pgnutls_datum_t; e: Pgnutls_datum_t; d: Pgnutls_datum_t; p: Pgnutls_datum_t; q: Pgnutls_datum_t; u: Pgnutls_datum_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_export_dsa_raw(pkey: Tgnutls_openpgp_privkey_t; p: Pgnutls_datum_t; q: Pgnutls_datum_t; g: Pgnutls_datum_t; y: Pgnutls_datum_t; x: Pgnutls_datum_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_export_rsa_raw(pkey: Tgnutls_openpgp_privkey_t; m: Pgnutls_datum_t; e: Pgnutls_datum_t; d: Pgnutls_datum_t; p: Pgnutls_datum_t; q: Pgnutls_datum_t; u: Pgnutls_datum_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_export(key: Tgnutls_openpgp_privkey_t; format: Tgnutls_openpgp_crt_fmt_t; password: pchar; flags: dword; output_data: pointer; output_data_size: Psize_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_export2(key: Tgnutls_openpgp_privkey_t; format: Tgnutls_openpgp_crt_fmt_t; password: pchar; flags: dword; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_set_preferred_key_id(key: Tgnutls_openpgp_privkey_t; keyid: Tgnutls_openpgp_keyid_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_privkey_get_preferred_key_id(key: Tgnutls_openpgp_privkey_t; keyid: Tgnutls_openpgp_keyid_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_get_auth_subkey(crt: Tgnutls_openpgp_crt_t; keyid: Tgnutls_openpgp_keyid_t; flag: dword): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_keyring_init(keyring: Pgnutls_openpgp_keyring_t): longint; cdecl; external libgnutls; deprecated;
procedure gnutls_openpgp_keyring_deinit(keyring: Tgnutls_openpgp_keyring_t); cdecl; external libgnutls; deprecated;
function gnutls_openpgp_keyring_import(keyring: Tgnutls_openpgp_keyring_t; data: Pgnutls_datum_t; format: Tgnutls_openpgp_crt_fmt_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_keyring_check_id(ring: Tgnutls_openpgp_keyring_t; keyid: Tgnutls_openpgp_keyid_t; flags: dword): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_verify_ring(key: Tgnutls_openpgp_crt_t; keyring: Tgnutls_openpgp_keyring_t; flags: dword; verify: Pdword): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_crt_verify_self(key: Tgnutls_openpgp_crt_t; flags: dword; verify: Pdword): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_keyring_get_crt(ring: Tgnutls_openpgp_keyring_t; idx: dword; cert: Pgnutls_openpgp_crt_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_openpgp_keyring_get_crt_count(ring: Tgnutls_openpgp_keyring_t): longint; cdecl; external libgnutls; deprecated;

type
  Tgnutls_openpgp_recv_key_func = function(session: Tgnutls_session_t; keyfpr: pbyte; keyfpr_length: dword; key: Pgnutls_datum_t): longint; cdecl;

procedure gnutls_openpgp_set_recv_key_function(session: Tgnutls_session_t; func: Tgnutls_openpgp_recv_key_func); cdecl; external libgnutls; deprecated;
function gnutls_certificate_set_openpgp_key(res: Tgnutls_certificate_credentials_t; crt: Tgnutls_openpgp_crt_t; pkey: Tgnutls_openpgp_privkey_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_certificate_get_openpgp_key(res: Tgnutls_certificate_credentials_t; index: dword; key: Pgnutls_openpgp_privkey_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_certificate_get_openpgp_crt(res: Tgnutls_certificate_credentials_t; index: dword; crt_list: PPgnutls_openpgp_crt_t; crt_list_size: Pdword): longint; cdecl; external libgnutls; deprecated;
function gnutls_certificate_set_openpgp_key_file(res: Tgnutls_certificate_credentials_t; certfile: pchar; keyfile: pchar; format: Tgnutls_openpgp_crt_fmt_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_certificate_set_openpgp_key_mem(res: Tgnutls_certificate_credentials_t; cert: Pgnutls_datum_t; key: Pgnutls_datum_t; format: Tgnutls_openpgp_crt_fmt_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_certificate_set_openpgp_key_file2(res: Tgnutls_certificate_credentials_t; certfile: pchar; keyfile: pchar; subkey_id: pchar; format: Tgnutls_openpgp_crt_fmt_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_certificate_set_openpgp_key_mem2(res: Tgnutls_certificate_credentials_t; cert: Pgnutls_datum_t; key: Pgnutls_datum_t; subkey_id: pchar; format: Tgnutls_openpgp_crt_fmt_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_certificate_set_openpgp_keyring_mem(c: Tgnutls_certificate_credentials_t; data: pbyte; dlen: Tsize_t; format: Tgnutls_openpgp_crt_fmt_t): longint; cdecl; external libgnutls; deprecated;
function gnutls_certificate_set_openpgp_keyring_file(c: Tgnutls_certificate_credentials_t; file_: pchar; format: Tgnutls_openpgp_crt_fmt_t): longint; cdecl; external libgnutls; deprecated;

// === Konventiert am: 9-7-25 13:39:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

{$IFDEF read_interface}


const
  GNUTLS_PKCS11_MAX_PIN_LEN = 256;

type
  Tgnutls_pkcs11_token_callback_t = function(userdata: pointer; _label: pchar; retry: dword): longint; cdecl;
  Tgnutls_pkcs11_obj_st = record
  end;
  Tgnutls_pkcs11_obj_t = ^Tgnutls_pkcs11_obj_st;
  Pgnutls_pkcs11_obj_t = ^Tgnutls_pkcs11_obj_t;
  PPgnutls_pkcs11_obj_t = ^Pgnutls_pkcs11_obj_t;

const
  GNUTLS_PKCS11_FLAG_MANUAL = 0;
  GNUTLS_PKCS11_FLAG_AUTO = 1;
  GNUTLS_PKCS11_FLAG_AUTO_TRUSTED = 1 shl 1;

function gnutls_pkcs11_init(flags: dword; deprecated_config_file: pchar): longint; cdecl; external libgnutls;
function gnutls_pkcs11_reinit: longint; cdecl; external libgnutls;
procedure gnutls_pkcs11_deinit; cdecl; external libgnutls;
procedure gnutls_pkcs11_set_token_function(fn: Tgnutls_pkcs11_token_callback_t; userdata: pointer); cdecl; external libgnutls;
procedure gnutls_pkcs11_set_pin_function(fn: Tgnutls_pin_callback_t; userdata: pointer); cdecl; external libgnutls;
function gnutls_pkcs11_get_pin_function(userdata: Ppointer): Tgnutls_pin_callback_t; cdecl; external libgnutls;
function gnutls_pkcs11_add_provider(name: pchar; params: pchar): longint; cdecl; external libgnutls;
function gnutls_pkcs11_obj_init(obj: Pgnutls_pkcs11_obj_t): longint; cdecl; external libgnutls;
procedure gnutls_pkcs11_obj_set_pin_function(obj: Tgnutls_pkcs11_obj_t; fn: Tgnutls_pin_callback_t; userdata: pointer); cdecl; external libgnutls;

type
  Pgnutls_pkcs11_obj_flags = ^Tgnutls_pkcs11_obj_flags;
  Tgnutls_pkcs11_obj_flags = longint;

const
  GNUTLS_PKCS11_OBJ_FLAG_LOGIN = 1 shl 0;
  GNUTLS_PKCS11_OBJ_FLAG_MARK_TRUSTED = 1 shl 1;
  GNUTLS_PKCS11_OBJ_FLAG_MARK_SENSITIVE = 1 shl 2;
  GNUTLS_PKCS11_OBJ_FLAG_LOGIN_SO = 1 shl 3;
  GNUTLS_PKCS11_OBJ_FLAG_MARK_PRIVATE = 1 shl 4;
  GNUTLS_PKCS11_OBJ_FLAG_MARK_NOT_PRIVATE = 1 shl 5;
  GNUTLS_PKCS11_OBJ_FLAG_RETRIEVE_ANY = 1 shl 6;
  GNUTLS_PKCS11_OBJ_FLAG_RETRIEVE_TRUSTED = GNUTLS_PKCS11_OBJ_FLAG_MARK_TRUSTED;
  GNUTLS_PKCS11_OBJ_FLAG_MARK_DISTRUSTED = 1 shl 8;
  GNUTLS_PKCS11_OBJ_FLAG_RETRIEVE_DISTRUSTED = GNUTLS_PKCS11_OBJ_FLAG_MARK_DISTRUSTED;
  GNUTLS_PKCS11_OBJ_FLAG_COMPARE = 1 shl 9;
  GNUTLS_PKCS11_OBJ_FLAG_PRESENT_IN_TRUSTED_MODULE = 1 shl 10;
  GNUTLS_PKCS11_OBJ_FLAG_MARK_CA = 1 shl 11;
  GNUTLS_PKCS11_OBJ_FLAG_MARK_KEY_WRAP = 1 shl 12;
  GNUTLS_PKCS11_OBJ_FLAG_COMPARE_KEY = 1 shl 13;
  GNUTLS_PKCS11_OBJ_FLAG_OVERWRITE_TRUSTMOD_EXT = 1 shl 14;
  GNUTLS_PKCS11_OBJ_FLAG_MARK_ALWAYS_AUTH = 1 shl 15;
  GNUTLS_PKCS11_OBJ_FLAG_MARK_EXTRACTABLE = 1 shl 16;
  GNUTLS_PKCS11_OBJ_FLAG_NEVER_EXTRACTABLE = 1 shl 17;
  GNUTLS_PKCS11_OBJ_FLAG_CRT = 1 shl 18;
  GNUTLS_PKCS11_OBJ_FLAG_WITH_PRIVKEY = 1 shl 19;
  GNUTLS_PKCS11_OBJ_FLAG_PUBKEY = 1 shl 20;
  GNUTLS_PKCS11_OBJ_FLAG_NO_STORE_PUBKEY = GNUTLS_PKCS11_OBJ_FLAG_PUBKEY;
  GNUTLS_PKCS11_OBJ_FLAG_PRIVKEY = 1 shl 21;
  GNUTLS_PKCS11_OBJ_FLAG_MARK_NOT_SENSITIVE = 1 shl 22;

type
  Tgnutls_pkcs11_obj_attr_t = Tgnutls_pkcs11_obj_flags;

type
  Pgnutls_pkcs11_url_type_t = ^Tgnutls_pkcs11_url_type_t;
  Tgnutls_pkcs11_url_type_t = longint;

const
  GNUTLS_PKCS11_URL_GENERIC = 0;
  GNUTLS_PKCS11_URL_LIB = 1;
  GNUTLS_PKCS11_URL_LIB_VERSION = 2;

function gnutls_pkcs11_obj_import_url(obj: Tgnutls_pkcs11_obj_t; url: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_obj_export_url(obj: Tgnutls_pkcs11_obj_t; detailed: Tgnutls_pkcs11_url_type_t; url: PPchar): longint; cdecl; external libgnutls;
procedure gnutls_pkcs11_obj_deinit(obj: Tgnutls_pkcs11_obj_t); cdecl; external libgnutls;
function gnutls_pkcs11_obj_export(obj: Tgnutls_pkcs11_obj_t; output_data: pointer; output_data_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_pkcs11_obj_export2(obj: Tgnutls_pkcs11_obj_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs11_obj_export3(obj: Tgnutls_pkcs11_obj_t; fmt: Tgnutls_x509_crt_fmt_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pkcs11_get_raw_issuer(url: pchar; cert: Tgnutls_x509_crt_t; issuer: Pgnutls_datum_t; fmt: Tgnutls_x509_crt_fmt_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_get_raw_issuer_by_dn(url: pchar; dn: Pgnutls_datum_t; issuer: Pgnutls_datum_t; fmt: Tgnutls_x509_crt_fmt_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_get_raw_issuer_by_subject_key_id(url: pchar; dn: Pgnutls_datum_t; spki: Pgnutls_datum_t; issuer: Pgnutls_datum_t; fmt: Tgnutls_x509_crt_fmt_t;
  flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_crt_is_known(url: pchar; cert: Tgnutls_x509_crt_t; flags: dword): dword; cdecl; external libgnutls;

function gnutls_pkcs11_copy_pubkey(token_url: pchar; crt: Tgnutls_pubkey_t; _label: pchar; cid: Pgnutls_datum_t; key_usage: dword;
  flags: dword): longint; cdecl; external libgnutls;

function gnutls_pkcs11_copy_x509_crt2(token_url: pchar; crt: Tgnutls_x509_crt_t; _label: pchar; id: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;


function gnutls_pkcs11_copy_x509_privkey2(token_url: pchar; key: Tgnutls_x509_privkey_t; _label: pchar; cid: Pgnutls_datum_t; key_usage: dword;
  flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_delete_url(object_url: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_copy_secret_key(token_url: pchar; key: Pgnutls_datum_t; _label: pchar; key_usage: dword; flags: dword): longint; cdecl; external libgnutls;

type
  Pgnutls_pkcs11_obj_info_t = ^Tgnutls_pkcs11_obj_info_t;
  Tgnutls_pkcs11_obj_info_t = longint;

const
  GNUTLS_PKCS11_OBJ_ID_HEX = 1;
  GNUTLS_PKCS11_OBJ_LABEL = 2;
  GNUTLS_PKCS11_OBJ_TOKEN_LABEL = 3;
  GNUTLS_PKCS11_OBJ_TOKEN_SERIAL = 4;
  GNUTLS_PKCS11_OBJ_TOKEN_MANUFACTURER = 5;
  GNUTLS_PKCS11_OBJ_TOKEN_MODEL = 6;
  GNUTLS_PKCS11_OBJ_ID = 7;
  GNUTLS_PKCS11_OBJ_LIBRARY_VERSION = 8;
  GNUTLS_PKCS11_OBJ_LIBRARY_DESCRIPTION = 9;
  GNUTLS_PKCS11_OBJ_LIBRARY_MANUFACTURER = 10;

function gnutls_pkcs11_obj_get_ptr(obj: Tgnutls_pkcs11_obj_t; ptr: Ppointer; session: Ppointer; ohandle: Ppointer; slot_id: Pculong;
  flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_obj_get_info(obj: Tgnutls_pkcs11_obj_t; itype: Tgnutls_pkcs11_obj_info_t; output: pointer; output_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_pkcs11_obj_set_info(obj: Tgnutls_pkcs11_obj_t; itype: Tgnutls_pkcs11_obj_info_t; data: pointer; data_size: Tsize_t; flags: dword): longint; cdecl; external libgnutls;

const
  GNUTLS_PKCS11_OBJ_ATTR_CRT_ALL = GNUTLS_PKCS11_OBJ_FLAG_CRT;
  GNUTLS_PKCS11_OBJ_ATTR_MATCH = 0;
  GNUTLS_PKCS11_OBJ_ATTR_ALL = 0;
  GNUTLS_PKCS11_OBJ_ATTR_CRT_TRUSTED = GNUTLS_PKCS11_OBJ_FLAG_CRT or GNUTLS_PKCS11_OBJ_FLAG_MARK_TRUSTED;
  GNUTLS_PKCS11_OBJ_ATTR_CRT_WITH_PRIVKEY = GNUTLS_PKCS11_OBJ_FLAG_CRT or GNUTLS_PKCS11_OBJ_FLAG_WITH_PRIVKEY;
  GNUTLS_PKCS11_OBJ_ATTR_CRT_TRUSTED_CA = (GNUTLS_PKCS11_OBJ_FLAG_CRT or GNUTLS_PKCS11_OBJ_FLAG_MARK_CA) or GNUTLS_PKCS11_OBJ_FLAG_MARK_TRUSTED;
  GNUTLS_PKCS11_OBJ_ATTR_PUBKEY = GNUTLS_PKCS11_OBJ_FLAG_PUBKEY;
  GNUTLS_PKCS11_OBJ_ATTR_PRIVKEY = GNUTLS_PKCS11_OBJ_FLAG_PRIVKEY;

type
  Pgnutls_pkcs11_token_info_t = ^Tgnutls_pkcs11_token_info_t;
  Tgnutls_pkcs11_token_info_t = longint;

const
  GNUTLS_PKCS11_TOKEN_LABEL = 0;
  GNUTLS_PKCS11_TOKEN_SERIAL = 1;
  GNUTLS_PKCS11_TOKEN_MANUFACTURER = 2;
  GNUTLS_PKCS11_TOKEN_MODEL = 3;
  GNUTLS_PKCS11_TOKEN_MODNAME = 4;

type
  Pgnutls_pkcs11_obj_type_t = ^Tgnutls_pkcs11_obj_type_t;
  Tgnutls_pkcs11_obj_type_t = longint;

const
  GNUTLS_PKCS11_OBJ_UNKNOWN = 0;
  GNUTLS_PKCS11_OBJ_X509_CRT = 1;
  GNUTLS_PKCS11_OBJ_PUBKEY = 2;
  GNUTLS_PKCS11_OBJ_PRIVKEY = 3;
  GNUTLS_PKCS11_OBJ_SECRET_KEY = 4;
  GNUTLS_PKCS11_OBJ_DATA = 5;
  GNUTLS_PKCS11_OBJ_X509_CRT_EXTENSION = 6;

function gnutls_pkcs11_token_init(token_url: pchar; so_pin: pchar; _label: pchar): longint; cdecl; external libgnutls;
function gnutls_pkcs11_token_get_ptr(url: pchar; ptr: Ppointer; slot_id: Pculong; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_token_get_mechanism(url: pchar; idx: dword; mechanism: Pculong): longint; cdecl; external libgnutls;
function gnutls_pkcs11_token_check_mechanism(url: pchar; mechanism: Tculong; ptr: pointer; psize: dword; flags: dword): dword; cdecl; external libgnutls;
function gnutls_pkcs11_token_set_pin(token_url: pchar; oldpin: pchar; newpin: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_token_get_url(seq: dword; detailed: Tgnutls_pkcs11_url_type_t; url: PPchar): longint; cdecl; external libgnutls;
function gnutls_pkcs11_token_get_info(url: pchar; ttype: Tgnutls_pkcs11_token_info_t; output: pointer; output_size: Psize_t): longint; cdecl; external libgnutls;

const
  GNUTLS_PKCS11_TOKEN_HW = 1;
  GNUTLS_PKCS11_TOKEN_TRUSTED = 1 shl 1;
  GNUTLS_PKCS11_TOKEN_RNG = 1 shl 2;
  GNUTLS_PKCS11_TOKEN_LOGIN_REQUIRED = 1 shl 3;
  GNUTLS_PKCS11_TOKEN_PROTECTED_AUTHENTICATION_PATH = 1 shl 4;
  GNUTLS_PKCS11_TOKEN_INITIALIZED = 1 shl 5;
  GNUTLS_PKCS11_TOKEN_USER_PIN_COUNT_LOW = 1 shl 6;
  GNUTLS_PKCS11_TOKEN_USER_PIN_FINAL_TRY = 1 shl 7;
  GNUTLS_PKCS11_TOKEN_USER_PIN_LOCKED = 1 shl 8;
  GNUTLS_PKCS11_TOKEN_SO_PIN_COUNT_LOW = 1 shl 9;
  GNUTLS_PKCS11_TOKEN_SO_PIN_FINAL_TRY = 1 shl 10;
  GNUTLS_PKCS11_TOKEN_SO_PIN_LOCKED = 1 shl 11;
  GNUTLS_PKCS11_TOKEN_USER_PIN_INITIALIZED = 1 shl 12;
  GNUTLS_PKCS11_TOKEN_ERROR_STATE = 1 shl 13;

function gnutls_pkcs11_token_get_flags(url: pchar; flags: Pdword): longint; cdecl; external libgnutls;

function gnutls_pkcs11_obj_list_import_url3(p_list: Pgnutls_pkcs11_obj_t; n_list: Pdword; url: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_obj_list_import_url4(p_list: PPgnutls_pkcs11_obj_t; n_list: Pdword; url: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_crt_import_pkcs11(crt: Tgnutls_x509_crt_t; pkcs11_crt: Tgnutls_pkcs11_obj_t): longint; cdecl; external libgnutls;
function gnutls_pkcs11_obj_get_type(obj: Tgnutls_pkcs11_obj_t): Tgnutls_pkcs11_obj_type_t; cdecl; external libgnutls;
function gnutls_pkcs11_type_get_name(_type: Tgnutls_pkcs11_obj_type_t): pchar; cdecl; external libgnutls;
function gnutls_pkcs11_obj_get_exts(obj: Tgnutls_pkcs11_obj_t; exts: PPgnutls_x509_ext_st; exts_size: Pdword; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_obj_get_flags(obj: Tgnutls_pkcs11_obj_t; oflags: Pdword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_obj_flags_get_str(flags: dword): pchar; cdecl; external libgnutls;
function gnutls_x509_crt_list_import_pkcs11(certs: Pgnutls_x509_crt_t; cert_max: dword; objs: Pgnutls_pkcs11_obj_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_privkey_init(key: Pgnutls_pkcs11_privkey_t): longint; cdecl; external libgnutls;
function gnutls_pkcs11_privkey_cpy(dst: Tgnutls_pkcs11_privkey_t; src: Tgnutls_pkcs11_privkey_t): longint; cdecl; external libgnutls;
procedure gnutls_pkcs11_privkey_set_pin_function(key: Tgnutls_pkcs11_privkey_t; fn: Tgnutls_pin_callback_t; userdata: pointer); cdecl; external libgnutls;
procedure gnutls_pkcs11_privkey_deinit(key: Tgnutls_pkcs11_privkey_t); cdecl; external libgnutls;
function gnutls_pkcs11_privkey_get_pk_algorithm(key: Tgnutls_pkcs11_privkey_t; bits: Pdword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_privkey_get_info(pkey: Tgnutls_pkcs11_privkey_t; itype: Tgnutls_pkcs11_obj_info_t; output: pointer; output_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_pkcs11_privkey_import_url(pkey: Tgnutls_pkcs11_privkey_t; url: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_privkey_export_url(key: Tgnutls_pkcs11_privkey_t; detailed: Tgnutls_pkcs11_url_type_t; url: PPchar): longint; cdecl; external libgnutls;
function gnutls_pkcs11_privkey_status(key: Tgnutls_pkcs11_privkey_t): dword; cdecl; external libgnutls;

function gnutls_pkcs11_privkey_generate3(url: pchar; pk: Tgnutls_pk_algorithm_t; bits: dword; _label: pchar; cid: Pgnutls_datum_t;
  fmt: Tgnutls_x509_crt_fmt_t; pubkey: Pgnutls_datum_t; key_usage: dword; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_privkey_export_pubkey(pkey: Tgnutls_pkcs11_privkey_t; fmt: Tgnutls_x509_crt_fmt_t; pubkey: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pkcs11_token_get_random(token_url: pchar; data: pointer; len: Tsize_t): longint; cdecl; external libgnutls;
function gnutls_pkcs11_copy_attached_extension(token_url: pchar; crt: Tgnutls_x509_crt_t; data: Pgnutls_datum_t; _label: pchar; flags: dword): longint; cdecl; external libgnutls;

function gnutls_x509_crt_import_pkcs11_url(crt: Tgnutls_x509_crt_t; url: pansichar; flags: cardinal): integer; cdecl; external libgnutls name 'gnutls_x509_crt_import_url';

// === Konventiert am: 9-7-25 13:39:51 ===

function gnutls_pkcs11_copy_x509_crt(url: pansichar; crt: Tgnutls_x509_crt_t; label_: pansichar; flags: cardinal): integer;
function gnutls_pkcs11_copy_x509_privkey(url: pansichar; key: Tgnutls_x509_privkey_t; label_: pansichar; usage: cardinal; flags: cardinal): integer;

function gnutls_pkcs11_obj_list_import_url(p_list: Pgnutls_pkcs11_obj_t; n_list: PCardinal; url: pansichar; attrs: cardinal; flags: cardinal): integer;
function gnutls_pkcs11_obj_list_import_url2(p_list: PPgnutls_pkcs11_obj_t; n_list: PCardinal; url: pansichar; attrs: cardinal; flags: cardinal): integer;

function gnutls_pkcs11_privkey_generate(url: pansichar; pk: Tgnutls_pk_algorithm_t; bits: cardinal; label_: pansichar; flags: cardinal): integer;
function gnutls_pkcs11_privkey_generate2(url: pansichar; pk: Tgnutls_pk_algorithm_t; bits: cardinal; label_: pansichar; fmt: cardinal; pubkey: Pointer; flags: cardinal): integer;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function gnutls_pkcs11_copy_x509_crt(url: pansichar; crt: Tgnutls_x509_crt_t; label_: pansichar; flags: cardinal): integer;
begin
  Result := gnutls_pkcs11_copy_x509_crt2(url, crt, label_, nil, flags);
end;

function gnutls_pkcs11_copy_x509_privkey(url: pansichar; key: Tgnutls_x509_privkey_t; label_: pansichar; usage: cardinal; flags: cardinal): integer;
begin
  Result := gnutls_pkcs11_copy_x509_privkey2(url, key, label_, nil, usage, flags);
end;

function gnutls_pkcs11_obj_list_import_url(p_list: Pgnutls_pkcs11_obj_t; n_list: PCardinal; url: pansichar; attrs: cardinal; flags: cardinal): integer;
begin
  Result := gnutls_pkcs11_obj_list_import_url3(p_list, n_list, url, attrs or flags);
end;

function gnutls_pkcs11_obj_list_import_url2(p_list: PPgnutls_pkcs11_obj_t; n_list: PCardinal; url: pansichar; attrs: cardinal; flags: cardinal): integer;
begin
  Result := gnutls_pkcs11_obj_list_import_url4(p_list, n_list, url, attrs or flags);
end;

function gnutls_pkcs11_privkey_generate(url: pansichar; pk: Tgnutls_pk_algorithm_t; bits: cardinal; label_: pansichar; flags: cardinal): integer;
begin
  Result := gnutls_pkcs11_privkey_generate3(url, pk, bits, label_, nil, 0, nil, 0, flags);
end;

function gnutls_pkcs11_privkey_generate2(url: pansichar; pk: Tgnutls_pk_algorithm_t; bits: cardinal; label_: pansichar; fmt: cardinal; pubkey: Pointer; flags: cardinal): integer;
begin
  Result := gnutls_pkcs11_privkey_generate3(url, pk, bits, label_, nil, fmt, pubkey, 0, flags);
end;



{$ENDIF read_implementation}

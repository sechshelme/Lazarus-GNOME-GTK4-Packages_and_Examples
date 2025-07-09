unit openssl;

interface

uses
  fp_gnutls, gnutls;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  GNUTLS_X509_CN_SIZE = 256;
  GNUTLS_X509_C_SIZE = 3;
  GNUTLS_X509_O_SIZE = 256;
  GNUTLS_X509_OU_SIZE = 256;
  GNUTLS_X509_L_SIZE = 256;
  GNUTLS_X509_S_SIZE = 256;
  GNUTLS_X509_EMAIL_SIZE = 256;

type
  Tgnutls_x509_dn = record
    common_name: array[0..(GNUTLS_X509_CN_SIZE) - 1] of char;
    country: array[0..(GNUTLS_X509_C_SIZE) - 1] of char;
    organization: array[0..(GNUTLS_X509_O_SIZE) - 1] of char;
    organizational_unit_name: array[0..(GNUTLS_X509_OU_SIZE) - 1] of char;
    locality_name: array[0..(GNUTLS_X509_L_SIZE) - 1] of char;
    state_or_province_name: array[0..(GNUTLS_X509_S_SIZE) - 1] of char;
    email: array[0..(GNUTLS_X509_EMAIL_SIZE) - 1] of char;
  end;
  Pgnutls_x509_dn = ^Tgnutls_x509_dn;

const
  OPENSSL_VERSION_NUMBER = $0090604F;
  SSLEAY_VERSION_NUMBER = OPENSSL_VERSION_NUMBER;
  SSL_ERROR_NONE = 0;
  SSL_ERROR_SSL = 1;
  SSL_ERROR_WANT_READ = 2;
  SSL_ERROR_WANT_WRITE = 3;
  SSL_ERROR_SYSCALL = 5;
  SSL_ERROR_ZERO_RETURN = 6;
  SSL_FILETYPE_PEM = GNUTLS_X509_FMT_PEM;
  SSL_VERIFY_NONE = 0;
  SSL_ST_OK = 1;
  X509_V_ERR_CERT_NOT_YET_VALID = 1;
  X509_V_ERR_CERT_HAS_EXPIRED = 2;
  X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT = 3;
  SSL_OP_ALL = $000FFFFF;
  SSL_OP_NO_TLSv1 = $0400000;
  SSL_MODE_ENABLE_PARTIAL_WRITE = $1;
  SSL_MODE_ACCEPT_MOVING_WRITE_BUFFER = $2;
  SSL_MODE_AUTO_RETRY = $4;

type
  PSSL = ^TSSL;

  PX509_NAME = ^TX509_NAME;
  TX509_NAME = Tgnutls_x509_dn;

  PX509 = ^TX509;
  TX509 = Tgnutls_datum_t;

  TSSL_METHOD = record
    priority_string: array[0..255] of char;
    connend: dword;
  end;
  PSSL_METHOD = ^TSSL_METHOD;

  TSSL_CIPHER = record
    version: Tgnutls_protocol_t;
    cipher: Tgnutls_cipher_algorithm_t;
    kx: Tgnutls_kx_algorithm_t;
    mac: Tgnutls_mac_algorithm_t;
    compression: Tgnutls_compression_method_t;
    cert: Tgnutls_certificate_type_t;
  end;
  PSSL_CIPHER = ^TSSL_CIPHER;

  TBIO = record
    fd: Tgnutls_transport_ptr_t;
  end;
  PBIO = ^TBIO;

  TX509_STORE_CTX = record
    ssl: PSSL;
    error: longint;
    cert_list: Pgnutls_datum_t;
  end;
  PX509_STORE_CTX = ^TX509_STORE_CTX;

  TSSL_CTX = record
    method: PSSL_METHOD;
    certfile: pchar;
    certfile_type: longint;
    keyfile: pchar;
    keyfile_type: longint;
    options: dword;
    verify_callback: function(para1: longint; para2: PX509_STORE_CTX): longint; cdecl;
    verify_mode: longint;
  end;
  PSSL_CTX = ^TSSL_CTX;

  TSSL = record
    gnutls_state: Tgnutls_session_t;
    gnutls_cred: Tgnutls_certificate_client_credentials;
    ctx: PSSL_CTX;
    ciphersuite: TSSL_CIPHER;
    last_error: longint;
    shutdown: longint;
    state: longint;
    options: dword;
    verify_callback: function(para1: longint; para2: PX509_STORE_CTX): longint; cdecl;
    verify_mode: longint;
    rfd: Tgnutls_transport_ptr_t;
    wfd: Tgnutls_transport_ptr_t;
  end;

type
  PMD_CTX = ^TMD_CTX;

  TMD_CTX = record
    handle: pointer;
  end;
  Prsa_st = ^Trsa_st;
  Trsa_st = record
  end;

  TRSA = Trsa_st;

type
  TMD5_CTX = TMD_CTX;
  TRIPEMD160_CTX = TMD_CTX;

function OpenSSL_add_ssl_algorithms: longint;
function SSLeay_add_ssl_algorithms: longint;
procedure SSLeay_add_all_algorithms;
function SSL_get_cipher_name(ssl: PSSL): pchar;
function SSL_get_cipher(ssl: PSSL): pchar;
function SSL_get_cipher_bits(ssl: PSSL; bp: PLongint): longint;
function SSL_get_cipher_version(ssl: PSSL): pchar;

function SSL_library_init: longint; cdecl; external libgnutls;
procedure OpenSSL_add_all_algorithms; cdecl; external libgnutls;
function SSL_CTX_new(method: PSSL_METHOD): PSSL_CTX; cdecl; external libgnutls;
procedure SSL_CTX_free(ctx: PSSL_CTX); cdecl; external libgnutls;
function SSL_CTX_set_default_verify_paths(ctx: PSSL_CTX): longint; cdecl; external libgnutls;
function SSL_CTX_use_certificate_file(ctx: PSSL_CTX; certfile: pchar; _type: longint): longint; cdecl; external libgnutls;
function SSL_CTX_use_PrivateKey_file(ctx: PSSL_CTX; keyfile: pchar; _type: longint): longint; cdecl; external libgnutls;

type
  TSSLVerifyCallback = function(preverify_ok: integer; ctx: PX509_STORE_CTX): integer; cdecl;

procedure SSL_CTX_set_verify(ctx: PSSL_CTX; verify_mode: longint; verify_callback: TSSLVerifyCallback); cdecl; external libgnutls;
function SSL_CTX_set_options(ctx: PSSL_CTX; options: dword): dword; cdecl; external libgnutls;
function SSL_CTX_set_mode(ctx: PSSL_CTX; mode: longint): longint; cdecl; external libgnutls;
function SSL_CTX_set_cipher_list(ctx: PSSL_CTX; list: pchar): longint; cdecl; external libgnutls;
function SSL_CTX_sess_number(ctx: PSSL_CTX): longint; cdecl; external libgnutls;
function SSL_CTX_sess_connect(ctx: PSSL_CTX): longint; cdecl; external libgnutls;
function SSL_CTX_sess_connect_good(ctx: PSSL_CTX): longint; cdecl; external libgnutls;
function SSL_CTX_sess_connect_renegotiate(ctx: PSSL_CTX): longint; cdecl; external libgnutls;
function SSL_CTX_sess_accept(ctx: PSSL_CTX): longint; cdecl; external libgnutls;
function SSL_CTX_sess_accept_good(ctx: PSSL_CTX): longint; cdecl; external libgnutls;
function SSL_CTX_sess_accept_renegotiate(ctx: PSSL_CTX): longint; cdecl; external libgnutls;
function SSL_CTX_sess_hits(ctx: PSSL_CTX): longint; cdecl; external libgnutls;
function SSL_CTX_sess_misses(ctx: PSSL_CTX): longint; cdecl; external libgnutls;
function SSL_CTX_sess_timeouts(ctx: PSSL_CTX): longint; cdecl; external libgnutls;
function SSL_new(ctx: PSSL_CTX): PSSL; cdecl; external libgnutls;
procedure SSL_free(ssl: PSSL); cdecl; external libgnutls;
procedure SSL_load_error_strings; cdecl; external libgnutls;
function SSL_get_error(ssl: PSSL; ret: longint): longint; cdecl; external libgnutls;
function SSL_set_fd(ssl: PSSL; fd: longint): longint; cdecl; external libgnutls;
function SSL_set_rfd(ssl: PSSL; fd: longint): longint; cdecl; external libgnutls;
function SSL_set_wfd(ssl: PSSL; fd: longint): longint; cdecl; external libgnutls;
procedure SSL_set_bio(ssl: PSSL; rbio: PBIO; wbio: PBIO); cdecl; external libgnutls;
procedure SSL_set_connect_state(ssl: PSSL); cdecl; external libgnutls;
function SSL_pending(ssl: PSSL): longint; cdecl; external libgnutls;

procedure SSL_set_verify(ssl: PSSL; verify_mode: longint; verify_callback: TSSLVerifyCallback); cdecl; external libgnutls;
function SSL_get_peer_certificate(ssl: PSSL): PX509; cdecl; external libgnutls;
function SSL_connect(ssl: PSSL): longint; cdecl; external libgnutls;
function SSL_accept(ssl: PSSL): longint; cdecl; external libgnutls;
function SSL_shutdown(ssl: PSSL): longint; cdecl; external libgnutls;
function SSL_read(ssl: PSSL; buf: pointer; len: longint): longint; cdecl; external libgnutls;
function SSL_write(ssl: PSSL; buf: pointer; len: longint): longint; cdecl; external libgnutls;
function SSL_want(ssl: PSSL): longint; cdecl; external libgnutls;

const
  SSL_NOTHING = 1;
  SSL_WRITING = 2;
  SSL_READING = 3;
  SSL_X509_LOOKUP = 4;

function SSL_want_nothing(s: PSSL): boolean;
function SSL_want_read(s: PSSL): boolean;
function SSL_want_write(s: PSSL): boolean;
function SSL_want_x509_lookup(s: PSSL): boolean;

function SSLv23_client_method: PSSL_METHOD; cdecl; external libgnutls;
function SSLv23_server_method: PSSL_METHOD; cdecl; external libgnutls;
function SSLv3_client_method: PSSL_METHOD; cdecl; external libgnutls;
function SSLv3_server_method: PSSL_METHOD; cdecl; external libgnutls;
function TLSv1_client_method: PSSL_METHOD; cdecl; external libgnutls;
function TLSv1_server_method: PSSL_METHOD; cdecl; external libgnutls;
function SSL_get_current_cipher(ssl: PSSL): PSSL_CIPHER; cdecl; external libgnutls;
function SSL_CIPHER_get_name(cipher: PSSL_CIPHER): pchar; cdecl; external libgnutls;
function SSL_CIPHER_get_bits(cipher: PSSL_CIPHER; bits: Plongint): longint; cdecl; external libgnutls;
function SSL_CIPHER_get_version(cipher: PSSL_CIPHER): pchar; cdecl; external libgnutls;
function SSL_CIPHER_description(cipher: PSSL_CIPHER; buf: pchar; size: longint): pchar; cdecl; external libgnutls;
function X509_get_subject_name(cert: PX509): PX509_NAME; cdecl; external libgnutls;
function X509_get_issuer_name(cert: PX509): PX509_NAME; cdecl; external libgnutls;
function X509_NAME_oneline(name: Pgnutls_x509_dn; buf: pchar; len: longint): pchar; cdecl; external libgnutls;
procedure X509_free(cert: PX509); cdecl; external libgnutls;
procedure BIO_get_fd(gnutls_state: Tgnutls_session_t; fd: Plongint); cdecl; external libgnutls;
function BIO_new_socket(sock: longint; close_flag: longint): PBIO; cdecl; external libgnutls;
function ERR_get_error: dword; cdecl; external libgnutls;
function ERR_error_string(e: dword; buf: pchar): pchar; cdecl; external libgnutls;
function RAND_status: longint; cdecl; external libgnutls;
procedure RAND_seed(buf: pointer; num: longint); cdecl; external libgnutls;
function RAND_bytes(buf: pbyte; num: longint): longint; cdecl; external libgnutls;
function RAND_pseudo_bytes(buf: pbyte; num: longint): longint; cdecl; external libgnutls;
function RAND_file_name(buf: pchar; len: Tsize_t): pchar; cdecl; external libgnutls;
function RAND_load_file(name: pchar; maxbytes: longint): longint; cdecl; external libgnutls;
function RAND_write_file(name: pchar): longint; cdecl; external libgnutls;
function RAND_egd_bytes(path: pchar; bytes: longint): longint; cdecl; external libgnutls;

function RAND_egd(p: pchar): longint;

const
  MD5_DIGEST_LENGTH = 16;

procedure MD5_Init(ctx: PMD5_CTX); cdecl; external libgnutls;
procedure MD5_Update(ctx: PMD5_CTX; buf: pointer; len: longint); cdecl; external libgnutls;
procedure MD5_Final(md: pbyte; ctx: PMD5_CTX); cdecl; external libgnutls;
function MD5(buf: pbyte; len: dword; md: pbyte): pbyte; cdecl; external libgnutls;
procedure RIPEMD160_Init(ctx: PRIPEMD160_CTX); cdecl; external libgnutls;
procedure RIPEMD160_Update(ctx: PRIPEMD160_CTX; buf: pointer; len: longint); cdecl; external libgnutls;
procedure RIPEMD160_Final(md: pbyte; ctx: PRIPEMD160_CTX); cdecl; external libgnutls;
function RIPEMD160(buf: pbyte; len: dword; md: pbyte): pbyte; cdecl; external libgnutls;

// === Konventiert am: 9-7-25 13:39:42 ===


implementation


function OpenSSL_add_ssl_algorithms: longint;
begin
  OpenSSL_add_ssl_algorithms := SSL_library_init;
end;

function SSLeay_add_ssl_algorithms: longint;
begin
  SSLeay_add_ssl_algorithms := SSL_library_init;
end;

procedure SSLeay_add_all_algorithms;
begin
  OpenSSL_add_all_algorithms;
end;

function SSL_get_cipher_name(ssl: PSSL): pchar;
begin
  SSL_get_cipher_name := SSL_CIPHER_get_name(SSL_get_current_cipher(ssl));
end;

function SSL_get_cipher(ssl: PSSL): pchar;
begin
  SSL_get_cipher := SSL_get_cipher_name(ssl);
end;

function SSL_get_cipher_bits(ssl: PSSL; bp: PLongint): longint;
begin
  SSL_get_cipher_bits := SSL_CIPHER_get_bits(SSL_get_current_cipher(ssl), bp);
end;

function SSL_get_cipher_version(ssl: PSSL): pchar;
begin
  SSL_get_cipher_version := SSL_CIPHER_get_version(SSL_get_current_cipher(ssl));
end;

function SSL_want_nothing(s: PSSL): boolean;
begin
  SSL_want_nothing := (SSL_want(s)) = SSL_NOTHING;
end;

function SSL_want_read(s: PSSL): boolean;
begin
  SSL_want_read := (SSL_want(s)) = SSL_READING;
end;

function SSL_want_write(s: PSSL): boolean;
begin
  SSL_want_write := (SSL_want(s)) = SSL_WRITING;
end;

function SSL_want_x509_lookup(s: PSSL): boolean;
begin
  SSL_want_x509_lookup := (SSL_want(s)) = SSL_X509_LOOKUP;
end;

function RAND_egd(p: pchar): longint;
begin
  RAND_egd := RAND_egd_bytes(p, 255);
end;


end.

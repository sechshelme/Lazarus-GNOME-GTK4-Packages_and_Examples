unit emile_cipher;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEmile_SSL = record
  end;
  PEmile_SSL = ^TEmile_SSL;

type
  PEmile_Cipher_Backend = ^TEmile_Cipher_Backend;
  TEmile_Cipher_Backend = longint;

const
  EMILE_NONE = 0;
  EMILE_OPENSSL = 1;
  EMILE_GNUTLS = 2;

type
  PEmile_Cipher_Algorithm = ^TEmile_Cipher_Algorithm;
  TEmile_Cipher_Algorithm = longint;

const
  EMILE_AES256_CBC = 0;

function emile_cipher_init: TEina_Bool; cdecl; external libemile;
function emile_cipher_module_get: TEmile_Cipher_Backend; cdecl; external libemile;
function emile_binbuf_cipher(algo: TEmile_Cipher_Algorithm; in_: PEina_Binbuf; key: pchar; length: dword): PEina_Binbuf; cdecl; external libemile;
function emile_binbuf_decipher(algo: TEmile_Cipher_Algorithm; in_: PEina_Binbuf; key: pchar; length: dword): PEina_Binbuf; cdecl; external libemile;

{$ifdef EFL_BETA_API_SUPPORT}
type
  PEmile_Cipher_Type = ^TEmile_Cipher_Type;
  TEmile_Cipher_Type = longint;

const
  EMILE_SSLv23 = 0;
  EMILE_TLSv1 = 1;

type
  PEmile_Want_Type = ^TEmile_Want_Type;
  TEmile_Want_Type = longint;

const
  EMILE_WANT_NOTHING = 0;
  EMILE_WANT_READ = 1;
  EMILE_WANT_WRITE = 3;

type
  TdigestArr = array[0..19] of byte;

function emile_binbuf_hmac_sha1(key: pchar; key_len: dword; data: PEina_Binbuf; digest: TdigestArr): TEina_Bool; cdecl; external libemile;
function emile_binbuf_sha1(data: PEina_Binbuf; digest: TdigestArr): TEina_Bool; cdecl; external libemile;
function emile_cipher_server_listen(t: TEmile_Cipher_Type): PEmile_SSL; cdecl; external libemile;
function emile_cipher_client_connect(server: PEmile_SSL; fd: longint): PEmile_SSL; cdecl; external libemile;
function emile_cipher_server_connect(t: TEmile_Cipher_Type): PEmile_SSL; cdecl; external libemile;
function emile_cipher_free(emile: PEmile_SSL): TEina_Bool; cdecl; external libemile;
function emile_cipher_cafile_add(emile: PEmile_SSL; file_: pchar): TEina_Bool; cdecl; external libemile;
function emile_cipher_cert_add(emile: PEmile_SSL; file_: pchar): TEina_Bool; cdecl; external libemile;
function emile_cipher_privkey_add(emile: PEmile_SSL; file_: pchar): TEina_Bool; cdecl; external libemile;
function emile_cipher_crl_add(emile: PEmile_SSL; file_: pchar): TEina_Bool; cdecl; external libemile;
function emile_cipher_read(emile: PEmile_SSL; buffer: PEina_Binbuf): longint; cdecl; external libemile;
function emile_cipher_write(emile: PEmile_SSL; buffer: PEina_Binbuf): longint; cdecl; external libemile;
function emile_cipher_error_get(emile: PEmile_SSL): pchar; cdecl; external libemile;
function emile_cipher_verify_name_set(emile: PEmile_SSL; name: pchar): TEina_Bool; cdecl; external libemile;
function emile_cipher_verify_name_get(emile: PEmile_SSL): pchar; cdecl; external libemile;
procedure emile_cipher_verify_set(emile: PEmile_SSL; verify: TEina_Bool); cdecl; external libemile;
procedure emile_cipher_verify_basic_set(emile: PEmile_SSL; verify_basic: TEina_Bool); cdecl; external libemile;
function emile_cipher_verify_get(emile: PEmile_SSL): TEina_Bool; cdecl; external libemile;
function emile_cipher_verify_basic_get(emile: PEmile_SSL): TEina_Bool; cdecl; external libemile;
{$endif}

// === Konventiert am: 20-5-25 15:35:33 ===


implementation



end.

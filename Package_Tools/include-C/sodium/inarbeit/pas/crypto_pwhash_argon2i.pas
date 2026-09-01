unit crypto_pwhash_argon2i;

interface

uses
  fp_sodium;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  crypto_pwhash_argon2i_ALG_ARGON2I13_ = 1;

function crypto_pwhash_argon2i_alg_argon2i13: longint; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_BYTES_MIN_ = 16;

function crypto_pwhash_argon2i_bytes_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_BYTES_MAX_ = 4294967295;

function crypto_pwhash_argon2i_bytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_PASSWD_MIN_ = 0;

function crypto_pwhash_argon2i_passwd_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_PASSWD_MAX_ = 4294967295;

function crypto_pwhash_argon2i_passwd_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_SALTBYTES_ = 16;

function crypto_pwhash_argon2i_saltbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_STRBYTES_ = 128;

function crypto_pwhash_argon2i_strbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_STRPREFIX_ = '$argon2i$';

function crypto_pwhash_argon2i_strprefix: pchar; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_OPSLIMIT_MIN_ = 3;

function crypto_pwhash_argon2i_opslimit_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_OPSLIMIT_MAX_ = 4294967295;

function crypto_pwhash_argon2i_opslimit_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_MEMLIMIT_MIN_ = 8192;

function crypto_pwhash_argon2i_memlimit_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_MEMLIMIT_MAX_ = 4398046510080;

function crypto_pwhash_argon2i_memlimit_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_OPSLIMIT_INTERACTIVE_ = 4;

function crypto_pwhash_argon2i_opslimit_interactive: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_MEMLIMIT_INTERACTIVE_ = 33554432;

function crypto_pwhash_argon2i_memlimit_interactive: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_OPSLIMIT_MODERATE_ = 6;

function crypto_pwhash_argon2i_opslimit_moderate: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_MEMLIMIT_MODERATE_ = 134217728;

function crypto_pwhash_argon2i_memlimit_moderate: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_OPSLIMIT_SENSITIVE_ = 8;

function crypto_pwhash_argon2i_opslimit_sensitive: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2i_MEMLIMIT_SENSITIVE_ = 536870912;

function crypto_pwhash_argon2i_memlimit_sensitive: Tsize_t; cdecl; external libsodium;
function crypto_pwhash_argon2i(out_: pbyte; outlen: qword; passwd: pchar; passwdlen: qword; salt: pbyte;
  opslimit: qword; memlimit: Tsize_t; alg: longint): longint; cdecl; external libsodium;
function crypto_pwhash_argon2i_str(out_: pchar; passwd: pchar; passwdlen: qword; opslimit: qword; memlimit: Tsize_t): longint; cdecl; external libsodium;
function crypto_pwhash_argon2i_str_verify(str: pchar; passwd: pchar; passwdlen: qword): longint; cdecl; external libsodium;
function crypto_pwhash_argon2i_str_needs_rehash(str: pchar; opslimit: qword; memlimit: Tsize_t): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:11:44 ===


implementation

end.

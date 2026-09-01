{$IFDEF read_interface}


const
  crypto_pwhash_argon2id_ALG_ARGON2ID13_ = 2;

function crypto_pwhash_argon2id_alg_argon2id13: longint; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_BYTES_MIN_ = 16;

function crypto_pwhash_argon2id_bytes_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_BYTES_MAX_ = 4294967295;

function crypto_pwhash_argon2id_bytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_PASSWD_MIN_ = 0;

function crypto_pwhash_argon2id_passwd_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_PASSWD_MAX_ = 4294967295;

function crypto_pwhash_argon2id_passwd_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_SALTBYTES_ = 16;

function crypto_pwhash_argon2id_saltbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_STRBYTES_ = 128;

function crypto_pwhash_argon2id_strbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_STRPREFIX_ = '$argon2id$';

function crypto_pwhash_argon2id_strprefix: pchar; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_OPSLIMIT_MIN_ = 1;

function crypto_pwhash_argon2id_opslimit_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_OPSLIMIT_MAX_ = 4294967295;

function crypto_pwhash_argon2id_opslimit_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_MEMLIMIT_MIN_ = 8192;

function crypto_pwhash_argon2id_memlimit_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_MEMLIMIT_MAX_ = 4398046510080;

function crypto_pwhash_argon2id_memlimit_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_OPSLIMIT_INTERACTIVE_ = 2;

function crypto_pwhash_argon2id_opslimit_interactive: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_MEMLIMIT_INTERACTIVE_ = 67108864;

function crypto_pwhash_argon2id_memlimit_interactive: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_OPSLIMIT_MODERATE_ = 3;

function crypto_pwhash_argon2id_opslimit_moderate: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_MEMLIMIT_MODERATE_ = 268435456;

function crypto_pwhash_argon2id_memlimit_moderate: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_OPSLIMIT_SENSITIVE_ = 4;

function crypto_pwhash_argon2id_opslimit_sensitive: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_argon2id_MEMLIMIT_SENSITIVE_ = 1073741824;

function crypto_pwhash_argon2id_memlimit_sensitive: Tsize_t; cdecl; external libsodium;
function crypto_pwhash_argon2id(out_: pbyte; outlen: qword; passwd: pchar; passwdlen: qword; salt: pbyte;
  opslimit: qword; memlimit: Tsize_t; alg: longint): longint; cdecl; external libsodium;
function crypto_pwhash_argon2id_str(out_: pchar; passwd: pchar; passwdlen: qword; opslimit: qword; memlimit: Tsize_t): longint; cdecl; external libsodium;
function crypto_pwhash_argon2id_str_verify(str: pchar; passwd: pchar; passwdlen: qword): longint; cdecl; external libsodium;
function crypto_pwhash_argon2id_str_needs_rehash(str: pchar; opslimit: qword; memlimit: Tsize_t): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:19:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}

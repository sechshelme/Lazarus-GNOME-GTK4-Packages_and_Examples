{$IFDEF read_interface}


const
  crypto_pwhash_ALG_ARGON2I13_ = crypto_pwhash_argon2i_ALG_ARGON2I13_;

function crypto_pwhash_alg_argon2i13: longint; cdecl; external libsodium;

const
  crypto_pwhash_ALG_ARGON2ID13_ = crypto_pwhash_argon2id_ALG_ARGON2ID13_;

function crypto_pwhash_alg_argon2id13: longint; cdecl; external libsodium;

const
  crypto_pwhash_ALG_DEFAULT_ = crypto_pwhash_ALG_ARGON2ID13_;

function crypto_pwhash_alg_default: longint; cdecl; external libsodium;

const
  crypto_pwhash_BYTES_MIN_ = crypto_pwhash_argon2id_BYTES_MIN_;

function crypto_pwhash_bytes_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_BYTES_MAX_ = crypto_pwhash_argon2id_BYTES_MAX_;

function crypto_pwhash_bytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_PASSWD_MIN_ = crypto_pwhash_argon2id_PASSWD_MIN_;

function crypto_pwhash_passwd_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_PASSWD_MAX_ = crypto_pwhash_argon2id_PASSWD_MAX_;

function crypto_pwhash_passwd_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_SALTBYTES_ = crypto_pwhash_argon2id_SALTBYTES_;

function crypto_pwhash_saltbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_STRBYTES_ = crypto_pwhash_argon2id_STRBYTES_;

function crypto_pwhash_strbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_STRPREFIX_ = crypto_pwhash_argon2id_STRPREFIX_;

function crypto_pwhash_strprefix: pchar; cdecl; external libsodium;

const
  crypto_pwhash_OPSLIMIT_MIN_ = crypto_pwhash_argon2id_OPSLIMIT_MIN_;

function crypto_pwhash_opslimit_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_OPSLIMIT_MAX_ = crypto_pwhash_argon2id_OPSLIMIT_MAX_;

function crypto_pwhash_opslimit_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_MEMLIMIT_MIN_ = crypto_pwhash_argon2id_MEMLIMIT_MIN_;

function crypto_pwhash_memlimit_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_MEMLIMIT_MAX_ = crypto_pwhash_argon2id_MEMLIMIT_MAX_;

function crypto_pwhash_memlimit_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_OPSLIMIT_INTERACTIVE_ = crypto_pwhash_argon2id_OPSLIMIT_INTERACTIVE_;

function crypto_pwhash_opslimit_interactive: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_MEMLIMIT_INTERACTIVE_ = crypto_pwhash_argon2id_MEMLIMIT_INTERACTIVE_;

function crypto_pwhash_memlimit_interactive: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_OPSLIMIT_MODERATE_ = crypto_pwhash_argon2id_OPSLIMIT_MODERATE_;

function crypto_pwhash_opslimit_moderate: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_MEMLIMIT_MODERATE_ = crypto_pwhash_argon2id_MEMLIMIT_MODERATE_;

function crypto_pwhash_memlimit_moderate: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_OPSLIMIT_SENSITIVE_ = crypto_pwhash_argon2id_OPSLIMIT_SENSITIVE_;

function crypto_pwhash_opslimit_sensitive: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_MEMLIMIT_SENSITIVE_ = crypto_pwhash_argon2id_MEMLIMIT_SENSITIVE_;

function crypto_pwhash_memlimit_sensitive: Tsize_t; cdecl; external libsodium;

function crypto_pwhash(out_: pbyte; outlen: qword; passwd: pchar; passwdlen: qword; salt: pbyte;
  opslimit: qword; memlimit: Tsize_t; alg: longint): longint; cdecl; external libsodium;
function crypto_pwhash_str(out_: pchar; passwd: pchar; passwdlen: qword; opslimit: qword; memlimit: Tsize_t): longint; cdecl; external libsodium;
function crypto_pwhash_str_alg(out_: pchar; passwd: pchar; passwdlen: qword; opslimit: qword; memlimit: Tsize_t;
  alg: longint): longint; cdecl; external libsodium;
function crypto_pwhash_str_verify(str: pchar; passwd: pchar; passwdlen: qword): longint; cdecl; external libsodium;
function crypto_pwhash_str_needs_rehash(str: pchar; opslimit: qword; memlimit: Tsize_t): longint; cdecl; external libsodium;

const
  crypto_pwhash_PRIMITIVE_ = 'argon2i';

function crypto_pwhash_primitive: pchar; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:11:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

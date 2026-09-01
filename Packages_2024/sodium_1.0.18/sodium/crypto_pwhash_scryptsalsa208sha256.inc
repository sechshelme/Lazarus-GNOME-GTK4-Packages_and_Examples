{$IFDEF read_interface}


const
  crypto_pwhash_scryptsalsa208sha256_BYTES_MIN_ = 16;

function crypto_pwhash_scryptsalsa208sha256_bytes_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_BYTES_MAX_ = $1fffffffe0;

function crypto_pwhash_scryptsalsa208sha256_bytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_PASSWD_MIN_ = 0;

function crypto_pwhash_scryptsalsa208sha256_passwd_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_PASSWD_MAX_ = SODIUM_SIZE_MAX;

function crypto_pwhash_scryptsalsa208sha256_passwd_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_SALTBYTES_ = 32;

function crypto_pwhash_scryptsalsa208sha256_saltbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_STRBYTES_ = 102;

function crypto_pwhash_scryptsalsa208sha256_strbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_STRPREFIX_ = '$7$';

function crypto_pwhash_scryptsalsa208sha256_strprefix: pchar; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_OPSLIMIT_MIN_ = 32768;

function crypto_pwhash_scryptsalsa208sha256_opslimit_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_OPSLIMIT_MAX_ = 4294967295;

function crypto_pwhash_scryptsalsa208sha256_opslimit_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_MIN_ = 16777216;

function crypto_pwhash_scryptsalsa208sha256_memlimit_min: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_MAX_ = 68719476736;

function crypto_pwhash_scryptsalsa208sha256_memlimit_max: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_OPSLIMIT_INTERACTIVE_ = 524288;

function crypto_pwhash_scryptsalsa208sha256_opslimit_interactive: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_INTERACTIVE_ = 16777216;

function crypto_pwhash_scryptsalsa208sha256_memlimit_interactive: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_OPSLIMIT_SENSITIVE_ = 33554432;

function crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive: Tsize_t; cdecl; external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_SENSITIVE_ = 1073741824;

function crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive: Tsize_t; cdecl; external libsodium;
function crypto_pwhash_scryptsalsa208sha256(out_: pbyte; outlen: qword; passwd: pchar; passwdlen: qword; salt: pbyte;
  opslimit: qword; memlimit: Tsize_t): longint; cdecl; external libsodium;
function crypto_pwhash_scryptsalsa208sha256_str(out_: pchar; passwd: pchar; passwdlen: qword; opslimit: qword; memlimit: Tsize_t): longint; cdecl; external libsodium;
function crypto_pwhash_scryptsalsa208sha256_str_verify(str: pchar; passwd: pchar; passwdlen: qword): longint; cdecl; external libsodium;
function crypto_pwhash_scryptsalsa208sha256_ll(passwd: Puint8_t; passwdlen: Tsize_t; salt: Puint8_t; saltlen: Tsize_t; N: Tuint64_t;
  r: Tuint32_t; p: Tuint32_t; buf: Puint8_t; buflen: Tsize_t): longint; cdecl; external libsodium;
function crypto_pwhash_scryptsalsa208sha256_str_needs_rehash(str: pchar; opslimit: qword; memlimit: Tsize_t): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:19:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}

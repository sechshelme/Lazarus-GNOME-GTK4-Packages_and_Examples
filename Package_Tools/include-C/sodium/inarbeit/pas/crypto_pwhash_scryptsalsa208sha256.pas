unit crypto_pwhash_scryptsalsa208sha256;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  crypto_pwhash_scryptsalsa208sha256_BYTES_MIN = 16;  

function crypto_pwhash_scryptsalsa208sha256_bytes_min:Tsize_t;cdecl;external libsodium;

function crypto_pwhash_scryptsalsa208sha256_BYTES_MAX : longint; { return type might be wrong }

function crypto_pwhash_scryptsalsa208sha256_bytes_max:Tsize_t;cdecl;external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_PASSWD_MIN = 0;  

function crypto_pwhash_scryptsalsa208sha256_passwd_min:Tsize_t;cdecl;external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_PASSWD_MAX = SODIUM_SIZE_MAX;  

function crypto_pwhash_scryptsalsa208sha256_passwd_max:Tsize_t;cdecl;external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_SALTBYTES = 32;  

function crypto_pwhash_scryptsalsa208sha256_saltbytes:Tsize_t;cdecl;external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_STRBYTES = 102;  

function crypto_pwhash_scryptsalsa208sha256_strbytes:Tsize_t;cdecl;external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_STRPREFIX = '$7$';  

function crypto_pwhash_scryptsalsa208sha256_strprefix:Pchar;cdecl;external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_OPSLIMIT_MIN = 32768;  

function crypto_pwhash_scryptsalsa208sha256_opslimit_min:Tsize_t;cdecl;external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_OPSLIMIT_MAX = 4294967295;  

function crypto_pwhash_scryptsalsa208sha256_opslimit_max:Tsize_t;cdecl;external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_MIN = 16777216;  

function crypto_pwhash_scryptsalsa208sha256_memlimit_min:Tsize_t;cdecl;external libsodium;
{ was #define dname def_expr }
function crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_MAX : longint; { return type might be wrong }

function crypto_pwhash_scryptsalsa208sha256_memlimit_max:Tsize_t;cdecl;external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_OPSLIMIT_INTERACTIVE = 524288;  

function crypto_pwhash_scryptsalsa208sha256_opslimit_interactive:Tsize_t;cdecl;external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_INTERACTIVE = 16777216;  

function crypto_pwhash_scryptsalsa208sha256_memlimit_interactive:Tsize_t;cdecl;external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_OPSLIMIT_SENSITIVE = 33554432;  

function crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive:Tsize_t;cdecl;external libsodium;

const
  crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_SENSITIVE = 1073741824;  

function crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive:Tsize_t;cdecl;external libsodium;
function crypto_pwhash_scryptsalsa208sha256(out:Pbyte; outlen:qword; passwd:Pchar; passwdlen:qword; salt:Pbyte; 
           opslimit:qword; memlimit:Tsize_t):longint;cdecl;external libsodium;
function crypto_pwhash_scryptsalsa208sha256_str(out:array[0..(crypto_pwhash_scryptsalsa208sha256_STRBYTES)-1] of char; passwd:Pchar; passwdlen:qword; opslimit:qword; memlimit:Tsize_t):longint;cdecl;external libsodium;
function crypto_pwhash_scryptsalsa208sha256_str_verify(str:array[0..(crypto_pwhash_scryptsalsa208sha256_STRBYTES)-1] of char; passwd:Pchar; passwdlen:qword):longint;cdecl;external libsodium;
function crypto_pwhash_scryptsalsa208sha256_ll(passwd:Puint8_t; passwdlen:Tsize_t; salt:Puint8_t; saltlen:Tsize_t; N:Tuint64_t; 
           r:Tuint32_t; p:Tuint32_t; buf:Puint8_t; buflen:Tsize_t):longint;cdecl;external libsodium;
function crypto_pwhash_scryptsalsa208sha256_str_needs_rehash(str:array[0..(crypto_pwhash_scryptsalsa208sha256_STRBYTES)-1] of char; opslimit:qword; memlimit:Tsize_t):longint;cdecl;external libsodium;

// === Konventiert am: 31-8-26 17:19:16 ===


implementation


{ was #define dname def_expr }
function crypto_pwhash_scryptsalsa208sha256_BYTES_MAX : longint; { return type might be wrong }
  begin
    crypto_pwhash_scryptsalsa208sha256_BYTES_MAX:=SODIUM_MIN(SODIUM_SIZE_MAX,$1fffffffe0);
  end;

{ was #define dname def_expr }
function crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_MAX : longint; { return type might be wrong }
  begin
    crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_MAX:=SODIUM_MIN(SIZE_MAX,68719476736);
  end;


end.

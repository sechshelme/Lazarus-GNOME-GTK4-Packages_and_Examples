unit crypto_pwhash;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_pwhash_H}
{$define crypto_pwhash_H}
{$include <stddef.h>}
{$include "crypto_pwhash_argon2i.h"}
{$include "crypto_pwhash_argon2id.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_pwhash_ALG_ARGON2I13 = crypto_pwhash_argon2i_ALG_ARGON2I13;  

function crypto_pwhash_alg_argon2i13:longint;cdecl;external libsodium;
const
  crypto_pwhash_ALG_ARGON2ID13 = crypto_pwhash_argon2id_ALG_ARGON2ID13;  

function crypto_pwhash_alg_argon2id13:longint;cdecl;external libsodium;
const
  crypto_pwhash_ALG_DEFAULT = crypto_pwhash_ALG_ARGON2ID13;  

function crypto_pwhash_alg_default:longint;cdecl;external libsodium;
const
  crypto_pwhash_BYTES_MIN = crypto_pwhash_argon2id_BYTES_MIN;  

function crypto_pwhash_bytes_min:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_BYTES_MAX = crypto_pwhash_argon2id_BYTES_MAX;  

function crypto_pwhash_bytes_max:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_PASSWD_MIN = crypto_pwhash_argon2id_PASSWD_MIN;  

function crypto_pwhash_passwd_min:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_PASSWD_MAX = crypto_pwhash_argon2id_PASSWD_MAX;  

function crypto_pwhash_passwd_max:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_SALTBYTES = crypto_pwhash_argon2id_SALTBYTES;  

function crypto_pwhash_saltbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_STRBYTES = crypto_pwhash_argon2id_STRBYTES;  

function crypto_pwhash_strbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_STRPREFIX = crypto_pwhash_argon2id_STRPREFIX;  

function crypto_pwhash_strprefix:Pchar;cdecl;external libsodium;
const
  crypto_pwhash_OPSLIMIT_MIN = crypto_pwhash_argon2id_OPSLIMIT_MIN;  

function crypto_pwhash_opslimit_min:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_OPSLIMIT_MAX = crypto_pwhash_argon2id_OPSLIMIT_MAX;  

function crypto_pwhash_opslimit_max:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_MEMLIMIT_MIN = crypto_pwhash_argon2id_MEMLIMIT_MIN;  

function crypto_pwhash_memlimit_min:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_MEMLIMIT_MAX = crypto_pwhash_argon2id_MEMLIMIT_MAX;  

function crypto_pwhash_memlimit_max:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_OPSLIMIT_INTERACTIVE = crypto_pwhash_argon2id_OPSLIMIT_INTERACTIVE;  

function crypto_pwhash_opslimit_interactive:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_MEMLIMIT_INTERACTIVE = crypto_pwhash_argon2id_MEMLIMIT_INTERACTIVE;  

function crypto_pwhash_memlimit_interactive:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_OPSLIMIT_MODERATE = crypto_pwhash_argon2id_OPSLIMIT_MODERATE;  

function crypto_pwhash_opslimit_moderate:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_MEMLIMIT_MODERATE = crypto_pwhash_argon2id_MEMLIMIT_MODERATE;  

function crypto_pwhash_memlimit_moderate:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_OPSLIMIT_SENSITIVE = crypto_pwhash_argon2id_OPSLIMIT_SENSITIVE;  

function crypto_pwhash_opslimit_sensitive:Tsize_t;cdecl;external libsodium;
const
  crypto_pwhash_MEMLIMIT_SENSITIVE = crypto_pwhash_argon2id_MEMLIMIT_SENSITIVE;  

function crypto_pwhash_memlimit_sensitive:Tsize_t;cdecl;external libsodium;
{
 * With this function, do not forget to store all parameters, including the
 * algorithm identifier in order to produce deterministic output.
 * The crypto_pwhash_* definitions, including crypto_pwhash_ALG_DEFAULT,
 * may change.
  }
function crypto_pwhash(out:Pbyte; outlen:qword; passwd:Pchar; passwdlen:qword; salt:Pbyte; 
           opslimit:qword; memlimit:Tsize_t; alg:longint):longint;cdecl;external libsodium;
{
 * The output string already includes all the required parameters, including
 * the algorithm identifier. The string is all that has to be stored in
 * order to verify a password.
  }
function crypto_pwhash_str(out:array[0..(crypto_pwhash_STRBYTES)-1] of char; passwd:Pchar; passwdlen:qword; opslimit:qword; memlimit:Tsize_t):longint;cdecl;external libsodium;
function crypto_pwhash_str_alg(out:array[0..(crypto_pwhash_STRBYTES)-1] of char; passwd:Pchar; passwdlen:qword; opslimit:qword; memlimit:Tsize_t; 
           alg:longint):longint;cdecl;external libsodium;
function crypto_pwhash_str_verify(str:array[0..(crypto_pwhash_STRBYTES)-1] of char; passwd:Pchar; passwdlen:qword):longint;cdecl;external libsodium;
function crypto_pwhash_str_needs_rehash(str:array[0..(crypto_pwhash_STRBYTES)-1] of char; opslimit:qword; memlimit:Tsize_t):longint;cdecl;external libsodium;
const
  crypto_pwhash_PRIMITIVE = 'argon2i';  

function crypto_pwhash_primitive:Pchar;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:11:46 ===


implementation



end.

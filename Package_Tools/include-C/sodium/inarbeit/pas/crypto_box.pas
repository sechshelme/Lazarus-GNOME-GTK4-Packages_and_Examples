unit crypto_box;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_box_H}
{$define crypto_box_H}
{
 * THREAD SAFETY: crypto_box_keypair() is thread-safe,
 * provided that sodium_init() was called before.
 *
 * Other functions are always thread-safe.
  }
{$include <stddef.h>}
{$include "crypto_box_curve25519xsalsa20poly1305.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_box_SEEDBYTES = crypto_box_curve25519xsalsa20poly1305_SEEDBYTES;  

function crypto_box_seedbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_box_PUBLICKEYBYTES = crypto_box_curve25519xsalsa20poly1305_PUBLICKEYBYTES;  

function crypto_box_publickeybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_box_SECRETKEYBYTES = crypto_box_curve25519xsalsa20poly1305_SECRETKEYBYTES;  

function crypto_box_secretkeybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_box_NONCEBYTES = crypto_box_curve25519xsalsa20poly1305_NONCEBYTES;  

function crypto_box_noncebytes:Tsize_t;cdecl;external libsodium;
const
  crypto_box_MACBYTES = crypto_box_curve25519xsalsa20poly1305_MACBYTES;  

function crypto_box_macbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_box_MESSAGEBYTES_MAX = crypto_box_curve25519xsalsa20poly1305_MESSAGEBYTES_MAX;  

function crypto_box_messagebytes_max:Tsize_t;cdecl;external libsodium;
const
  crypto_box_PRIMITIVE = 'curve25519xsalsa20poly1305';  

function crypto_box_primitive:Pchar;cdecl;external libsodium;
function crypto_box_seed_keypair(pk:Pbyte; sk:Pbyte; seed:Pbyte):longint;cdecl;external libsodium;
function crypto_box_keypair(pk:Pbyte; sk:Pbyte):longint;cdecl;external libsodium;
function crypto_box_easy(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; pk:Pbyte; 
           sk:Pbyte):longint;cdecl;external libsodium;
function crypto_box_open_easy(m:Pbyte; c:Pbyte; clen:qword; n:Pbyte; pk:Pbyte; 
           sk:Pbyte):longint;cdecl;external libsodium;
function crypto_box_detached(c:Pbyte; mac:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; 
           pk:Pbyte; sk:Pbyte):longint;cdecl;external libsodium;
function crypto_box_open_detached(m:Pbyte; c:Pbyte; mac:Pbyte; clen:qword; n:Pbyte; 
           pk:Pbyte; sk:Pbyte):longint;cdecl;external libsodium;
{ -- Precomputation interface --  }
const
  crypto_box_BEFORENMBYTES = crypto_box_curve25519xsalsa20poly1305_BEFORENMBYTES;  

function crypto_box_beforenmbytes:Tsize_t;cdecl;external libsodium;
function crypto_box_beforenm(k:Pbyte; pk:Pbyte; sk:Pbyte):longint;cdecl;external libsodium;
function crypto_box_easy_afternm(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_box_open_easy_afternm(m:Pbyte; c:Pbyte; clen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_box_detached_afternm(c:Pbyte; mac:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; 
           k:Pbyte):longint;cdecl;external libsodium;
function crypto_box_open_detached_afternm(m:Pbyte; c:Pbyte; mac:Pbyte; clen:qword; n:Pbyte; 
           k:Pbyte):longint;cdecl;external libsodium;
{ -- Ephemeral SK interface --  }
const
  crypto_box_SEALBYTES = crypto_box_PUBLICKEYBYTES+crypto_box_MACBYTES;  

function crypto_box_sealbytes:Tsize_t;cdecl;external libsodium;
function crypto_box_seal(c:Pbyte; m:Pbyte; mlen:qword; pk:Pbyte):longint;cdecl;external libsodium;
function crypto_box_seal_open(m:Pbyte; c:Pbyte; clen:qword; pk:Pbyte; sk:Pbyte):longint;cdecl;external libsodium;
{ -- NaCl compatibility interface ; Requires padding --  }
const
  crypto_box_ZEROBYTES = crypto_box_curve25519xsalsa20poly1305_ZEROBYTES;  

function crypto_box_zerobytes:Tsize_t;cdecl;external libsodium;
const
  crypto_box_BOXZEROBYTES = crypto_box_curve25519xsalsa20poly1305_BOXZEROBYTES;  

function crypto_box_boxzerobytes:Tsize_t;cdecl;external libsodium;
function crypto_box(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; pk:Pbyte; 
           sk:Pbyte):longint;cdecl;external libsodium;
function crypto_box_open(m:Pbyte; c:Pbyte; clen:qword; n:Pbyte; pk:Pbyte; 
           sk:Pbyte):longint;cdecl;external libsodium;
function crypto_box_afternm(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_box_open_afternm(m:Pbyte; c:Pbyte; clen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 15:48:56 ===


implementation



end.

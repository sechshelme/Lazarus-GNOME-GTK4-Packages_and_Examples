unit crypto_box_curve25519xsalsa20poly1305;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_box_curve25519xsalsa20poly1305_H}
{$define crypto_box_curve25519xsalsa20poly1305_H}
{$include <stddef.h>}
{$include "crypto_stream_xsalsa20.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_box_curve25519xsalsa20poly1305_SEEDBYTES = 32;  

function crypto_box_curve25519xsalsa20poly1305_seedbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_box_curve25519xsalsa20poly1305_PUBLICKEYBYTES = 32;  

function crypto_box_curve25519xsalsa20poly1305_publickeybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_box_curve25519xsalsa20poly1305_SECRETKEYBYTES = 32;  

function crypto_box_curve25519xsalsa20poly1305_secretkeybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_box_curve25519xsalsa20poly1305_BEFORENMBYTES = 32;  

function crypto_box_curve25519xsalsa20poly1305_beforenmbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_box_curve25519xsalsa20poly1305_NONCEBYTES = 24;  

function crypto_box_curve25519xsalsa20poly1305_noncebytes:Tsize_t;cdecl;external libsodium;
const
  crypto_box_curve25519xsalsa20poly1305_MACBYTES = 16;  

function crypto_box_curve25519xsalsa20poly1305_macbytes:Tsize_t;cdecl;external libsodium;
{ Only for the libsodium API - The NaCl compatibility API would require BOXZEROBYTES extra bytes  }
const
  crypto_box_curve25519xsalsa20poly1305_MESSAGEBYTES_MAX = crypto_stream_xsalsa20_MESSAGEBYTES_MAX-crypto_box_curve25519xsalsa20poly1305_MACBYTES;  

function crypto_box_curve25519xsalsa20poly1305_messagebytes_max:Tsize_t;cdecl;external libsodium;
function crypto_box_curve25519xsalsa20poly1305_seed_keypair(pk:Pbyte; sk:Pbyte; seed:Pbyte):longint;cdecl;external libsodium;
function crypto_box_curve25519xsalsa20poly1305_keypair(pk:Pbyte; sk:Pbyte):longint;cdecl;external libsodium;
function crypto_box_curve25519xsalsa20poly1305_beforenm(k:Pbyte; pk:Pbyte; sk:Pbyte):longint;cdecl;external libsodium;
{ -- NaCl compatibility interface ; Requires padding --  }
const
  crypto_box_curve25519xsalsa20poly1305_BOXZEROBYTES = 16;  

function crypto_box_curve25519xsalsa20poly1305_boxzerobytes:Tsize_t;cdecl;external libsodium;
const
  crypto_box_curve25519xsalsa20poly1305_ZEROBYTES = crypto_box_curve25519xsalsa20poly1305_BOXZEROBYTES+crypto_box_curve25519xsalsa20poly1305_MACBYTES;  

function crypto_box_curve25519xsalsa20poly1305_zerobytes:Tsize_t;cdecl;external libsodium;
function crypto_box_curve25519xsalsa20poly1305(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; pk:Pbyte; 
           sk:Pbyte):longint;cdecl;external libsodium;
function crypto_box_curve25519xsalsa20poly1305_open(m:Pbyte; c:Pbyte; clen:qword; n:Pbyte; pk:Pbyte; 
           sk:Pbyte):longint;cdecl;external libsodium;
function crypto_box_curve25519xsalsa20poly1305_afternm(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_box_curve25519xsalsa20poly1305_open_afternm(m:Pbyte; c:Pbyte; clen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 16:26:24 ===


implementation



end.

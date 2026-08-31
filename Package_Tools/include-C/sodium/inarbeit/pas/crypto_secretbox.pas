unit crypto_secretbox;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_secretbox_H}
{$define crypto_secretbox_H}
{$include <stddef.h>}
{$include "crypto_secretbox_xsalsa20poly1305.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_secretbox_KEYBYTES = crypto_secretbox_xsalsa20poly1305_KEYBYTES;  

function crypto_secretbox_keybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_secretbox_NONCEBYTES = crypto_secretbox_xsalsa20poly1305_NONCEBYTES;  

function crypto_secretbox_noncebytes:Tsize_t;cdecl;external libsodium;
const
  crypto_secretbox_MACBYTES = crypto_secretbox_xsalsa20poly1305_MACBYTES;  

function crypto_secretbox_macbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_secretbox_PRIMITIVE = 'xsalsa20poly1305';  

function crypto_secretbox_primitive:Pchar;cdecl;external libsodium;
const
  crypto_secretbox_MESSAGEBYTES_MAX = crypto_secretbox_xsalsa20poly1305_MESSAGEBYTES_MAX;  

function crypto_secretbox_messagebytes_max:Tsize_t;cdecl;external libsodium;
function crypto_secretbox_easy(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_secretbox_open_easy(m:Pbyte; c:Pbyte; clen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_secretbox_detached(c:Pbyte; mac:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; 
           k:Pbyte):longint;cdecl;external libsodium;
function crypto_secretbox_open_detached(m:Pbyte; c:Pbyte; mac:Pbyte; clen:qword; n:Pbyte; 
           k:Pbyte):longint;cdecl;external libsodium;
procedure crypto_secretbox_keygen(k:array[0..(crypto_secretbox_KEYBYTES)-1] of byte);cdecl;external libsodium;
{ -- NaCl compatibility interface ; Requires padding --  }
const
  crypto_secretbox_ZEROBYTES = crypto_secretbox_xsalsa20poly1305_ZEROBYTES;  

function crypto_secretbox_zerobytes:Tsize_t;cdecl;external libsodium;
const
  crypto_secretbox_BOXZEROBYTES = crypto_secretbox_xsalsa20poly1305_BOXZEROBYTES;  

function crypto_secretbox_boxzerobytes:Tsize_t;cdecl;external libsodium;
function crypto_secretbox(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_secretbox_open(m:Pbyte; c:Pbyte; clen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:19:06 ===


implementation



end.

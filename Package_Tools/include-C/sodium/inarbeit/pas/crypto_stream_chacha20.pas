unit crypto_stream_chacha20;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_stream_chacha20_H}
{$define crypto_stream_chacha20_H}
{
 *  WARNING: This is just a stream cipher. It is NOT authenticated encryption.
 *  While it provides some protection against eavesdropping, it does NOT
 *  provide any security against active attacks.
 *  Unless you know what you're doing, what you are looking for is probably
 *  the crypto_box functions.
  }
{$include <stddef.h>}
{$include <stdint.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_stream_chacha20_KEYBYTES = 32;  

function crypto_stream_chacha20_keybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_stream_chacha20_NONCEBYTES = 8;  

function crypto_stream_chacha20_noncebytes:Tsize_t;cdecl;external libsodium;
const
  crypto_stream_chacha20_MESSAGEBYTES_MAX = SODIUM_SIZE_MAX;  

function crypto_stream_chacha20_messagebytes_max:Tsize_t;cdecl;external libsodium;
{ ChaCha20 with a 64-bit nonce and a 64-bit counter, as originally designed  }
function crypto_stream_chacha20(c:Pbyte; clen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_stream_chacha20_xor(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_stream_chacha20_xor_ic(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; ic:Tuint64_t; 
           k:Pbyte):longint;cdecl;external libsodium;
procedure crypto_stream_chacha20_keygen(k:array[0..(crypto_stream_chacha20_KEYBYTES)-1] of byte);cdecl;external libsodium;
{ ChaCha20 with a 96-bit nonce and a 32-bit counter (IETF)  }
const
  crypto_stream_chacha20_ietf_KEYBYTES = 32;  

function crypto_stream_chacha20_ietf_keybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_stream_chacha20_ietf_NONCEBYTES = 12;  

function crypto_stream_chacha20_ietf_noncebytes:Tsize_t;cdecl;external libsodium;
{ was #define dname def_expr }
function crypto_stream_chacha20_ietf_MESSAGEBYTES_MAX : longint; { return type might be wrong }

function crypto_stream_chacha20_ietf_messagebytes_max:Tsize_t;cdecl;external libsodium;
function crypto_stream_chacha20_ietf(c:Pbyte; clen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_stream_chacha20_ietf_xor(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_stream_chacha20_ietf_xor_ic(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; ic:Tuint32_t; 
           k:Pbyte):longint;cdecl;external libsodium;
procedure crypto_stream_chacha20_ietf_keygen(k:array[0..(crypto_stream_chacha20_ietf_KEYBYTES)-1] of byte);cdecl;external libsodium;
{ Aliases  }
const
  crypto_stream_chacha20_IETF_KEYBYTES = crypto_stream_chacha20_ietf_KEYBYTES;  
  crypto_stream_chacha20_IETF_NONCEBYTES = crypto_stream_chacha20_ietf_NONCEBYTES;  
  crypto_stream_chacha20_IETF_MESSAGEBYTES_MAX = crypto_stream_chacha20_ietf_MESSAGEBYTES_MAX;  
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:25:39 ===


implementation


{ was #define dname def_expr }
function crypto_stream_chacha20_ietf_MESSAGEBYTES_MAX : longint; { return type might be wrong }
  begin
    crypto_stream_chacha20_ietf_MESSAGEBYTES_MAX:=SODIUM_MIN(SODIUM_SIZE_MAX,64*(1 shl 32));
  end;


end.

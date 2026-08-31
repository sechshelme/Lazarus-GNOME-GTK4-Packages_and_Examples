unit crypto_aead_xchacha20poly1305;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_aead_xchacha20poly1305_H}
{$define crypto_aead_xchacha20poly1305_H}
{$include <stddef.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_aead_xchacha20poly1305_ietf_KEYBYTES = 32;  

function crypto_aead_xchacha20poly1305_ietf_keybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_aead_xchacha20poly1305_ietf_NSECBYTES = 0;  

function crypto_aead_xchacha20poly1305_ietf_nsecbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_aead_xchacha20poly1305_ietf_NPUBBYTES = 24;  

function crypto_aead_xchacha20poly1305_ietf_npubbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_aead_xchacha20poly1305_ietf_ABYTES = 16;  

function crypto_aead_xchacha20poly1305_ietf_abytes:Tsize_t;cdecl;external libsodium;
const
  crypto_aead_xchacha20poly1305_ietf_MESSAGEBYTES_MAX = SODIUM_SIZE_MAX-crypto_aead_xchacha20poly1305_ietf_ABYTES;  

function crypto_aead_xchacha20poly1305_ietf_messagebytes_max:Tsize_t;cdecl;external libsodium;
function crypto_aead_xchacha20poly1305_ietf_encrypt(c:Pbyte; clen_p:Pqword; m:Pbyte; mlen:qword; ad:Pbyte; 
           adlen:qword; nsec:Pbyte; npub:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_aead_xchacha20poly1305_ietf_decrypt(m:Pbyte; mlen_p:Pqword; nsec:Pbyte; c:Pbyte; clen:qword; 
           ad:Pbyte; adlen:qword; npub:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_aead_xchacha20poly1305_ietf_encrypt_detached(c:Pbyte; mac:Pbyte; maclen_p:Pqword; m:Pbyte; mlen:qword; 
           ad:Pbyte; adlen:qword; nsec:Pbyte; npub:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_aead_xchacha20poly1305_ietf_decrypt_detached(m:Pbyte; nsec:Pbyte; c:Pbyte; clen:qword; mac:Pbyte; 
           ad:Pbyte; adlen:qword; npub:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
procedure crypto_aead_xchacha20poly1305_ietf_keygen(k:array[0..(crypto_aead_xchacha20poly1305_ietf_KEYBYTES)-1] of byte);cdecl;external libsodium;
{ Aliases  }
const
  crypto_aead_xchacha20poly1305_IETF_KEYBYTES = crypto_aead_xchacha20poly1305_ietf_KEYBYTES;  
  crypto_aead_xchacha20poly1305_IETF_NSECBYTES = crypto_aead_xchacha20poly1305_ietf_NSECBYTES;  
  crypto_aead_xchacha20poly1305_IETF_NPUBBYTES = crypto_aead_xchacha20poly1305_ietf_NPUBBYTES;  
  crypto_aead_xchacha20poly1305_IETF_ABYTES = crypto_aead_xchacha20poly1305_ietf_ABYTES;  
  crypto_aead_xchacha20poly1305_IETF_MESSAGEBYTES_MAX = crypto_aead_xchacha20poly1305_ietf_MESSAGEBYTES_MAX;  
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 15:49:09 ===


implementation



end.

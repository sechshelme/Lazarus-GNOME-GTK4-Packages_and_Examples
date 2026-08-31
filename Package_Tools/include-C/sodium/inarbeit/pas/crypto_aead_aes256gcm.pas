unit crypto_aead_aes256gcm;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_aead_aes256gcm_H}
{$define crypto_aead_aes256gcm_H}
{
 * WARNING: Despite being the most popular AEAD construction due to its
 * use in TLS, safely using AES-GCM in a different context is tricky.
 *
 * No more than ~ 350 GB of input data should be encrypted with a given key.
 * This is for ~ 16 KB messages -- Actual figures vary according to
 * message sizes.
 *
 * In addition, nonces are short and repeated nonces would totally destroy
 * the security of this scheme.
 *
 * Nonces should thus come from atomic counters, which can be difficult to
 * set up in a distributed environment.
 *
 * Unless you absolutely need AES-GCM, use crypto_aead_xchacha20poly1305_ietf_*()
 * instead. It doesn't have any of these limitations.
 * Or, if you don't need to authenticate additional data, just stick to
 * crypto_secretbox().
  }
{$include <stddef.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

function crypto_aead_aes256gcm_is_available:longint;cdecl;external libsodium;
const
  crypto_aead_aes256gcm_KEYBYTES = 32;  

function crypto_aead_aes256gcm_keybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_aead_aes256gcm_NSECBYTES = 0;  

function crypto_aead_aes256gcm_nsecbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_aead_aes256gcm_NPUBBYTES = 12;  

function crypto_aead_aes256gcm_npubbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_aead_aes256gcm_ABYTES = 16;  

function crypto_aead_aes256gcm_abytes:Tsize_t;cdecl;external libsodium;
{ was #define dname def_expr }
function crypto_aead_aes256gcm_MESSAGEBYTES_MAX : longint; { return type might be wrong }

function crypto_aead_aes256gcm_messagebytes_max:Tsize_t;cdecl;external libsodium;
{CRYPTO_ALIGN(16) }type
  Pcrypto_aead_aes256gcm_state_ = ^Tcrypto_aead_aes256gcm_state_;
  Tcrypto_aead_aes256gcm_state_ = record
      opaque : array[0..511] of byte;
    end;
  Tcrypto_aead_aes256gcm_state = Tcrypto_aead_aes256gcm_state_;
  Pcrypto_aead_aes256gcm_state = ^Tcrypto_aead_aes256gcm_state;

function crypto_aead_aes256gcm_statebytes:Tsize_t;cdecl;external libsodium;
function crypto_aead_aes256gcm_encrypt(c:Pbyte; clen_p:Pqword; m:Pbyte; mlen:qword; ad:Pbyte; 
           adlen:qword; nsec:Pbyte; npub:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_aead_aes256gcm_decrypt(m:Pbyte; mlen_p:Pqword; nsec:Pbyte; c:Pbyte; clen:qword; 
           ad:Pbyte; adlen:qword; npub:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_aead_aes256gcm_encrypt_detached(c:Pbyte; mac:Pbyte; maclen_p:Pqword; m:Pbyte; mlen:qword; 
           ad:Pbyte; adlen:qword; nsec:Pbyte; npub:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_aead_aes256gcm_decrypt_detached(m:Pbyte; nsec:Pbyte; c:Pbyte; clen:qword; mac:Pbyte; 
           ad:Pbyte; adlen:qword; npub:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
{ -- Precomputation interface --  }
function crypto_aead_aes256gcm_beforenm(ctx_:Pcrypto_aead_aes256gcm_state; k:Pbyte):longint;cdecl;external libsodium;
function crypto_aead_aes256gcm_encrypt_afternm(c:Pbyte; clen_p:Pqword; m:Pbyte; mlen:qword; ad:Pbyte; 
           adlen:qword; nsec:Pbyte; npub:Pbyte; ctx_:Pcrypto_aead_aes256gcm_state):longint;cdecl;external libsodium;
function crypto_aead_aes256gcm_decrypt_afternm(m:Pbyte; mlen_p:Pqword; nsec:Pbyte; c:Pbyte; clen:qword; 
           ad:Pbyte; adlen:qword; npub:Pbyte; ctx_:Pcrypto_aead_aes256gcm_state):longint;cdecl;external libsodium;
function crypto_aead_aes256gcm_encrypt_detached_afternm(c:Pbyte; mac:Pbyte; maclen_p:Pqword; m:Pbyte; mlen:qword; 
           ad:Pbyte; adlen:qword; nsec:Pbyte; npub:Pbyte; ctx_:Pcrypto_aead_aes256gcm_state):longint;cdecl;external libsodium;
function crypto_aead_aes256gcm_decrypt_detached_afternm(m:Pbyte; nsec:Pbyte; c:Pbyte; clen:qword; mac:Pbyte; 
           ad:Pbyte; adlen:qword; npub:Pbyte; ctx_:Pcrypto_aead_aes256gcm_state):longint;cdecl;external libsodium;
procedure crypto_aead_aes256gcm_keygen(k:array[0..(crypto_aead_aes256gcm_KEYBYTES)-1] of byte);cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 15:49:14 ===


implementation


{ was #define dname def_expr }
function crypto_aead_aes256gcm_MESSAGEBYTES_MAX : longint; { return type might be wrong }
  begin
    crypto_aead_aes256gcm_MESSAGEBYTES_MAX:=SODIUM_MIN(SODIUM_SIZE_MAX-crypto_aead_aes256gcm_ABYTES,16*((1 shl 32)-2));
  end;


end.

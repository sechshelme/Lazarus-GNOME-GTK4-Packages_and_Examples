unit crypto_aead_aes256gcm;

interface

uses
  fp_sodium;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function crypto_aead_aes256gcm_is_available: longint; cdecl; external libsodium;

const
  crypto_aead_aes256gcm_KEYBYTES_ = 32;

function crypto_aead_aes256gcm_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_aead_aes256gcm_NSECBYTES_ = 0;

function crypto_aead_aes256gcm_nsecbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_aead_aes256gcm_NPUBBYTES_ = 12;

function crypto_aead_aes256gcm_npubbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_aead_aes256gcm_ABYTES_ = 16;

function crypto_aead_aes256gcm_messagebytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_aead_aes256gcm_MESSAGEBYTES_MAX_ = 68719476704;

type
  {CRYPTO_ALIGN(16) }
  Pcrypto_aead_aes256gcm_state = ^Tcrypto_aead_aes256gcm_state;
  Tcrypto_aead_aes256gcm_state = record
    opaque: array[0..511] of byte;
  end;

function crypto_aead_aes256gcm_statebytes: Tsize_t; cdecl; external libsodium;
function crypto_aead_aes256gcm_encrypt(c: pbyte; clen_p: Pqword; m: pbyte; mlen: qword; ad: pbyte;
  adlen: qword; nsec: pbyte; npub: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_aead_aes256gcm_decrypt(m: pbyte; mlen_p: Pqword; nsec: pbyte; c: pbyte; clen: qword;
  ad: pbyte; adlen: qword; npub: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_aead_aes256gcm_encrypt_detached(c: pbyte; mac: pbyte; maclen_p: Pqword; m: pbyte; mlen: qword;
  ad: pbyte; adlen: qword; nsec: pbyte; npub: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_aead_aes256gcm_decrypt_detached(m: pbyte; nsec: pbyte; c: pbyte; clen: qword; mac: pbyte;
  ad: pbyte; adlen: qword; npub: pbyte; k: pbyte): longint; cdecl; external libsodium;

function crypto_aead_aes256gcm_beforenm(ctx_: Pcrypto_aead_aes256gcm_state; k: pbyte): longint; cdecl; external libsodium;
function crypto_aead_aes256gcm_encrypt_afternm(c: pbyte; clen_p: Pqword; m: pbyte; mlen: qword; ad: pbyte;
  adlen: qword; nsec: pbyte; npub: pbyte; ctx_: Pcrypto_aead_aes256gcm_state): longint; cdecl; external libsodium;
function crypto_aead_aes256gcm_decrypt_afternm(m: pbyte; mlen_p: Pqword; nsec: pbyte; c: pbyte; clen: qword;
  ad: pbyte; adlen: qword; npub: pbyte; ctx_: Pcrypto_aead_aes256gcm_state): longint; cdecl; external libsodium;
function crypto_aead_aes256gcm_encrypt_detached_afternm(c: pbyte; mac: pbyte; maclen_p: Pqword; m: pbyte; mlen: qword;
  ad: pbyte; adlen: qword; nsec: pbyte; npub: pbyte; ctx_: Pcrypto_aead_aes256gcm_state): longint; cdecl; external libsodium;
function crypto_aead_aes256gcm_decrypt_detached_afternm(m: pbyte; nsec: pbyte; c: pbyte; clen: qword; mac: pbyte;
  ad: pbyte; adlen: qword; npub: pbyte; ctx_: Pcrypto_aead_aes256gcm_state): longint; cdecl; external libsodium;
procedure crypto_aead_aes256gcm_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 15:49:14 ===


implementation


end.

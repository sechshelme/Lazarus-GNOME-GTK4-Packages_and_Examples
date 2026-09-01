{$IFDEF read_interface}



const
  crypto_aead_xchacha20poly1305_ietf_KEYBYTES_ = 32;

function crypto_aead_xchacha20poly1305_ietf_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_aead_xchacha20poly1305_ietf_NSECBYTES_ = 0;

function crypto_aead_xchacha20poly1305_ietf_nsecbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_aead_xchacha20poly1305_ietf_NPUBBYTES_ = 24;

function crypto_aead_xchacha20poly1305_ietf_npubbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_aead_xchacha20poly1305_ietf_ABYTES_ = 16;

function crypto_aead_xchacha20poly1305_ietf_abytes: Tsize_t; cdecl; external libsodium;

const
  crypto_aead_xchacha20poly1305_ietf_MESSAGEBYTES_MAX_ = SODIUM_SIZE_MAX - crypto_aead_xchacha20poly1305_ietf_ABYTES_;

function crypto_aead_xchacha20poly1305_ietf_messagebytes_max: Tsize_t; cdecl; external libsodium;
function crypto_aead_xchacha20poly1305_ietf_encrypt(c: pbyte; clen_p: Pqword; m: pbyte; mlen: qword; ad: pbyte;
  adlen: qword; nsec: pbyte; npub: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_aead_xchacha20poly1305_ietf_decrypt(m: pbyte; mlen_p: Pqword; nsec: pbyte; c: pbyte; clen: qword;
  ad: pbyte; adlen: qword; npub: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_aead_xchacha20poly1305_ietf_encrypt_detached(c: pbyte; mac: pbyte; maclen_p: Pqword; m: pbyte; mlen: qword;
  ad: pbyte; adlen: qword; nsec: pbyte; npub: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_aead_xchacha20poly1305_ietf_decrypt_detached(m: pbyte; nsec: pbyte; c: pbyte; clen: qword; mac: pbyte;
  ad: pbyte; adlen: qword; npub: pbyte; k: pbyte): longint; cdecl; external libsodium;
procedure crypto_aead_xchacha20poly1305_ietf_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 15:49:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

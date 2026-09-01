{$IFDEF read_interface}


const
  crypto_secretstream_xchacha20poly1305_ABYTES_ = 1 + crypto_aead_xchacha20poly1305_ietf_ABYTES_;

function crypto_secretstream_xchacha20poly1305_abytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretstream_xchacha20poly1305_HEADERBYTES_ = crypto_aead_xchacha20poly1305_ietf_NPUBBYTES_;

function crypto_secretstream_xchacha20poly1305_headerbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretstream_xchacha20poly1305_KEYBYTES_ = crypto_aead_xchacha20poly1305_ietf_KEYBYTES_;

function crypto_secretstream_xchacha20poly1305_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretstream_xchacha20poly1305_MESSAGEBYTES_MAX_ = $3fffffff80;

function crypto_secretstream_xchacha20poly1305_messagebytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_secretstream_xchacha20poly1305_TAG_MESSAGE_ = $00;

function crypto_secretstream_xchacha20poly1305_tag_message: byte; cdecl; external libsodium;

const
  crypto_secretstream_xchacha20poly1305_TAG_PUSH_ = $01;

function crypto_secretstream_xchacha20poly1305_tag_push: byte; cdecl; external libsodium;

const
  crypto_secretstream_xchacha20poly1305_TAG_REKEY_ = $02;

function crypto_secretstream_xchacha20poly1305_tag_rekey: byte; cdecl; external libsodium;

const
  crypto_secretstream_xchacha20poly1305_TAG_FINAL_ = crypto_secretstream_xchacha20poly1305_TAG_PUSH_ or crypto_secretstream_xchacha20poly1305_TAG_REKEY_;

function crypto_secretstream_xchacha20poly1305_tag_final: byte; cdecl; external libsodium;

type
  Pcrypto_secretstream_xchacha20poly1305_state = ^Tcrypto_secretstream_xchacha20poly1305_state;
  Tcrypto_secretstream_xchacha20poly1305_state = record
    k: array[0..(crypto_stream_chacha20_ietf_KEYBYTES_) - 1] of byte;
    nonce: array[0..(crypto_stream_chacha20_ietf_NONCEBYTES_) - 1] of byte;
    _pad: array[0..7] of byte;
  end;

function crypto_secretstream_xchacha20poly1305_statebytes: Tsize_t; cdecl; external libsodium;
procedure crypto_secretstream_xchacha20poly1305_keygen(k: pbyte); cdecl; external libsodium;
function crypto_secretstream_xchacha20poly1305_init_push(state: Pcrypto_secretstream_xchacha20poly1305_state; header: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_secretstream_xchacha20poly1305_push(state: Pcrypto_secretstream_xchacha20poly1305_state; c: pbyte; clen_p: Pqword; m: pbyte; mlen: qword;
  ad: pbyte; adlen: qword; tag: byte): longint; cdecl; external libsodium;
function crypto_secretstream_xchacha20poly1305_init_pull(state: Pcrypto_secretstream_xchacha20poly1305_state; header: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_secretstream_xchacha20poly1305_pull(state: Pcrypto_secretstream_xchacha20poly1305_state; m: pbyte; mlen_p: Pqword; tag_p: pbyte; c: pbyte;
  clen: qword; ad: pbyte; adlen: qword): longint; cdecl; external libsodium;
procedure crypto_secretstream_xchacha20poly1305_rekey(state: Pcrypto_secretstream_xchacha20poly1305_state); cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:18:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}

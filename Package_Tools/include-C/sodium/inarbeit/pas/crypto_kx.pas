unit crypto_kx;

interface

uses
  fp_sodium;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  crypto_kx_PUBLICKEYBYTES_ = 32;

function crypto_kx_publickeybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_kx_SECRETKEYBYTES_ = 32;

function crypto_kx_secretkeybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_kx_SEEDBYTES_ = 32;

function crypto_kx_seedbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_kx_SESSIONKEYBYTES_ = 32;

function crypto_kx_sessionkeybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_kx_PRIMITIVE_ = 'x25519blake2b';

function crypto_kx_primitive: pchar; cdecl; external libsodium;
function crypto_kx_seed_keypair(pk: pbyte; sk: pbyte; seed: pbyte): longint; cdecl; external libsodium;
function crypto_kx_keypair(pk: pbyte; sk: pbyte): longint; cdecl; external libsodium;
function crypto_kx_client_session_keys(rx: pbyte; tx: pbyte; client_pk: pbyte; client_sk: pbyte; server_pk: pbyte): longint; cdecl; external libsodium;
function crypto_kx_server_session_keys(rx: pbyte; tx: pbyte; server_pk: pbyte; server_sk: pbyte; client_pk: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:11:52 ===


implementation



end.

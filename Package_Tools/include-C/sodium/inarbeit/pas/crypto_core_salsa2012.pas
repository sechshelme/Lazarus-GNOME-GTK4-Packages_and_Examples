unit crypto_core_salsa2012;

interface

uses
  fp_sodium;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  crypto_core_salsa2012_OUTPUTBYTES_ = 64;

function crypto_core_salsa2012_outputbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_salsa2012_INPUTBYTES_ = 16;

function crypto_core_salsa2012_inputbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_salsa2012_KEYBYTES_ = 32;

function crypto_core_salsa2012_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_salsa2012_CONSTBYTES_ = 16;

function crypto_core_salsa2012_constbytes: Tsize_t; cdecl; external libsodium;
function crypto_core_salsa2012(out_: pbyte; in_: pbyte; k: pbyte; c: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 16:26:04 ===


implementation



end.

unit crypto_core_hsalsa20;

interface

uses
  fp_sodium;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  crypto_core_hsalsa20_OUTPUTBYTES_ = 32;

function crypto_core_hsalsa20_outputbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_hsalsa20_INPUTBYTES_ = 16;

function crypto_core_hsalsa20_inputbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_hsalsa20_KEYBYTES_ = 32;

function crypto_core_hsalsa20_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_hsalsa20_CONSTBYTES_ = 16;

function crypto_core_hsalsa20_constbytes: Tsize_t; cdecl; external libsodium;
function crypto_core_hsalsa20(out_: pbyte; in_: pbyte; k: pbyte; c: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 16:26:16 ===


implementation



end.

{$IFDEF read_interface}


const
  crypto_core_salsa20_OUTPUTBYTES_ = 64;

function crypto_core_salsa20_outputbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_salsa20_INPUTBYTES_ = 16;

function crypto_core_salsa20_inputbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_salsa20_KEYBYTES_ = 32;

function crypto_core_salsa20_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_salsa20_CONSTBYTES_ = 16;

function crypto_core_salsa20_constbytes: Tsize_t; cdecl; external libsodium;
function crypto_core_salsa20(out_: pbyte; in_: pbyte; k: pbyte; c: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 16:26:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

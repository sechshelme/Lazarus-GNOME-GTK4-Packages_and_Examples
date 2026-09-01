{$IFDEF read_interface}


const
  crypto_core_salsa208_OUTPUTBYTES_ = 64;

function crypto_core_salsa208_outputbytes: Tsize_t; cdecl; external libsodium; deprecated;

const
  crypto_core_salsa208_INPUTBYTES_ = 16;

function crypto_core_salsa208_inputbytes: Tsize_t; cdecl; external libsodium; deprecated;

const
  crypto_core_salsa208_KEYBYTES_ = 32;

function crypto_core_salsa208_keybytes: Tsize_t; cdecl; external libsodium; deprecated;

const
  crypto_core_salsa208_CONSTBYTES_ = 16;

function crypto_core_salsa208_constbytes: Tsize_t; cdecl; external libsodium; deprecated;
function crypto_core_salsa208(out_: pbyte; in_: pbyte; k: pbyte; c: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 16:26:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

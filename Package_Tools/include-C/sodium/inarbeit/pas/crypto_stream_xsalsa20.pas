unit crypto_stream_xsalsa20;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



const
  crypto_stream_xsalsa20_KEYBYTES_ = 32;  

function crypto_stream_xsalsa20_keybytes:Tsize_t;cdecl;external libsodium;

const
  crypto_stream_xsalsa20_NONCEBYTES_ = 24;  

function crypto_stream_xsalsa20_noncebytes:Tsize_t;cdecl;external libsodium;

const
  crypto_stream_xsalsa20_MESSAGEBYTES_MAX_ = SODIUM_SIZE_MAX;  

function crypto_stream_xsalsa20_messagebytes_max:Tsize_t;cdecl;external libsodium;
function crypto_stream_xsalsa20(c:Pbyte; clen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_stream_xsalsa20_xor(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external libsodium;
function crypto_stream_xsalsa20_xor_ic(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; ic:Tuint64_t; 
           k:Pbyte):longint;cdecl;external libsodium;
procedure crypto_stream_xsalsa20_keygen(k:Pbyte);cdecl;external libsodium;

// === Konventiert am: 31-8-26 17:29:05 ===


implementation



end.

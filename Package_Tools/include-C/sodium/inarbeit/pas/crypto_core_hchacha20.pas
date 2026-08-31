unit crypto_core_hchacha20;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_core_hchacha20_H}
{$define crypto_core_hchacha20_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_core_hchacha20_OUTPUTBYTES = 32;  

function crypto_core_hchacha20_outputbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_hchacha20_INPUTBYTES = 16;  

function crypto_core_hchacha20_inputbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_hchacha20_KEYBYTES = 32;  

function crypto_core_hchacha20_keybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_hchacha20_CONSTBYTES = 16;  

function crypto_core_hchacha20_constbytes:Tsize_t;cdecl;external libsodium;
function crypto_core_hchacha20(out:Pbyte; in:Pbyte; k:Pbyte; c:Pbyte):longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 16:26:19 ===


implementation



end.

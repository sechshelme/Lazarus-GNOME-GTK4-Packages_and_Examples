unit crypto_core_salsa2012;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_core_salsa2012_H}
{$define crypto_core_salsa2012_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_core_salsa2012_OUTPUTBYTES = 64;  

function crypto_core_salsa2012_outputbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_salsa2012_INPUTBYTES = 16;  

function crypto_core_salsa2012_inputbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_salsa2012_KEYBYTES = 32;  

function crypto_core_salsa2012_keybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_salsa2012_CONSTBYTES = 16;  

function crypto_core_salsa2012_constbytes:Tsize_t;cdecl;external libsodium;
function crypto_core_salsa2012(out:Pbyte; in:Pbyte; k:Pbyte; c:Pbyte):longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 16:26:04 ===


implementation



end.

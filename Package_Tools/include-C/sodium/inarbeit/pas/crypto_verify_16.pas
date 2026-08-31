unit crypto_verify_16;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_verify_16_H}
{$define crypto_verify_16_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_verify_16_BYTES = 16;  

function crypto_verify_16_bytes:Tsize_t;cdecl;external libsodium;
function crypto_verify_16(x:Pbyte; y:Pbyte):longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:29:03 ===


implementation



end.

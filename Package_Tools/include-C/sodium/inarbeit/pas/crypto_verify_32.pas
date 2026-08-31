unit crypto_verify_32;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_verify_32_H}
{$define crypto_verify_32_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_verify_32_BYTES = 32;  

function crypto_verify_32_bytes:Tsize_t;cdecl;external libsodium;
function crypto_verify_32(x:Pbyte; y:Pbyte):longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:29:00 ===


implementation



end.

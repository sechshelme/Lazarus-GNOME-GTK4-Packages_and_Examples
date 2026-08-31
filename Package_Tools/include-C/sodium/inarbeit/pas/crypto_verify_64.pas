unit crypto_verify_64;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_verify_64_H}
{$define crypto_verify_64_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_verify_64_BYTES = 64;  

function crypto_verify_64_bytes:Tsize_t;cdecl;external libsodium;
function crypto_verify_64(x:Pbyte; y:Pbyte):longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:28:58 ===


implementation



end.

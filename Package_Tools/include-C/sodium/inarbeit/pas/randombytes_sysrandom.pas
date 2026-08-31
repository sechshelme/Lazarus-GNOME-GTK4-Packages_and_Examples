unit randombytes_sysrandom;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef randombytes_sysrandom_H}
{$define randombytes_sysrandom_H}
{$include "export.h"}
{$include "randombytes.h"}
{ C++ extern C conditionnal removed }
  var
    randombytes_sysrandom_implementation : Trandombytes_implementation;cvar;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:33:57 ===


implementation



end.

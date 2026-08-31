unit randombytes_internal_random;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef randombytes_internal_random_H}
{$define randombytes_internal_random_H}
{$include "export.h"}
{$include "randombytes.h"}
{ C++ extern C conditionnal removed }
  var
    randombytes_internal_implementation : Trandombytes_implementation;cvar;external libsodium;
{ Backwards compatibility with libsodium < 1.0.18  }

const
  randombytes_salsa20_implementation = randombytes_internal_implementation;  
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:34:00 ===


implementation



end.

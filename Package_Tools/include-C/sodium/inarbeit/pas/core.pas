unit core;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef sodium_core_H}
{$define sodium_core_H}
{$include "export.h"}
{ C++ extern C conditionnal removed }

function sodium_init:longint;cdecl;external libsodium;
{ ----  }
function sodium_set_misuse_handler(handler:procedure ):longint;cdecl;external libsodium;
procedure sodium_misuse;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 15:49:17 ===


implementation



end.

unit version;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef sodium_version_H}
{$define sodium_version_H}
{$include "export.h"}

const
  SODIUM_VERSION_STRING = '1.0.18';  
  SODIUM_LIBRARY_VERSION_MAJOR = 10;  
  SODIUM_LIBRARY_VERSION_MINOR = 3;  
{ C++ extern C conditionnal removed }

function sodium_version_string:Pchar;cdecl;external libsodium;
function sodium_library_version_major:longint;cdecl;external libsodium;
function sodium_library_version_minor:longint;cdecl;external libsodium;
function sodium_library_minimal:longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:33:51 ===


implementation



end.

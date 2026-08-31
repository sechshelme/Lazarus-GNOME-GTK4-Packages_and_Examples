unit runtime;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef sodium_runtime_H}
{$define sodium_runtime_H}
{$include "export.h"}
{ C++ extern C conditionnal removed }

function sodium_runtime_has_neon:longint;cdecl;external libsodium;
function sodium_runtime_has_sse2:longint;cdecl;external libsodium;
function sodium_runtime_has_sse3:longint;cdecl;external libsodium;
function sodium_runtime_has_ssse3:longint;cdecl;external libsodium;
function sodium_runtime_has_sse41:longint;cdecl;external libsodium;
function sodium_runtime_has_avx:longint;cdecl;external libsodium;
function sodium_runtime_has_avx2:longint;cdecl;external libsodium;
function sodium_runtime_has_avx512f:longint;cdecl;external libsodium;
function sodium_runtime_has_pclmul:longint;cdecl;external libsodium;
function sodium_runtime_has_aesni:longint;cdecl;external libsodium;
function sodium_runtime_has_rdrand:longint;cdecl;external libsodium;
{ -------------------------------------------------------------------------  }
function _sodium_runtime_get_cpu_features:longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:33:55 ===


implementation



end.

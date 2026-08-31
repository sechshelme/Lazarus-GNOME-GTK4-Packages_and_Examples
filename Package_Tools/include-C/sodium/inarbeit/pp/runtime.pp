
unit runtime;
interface

{
  Automatically converted by H2Pas 1.0.0 from runtime.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    runtime.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef sodium_runtime_H}
{$define sodium_runtime_H}
{$include "export.h"}
{ C++ extern C conditionnal removed }

function sodium_runtime_has_neon:longint;cdecl;external;
function sodium_runtime_has_sse2:longint;cdecl;external;
function sodium_runtime_has_sse3:longint;cdecl;external;
function sodium_runtime_has_ssse3:longint;cdecl;external;
function sodium_runtime_has_sse41:longint;cdecl;external;
function sodium_runtime_has_avx:longint;cdecl;external;
function sodium_runtime_has_avx2:longint;cdecl;external;
function sodium_runtime_has_avx512f:longint;cdecl;external;
function sodium_runtime_has_pclmul:longint;cdecl;external;
function sodium_runtime_has_aesni:longint;cdecl;external;
function sodium_runtime_has_rdrand:longint;cdecl;external;
{ -------------------------------------------------------------------------  }
function _sodium_runtime_get_cpu_features:longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.

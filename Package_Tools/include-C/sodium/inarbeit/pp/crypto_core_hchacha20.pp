
unit crypto_core_hchacha20;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_core_hchacha20.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_core_hchacha20.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pbyte  = ^byte;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_core_hchacha20_H}
{$define crypto_core_hchacha20_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_core_hchacha20_OUTPUTBYTES = 32;  

function crypto_core_hchacha20_outputbytes:Tsize_t;cdecl;external;
const
  crypto_core_hchacha20_INPUTBYTES = 16;  

function crypto_core_hchacha20_inputbytes:Tsize_t;cdecl;external;
const
  crypto_core_hchacha20_KEYBYTES = 32;  

function crypto_core_hchacha20_keybytes:Tsize_t;cdecl;external;
const
  crypto_core_hchacha20_CONSTBYTES = 16;  

function crypto_core_hchacha20_constbytes:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_core_hchacha20(out:Pbyte; in:Pbyte; k:Pbyte; c:Pbyte):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.

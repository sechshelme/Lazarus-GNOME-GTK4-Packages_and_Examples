
unit addon;
interface

{
  Automatically converted by H2Pas 1.0.0 from addon.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    addon.h
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
Pchar  = ^char;
Pdouble  = ^double;
PFILE  = ^FILE;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



function mgl_gauss_rnd:Tdouble;cdecl;external;
procedure mgl_fft_freq(freq:Pdouble; nn:longint);cdecl;external;
procedure mgl_strcls(str:Pchar);cdecl;external;
(* Const before type ignored *)
function mgl_strpos(str:Pchar; fnd:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mgl_chrpos(str:Pchar; fnd:char):longint;cdecl;external;
function mgl_fgetstr(fp:PFILE):Pchar;cdecl;external;
(* Const before type ignored *)
procedure mgl_fgetpar(fp:PFILE; str:Pchar; args:array of const);cdecl;external;
procedure mgl_fgetpar(fp:PFILE; str:Pchar);cdecl;external;
function mgl_istrue(ch:char):longint;cdecl;external;
(* Const before type ignored *)
procedure mgl_test(str:Pchar; args:array of const);cdecl;external;
procedure mgl_test(str:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_info(str:Pchar; args:array of const);cdecl;external;
procedure mgl_info(str:Pchar);cdecl;external;
(* Const before type ignored *)
function mgl_next_data(fname:Pchar; p:longint):PFILE;cdecl;external;
procedure mgl_fgetstr_mgl(enable:longint);cdecl;external;

implementation


end.

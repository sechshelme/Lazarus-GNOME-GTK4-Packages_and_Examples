
unit mat2x3;
interface

{
  Automatically converted by H2Pas 1.0.0 from mat2x3.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mat2x3.h
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
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
  }
{$ifndef cglmc_mat2x3_h}
{$define cglmc_mat2x3_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_mat2x3_copy(mat:Tmat2x3; dest:Tmat2x3);cdecl;external;
procedure glmc_mat2x3_zero(mat:Tmat2x3);cdecl;external;
procedure glmc_mat2x3_make(src:Psingle; dest:Tmat2x3);cdecl;external;
procedure glmc_mat2x3_mul(m1:Tmat2x3; m2:Tmat3x2; dest:Tmat2);cdecl;external;
procedure glmc_mat2x3_mulv(m:Tmat2x3; v:Tvec3; dest:Tvec2);cdecl;external;
procedure glmc_mat2x3_transpose(m:Tmat2x3; dest:Tmat3x2);cdecl;external;
procedure glmc_mat2x3_scale(m:Tmat2x3; s:single);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_mat2x3_h  }

implementation


end.


unit mat2x4;
interface

{
  Automatically converted by H2Pas 1.0.0 from mat2x4.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mat2x4.h
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
{$ifndef cglmc_mat2x4_h}
{$define cglmc_mat2x4_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_mat2x4_copy(mat:Tmat2x4; dest:Tmat2x4);cdecl;external;
procedure glmc_mat2x4_zero(mat:Tmat2x4);cdecl;external;
procedure glmc_mat2x4_make(src:Psingle; dest:Tmat2x4);cdecl;external;
procedure glmc_mat2x4_mul(m1:Tmat2x4; m2:Tmat4x2; dest:Tmat2);cdecl;external;
procedure glmc_mat2x4_mulv(m:Tmat2x4; v:Tvec4; dest:Tvec2);cdecl;external;
procedure glmc_mat2x4_transpose(m:Tmat2x4; dest:Tmat4x2);cdecl;external;
procedure glmc_mat2x4_scale(m:Tmat2x4; s:single);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_mat2x4_h  }

implementation


end.


unit mat4x2;
interface

{
  Automatically converted by H2Pas 1.0.0 from mat4x2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mat4x2.h
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
{$ifndef cglmc_mat4x2_h}
{$define cglmc_mat4x2_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_mat4x2_copy(mat:Tmat4x2; dest:Tmat4x2);cdecl;external;
procedure glmc_mat4x2_zero(mat:Tmat4x2);cdecl;external;
procedure glmc_mat4x2_make(src:Psingle; dest:Tmat4x2);cdecl;external;
procedure glmc_mat4x2_mul(m1:Tmat4x2; m2:Tmat2x4; dest:Tmat4);cdecl;external;
procedure glmc_mat4x2_mulv(m:Tmat4x2; v:Tvec2; dest:Tvec4);cdecl;external;
procedure glmc_mat4x2_transpose(m:Tmat4x2; dest:Tmat2x4);cdecl;external;
procedure glmc_mat4x2_scale(m:Tmat4x2; s:single);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_mat4x2_h  }

implementation


end.

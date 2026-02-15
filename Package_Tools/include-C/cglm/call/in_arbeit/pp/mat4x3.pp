
unit mat4x3;
interface

{
  Automatically converted by H2Pas 1.0.0 from mat4x3.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mat4x3.h
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
{$ifndef cglmc_mat4x3_h}
{$define cglmc_mat4x3_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_mat4x3_copy(mat:Tmat4x3; dest:Tmat4x3);cdecl;external;
procedure glmc_mat4x3_zero(mat:Tmat4x3);cdecl;external;
procedure glmc_mat4x3_make(src:Psingle; dest:Tmat4x3);cdecl;external;
procedure glmc_mat4x3_mul(m1:Tmat4x3; m2:Tmat3x4; dest:Tmat4);cdecl;external;
procedure glmc_mat4x3_mulv(m:Tmat4x3; v:Tvec3; dest:Tvec4);cdecl;external;
procedure glmc_mat4x3_transpose(m:Tmat4x3; dest:Tmat3x4);cdecl;external;
procedure glmc_mat4x3_scale(m:Tmat4x3; s:single);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_mat4x3_h  }

implementation


end.

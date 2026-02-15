
unit mat2;
interface

{
  Automatically converted by H2Pas 1.0.0 from mat2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mat2.h
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
Pmat2  = ^mat2;
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
{$ifndef cglmc_mat2_h}
{$define cglmc_mat2_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_mat2_copy(mat:Tmat2; dest:Tmat2);cdecl;external;
procedure glmc_mat2_identity(mat:Tmat2);cdecl;external;
procedure glmc_mat2_identity_array(mat:Pmat2; count:Tsize_t);cdecl;external;
procedure glmc_mat2_zero(mat:Tmat2);cdecl;external;
procedure glmc_mat2_mul(m1:Tmat2; m2:Tmat2; dest:Tmat2);cdecl;external;
procedure glmc_mat2_transpose_to(m:Tmat2; dest:Tmat2);cdecl;external;
procedure glmc_mat2_transpose(m:Tmat2);cdecl;external;
procedure glmc_mat2_mulv(m:Tmat2; v:Tvec2; dest:Tvec2);cdecl;external;
function glmc_mat2_trace(m:Tmat2):single;cdecl;external;
procedure glmc_mat2_scale(m:Tmat2; s:single);cdecl;external;
function glmc_mat2_det(mat:Tmat2):single;cdecl;external;
procedure glmc_mat2_inv(mat:Tmat2; dest:Tmat2);cdecl;external;
procedure glmc_mat2_swap_col(mat:Tmat2; col1:longint; col2:longint);cdecl;external;
procedure glmc_mat2_swap_row(mat:Tmat2; row1:longint; row2:longint);cdecl;external;
function glmc_mat2_rmc(r:Tvec2; m:Tmat2; c:Tvec2):single;cdecl;external;
procedure glmc_mat2_make(src:Psingle; dest:Tmat2);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_mat2_h  }

implementation


end.

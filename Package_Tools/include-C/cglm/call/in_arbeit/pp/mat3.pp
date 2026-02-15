
unit mat3;
interface

{
  Automatically converted by H2Pas 1.0.0 from mat3.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mat3.h
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
Pmat3  = ^mat3;
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
{$ifndef cglmc_mat3_h}
{$define cglmc_mat3_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}
{ DEPRECATED! use _copy, _ucopy versions  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function glmc_mat3_dup(mat,dest : longint) : longint;

procedure glmc_mat3_copy(mat:Tmat3; dest:Tmat3);cdecl;external;
procedure glmc_mat3_identity(mat:Tmat3);cdecl;external;
procedure glmc_mat3_zero(mat:Tmat3);cdecl;external;
procedure glmc_mat3_identity_array(mat:Pmat3; count:Tsize_t);cdecl;external;
procedure glmc_mat3_mul(m1:Tmat3; m2:Tmat3; dest:Tmat3);cdecl;external;
procedure glmc_mat3_transpose_to(m:Tmat3; dest:Tmat3);cdecl;external;
procedure glmc_mat3_transpose(m:Tmat3);cdecl;external;
procedure glmc_mat3_mulv(m:Tmat3; v:Tvec3; dest:Tvec3);cdecl;external;
function glmc_mat3_trace(m:Tmat3):single;cdecl;external;
procedure glmc_mat3_quat(m:Tmat3; dest:Tversor);cdecl;external;
procedure glmc_mat3_scale(m:Tmat3; s:single);cdecl;external;
function glmc_mat3_det(mat:Tmat3):single;cdecl;external;
procedure glmc_mat3_inv(mat:Tmat3; dest:Tmat3);cdecl;external;
procedure glmc_mat3_swap_col(mat:Tmat3; col1:longint; col2:longint);cdecl;external;
procedure glmc_mat3_swap_row(mat:Tmat3; row1:longint; row2:longint);cdecl;external;
function glmc_mat3_rmc(r:Tvec3; m:Tmat3; c:Tvec3):single;cdecl;external;
procedure glmc_mat3_make(src:Psingle; dest:Tmat3);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_mat3_h  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_mat3_dup(mat,dest : longint) : longint;
begin
  glmc_mat3_dup:=glmc_mat3_copy(mat,dest);
end;


end.

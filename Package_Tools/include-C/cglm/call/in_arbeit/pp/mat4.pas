unit mat4;

interface

uses
  fp_cglm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
  }
{$ifndef cglmc_mat_h}
{$define cglmc_mat_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}
{ DEPRECATED! use _copy, _ucopy versions  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function glmc_mat4_udup(mat,dest : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_mat4_dup(mat,dest : longint) : longint;

procedure glmc_mat4_ucopy(mat:Tmat4; dest:Tmat4);cdecl;external libcglm;
procedure glmc_mat4_copy(mat:Tmat4; dest:Tmat4);cdecl;external libcglm;
procedure glmc_mat4_identity(mat:Tmat4);cdecl;external libcglm;
procedure glmc_mat4_identity_array(mat:Pmat4; count:Tsize_t);cdecl;external libcglm;
procedure glmc_mat4_zero(mat:Tmat4);cdecl;external libcglm;
procedure glmc_mat4_pick3(mat:Tmat4; dest:Tmat3);cdecl;external libcglm;
procedure glmc_mat4_pick3t(mat:Tmat4; dest:Tmat3);cdecl;external libcglm;
procedure glmc_mat4_ins3(mat:Tmat3; dest:Tmat4);cdecl;external libcglm;
procedure glmc_mat4_mul(m1:Tmat4; m2:Tmat4; dest:Tmat4);cdecl;external libcglm;
procedure glmc_mat4_mulN(matrices:PPmat4; len:Tuint32_t; dest:Tmat4);cdecl;external libcglm;
procedure glmc_mat4_mulv(m:Tmat4; v:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_mat4_mulv3(m:Tmat4; v:Tvec3; last:single; dest:Tvec3);cdecl;external libcglm;
function glmc_mat4_trace(m:Tmat4):single;cdecl;external libcglm;
function glmc_mat4_trace3(m:Tmat4):single;cdecl;external libcglm;
procedure glmc_mat4_quat(m:Tmat4; dest:Tversor);cdecl;external libcglm;
procedure glmc_mat4_transpose_to(m:Tmat4; dest:Tmat4);cdecl;external libcglm;
procedure glmc_mat4_transpose(m:Tmat4);cdecl;external libcglm;
procedure glmc_mat4_scale_p(m:Tmat4; s:single);cdecl;external libcglm;
procedure glmc_mat4_scale(m:Tmat4; s:single);cdecl;external libcglm;
function glmc_mat4_det(mat:Tmat4):single;cdecl;external libcglm;
procedure glmc_mat4_inv(mat:Tmat4; dest:Tmat4);cdecl;external libcglm;
procedure glmc_mat4_inv_precise(mat:Tmat4; dest:Tmat4);cdecl;external libcglm;
procedure glmc_mat4_inv_fast(mat:Tmat4; dest:Tmat4);cdecl;external libcglm;
procedure glmc_mat4_swap_col(mat:Tmat4; col1:longint; col2:longint);cdecl;external libcglm;
procedure glmc_mat4_swap_row(mat:Tmat4; row1:longint; row2:longint);cdecl;external libcglm;
function glmc_mat4_rmc(r:Tvec4; m:Tmat4; c:Tvec4):single;cdecl;external libcglm;
procedure glmc_mat4_make(src:Psingle; dest:Tmat4);cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_mat_h  }

// === Konventiert am: 16-2-26 19:44:21 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_mat4_udup(mat,dest : longint) : longint;
begin
  glmc_mat4_udup:=glmc_mat4_ucopy(mat,dest);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_mat4_dup(mat,dest : longint) : longint;
begin
  glmc_mat4_dup:=glmc_mat4_copy(mat,dest);
end;


end.

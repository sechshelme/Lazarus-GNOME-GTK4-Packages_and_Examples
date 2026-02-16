unit mat4x3;

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
{$ifndef cglmc_mat4x3_h}
{$define cglmc_mat4x3_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_mat4x3_copy(mat:Tmat4x3; dest:Tmat4x3);cdecl;external libcglm;
procedure glmc_mat4x3_zero(mat:Tmat4x3);cdecl;external libcglm;
procedure glmc_mat4x3_make(src:Psingle; dest:Tmat4x3);cdecl;external libcglm;
procedure glmc_mat4x3_mul(m1:Tmat4x3; m2:Tmat3x4; dest:Tmat4);cdecl;external libcglm;
procedure glmc_mat4x3_mulv(m:Tmat4x3; v:Tvec3; dest:Tvec4);cdecl;external libcglm;
procedure glmc_mat4x3_transpose(m:Tmat4x3; dest:Tmat3x4);cdecl;external libcglm;
procedure glmc_mat4x3_scale(m:Tmat4x3; s:single);cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_mat4x3_h  }

// === Konventiert am: 16-2-26 19:44:13 ===


implementation



end.

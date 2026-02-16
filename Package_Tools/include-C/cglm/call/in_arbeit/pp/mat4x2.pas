unit mat4x2;

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
{$ifndef cglmc_mat4x2_h}
{$define cglmc_mat4x2_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_mat4x2_copy(mat:Tmat4x2; dest:Tmat4x2);cdecl;external libcglm;
procedure glmc_mat4x2_zero(mat:Tmat4x2);cdecl;external libcglm;
procedure glmc_mat4x2_make(src:Psingle; dest:Tmat4x2);cdecl;external libcglm;
procedure glmc_mat4x2_mul(m1:Tmat4x2; m2:Tmat2x4; dest:Tmat4);cdecl;external libcglm;
procedure glmc_mat4x2_mulv(m:Tmat4x2; v:Tvec2; dest:Tvec4);cdecl;external libcglm;
procedure glmc_mat4x2_transpose(m:Tmat4x2; dest:Tmat2x4);cdecl;external libcglm;
procedure glmc_mat4x2_scale(m:Tmat4x2; s:single);cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_mat4x2_h  }

// === Konventiert am: 16-2-26 19:44:18 ===


implementation



end.

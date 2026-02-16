unit mat3x4;

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
{$ifndef cglmc_mat3x4_h}
{$define cglmc_mat3x4_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_mat3x4_copy(mat:Tmat3x4; dest:Tmat3x4);cdecl;external libcglm;
procedure glmc_mat3x4_zero(mat:Tmat3x4);cdecl;external libcglm;
procedure glmc_mat3x4_make(src:Psingle; dest:Tmat3x4);cdecl;external libcglm;
procedure glmc_mat3x4_mul(m1:Tmat3x4; m2:Tmat4x3; dest:Tmat3);cdecl;external libcglm;
procedure glmc_mat3x4_mulv(m:Tmat3x4; v:Tvec4; dest:Tvec3);cdecl;external libcglm;
procedure glmc_mat3x4_transpose(m:Tmat3x4; dest:Tmat4x3);cdecl;external libcglm;
procedure glmc_mat3x4_scale(m:Tmat3x4; s:single);cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_mat3x4_h  }

// === Konventiert am: 16-2-26 19:44:24 ===


implementation



end.

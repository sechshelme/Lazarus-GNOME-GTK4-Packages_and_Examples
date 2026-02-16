unit mat2x3;

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
{$ifndef cglmc_mat2x3_h}
{$define cglmc_mat2x3_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_mat2x3_copy(mat:Tmat2x3; dest:Tmat2x3);cdecl;external libcglm;
procedure glmc_mat2x3_zero(mat:Tmat2x3);cdecl;external libcglm;
procedure glmc_mat2x3_make(src:Psingle; dest:Tmat2x3);cdecl;external libcglm;
procedure glmc_mat2x3_mul(m1:Tmat2x3; m2:Tmat3x2; dest:Tmat2);cdecl;external libcglm;
procedure glmc_mat2x3_mulv(m:Tmat2x3; v:Tvec3; dest:Tvec2);cdecl;external libcglm;
procedure glmc_mat2x3_transpose(m:Tmat2x3; dest:Tmat3x2);cdecl;external libcglm;
procedure glmc_mat2x3_scale(m:Tmat2x3; s:single);cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_mat2x3_h  }

// === Konventiert am: 16-2-26 19:44:36 ===


implementation



end.

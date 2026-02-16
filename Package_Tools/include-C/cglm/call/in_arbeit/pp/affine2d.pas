unit affine2d;

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
{$ifndef cglmc_affine2d_h}
{$define cglmc_affine2d_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_translate2d_make(m:Tmat3; v:Tvec2);cdecl;external libcglm;
procedure glmc_translate2d_to(m:Tmat3; v:Tvec2; dest:Tmat3);cdecl;external libcglm;
procedure glmc_translate2d(m:Tmat3; v:Tvec2);cdecl;external libcglm;
procedure glmc_translate2d_x(m:Tmat3; to:single);cdecl;external libcglm;
procedure glmc_translate2d_y(m:Tmat3; to:single);cdecl;external libcglm;
procedure glmc_scale2d_to(m:Tmat3; v:Tvec2; dest:Tmat3);cdecl;external libcglm;
procedure glmc_scale2d_make(m:Tmat3; v:Tvec2);cdecl;external libcglm;
procedure glmc_scale2d(m:Tmat3; v:Tvec2);cdecl;external libcglm;
procedure glmc_scale2d_uni(m:Tmat3; s:single);cdecl;external libcglm;
procedure glmc_rotate2d_make(m:Tmat3; angle:single);cdecl;external libcglm;
procedure glmc_rotate2d(m:Tmat3; angle:single);cdecl;external libcglm;
procedure glmc_rotate2d_to(m:Tmat3; angle:single; dest:Tmat3);cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_affine2d_h  }

// === Konventiert am: 16-2-26 19:45:14 ===


implementation



end.

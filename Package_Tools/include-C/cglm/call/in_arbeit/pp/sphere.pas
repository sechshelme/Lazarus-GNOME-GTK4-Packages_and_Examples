unit sphere;

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
{$ifndef cglmc_sphere_h}
{$define cglmc_sphere_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

function glmc_sphere_radii(s:Tvec4):single;cdecl;external libcglm;
procedure glmc_sphere_transform(s:Tvec4; m:Tmat4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_sphere_merge(s1:Tvec4; s2:Tvec4; dest:Tvec4);cdecl;external libcglm;
function glmc_sphere_sphere(s1:Tvec4; s2:Tvec4):Tbool;cdecl;external libcglm;
function glmc_sphere_point(s:Tvec4; point:Tvec3):Tbool;cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_sphere_h  }

// === Konventiert am: 16-2-26 19:43:50 ===


implementation



end.

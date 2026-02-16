unit ray;

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
{$ifndef cglmc_ray_h}
{$define cglmc_ray_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

function glmc_ray_triangle(origin:Tvec3; direction:Tvec3; v0:Tvec3; v1:Tvec3; v2:Tvec3; 
           d:Psingle):Tbool;cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_ray_h  }

// === Konventiert am: 16-2-26 19:43:53 ===


implementation



end.

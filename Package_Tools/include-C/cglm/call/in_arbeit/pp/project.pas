unit project;

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
{$ifndef cglmc_project_h}
{$define cglmc_project_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_unprojecti(pos:Tvec3; invMat:Tmat4; vp:Tvec4; dest:Tvec3);cdecl;external libcglm;
procedure glmc_unproject(pos:Tvec3; m:Tmat4; vp:Tvec4; dest:Tvec3);cdecl;external libcglm;
procedure glmc_project(pos:Tvec3; m:Tmat4; vp:Tvec4; dest:Tvec3);cdecl;external libcglm;
function glmc_project_z(pos:Tvec3; m:Tmat4):single;cdecl;external libcglm;
procedure glmc_pickmatrix(center:Tvec2; size:Tvec2; vp:Tvec4; dest:Tmat4);cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_project_h  }

// === Konventiert am: 16-2-26 19:44:07 ===


implementation



end.

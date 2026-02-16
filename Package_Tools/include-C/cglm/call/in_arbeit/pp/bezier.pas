unit bezier;

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
{$ifndef cglmc_bezier_h}
{$define cglmc_bezier_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

function glmc_bezier(s:single; p0:single; c0:single; c1:single; p1:single):single;cdecl;external libcglm;
function glmc_hermite(s:single; p0:single; t0:single; t1:single; p1:single):single;cdecl;external libcglm;
function glmc_decasteljau(prm:single; p0:single; c0:single; c1:single; p1:single):single;cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_bezier_h  }

// === Konventiert am: 16-2-26 19:45:12 ===


implementation



end.

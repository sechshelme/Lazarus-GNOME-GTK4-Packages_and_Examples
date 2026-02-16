unit curve;

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
{$ifndef cglmc_curve_h}
{$define cglmc_curve_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

function glmc_smc(s:single; m:Tmat4; c:Tvec4):single;cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_curve_h  }

// === Konventiert am: 16-2-26 19:45:02 ===


implementation



end.

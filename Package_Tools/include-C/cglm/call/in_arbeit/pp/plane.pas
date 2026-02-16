unit plane;

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
{$ifndef cglmc_plane_h}
{$define cglmc_plane_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_plane_normalize(plane:Tvec4);cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_plane_h  }

// === Konventiert am: 16-2-26 19:44:11 ===


implementation



end.

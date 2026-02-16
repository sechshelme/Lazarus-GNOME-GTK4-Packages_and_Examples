unit euler;

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
{$ifndef cglmc_euler_h}
{$define cglmc_euler_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_euler_angles(m:Tmat4; dest:Tvec3);cdecl;external libcglm;
procedure glmc_euler(angles:Tvec3; dest:Tmat4);cdecl;external libcglm;
procedure glmc_euler_xyz(angles:Tvec3; dest:Tmat4);cdecl;external libcglm;
procedure glmc_euler_zyx(angles:Tvec3; dest:Tmat4);cdecl;external libcglm;
procedure glmc_euler_zxy(angles:Tvec3; dest:Tmat4);cdecl;external libcglm;
procedure glmc_euler_xzy(angles:Tvec3; dest:Tmat4);cdecl;external libcglm;
procedure glmc_euler_yzx(angles:Tvec3; dest:Tmat4);cdecl;external libcglm;
procedure glmc_euler_yxz(angles:Tvec3; dest:Tmat4);cdecl;external libcglm;
procedure glmc_euler_by_order(angles:Tvec3; axis:Tglm_euler_seq; dest:Tmat4);cdecl;external libcglm;
procedure glmc_euler_xyz_quat(angles:Tvec3; dest:Tversor);cdecl;external libcglm;
procedure glmc_euler_xzy_quat(angles:Tvec3; dest:Tversor);cdecl;external libcglm;
procedure glmc_euler_yxz_quat(angles:Tvec3; dest:Tversor);cdecl;external libcglm;
procedure glmc_euler_yzx_quat(angles:Tvec3; dest:Tversor);cdecl;external libcglm;
procedure glmc_euler_zxy_quat(angles:Tvec3; dest:Tversor);cdecl;external libcglm;
procedure glmc_euler_zyx_quat(angles:Tvec3; dest:Tversor);cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_euler_h  }

// === Konventiert am: 16-2-26 19:44:55 ===


implementation



end.

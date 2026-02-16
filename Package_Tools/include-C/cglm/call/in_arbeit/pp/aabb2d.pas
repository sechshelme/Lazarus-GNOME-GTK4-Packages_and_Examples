unit aabb2d;

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
{$ifndef cglmc_aabb2d_h}
{$define cglmc_aabb2d_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_aabb2d_copy(aabb:array[0..1] of Tvec2; dest:array[0..1] of Tvec2);cdecl;external libcglm;
procedure glmc_aabb2d_transform(aabb:array[0..1] of Tvec2; m:Tmat3; dest:array[0..1] of Tvec2);cdecl;external libcglm;
procedure glmc_aabb2d_merge(aabb1:array[0..1] of Tvec2; aabb2:array[0..1] of Tvec2; dest:array[0..1] of Tvec2);cdecl;external libcglm;
procedure glmc_aabb2d_crop(aabb:array[0..1] of Tvec2; cropAabb:array[0..1] of Tvec2; dest:array[0..1] of Tvec2);cdecl;external libcglm;
procedure glmc_aabb2d_crop_until(aabb:array[0..1] of Tvec2; cropAabb:array[0..1] of Tvec2; clampAabb:array[0..1] of Tvec2; dest:array[0..1] of Tvec2);cdecl;external libcglm;
procedure glmc_aabb2d_invalidate(aabb:array[0..1] of Tvec2);cdecl;external libcglm;
function glmc_aabb2d_isvalid(aabb:array[0..1] of Tvec2):Tbool;cdecl;external libcglm;
function glmc_aabb2d_size(aabb:array[0..1] of Tvec2):single;cdecl;external libcglm;
function glmc_aabb2d_radius(aabb:array[0..1] of Tvec2):single;cdecl;external libcglm;
procedure glmc_aabb2d_center(aabb:array[0..1] of Tvec2; dest:Tvec2);cdecl;external libcglm;
function glmc_aabb2d_aabb(aabb:array[0..1] of Tvec2; other:array[0..1] of Tvec2):Tbool;cdecl;external libcglm;
function glmc_aabb2d_point(aabb:array[0..1] of Tvec2; point:Tvec2):Tbool;cdecl;external libcglm;
function glmc_aabb2d_contains(aabb:array[0..1] of Tvec2; other:array[0..1] of Tvec2):Tbool;cdecl;external libcglm;
function glmc_aabb2d_circle(aabb:array[0..1] of Tvec2; s:Tvec3):Tbool;cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_aabb2d_h  }

// === Konventiert am: 16-2-26 19:45:21 ===


implementation



end.

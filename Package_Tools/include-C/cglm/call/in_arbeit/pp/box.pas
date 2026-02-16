unit box;

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
{$ifndef cglmc_box_h}
{$define cglmc_box_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_aabb_transform(box:array[0..1] of Tvec3; m:Tmat4; dest:array[0..1] of Tvec3);cdecl;external libcglm;
procedure glmc_aabb_merge(box1:array[0..1] of Tvec3; box2:array[0..1] of Tvec3; dest:array[0..1] of Tvec3);cdecl;external libcglm;
procedure glmc_aabb_crop(box:array[0..1] of Tvec3; cropBox:array[0..1] of Tvec3; dest:array[0..1] of Tvec3);cdecl;external libcglm;
procedure glmc_aabb_crop_until(box:array[0..1] of Tvec3; cropBox:array[0..1] of Tvec3; clampBox:array[0..1] of Tvec3; dest:array[0..1] of Tvec3);cdecl;external libcglm;
function glmc_aabb_frustum(box:array[0..1] of Tvec3; planes:array[0..5] of Tvec4):Tbool;cdecl;external libcglm;
procedure glmc_aabb_invalidate(box:array[0..1] of Tvec3);cdecl;external libcglm;
function glmc_aabb_isvalid(box:array[0..1] of Tvec3):Tbool;cdecl;external libcglm;
function glmc_aabb_size(box:array[0..1] of Tvec3):single;cdecl;external libcglm;
function glmc_aabb_radius(box:array[0..1] of Tvec3):single;cdecl;external libcglm;
procedure glmc_aabb_center(box:array[0..1] of Tvec3; dest:Tvec3);cdecl;external libcglm;
function glmc_aabb_aabb(box:array[0..1] of Tvec3; other:array[0..1] of Tvec3):Tbool;cdecl;external libcglm;
function glmc_aabb_point(box:array[0..1] of Tvec3; point:Tvec3):Tbool;cdecl;external libcglm;
function glmc_aabb_contains(box:array[0..1] of Tvec3; other:array[0..1] of Tvec3):Tbool;cdecl;external libcglm;
function glmc_aabb_sphere(box:array[0..1] of Tvec3; s:Tvec4):Tbool;cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_box_h  }

// === Konventiert am: 16-2-26 19:45:08 ===


implementation



end.

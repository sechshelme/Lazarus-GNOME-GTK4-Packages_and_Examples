unit vec4;

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
{$ifndef cglmc_vec4_h}
{$define cglmc_vec4_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}
{ DEPRECATED! use _copy, _ucopy versions  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function glmc_vec4_dup3(v,dest : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_vec4_dup(v,dest : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_vec4_flipsign(v : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_vec4_flipsign_to(v,dest : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_vec4_inv(v : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_vec4_inv_to(v,dest : longint) : longint;

procedure glmc_vec4(v3:Tvec3; last:single; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_zero(v:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_one(v:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_copy3(v:Tvec4; dest:Tvec3);cdecl;external libcglm;
procedure glmc_vec4_copy(v:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_ucopy(v:Tvec4; dest:Tvec4);cdecl;external libcglm;
function glmc_vec4_dot(a:Tvec4; b:Tvec4):single;cdecl;external libcglm;
function glmc_vec4_norm(v:Tvec4):single;cdecl;external libcglm;
function glmc_vec4_norm2(v:Tvec4):single;cdecl;external libcglm;
function glmc_vec4_norm_one(v:Tvec4):single;cdecl;external libcglm;
function glmc_vec4_norm_inf(v:Tvec4):single;cdecl;external libcglm;
procedure glmc_vec4_normalize_to(v:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_normalize(v:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_add(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_adds(v:Tvec4; s:single; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_sub(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_subs(v:Tvec4; s:single; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_mul(a:Tvec4; b:Tvec4; d:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_scale(v:Tvec4; s:single; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_scale_as(v:Tvec4; s:single; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_div(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_divs(v:Tvec4; s:single; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_addadd(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_subadd(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_muladd(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_muladds(a:Tvec4; s:single; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_maxadd(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_minadd(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_subsub(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_addsub(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_mulsub(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_mulsubs(a:Tvec4; s:single; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_maxsub(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_minsub(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_negate(v:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_negate_to(v:Tvec4; dest:Tvec4);cdecl;external libcglm;
function glmc_vec4_distance(a:Tvec4; b:Tvec4):single;cdecl;external libcglm;
function glmc_vec4_distance2(a:Tvec4; b:Tvec4):single;cdecl;external libcglm;
procedure glmc_vec4_maxv(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_minv(a:Tvec4; b:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_clamp(v:Tvec4; minVal:single; maxVal:single);cdecl;external libcglm;
procedure glmc_vec4_lerp(from:Tvec4; to:Tvec4; t:single; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_lerpc(from:Tvec4; to:Tvec4; t:single; dest:Tvec4);cdecl;external libcglm;
{ xxxxxxxxxxx }
procedure glmc_vec4_mix(from:Tvec4; to:Tvec4; t:single; dest:Tvec4);cdecl;external libcglm;
{  glmc_vec4_lerp(from, to, t, dest); }
{ }
{ xxxxxxxxxxx }
procedure glmc_vec4_mixc(from:Tvec4; to:Tvec4; t:single; dest:Tvec4);cdecl;external libcglm;
{  glmc_vec4_lerpc(from, to, t, dest); }
{ }
procedure glmc_vec4_step_uni(edge:single; x:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_step(edge:Tvec4; x:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_smoothstep_uni(edge0:single; edge1:single; x:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_smoothstep(edge0:Tvec4; edge1:Tvec4; x:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_smoothinterp(from:Tvec4; to:Tvec4; t:single; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_smoothinterpc(from:Tvec4; to:Tvec4; t:single; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_cubic(s:single; dest:Tvec4);cdecl;external libcglm;
{ ext  }
procedure glmc_vec4_mulv(a:Tvec4; b:Tvec4; d:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_broadcast(val:single; d:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_fill(v:Tvec4; val:single);cdecl;external libcglm;
function glmc_vec4_eq(v:Tvec4; val:single):Tbool;cdecl;external libcglm;
function glmc_vec4_eq_eps(v:Tvec4; val:single):Tbool;cdecl;external libcglm;
function glmc_vec4_eq_all(v:Tvec4):Tbool;cdecl;external libcglm;
function glmc_vec4_eqv(a:Tvec4; b:Tvec4):Tbool;cdecl;external libcglm;
function glmc_vec4_eqv_eps(a:Tvec4; b:Tvec4):Tbool;cdecl;external libcglm;
function glmc_vec4_max(v:Tvec4):single;cdecl;external libcglm;
function glmc_vec4_min(v:Tvec4):single;cdecl;external libcglm;
function glmc_vec4_isnan(v:Tvec4):Tbool;cdecl;external libcglm;
function glmc_vec4_isinf(v:Tvec4):Tbool;cdecl;external libcglm;
function glmc_vec4_isvalid(v:Tvec4):Tbool;cdecl;external libcglm;
procedure glmc_vec4_sign(v:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_abs(v:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_fract(v:Tvec4; dest:Tvec4);cdecl;external libcglm;
function glmc_vec4_hadd(v:Tvec4):single;cdecl;external libcglm;
procedure glmc_vec4_sqrt(v:Tvec4; dest:Tvec4);cdecl;external libcglm;
procedure glmc_vec4_make(src:Psingle; dest:Tvec4);cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_vec4_h  }

// === Konventiert am: 16-2-26 19:43:41 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_vec4_dup3(v,dest : longint) : longint;
begin
  glmc_vec4_dup3:=glmc_vec4_copy3(v,dest);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_vec4_dup(v,dest : longint) : longint;
begin
  glmc_vec4_dup:=glmc_vec4_copy(v,dest);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_vec4_flipsign(v : longint) : longint;
begin
  glmc_vec4_flipsign:=glmc_vec4_negate(v);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_vec4_flipsign_to(v,dest : longint) : longint;
begin
  glmc_vec4_flipsign_to:=glmc_vec4_negate_to(v,dest);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_vec4_inv(v : longint) : longint;
begin
  glmc_vec4_inv:=glmc_vec4_negate(v);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glmc_vec4_inv_to(v,dest : longint) : longint;
begin
  glmc_vec4_inv_to:=glmc_vec4_negate_to(v,dest);
end;


end.

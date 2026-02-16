unit ortho_lh_no;

interface

uses
  fp_cglm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure glmc_ortho_lh_no(left: single; right: single; bottom: single; top: single; nearZ: single; farZ: single; dest: Tmat4); cdecl; external libcglm;
procedure glmc_ortho_aabb_lh_no(box: Pvec3; dest: Tmat4); cdecl; external libcglm;
procedure glmc_ortho_aabb_p_lh_no(box: Pvec3; padding: single; dest: Tmat4); cdecl; external libcglm;
procedure glmc_ortho_aabb_pz_lh_no(box: Pvec3; padding: single; dest: Tmat4); cdecl; external libcglm;
procedure glmc_ortho_default_lh_no(aspect: single; dest: Tmat4); cdecl; external libcglm;
procedure glmc_ortho_default_s_lh_no(aspect: single; size: single; dest: Tmat4); cdecl; external libcglm;

// === Konventiert am: 16-2-26 19:46:59 ===


implementation



end.

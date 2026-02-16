unit project_no;

interface

uses
  fp_cglm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure glmc_unprojecti_no(pos: Tvec3; invMat: Tmat4; vp: Tvec4; dest: Tvec3); cdecl; external libcglm;
procedure glmc_project_no(pos: Tvec3; m: Tmat4; vp: Tvec4; dest: Tvec3); cdecl; external libcglm;
function glmc_project_z_no(pos: Tvec3; m: Tmat4): single; cdecl; external libcglm;

// === Konventiert am: 16-2-26 19:46:29 ===


implementation



end.

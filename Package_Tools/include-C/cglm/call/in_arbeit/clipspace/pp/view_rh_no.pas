unit view_rh_no;

interface

uses
  fp_cglm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure glmc_lookat_rh_no(eye: Tvec3; center: Tvec3; up: Tvec3; dest: Tmat4); cdecl; external libcglm;
procedure glmc_look_rh_no(eye: Tvec3; dir: Tvec3; up: Tvec3; dest: Tmat4); cdecl; external libcglm;
procedure glmc_look_anyup_rh_no(eye: Tvec3; dir: Tvec3; dest: Tmat4); cdecl; external libcglm;

// === Konventiert am: 16-2-26 19:46:18 ===


implementation



end.

unit pde;

interface

uses
  mgl_command, define, abstract;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tgo2dFunc = function(u: Tmreal; x: Tmreal; y: Tmreal; px: Tmreal; py: Tmreal; par: pointer): Tmdual;
  Tgo3dFunc = function(u: Tmreal; x: Tmreal; y: Tmreal; z: Tmreal; px: Tmreal; py: Tmreal; pz: Tmreal; par: pointer): Tmdual;
  TodeFunc = procedure(x: Pmreal; dx: Pmreal; par: pointer);

function mgl_pde_solve_c(gr: THMGL; ham: pchar; ini_re: THCDT; ini_im: THCDT; dz: Tmreal; k0: Tmreal; opt: pchar): THADT; cdecl; external libmgl;
function mgl_pde_solve(gr: THMGL; ham: pchar; ini_re: THCDT; ini_im: THCDT; dz: Tmreal; k0: Tmreal; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_pde_adv_c(gr: THMGL; ham: pchar; ini_re: THCDT; ini_im: THCDT; dz: Tmreal; k0: Tmreal; opt: pchar): THADT; cdecl; external libmgl;
function mgl_pde_adv(gr: THMGL; ham: pchar; ini_re: THCDT; ini_im: THCDT; dz: Tmreal; k0: Tmreal; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_qo2d_solve_c(ham: pchar; ini_re: THCDT; ini_im: THCDT; ray: THCDT; r: Tmreal; k0: Tmreal; xx: THMDT; yy: THMDT): THADT; cdecl; external libmgl;
function mgl_qo2d_func_c(ham: Tgo2dFunc; par: pointer; ini_re: THCDT; ini_im: THCDT; ray: THCDT; r: Tmreal; k0: Tmreal; xx: THMDT; yy: THMDT): THADT; cdecl; external libmgl;
function mgl_qo2d_solve(ham: pchar; ini_re: THCDT; ini_im: THCDT; ray: THCDT; r: Tmreal; k0: Tmreal; xx: THMDT; yy: THMDT): THMDT; cdecl; external libmgl;
function mgl_qo2d_func(ham: Tgo2dFunc; par: pointer; ini_re: THCDT; ini_im: THCDT; ray: THCDT; r: Tmreal; k0: Tmreal; xx: THMDT; yy: THMDT): THMDT; cdecl; external libmgl;
function mgl_qo3d_solve_c(ham: pchar; ini_re: THCDT; ini_im: THCDT; ray: THCDT; r: Tmreal; k0: Tmreal; xx: THMDT; yy: THMDT; zz: THMDT): THADT; cdecl; external libmgl;
function mgl_qo3d_func_c(ham: Tgo3dFunc; par: pointer; ini_re: THCDT; ini_im: THCDT; ray: THCDT; r: Tmreal; k0: Tmreal; xx: THMDT; yy: THMDT; zz: THMDT): THADT; cdecl; external libmgl;
function mgl_qo3d_solve(ham: pchar; ini_re: THCDT; ini_im: THCDT; ray: THCDT; r: Tmreal; k0: Tmreal; xx: THMDT; yy: THMDT; zz: THMDT): THMDT; cdecl; external libmgl;
function mgl_qo3d_func(ham: Tgo3dFunc; par: pointer; ini_re: THCDT; ini_im: THCDT; ray: THCDT; r: Tmreal; k0: Tmreal; xx: THMDT; yy: THMDT; zz: THMDT): THMDT; cdecl; external libmgl;
function mgl_ode_solve(func: TodeFunc; n: longint; x0: Pmreal; dt: Tmreal; tmax: Tmreal; par: pointer): THMDT; cdecl; external libmgl;
function mgl_ode_solve_str(func: pchar; var_: pchar; x0: THCDT; dt: Tmreal; tmax: Tmreal): THMDT; cdecl; external libmgl;
function mgl_ode_solve_str_c(func: pchar; var_: pchar; x0: THCDT; dt: Tmreal; tmax: Tmreal): THADT; cdecl; external libmgl;
function mgl_ode_solve_set(func: pchar; var_: pchar; brd: char; x0: THCDT; dt: Tmreal; tmax: Tmreal): THMDT; cdecl; external libmgl;
function mgl_ode_solve_set_c(func: pchar; var_: pchar; brd: char; x0: THCDT; dt: Tmreal; tmax: Tmreal): THADT; cdecl; external libmgl;
function mgl_ode_solve_ex(func: TodeFunc; n: longint; x0: Pmreal; dt: Tmreal; tmax: Tmreal; par: pointer; bord: TodeFunc): THMDT; cdecl; external libmgl;
function mgl_ray_trace(ham: pchar; x0: Tmreal; y0: Tmreal; z0: Tmreal; px: Tmreal; py: Tmreal; pz: Tmreal; dt: Tmreal; tmax: Tmreal): THMDT; cdecl; external libmgl;
function mgl_jacobian_2d(x: THCDT; y: THCDT): THMDT; cdecl; external libmgl;
function mgl_jacobian_3d(x: THCDT; y: THCDT; z: THCDT): THMDT; cdecl; external libmgl;

// === Konventiert am: 27-6-25 17:58:32 ===


implementation



end.

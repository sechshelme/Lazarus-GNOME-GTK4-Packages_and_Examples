unit gsl_siman;

interface

uses
  fp_gsl, gsl_rng;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type

  Tgsl_siman_Efunc_t = function(xp: pointer): Tdouble; cdecl;
  Tgsl_siman_step_t = procedure(r: Pgsl_rng; xp: pointer; step_size: Tdouble); cdecl;
  Tgsl_siman_metric_t = function(xp: pointer; yp: pointer): Tdouble; cdecl;
  Tgsl_siman_print_t = procedure(xp: pointer); cdecl;
  Tgsl_siman_copy_t = procedure(source: pointer; dest: pointer); cdecl;
  Tgsl_siman_copy_construct_t = function(xp: pointer): pointer; cdecl;
  Tgsl_siman_destroy_t = procedure(xp: pointer); cdecl;

  Tgsl_siman_params_t = record
    n_tries: longint;
    iters_fixed_T: longint;
    step_size: Tdouble;
    k: Tdouble;
    t_initial: Tdouble;
    mu_t: Tdouble;
    t_min: Tdouble;
  end;
  Pgsl_siman_params_t = ^Tgsl_siman_params_t;

procedure gsl_siman_solve(r: Pgsl_rng; x0_p: pointer; Ef: Tgsl_siman_Efunc_t; take_step: Tgsl_siman_step_t; distance: Tgsl_siman_metric_t;
  print_position: Tgsl_siman_print_t; copyfunc: Tgsl_siman_copy_t; copy_constructor: Tgsl_siman_copy_construct_t; destruc: Tgsl_siman_destroy_t; element_size: Tsize_t;
  params: Tgsl_siman_params_t); cdecl; external libgsl;
procedure gsl_siman_solve_many(r: Pgsl_rng; x0_p: pointer; Ef: Tgsl_siman_Efunc_t; take_step: Tgsl_siman_step_t; distance: Tgsl_siman_metric_t;
  print_position: Tgsl_siman_print_t; element_size: Tsize_t; params: Tgsl_siman_params_t); cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:41:28 ===


implementation



end.

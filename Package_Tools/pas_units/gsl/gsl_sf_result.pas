unit gsl_sf_result;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_sf_result_struct = record
    val: Tdouble;
    err: Tdouble;
  end;
  Pgsl_sf_result_struct = ^Tgsl_sf_result_struct;
  Tgsl_sf_result = Tgsl_sf_result_struct;
  Pgsl_sf_result = ^Tgsl_sf_result;

  Tgsl_sf_result_e10_struct = record
    val: Tdouble;
    err: Tdouble;
    e10: longint;
  end;
  Pgsl_sf_result_e10_struct = ^Tgsl_sf_result_e10_struct;
  Tgsl_sf_result_e10 = Tgsl_sf_result_e10_struct;
  Pgsl_sf_result_e10 = ^Tgsl_sf_result_e10;

function gsl_sf_result_smash_e(re: Pgsl_sf_result_e10; r: Pgsl_sf_result): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 15:15:21 ===


implementation



end.

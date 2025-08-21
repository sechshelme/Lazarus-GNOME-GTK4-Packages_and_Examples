unit gsl_monte;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_monte_function_struct = record
    f: function(x_array: Pdouble; dim: Tsize_t; params: pointer): Tdouble; cdecl;
    dim: Tsize_t;
    params: pointer;
  end;
  Pgsl_monte_function_struct = ^Tgsl_monte_function_struct;

  Tgsl_monte_function = Tgsl_monte_function_struct;
  Pgsl_monte_function = ^Tgsl_monte_function;

  // === Konventiert am: 21-8-25 19:43:17 ===


implementation



end.

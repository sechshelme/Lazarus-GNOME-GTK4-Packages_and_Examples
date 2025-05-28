unit elm_progressbar_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pprogressbar_func_type = ^Tprogressbar_func_type;
  Tprogressbar_func_type = function(para1: double): pchar; cdecl;

  Pprogressbar_func_full_type = ^Tprogressbar_func_full_type;
  Tprogressbar_func_full_type = function(para1: double; para2: pointer): pchar; cdecl;

  Tprogressbar_freefunc_type = procedure(para1: pchar); cdecl;

  // === Konventiert am: 28-5-25 13:38:55 ===


implementation



end.

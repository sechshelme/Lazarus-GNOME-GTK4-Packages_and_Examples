unit elm_slider_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pslider_func_type = ^Tslider_func_type;
  Tslider_func_type = function(para1: double): pchar; cdecl;

  Pslider_func_full_type = ^Tslider_func_full_type;
  Tslider_func_full_type = function(para1: double; para2: pointer): pchar; cdecl;

  Tslider_freefunc_type = procedure(para1: pchar); cdecl;

  // === Konventiert am: 27-5-25 17:58:45 ===


implementation



end.

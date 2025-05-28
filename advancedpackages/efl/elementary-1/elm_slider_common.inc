{$IFDEF read_interface}


type
  Pslider_func_type = ^Tslider_func_type;
  Tslider_func_type = function(para1: double): pchar; cdecl;

  Pslider_func_full_type = ^Tslider_func_full_type;
  Tslider_func_full_type = function(para1: double; para2: pointer): pchar; cdecl;

  Tslider_freefunc_type = procedure(para1: pchar); cdecl;

  // === Konventiert am: 27-5-25 17:58:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

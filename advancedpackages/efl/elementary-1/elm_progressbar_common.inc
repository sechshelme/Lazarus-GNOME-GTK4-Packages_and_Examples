{$IFDEF read_interface}


type
  Pprogressbar_func_type = ^Tprogressbar_func_type;
  Tprogressbar_func_type = function(para1: double): pchar; cdecl;

  Pprogressbar_func_full_type = ^Tprogressbar_func_full_type;
  Tprogressbar_func_full_type = function(para1: double; para2: pointer): pchar; cdecl;

  Tprogressbar_freefunc_type = procedure(para1: pchar); cdecl;

  // === Konventiert am: 28-5-25 13:38:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

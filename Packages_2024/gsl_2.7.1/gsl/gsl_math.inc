{$IFDEF read_interface}



const
  M_E = 2.71828182845904523536028747135;
  M_LOG2E = 1.44269504088896340735992468100;
  M_LOG10E = 0.43429448190325182765112891892;
  M_SQRT2 = 1.41421356237309504880168872421;
  M_SQRT1_2 = 0.70710678118654752440084436210;
  M_SQRT3 = 1.73205080756887729352744634151;
  M_PI = 3.14159265358979323846264338328;
  M_PI_2 = 1.57079632679489661923132169164;
  M_PI_4 = 0.78539816339744830961566084582;
  M_SQRTPI = 1.77245385090551602729816748334;
  M_2_SQRTPI = 1.12837916709551257389615890312;
  M_1_PI = 0.31830988618379067153776752675;
  M_2_PI = 0.63661977236758134307553505349;
  M_LN10 = 2.30258509299404568401799145468;
  M_LN2 = 0.69314718055994530941723212146;
  M_LNPI = 1.14472988584940017414342735135;
  M_EULER = 0.57721566490153286060651209008;

type
  Tgsl_function_struct = record
    _function: function(x: double; params: pointer): double; cdecl;
    params: pointer;
  end;
  Pgsl_function_struct = ^Tgsl_function_struct;

  Tgsl_function = Tgsl_function_struct;
  Pgsl_function = ^Tgsl_function;

type
  Tgsl_function_fdf_struct = record
    f: function(x: double; params: pointer): double; cdecl;
    df: function(x: double; params: pointer): double; cdecl;
    fdf: procedure(x: double; params: pointer; f: Pdouble; df: Pdouble); cdecl;
    params: pointer;
  end;
  Pgsl_function_fdf_struct = ^Tgsl_function_fdf_struct;

  Tgsl_function_fdf = Tgsl_function_fdf_struct;
  Pgsl_function_fdf = ^Tgsl_function_fdf;

type
  Tgsl_function_vec_struct = record
    _function: function(x: double; y: Pdouble; params: pointer): longint; cdecl;
    params: pointer;
  end;
  Pgsl_function_vec_struct = ^Tgsl_function_vec_struct;

  Tgsl_function_vec = Tgsl_function_vec_struct;
  Pgsl_function_vec = ^Tgsl_function_vec;



  // === Konventiert am: 21-8-25 17:00:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

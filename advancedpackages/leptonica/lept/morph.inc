{$IFDEF read_interface}


const
  SEL_VERSION_NUMBER = 1;

type
  TSel = record
    sy: Tl_int32;
    sx: Tl_int32;
    cy: Tl_int32;
    cx: Tl_int32;
    data: ^Pl_int32;
    name: pchar;
  end;
  PSel = ^TSel;
  PPSel = ^PSel;

  TSela = record
    n: Tl_int32;
    nalloc: Tl_int32;
    sel: ^PSel;
  end;
  PSela = ^TSela;
  PPSela = ^PSela;

const
  KERNEL_VERSION_NUMBER = 2;

type
  TL_Kernel = record
    sy: Tl_int32;
    sx: Tl_int32;
    cy: Tl_int32;
    cx: Tl_int32;
    data: ^Pl_float32;
  end;
  PL_Kernel = ^TL_Kernel;
  PPL_Kernel = ^PL_Kernel;

const
  SYMMETRIC_MORPH_BC = 0;
  ASYMMETRIC_MORPH_BC = 1;

const
  SEL_DONT_CARE = 0;
  SEL_HIT = 1;
  SEL_MISS = 2;

const
  L_RUN_OFF = 0;
  L_RUN_ON = 1;

const
  L_HORIZ = 1;
  L_VERT = 2;
  L_BOTH_DIRECTIONS = 3;

const
  L_MORPH_DILATE = 1;
  L_MORPH_ERODE = 2;
  L_MORPH_OPEN = 3;
  L_MORPH_CLOSE = 4;
  L_MORPH_HMT = 5;

const
  L_LINEAR_SCALE = 1;
  L_LOG_SCALE = 2;

const
  L_TOPHAT_WHITE = 0;
  L_TOPHAT_BLACK = 1;

const
  L_ARITH_ADD = 1;
  L_ARITH_SUBTRACT = 2;
  L_ARITH_MULTIPLY = 3;
  L_ARITH_DIVIDE = 4;
  L_UNION = 5;
  L_INTERSECTION = 6;
  L_SUBTRACTION = 7;
  L_EXCLUSIVE_OR = 8;

const
  L_CHOOSE_MIN = 1;
  L_CHOOSE_MAX = 2;
  L_CHOOSE_MAXDIFF = 3;
  L_CHOOSE_MIN_BOOST = 4;
  L_CHOOSE_MAX_BOOST = 5;

const
  L_BOUNDARY_BG = 1;
  L_BOUNDARY_FG = 2;

const
  L_COMPARE_XOR = 1;
  L_COMPARE_SUBTRACT = 2;
  L_COMPARE_ABS_DIFF = 3;


  // === Konventiert am: 16-8-25 19:54:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

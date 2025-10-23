{$IFDEF read_interface}


const
  NUMA_VERSION_NUMBER = 1;

type
  TNuma = record
    nalloc: Tl_int32;
    n: Tl_int32;
    refcount: Tl_int32;
    startx: Tl_float32;
    delx: Tl_float32;
    arr: Pl_float32;
  end;
  PNUMA = ^TNuma;
  PPNUMA = ^PNUMA;

  TNumaa = record
    nalloc: Tl_int32;
    n: Tl_int32;
    numa: ^PNuma;
  end;
  PNUMAA = ^TNumaa;
  PPNUMAA = ^PNUMAA;

const
  DNA_VERSION_NUMBER = 1;

type
  TL_Dna = record
    nalloc: Tl_int32;
    n: Tl_int32;
    refcount: Tl_int32;
    startx: Tl_float64;
    delx: Tl_float64;
    arr: Pl_float64;
  end;
  PL_DNA = ^TL_Dna;
  PPL_DNA = ^PL_DNA;

  TL_Dnaa = record
    nalloc: Tl_int32;
    n: Tl_int32;
    dna: ^PL_Dna;
  end;
  PL_DNAA = ^TL_Dnaa;
  PPL_DNAA = ^PL_DNAA;

  TL_DnaHash = record
    nbuckets: Tl_int32;
    initsize: Tl_int32;
    dna: ^PL_Dna;
  end;
  PL_DNAHASH = ^TL_DnaHash;
  PPL_DNAHASH = ^PL_DNAHASH;

const
  SARRAY_VERSION_NUMBER = 1;

type
  TSarray = record
    nalloc: Tl_int32;
    n: Tl_int32;
    refcount: Tl_int32;
    arr: ^pchar;
  end;
  PSARRAY = ^TSarray;
  PPSARRAY = ^PSARRAY;

  TL_Bytea = record
    nalloc: Tsize_t;
    size: Tsize_t;
    refcount: Tl_int32;
    data: Pl_uint8;
  end;
  PL_BYTEA = ^TL_Bytea;
  PPL_BYTEA = ^PL_BYTEA;

const
  L_LINEAR_INTERP = 1;
  L_QUADRATIC_INTERP = 2;

const
  L_CONTINUED_BORDER = 1;
  L_SLOPE_BORDER = 2;
  L_MIRRORED_BORDER = 3;

const
  L_INTEGER_VALUE = 1;
  L_FLOAT_VALUE = 2;


  // === Konventiert am: 16-8-25 19:47:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

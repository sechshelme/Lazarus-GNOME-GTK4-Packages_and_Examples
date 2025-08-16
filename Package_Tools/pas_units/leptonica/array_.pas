unit array_;

interface

uses
  fp_lept, environ;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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
  PNuma = ^TNuma;
  PPNuma = ^PNuma;

  TNumaa = record
    nalloc: Tl_int32;
    n: Tl_int32;
    numa: ^PNuma;
  end;
  PNumaa = ^TNumaa;
  PPNumaa = ^PNumaa;

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
  PL_Dna = ^TL_Dna;
  PPL_Dna = ^PL_Dna;

  TL_Dnaa = record
    nalloc: Tl_int32;
    n: Tl_int32;
    dna: ^PL_Dna;
  end;
  PL_Dnaa = ^TL_Dnaa;

  TL_DnaHash = record
    nbuckets: Tl_int32;
    initsize: Tl_int32;
    dna: ^PL_Dna;
  end;
  PL_DnaHash = ^TL_DnaHash;

const
  SARRAY_VERSION_NUMBER = 1;

type
  TSarray = record
    nalloc: Tl_int32;
    n: Tl_int32;
    refcount: Tl_int32;
    arr: ^pchar;
  end;
  PSarray = ^TSarray;

  TL_Bytea = record
    nalloc: Tsize_t;
    size: Tsize_t;
    refcount: Tl_int32;
    data: Pl_uint8;
  end;
  PL_Bytea = ^TL_Bytea;
  PPL_Bytea = ^PL_Bytea;

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


implementation



end.

unit fp_gsl;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF Linux}
  libgsl = 'libgsl';
  libgslcblas = 'libgslcblas';
  {$ENDIF}

  {$IFDEF Windows}
  libgsl = 'libgsl-0.dll';
  libgslcblas = 'libgslcblas-0.dll';
  {$ENDIF}

type
  Tdouble = double;

  Tlong_double = extended;
  Plong_double = ^Tlong_double;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  PFILE = type Pointer;

implementation

end.

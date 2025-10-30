unit fp_gsl;

interface

uses
  ctypes;

const
  {$IFDEF Linux}
  libgsl = 'libgsl';
  libgslcblas = 'libgslcblas';
  {$ENDIF}

  {$IFDEF Windows}
  libgsl = 'libgsl-0.dll';
  libgslcblas = 'libgslcblas-0.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int64;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

type
  Tdouble = double;

  Tlong_double = extended;
  Plong_double = ^Tlong_double;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  PFILE = type Pointer;

  {$DEFINE read_interface}
  {$include fp_gsl_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_gsl_includes.inc}
{$UNDEF read_interface}

end.

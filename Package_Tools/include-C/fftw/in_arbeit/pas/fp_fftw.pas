unit fp_fftw;

interface

const
  {$IFDEF Linux}
  libfftw3 = 'fftw3';
  libfftw3_threads = 'fftw3_threads';
  libfftw3_mpi = 'fftw3_mpi';

  libfftw3f = 'fftw3f';
  libfftw3f_threads = 'fftw3f_threads';
  libfftw3f_mpi = 'fftw3f_mpi';

  libfftw3l = 'fftw3l';
  libfftw3l_threads = 'fftw3l_threads';
  libfftw3l_mpi = 'fftw3l_mpi';

  libfftw3q = 'fftw3q';
  libfftw3q_threads = 'fftw3q_threads';
  libfftw3q_mpi = 'fftw3q_mpi';
  {$ENDIF}

  {$IFDEF Windows}
  libfftw3 = 'libfftw3-3.dll';
  libfftw3_threads = 'libfftw3_threads-3.dll';
  libfftw3_mpi = 'libfftw3_mpi-3.dll';

  libfftw3f = 'libfftw3f-3.dll';
  libfftw3f_threads = 'libfftw3f_threads-3.dll';
  libfftw3f_mpi = 'libfftw3f_mpi-3.dll';

  libfftw3l = 'libfftw3l-3.dll';
  libfftw3l_threads = 'libfftw3l_threads-3.dll';
  libfftw3l_mpi = 'libfftw3l_mpi-3.dll';

  libfftw3q = 'libfftw3q-3.dll';
  libfftw3q_threads = 'libfftw3q_threads-3.dll';
  libfftw3q_mpi = 'libfftw3q_mpi-3.dll';
  {$ENDIF}

type
  TMPI_Comm=type Pointer;
  TMPI_Datatype=type Pointer;
  TMPI_Request=type Pointer;

  Tptrdiff_t=PtrInt;
  Pptrdiff_t=^Tptrdiff_t;

  Tdouble = Double;
  Pdouble = ^Tdouble;

  Tfloat = Single;
  Pfloat = ^Tfloat;

  Tlongdouble = Extended;
  Plongdouble = ^Tlongdouble;

  Tfloat128 = array[0..15] of Byte;
  Pfloat128 = ^Tfloat128;

type
  Tfftw_complex = record
    re: Tdouble;
    im: Tdouble;
  end;
  Pfftw_complex = ^Tfftw_complex;

  Tfftwf_complex = record
    re: Tfloat;
    im: Tfloat;
  end;
  Pfftwf_complex = ^Tfftwf_complex;

  Tfftwl_complex = record
    re: Tlongdouble;
    im: Tlongdouble;
  end;
  Pfftwl_complex = ^Tfftwl_complex;

  Tfftwq_complex = record
    re: Tfloat128;
    im: Tfloat128;
  end;
  Pfftwq_complex = ^Tfftwq_complex;



  {$DEFINE read_interface}
  //{$include fp_fftw_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_fftw_includes.inc}
{$UNDEF read_implementation}

end.

{$IFDEF read_interface}


const
  OPENBLAS_OS_LINUX = 1;
  OPENBLAS_ARCH_X86_64 = 1;
  OPENBLAS_C_GCC = 1;
  OPENBLAS___64BIT__ = 1;
  OPENBLAS_HAVE_C11 = 1;
  OPENBLAS_NEEDBUNDERSCORE = 1;
  OPENBLAS_L1_DATA_SIZE = 32768;
  OPENBLAS_L1_DATA_LINESIZE = 128;
  OPENBLAS_L2_SIZE = 512488;
  OPENBLAS_L2_LINESIZE = 128;
  OPENBLAS_DTB_DEFAULT_ENTRIES = 128;
  OPENBLAS_DTB_SIZE = 4096;
  OPENBLAS_L2_ASSOCIATIVE = 8;
  OPENBLAS_CHAR_CORENAME = 'generic';
  OPENBLAS_SLOCAL_BUFFER_SIZE = 4096;
  OPENBLAS_DLOCAL_BUFFER_SIZE = 4096;
  OPENBLAS_CLOCAL_BUFFER_SIZE = 8192;
  OPENBLAS_ZLOCAL_BUFFER_SIZE = 8192;
  OPENBLAS_GEMM_MULTITHREAD_THRESHOLD = 4;
  OPENBLAS_VERSION = ' OpenBLAS 0.3.26 ';

type
  Txdouble = double;

type
  {$IFDEF linux}
  PBLASLONG = ^TBLASLONG;
  TBLASLONG = int64;

  PBLASULONG = ^TBLASULONG;
  TBLASULONG = uint64;
  {$ENDIF}

  {$IFDEF windows}
  PBLASLONG = ^TBLASLONG;
  TBLASLONG = int32;

  PBLASULONG = ^TBLASULONG;
  TBLASULONG = uint32;
  {$ENDIF}


type
  Pbfloat16 = ^Tbfloat16;
  Tbfloat16 = uint16;

type
  Pblasint = ^Tblasint;
  Tblasint = TBLASLONG;

type
  FLOATRET = single;

type
  Topenblas_complex_float = record
    real: single;
    imag: single;
  end;
  Popenblas_complex_float = ^Topenblas_complex_float;

  Topenblas_complex_double = record
    real: double;
    imag: double;
  end;
  Popenblas_complex_double = ^Topenblas_complex_double;

  Topenblas_complex_xdouble = record
    real: Txdouble;
    imag: Txdouble;
  end;
  Popenblas_complex_xdouble = ^Topenblas_complex_xdouble;

function openblas_make_complex_float(real, imag: single): Topenblas_complex_float; inline;
function openblas_make_complex_double(real, imag: double): Topenblas_complex_double; inline;
function openblas_make_complex_xdouble(real, imag: Txdouble): Topenblas_complex_xdouble; inline;

function openblas_complex_float_real(z: Topenblas_complex_float): single;
function openblas_complex_float_imag(z: Topenblas_complex_float): single;
function openblas_complex_double_real(z: Topenblas_complex_double): double;
function openblas_complex_double_imag(z: Topenblas_complex_double): double;
function openblas_complex_xdouble_real(z: Topenblas_complex_xdouble): Txdouble;
function openblas_complex_xdouble_imag(z: Topenblas_complex_xdouble): Txdouble;


// === Konventiert am: 9-11-25 19:29:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function openblas_make_complex_float(real, imag: single
  ): Topenblas_complex_float;
begin
  Result.real := real;
  Result.imag := imag;
end;

function openblas_make_complex_double(real, imag: double
  ): Topenblas_complex_double;
begin
  Result.real := real;
  Result.imag := imag;
end;

function openblas_make_complex_xdouble(real, imag: Txdouble
  ): Topenblas_complex_xdouble;
begin
  Result.real := real;
  Result.imag := imag;
end;


function openblas_complex_float_real(z: Topenblas_complex_float): single;
begin
  openblas_complex_float_real := z.real;
end;

function openblas_complex_float_imag(z: Topenblas_complex_float): single;
begin
  openblas_complex_float_imag := z.imag;
end;

function openblas_complex_double_real(z: Topenblas_complex_double): double;
begin
  openblas_complex_double_real := z.real;
end;

function openblas_complex_double_imag(z: Topenblas_complex_double): double;
begin
  openblas_complex_double_imag := z.imag;
end;

function openblas_complex_xdouble_real(z: Topenblas_complex_xdouble): Txdouble;
begin
  openblas_complex_xdouble_real := z.real;
end;

function openblas_complex_xdouble_imag(z: Topenblas_complex_xdouble): Txdouble;
begin
  openblas_complex_xdouble_imag := z.imag;
end;


{$ENDIF read_implementation}

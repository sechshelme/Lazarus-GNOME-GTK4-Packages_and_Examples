unit fp_suitesparse;

interface

const
  {$IFDEF Linux}
  libamd = 'amd';
  libbtf = 'btf';
  libcamd = 'camd';
  libccolamd = 'ccolamd';
  libcholmod = 'cholmod';
  libcolamd = 'colamd';
  libcxsparse = 'cxsparse';
  libklu = 'klu';
  libklu_cholmod = 'klu_cholmod';
  libldl = 'ldl';
  libumfpack = 'umfpack';
  libparu = 'paru';
  librbio = 'rbio';
  libspex = 'spex';
  libsuitesparse = 'spqr';
  libsuitesparseconfig = 'suitesparseconfig';
  {$ENDIF}

  {$IFDEF Windows}
  libamd = 'libamd.dll';
  libbtf = 'libbtf.dll';
  libcamd = 'libcamd.dll';
  libccolamd = 'libccolamd.dll';
  libcholmod = 'libcholmod.dll';
  libcolamd = 'libcolamd.dll';
  libcxsparse = 'libcxsparse.dll';
  libklu = 'libklu.dll';
  libklu_cholmod = 'libklu_cholmod.dll';
  libldl = 'libldl.dll';
  libumfpack = 'libumfpack.dll';
  libparu = 'libparu.dll';
  librbio = 'librbio.dll';
  libspex = 'libspex.dll';
  libsuitesparse = 'libspqr.dll';
  libsuitesparseconfig = 'libsuitesparseconfig.dll';
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  PFILE = type Pointer;

type // /usr/include/mpfr.h
  Tmpfr_rnd_t = longint;
  Pmpfr_t = type Pointer;
  Tmpq_t = Pointer;  // ???????
  Tmpfr_t = Pointer;  // ???????

type // /usr/include/x86_64-linux-gnu/gmp.h
  Pmp_limb = PUInt64;

  Tmpz = record
    _mp_alloc: longint;
    _mp_size: longint;
    _mp_d: Pmp_limb;
  end;
  Pmpz = ^Tmpz;

  Tmpq = record
    _mp_num: Tmpz;
    _mp_den: Tmpz;
  end;
  Pmpq = ^Tmpq;


type
  Tdouble_Complex = record
    a, b: double;
  end;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_suitesparse_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_suitesparse_includes.inc}
{$UNDEF read_interface}

end.

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
  libsuitesparse='spqr';

  libsuitesparseconfig = 'libsuitesparseconfig';
  {$ENDIF}

  {$IFDEF Windows}
  // ?????????????
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
  Tmpfr_t= Pointer;  // ???????

type // /usr/include/x86_64-linux-gnu/gmp.h
  Pmpz_t = type Pointer;
  Pmpq_t = type Pointer;
  Tmpz_t=Pointer;  // ???????

type
  Tdouble_Complex=record
    a,b:Double;
  end;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



implementation

end.

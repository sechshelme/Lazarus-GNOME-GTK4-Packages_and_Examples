unit fp_asound;

interface

const
  {$IFDEF Linux}
  libasound = 'libasound';
  {$ENDIF}

  {$IFDEF Windows}
  // ?????????????
  {$ENDIF}

type
PPdword=^PDWord;

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

  Tssize_t=SizeInt;

  PFILE = type Pointer;

  Ttime_t = int64; // types.h
  Ptime_t = ^Ttime_t;

  Tpid_t=Int32;

  Tva_list=type Pointer; // ??????

  type // /usr/include/asm-generic/poll.h
  Ppollfd=type Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type // Herkunft unbekannt
  Psnd_shm_area = type Pointer;
  PPsnd_shm_area = ^Psnd_shm_area;

const // /usr/include/asm-generic/fcntl.h
  O_RDONLY = &00;
  O_WRONLY = &01;
  O_RDWR = &02;
  O_NONBLOCK = &04000;



  {$DEFINE read_interface}
  //  {$include fp_suitesparse_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_suitesparse_includes.inc}
{$UNDEF read_interface}

end.

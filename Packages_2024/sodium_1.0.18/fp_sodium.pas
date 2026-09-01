unit fp_sodium;

interface

const
  {$IFDEF Linux}
  libsodium = 'sodium';
  {$ENDIF}

  {$IFDEF windows}
  libsodium = 'libsodium.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Tprocedure = procedure;

const
  SODIUM_SIZE_MAX = High(PtrUInt);


  {$DEFINE read_interface}
  {$include fp_sodium_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_sodium_includes.inc}
{$UNDEF read_implementation}

end.

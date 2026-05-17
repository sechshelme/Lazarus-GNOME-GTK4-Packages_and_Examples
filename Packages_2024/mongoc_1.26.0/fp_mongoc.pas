unit fp_mongoc;

interface

uses
  fp_bson;

const
  {$ifdef linux}
  libmongoc = 'mongoc-1.0';
  {$endif}

  {$ifdef windows}
  libmongoc = 'libmongoc-1.0.dll';
  {$endif}

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

  Tssize_t = SizeInt;
  Pssize_t = ^Tssize_t;

  Psockaddr = type Pointer;
  Paddrinfo = type Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_enum}
  {$include fp_mongoc_includes.inc}
  {$UNDEF read_enum}

  {$DEFINE read_struct}
  {$include fp_mongoc_includes.inc}
  {$UNDEF read_struct}

  {$DEFINE read_function}
  {$include fp_mongoc_includes.inc}
  {$UNDEF read_function}

implementation

{$DEFINE read_implementation}
{$include fp_mongoc_includes.inc}
{$UNDEF read_implementation}

end.

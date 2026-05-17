unit fp_mongoc;

interface

const
  {$ifdef linux}
  libmongoc = 'mongoc';
  {$endif}

  {$ifdef windows}
  libmongoc = 'libmongoc.dll';
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

  Tsize_t=SizeUInt;
  Psize_t=^Tsize_t;

  Tssize_t=SizeInt;
  Pssize_t=^Tssize_t;

  Psockaddr=type Pointer;
  Paddrinfo =type Pointer;

  // =====


  Pbson_t=Pointer;
  PPbson_t=^Pbson_t;
  Pbson_oid_t=Pointer;
  Pbson_error_t=Pointer;
  Pbson_value_t=Pointer;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  Pmongoc_cursor_t=Pointer;

implementation

end.


unit fp_vlc;

interface

const
  {$IFDEF linux}
  libvlc = 'libvlc';
  {$ENDIF}

  {$IFDEF windows}
  libsoup = 'libvlc.dll';  // ?????
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
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

  Tuintptr_t=PtrUInt;
  Puintptr_t=^Tuintptr_t;

  Tsize_t=SizeUInt;

  PFILE=type Pointer;
  Tva_list=Pointer; // ?????????


  {$DEFINE read_interface}
  //{$include fp_vlc_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_vlc_includes.inc}
{$UNDEF read_implementation}

end.

unit fp_rist;

interface

const
  {$IFDEF Linux}
  librist = 'rist';
  {$ENDIF}

  {$IFDEF Windows}
  librist = 'librist.dll';
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


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  AF_UNSPEC = 0;
  {$IFDEF Linux}
  POLLIN = 1;
  POLLOUT = 4;
  {$ENDIF}

  {$IFDEF Windows}
  POLLIN = 768;
  POLLOUT = 16;
  {$ENDIF}

type
  Psockaddr = type Pointer;

  {$DEFINE read_interface}
  {$include rist/version.inc}
  {$include rist/logging.inc}
  {$include rist/headers.inc}
  {$include rist/peer.inc}
  {$include rist/librist.inc}
  {$include rist/librist_config.inc}
  {$include rist/librist_srp.inc}
  {$include rist/oob.inc}
  {$include rist/opt.inc}
  {$include rist/receiver.inc}
  {$include rist/sender.inc}
  {$include rist/stats.inc}
  {$include rist/udpsocket.inc}
  {$include rist/urlparam.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include rist/version.inc}
{$include rist/logging.inc}
{$include rist/headers.inc}
{$include rist/peer.inc}
{$include rist/librist.inc}
{$include rist/librist_config.inc}
{$include rist/librist_srp.inc}
{$include rist/oob.inc}
{$include rist/opt.inc}
{$include rist/receiver.inc}
{$include rist/sender.inc}
{$include rist/stats.inc}
{$include rist/udpsocket.inc}
{$include rist/urlparam.inc}
{$UNDEF read_implementation}

end.

unit lib_dbus_arch_deps;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  DBUS_HAVE_INT64 = 1;

type
  Pdbus_int64_t = ^Tdbus_int64_t;
  Tdbus_int64_t = int64;

  Pdbus_uint64_t = ^Tdbus_uint64_t;
  Tdbus_uint64_t = uint64;

  Pdbus_int32_t = ^Tdbus_int32_t;
  Tdbus_int32_t = int32;

  Pdbus_uint32_t = ^Tdbus_uint32_t;
  Tdbus_uint32_t = uint32;

  Pdbus_int16_t = ^Tdbus_int16_t;
  Tdbus_int16_t = int16;

  Pdbus_uint16_t = ^Tdbus_uint16_t;
  Tdbus_uint16_t = uint16;

const
  DBUS_MAJOR_VERSION = 1;
  DBUS_MINOR_VERSION = 14;
  DBUS_MICRO_VERSION = 10;
  DBUS_VERSION_STRING = '1.14.10';
  DBUS_VERSION = ((1 shl 16) or (14 shl 8)) or 10;

  // === Konventiert am: 29-7-25 15:07:41 ===


implementation



end.

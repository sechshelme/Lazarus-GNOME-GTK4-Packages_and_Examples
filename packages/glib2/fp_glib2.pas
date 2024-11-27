unit fp_glib2;

interface

uses
  {$ifdef linux}
  x, xlib,
  {$endif}
  Math, // wegen "division_by_zero" in den clibs
  ctypes;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$include ../gnome_lib_const.inc}

  // ==== GLIB2
  // /usr/lib/x86_64-linux-gnu/glib-2.0/include/glibconfig.h

const
  GLIB_SYSDEF_AF_UNIX = 1;
  GLIB_SYSDEF_AF_INET = 2;
  GLIB_SYSDEF_AF_INET6 = 10;

  GLIB_SYSDEF_MSG_OOB = 1;
  GLIB_SYSDEF_MSG_PEEK = 2;
  GLIB_SYSDEF_MSG_DONTROUTE = 4;

  {$IFDEF Linux}
  G_DIR_SEPARATOR = '/';
  {$ENDIF}
  {$IFDEF Windows}
  G_DIR_SEPARATOR = '';
  {$ENDIF}

const
  G_MINFLOAT = 5.0e-324;
  G_MAXFLOAT = 1.7e308;
  G_MINDOUBLE = G_MINFLOAT;
  G_MAXDOUBLE = G_MAXFLOAT;
  G_MAXSHORT = 32767;
  G_MINSHORT = -G_MAXSHORT - 1;
  G_MAXUSHORT = 2 * G_MAXSHORT + 1;
  G_MAXINT = 2147483647;
  G_MININT = -G_MAXINT - 1;
  G_MAXUINT = 4294967295;
  G_MINLONG = G_MININT;
  G_MAXLONG = G_MAXINT;
  G_MAXULONG = G_MAXUINT;

type
  Tgint8 = int8;
  Tguint8 = uint8;
  Pgint8 = ^int8;
  Pguint8 = ^uint8;
  PPguint8 = ^PUInt8;

  Tgint16 = int16;
  Tguint16 = uint16;
  Pgint16 = ^int16;
  Pguint16 = ^uint16;
  PPguint16 = ^PUInt16;

  Tgint32 = int32;
  Tguint32 = uint32;
  Pgint32 = ^int32;
  Pguint32 = ^uint32;
  PPguint32 = ^PUInt32;

  Tgint64 = int64;
  Tguint64 = uint64;
  Pgint64 = ^int64;
  Pguint64 = ^uint64;

  Tgssize = SizeInt;
  Pgssize = PSizeInt;
  Tgsize = SizeUInt;
  Pgsize = PSizeUInt;


  Tgintptr = IntPtr;
  Pgintptr = PIntPtr;
  Tguintptr = PtrUInt;
  Pguintptr = PPtrUInt;

  Tgoffset = SizeInt;


  {$DEFINE read_interface}
  {$include fp_glib2_includes.inc}
  {$include fp_gobject2_includes.inc}
  {$include fp_gio2_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_glib2_includes.inc}
{$include fp_gobject2_includes.inc}
{$include fp_gio2_includes.inc}
{$UNDEF read_implementation}

begin
  // wegen "division_by_zero" in den clibs
  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);
end.

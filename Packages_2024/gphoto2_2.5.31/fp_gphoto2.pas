unit fp_gphoto2;

interface

const
  {$IFDEF Linux}
  libgphoto2 = 'gphoto2';
  {$ENDIF}

  {$IFDEF Windows}
  libgphoto2 = 'libgphoto2.dll';  // ??????
  {$ENDIF}

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  Tlong_double = extended;
  {$ENDIF}

  {$IFDEF Windows}
  Tculong = uint32;
  Tclong = int32;
  Tlong_double = double;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

type
  Tuint32_t = uint32;

  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;

  Tsize_t = SizeUInt;
  Psize_t = Tsize_t;

  Ttime_t = int64; // types.h
  Ptime_t = ^Ttime_t;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PCameraWidget = type Pointer;
  PPCameraWidget = ^PCameraWidget;

  {$DEFINE read_interface}
  {$include fp_gphoto2_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_gphoto2_includes.inc}
{$UNDEF read_implementation}

end.

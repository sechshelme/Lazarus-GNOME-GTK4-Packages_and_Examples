unit fp_dbus;

interface

const
  {$IFDEF Linux}
  libdbus_1 = 'libdbus-1';
  {$ENDIF}

  {$IFDEF windows}
  libdbus_1 = 'libdbus-1-3.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int32;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

  Tsize_t = SizeInt;
  Tva_list = Pointer;


  {$DEFINE read_interface}
  {$include fp_dbus_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_dbus_includes.inc}
{$UNDEF read_interface}


end.

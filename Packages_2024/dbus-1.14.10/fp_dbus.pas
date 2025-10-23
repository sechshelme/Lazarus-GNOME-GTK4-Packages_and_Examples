unit fp_dbus;

interface

uses
  ctypes;

const
  {$IFDEF Linux}
  libdbus_1 = 'libdbus-1';
  {$ENDIF}

  {$IFDEF windows}
  libdbus_1 = 'libdbus-1.3.dll';
  {$ENDIF}

type
  Tsize_t = SizeInt;

  Tva_list = Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$DEFINE read_interface}
  {$include fp_dbus_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_dbus_includes.inc}
{$UNDEF read_interface}


end.

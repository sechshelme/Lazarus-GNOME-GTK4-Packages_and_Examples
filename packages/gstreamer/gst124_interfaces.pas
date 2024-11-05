unit gst124_interfaces;

interface

uses
  glib280,
  gst124,
  gst124_base,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/interfaces/photography.inc}                           // io.
  {$include gst/interfaces/photography_enumtypes.inc}                 // io.
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/interfaces/photography.inc}                           // io.
{$include gst/interfaces/photography_enumtypes.inc}                 // io.
{$UNDEF read_interface}
{$UNDEF read_implementation}

end.

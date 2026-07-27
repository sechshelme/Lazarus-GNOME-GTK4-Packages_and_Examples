unit fp_gst_interfaces;

interface

uses
  fp_glib2,
  fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/interfaces/photography.inc}
  {$include gst/interfaces/photography_enumtypes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/interfaces/photography.inc}
{$include gst/interfaces/photography_enumtypes.inc}
{$UNDEF read_implementation}

end.

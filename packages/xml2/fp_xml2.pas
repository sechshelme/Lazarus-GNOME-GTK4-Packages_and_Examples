unit fp_xml2;

//{$modeswitch typehelpers}

interface

uses
  ctypes, fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_xml2_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_xml2_includes.inc}
{$UNDEF read_implementation}

end.


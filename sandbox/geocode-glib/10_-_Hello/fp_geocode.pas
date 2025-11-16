unit fp_geocode;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  geocode_glib = 'libgeocode-glib-2';
  {$ENDIF}

  {$IFDEF Windows}
  geocode_glib = 'libgeocode-glib-2.dll';  // ?????
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_chafa_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
//{$include fp_chafa_includes.inc}
{$UNDEF read_implementation}

end.

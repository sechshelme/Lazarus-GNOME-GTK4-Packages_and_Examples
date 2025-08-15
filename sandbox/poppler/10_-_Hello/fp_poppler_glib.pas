unit fp_poppler_glib;

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF Linux}
  poppler_glib = 'poppler-glib';
  {$ENDIF}

  {$IFDEF msWindows}
    poppler_glib = 'libpoppler-glib-8.dll';
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include poppler_glib_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
//{$include poppler_glib_includes.inc}
{$UNDEF read_implementation}

end.


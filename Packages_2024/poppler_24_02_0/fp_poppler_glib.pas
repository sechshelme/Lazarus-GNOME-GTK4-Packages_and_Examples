unit fp_poppler_glib;

interface

uses
  fp_glib2, fp_cairo;

const
  {$IFDEF Linux}
  libpoppler_glib = 'poppler-glib';
  {$ENDIF}

  {$IFDEF msWindows}
  libpoppler_glib = 'libpoppler-glib-8.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_poppler_glib_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_poppler_glib_includes.inc}
{$UNDEF read_implementation}

end.

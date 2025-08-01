unit fp_pango;

//{$modeswitch typehelpers}

interface

uses
  {$IFDEF Linux}
  x, xlib,
  {$ENDIF}
  ctypes, fp_FreeType2, fp_glib2, fp_harfbuzz, fp_cairo;

const
  {$IFDEF Linux}
  libpango = 'libpango-1.0';
  libpangocairo = 'libpangocairo-1.0';
  libpangoft2 = 'libpangoft2-1.0';
  libpangoxft = 'libpangoxft-1.0';  // Nur Linux
  {$ENDIF}

  {$IFDEF Windows}
  libpango = 'libpango-1.0-0.dll';
  libpangocairo = 'libpangocairo-1.0-0.dll';
  libpangoft2 = 'libpangoft2-1.0-0.dll';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_pango_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_pango_includes.inc}
{$UNDEF read_implementation}

end.

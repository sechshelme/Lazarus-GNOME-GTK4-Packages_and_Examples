unit fp_soup3;

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF linux}
  libsoup = 'libsoup-3.0';
  {$ENDIF}

  {$IFDEF windows}
  libsoup = 'libsoup-3.0-1.dll';  // ?????
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_soup3_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_soup3_includes.inc}
{$UNDEF read_implementation}

end.

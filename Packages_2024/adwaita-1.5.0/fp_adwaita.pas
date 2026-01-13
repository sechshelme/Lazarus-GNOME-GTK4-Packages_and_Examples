unit fp_adwaita;

interface

uses
  fp_glib2, fp_pango, fp_GTK4;

const
  {$IFDEF Linux}
  libadwaita = 'libadwaita-1';
  {$ENDIF}

  {$IFDEF Windows}
  libadwaita = 'libadwaita-1-0.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_adwaita_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_adwaita_includes.inc}
{$UNDEF read_implementation}

end.

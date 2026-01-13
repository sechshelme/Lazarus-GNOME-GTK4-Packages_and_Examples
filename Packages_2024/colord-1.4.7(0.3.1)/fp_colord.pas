unit fp_colord;

interface

uses
  fp_glib2, fp_GTK4;

const
  {$IFDEF Linux}
  libcolord_gtk = 'libcolord-gtk4';
  libcolord = 'libcolord';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_colord_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_colord_includes.inc}
{$UNDEF read_implementation}



end.


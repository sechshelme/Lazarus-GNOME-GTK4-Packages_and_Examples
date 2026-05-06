unit fp_shumate;

interface

uses
  fp_glib2, fp_gdk_pixbuf2, fp_GTK4;

const
  {$IFDEF Linux}
  libshumate = 'shumate-1.0';
  {$ENDIF}

  {$IFDEF Windows}
  libshumate = 'libshumate-1.0-1.dll';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_shumate_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_shumate_includes.inc}
{$UNDEF read_implementation}

end.


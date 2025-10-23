unit fp_portal;

interface

uses
  fp_glib2;

const
  {$IFDEF linux}
  libportal = 'libportal';
  libportal_gtk4 = 'libportal-gtk4';
  {$ENDIF}

  {$IFDEF windows}
  libportal = 'libportal.dll';        // ?????????
  libportal_gtk4 = 'libportal-gtk4.dll'; // ?????????
  {$ENDIF}



  {$DEFINE read_interface}
  {$include fp_portal_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_portal_includes.inc}
{$UNDEF read_implementation}

end.


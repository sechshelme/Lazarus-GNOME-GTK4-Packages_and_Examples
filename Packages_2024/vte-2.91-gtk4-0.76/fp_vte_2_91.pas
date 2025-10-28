unit fp_vte_2_91;

interface

uses
  fp_glib2, fp_GTK4, fp_pango, fp_cairo;

const
  {$IFDEF Linux}
  libvte_2_91_gtk4 = 'vte-2.91-gtk4';
  {$ENDIF}

  {$IFDEF mswindows}
  libvte_2_91_gtk4 = 'vte-2.91-gtk4.dll'; // ???
  {$ENDIF}

  {$IFDEF darwin}
  libvte_2_91_gtk4 = 'vte-2.91-gtk4.dylib'; // ???
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_vte_2_91_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_vte_2_91_includes.inc}
{$UNDEF read_implementation}

end.

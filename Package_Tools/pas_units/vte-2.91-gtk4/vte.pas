unit vte;

interface

uses
  fp_glib2, fp_GTK4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

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



// === Konventiert am: 3-5-25 17:03:34 ===


implementation



end.

unit ibus;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF linux}
  libibus = 'libibus-1.0';
  {$ENDIF}

  {$IFDEF windows}
  libibus = 'libibus-1.0-1.dll'; // ???
  {$ENDIF}

  {$IFDEF darwin}
  libibus = 'libibus-1.0.synlib'; // ????
  {$ENDIF}



// === Konventiert am: 25-7-25 14:33:37 ===


implementation



end.

unit fp_colord;

interface

const
  {$IFDEF Linux}
  libcolord_gtk = 'libcolord-gtk4';
  libcolord = 'libcolord';
  {$ENDIF}

  {$IFDEF Windows}
  libcolord_gtk = 'libcolord-gtk4.dll ';  // ??????????
  libcolord = 'libcolord';                // ??????????
  {$ENDIF}

type
  PCdColorRGB = Pointer;
  PCdProfile = Pointer;
implementation

end.


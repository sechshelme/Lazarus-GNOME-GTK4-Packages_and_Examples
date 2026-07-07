unit gtkcolorutils;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
procedure gtk_hsv_to_rgb(h: single; s: single; v: single; r: Psingle; g: Psingle; b: Psingle); cdecl; external libgtk4;
procedure gtk_rgb_to_hsv(r: single; g: single; b: single; h: Psingle; s: Psingle; v: Psingle); cdecl; external libgtk4;
{$ENDIF read_function}

// === Konventiert am: 6-7-26 14:02:41 ===


implementation



end.

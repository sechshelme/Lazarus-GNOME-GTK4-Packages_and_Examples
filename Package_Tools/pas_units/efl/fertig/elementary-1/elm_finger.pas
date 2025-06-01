unit elm_finger;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure elm_coords_finger_size_adjust(times_w: longint; w: PEvas_Coord; times_h: longint; h: PEvas_Coord); cdecl; external libelementary;

// === Konventiert am: 1-6-25 12:57:27 ===


implementation



end.

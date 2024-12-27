unit hb_ot_font;

interface

uses
  fp_glib2, hb_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure hb_ot_font_set_funcs(font: Phb_font_t); cdecl; external libharfbuzz;

// === Konventiert am: 27-12-24 15:42:32 ===


implementation



end.

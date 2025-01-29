unit chafa_util;

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure chafa_calc_canvas_geometry(src_width: Tgint; src_height: Tgint; dest_width_inout: Pgint; dest_height_inout: Pgint; font_ratio: Tgfloat;
  zoom: Tgboolean; stretch: Tgboolean); cdecl; external libchafa;
procedure chafa_free_gstring_array(gsa: PPGString); cdecl; external libchafa;

// === Konventiert am: 29-1-25 19:32:32 ===


implementation



end.

{$IFDEF read_interface}


procedure chafa_calc_canvas_geometry(src_width: Tgint; src_height: Tgint; dest_width_inout: Pgint; dest_height_inout: Pgint; font_ratio: Tgfloat;
  zoom: Tgboolean; stretch: Tgboolean); cdecl; external libchafa;
procedure chafa_free_gstring_array(gsa: PPGString); cdecl; external libchafa;

// === Konventiert am: 29-1-25 19:32:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

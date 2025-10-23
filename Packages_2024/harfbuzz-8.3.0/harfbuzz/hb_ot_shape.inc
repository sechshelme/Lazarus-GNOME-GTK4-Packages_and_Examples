{$IFDEF read_interface}


procedure hb_ot_shape_glyphs_closure(font: Phb_font_t; buffer: Phb_buffer_t; features: Phb_feature_t; num_features: dword; glyphs: Phb_set_t); cdecl; external libharfbuzz;
procedure hb_ot_shape_plan_collect_lookups(shape_plan: Phb_shape_plan_t; table_tag: Thb_tag_t; lookup_indexes: Phb_set_t); cdecl; external libharfbuzz;

// === Konventiert am: 27-12-24 15:28:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

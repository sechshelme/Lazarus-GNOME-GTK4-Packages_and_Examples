unit hb_ot_shape;

interface

uses
  fp_glib2, hb_common, hb_buffer, hb_set, hb_shape_plan;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure hb_ot_shape_glyphs_closure(font: Phb_font_t; buffer: Phb_buffer_t; features: Phb_feature_t; num_features: dword; glyphs: Phb_set_t); cdecl; external libharfbuzz;
procedure hb_ot_shape_plan_collect_lookups(shape_plan: Phb_shape_plan_t; table_tag: Thb_tag_t; lookup_indexes: Phb_set_t); cdecl; external libharfbuzz;

// === Konventiert am: 27-12-24 15:28:56 ===


implementation



end.


unit hb_shape_;

interface

uses
  fp_glib2, hb_common, hb_buffer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure hb_shape(font: Phb_font_t; buffer: Phb_buffer_t; features: Phb_feature_t; num_features: dword); cdecl; external libharfbuzz;
function hb_shape_full(font: Phb_font_t; buffer: Phb_buffer_t; features: Phb_feature_t; num_features: dword; shaper_list: PPchar): Thb_bool_t; cdecl; external libharfbuzz;
function hb_shape_justify(font: Phb_font_t; buffer: Phb_buffer_t; features: Phb_feature_t; num_features: dword; shaper_list: PPchar;
  min_target_advance: single; max_target_advance: single; advance: Psingle; var_tag: Phb_tag_t; var_value: Psingle): Thb_bool_t; cdecl; external libharfbuzz;
function hb_shape_list_shapers: PPChar; cdecl; external libharfbuzz;

// === Konventiert am: 26-12-24 15:08:49 ===


implementation



end.

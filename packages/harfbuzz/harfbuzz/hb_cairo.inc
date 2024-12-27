{$IFDEF read_interface}


function hb_cairo_font_face_create_for_font(font: Phb_font_t): Pcairo_font_face_t; cdecl; external libharfbuzzcairo;
function hb_cairo_font_face_get_font(font_face: Pcairo_font_face_t): Phb_font_t; cdecl; external libharfbuzzcairo;
function hb_cairo_font_face_create_for_face(face: Phb_face_t): Pcairo_font_face_t; cdecl; external libharfbuzzcairo;
function hb_cairo_font_face_get_face(font_face: Pcairo_font_face_t): Phb_face_t; cdecl; external libharfbuzzcairo;

type
  Phb_cairo_font_init_func_t = ^Thb_cairo_font_init_func_t;
  Thb_cairo_font_init_func_t = function(font: Phb_font_t; scaled_font: Pcairo_scaled_font_t; user_data: pointer): Phb_font_t; cdecl;

procedure hb_cairo_font_face_set_font_init_func(font_face: Pcairo_font_face_t; func: Thb_cairo_font_init_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzzcairo;
function hb_cairo_scaled_font_get_font(scaled_font: Pcairo_scaled_font_t): Phb_font_t; cdecl; external libharfbuzzcairo;
procedure hb_cairo_font_face_set_scale_factor(font_face: Pcairo_font_face_t; scale_factor: dword); cdecl; external libharfbuzzcairo;
function hb_cairo_font_face_get_scale_factor(font_face: Pcairo_font_face_t): dword; cdecl; external libharfbuzzcairo;
procedure hb_cairo_glyphs_from_buffer(buffer: Phb_buffer_t; utf8_clusters: Thb_bool_t; x_scale_factor: Tdouble; y_scale_factor: Tdouble; x: Tdouble;
  y: Tdouble; utf8: pchar; utf8_len: longint; glyphs: PPcairo_glyph_t; num_glyphs: Pdword;
  clusters: PPcairo_text_cluster_t; num_clusters: Pdword; cluster_flags: Pcairo_text_cluster_flags_t); cdecl; external libharfbuzzcairo;

// === Konventiert am: 27-12-24 14:35:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

{$IFDEF read_interface}

function hb_ft_face_create(ft_face: TFT_Face; Destroy: Thb_destroy_func_t): Phb_face_t; cdecl; external libharfbuzz;
function hb_ft_face_create_cached(ft_face: TFT_Face): Phb_face_t; cdecl; external libharfbuzz;
function hb_ft_face_create_referenced(ft_face: TFT_Face): Phb_face_t; cdecl; external libharfbuzz;
function hb_ft_font_create(ft_face: TFT_Face; Destroy: Thb_destroy_func_t): Phb_font_t; cdecl; external libharfbuzz;
function hb_ft_font_create_referenced(ft_face: TFT_Face): Phb_font_t; cdecl; external libharfbuzz;
function hb_ft_font_get_face(font: Phb_font_t): TFT_Face; cdecl; external libharfbuzz;
function hb_ft_font_lock_face(font: Phb_font_t): TFT_Face; cdecl; external libharfbuzz;
procedure hb_ft_font_unlock_face(font: Phb_font_t); cdecl; external libharfbuzz;
procedure hb_ft_font_set_load_flags(font: Phb_font_t; load_flags: longint); cdecl; external libharfbuzz;
function hb_ft_font_get_load_flags(font: Phb_font_t): longint; cdecl; external libharfbuzz;
procedure hb_ft_font_changed(font: Phb_font_t); cdecl; external libharfbuzz;
function hb_ft_hb_font_changed(font: Phb_font_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_ft_font_set_funcs(font: Phb_font_t); cdecl; external libharfbuzz;

// === Konventiert am: 27-12-24 14:56:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

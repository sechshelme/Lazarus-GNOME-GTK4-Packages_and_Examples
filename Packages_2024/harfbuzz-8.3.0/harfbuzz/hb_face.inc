  {$IFDEF read_interface}

type
  Thb_face_t = record
  end;
  Phb_face_t = ^Thb_face_t;

function hb_face_count(blob: Phb_blob_t): dword; cdecl; external libharfbuzz;
function hb_face_create(blob: Phb_blob_t; index: dword): Phb_face_t; cdecl; external libharfbuzz;

type
  Phb_reference_table_func_t = ^Thb_reference_table_func_t;
  Thb_reference_table_func_t = function(face: Phb_face_t; tag: Thb_tag_t; user_data: pointer): Phb_blob_t; cdecl;

function hb_face_create_for_tables(reference_table_func: Thb_reference_table_func_t; user_data: pointer; Destroy: Thb_destroy_func_t): Phb_face_t; cdecl; external libharfbuzz;
function hb_face_get_empty: Phb_face_t; cdecl; external libharfbuzz;
function hb_face_reference(face: Phb_face_t): Phb_face_t; cdecl; external libharfbuzz;
procedure hb_face_destroy(face: Phb_face_t); cdecl; external libharfbuzz;
function hb_face_set_user_data(face: Phb_face_t; key: Phb_user_data_key_t; Data: pointer; Destroy: Thb_destroy_func_t; replace: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_face_get_user_data(face: Phb_face_t; key: Phb_user_data_key_t): pointer; cdecl; external libharfbuzz;
procedure hb_face_make_immutable(face: Phb_face_t); cdecl; external libharfbuzz;
function hb_face_is_immutable(face: Phb_face_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_face_reference_table(face: Phb_face_t; tag: Thb_tag_t): Phb_blob_t; cdecl; external libharfbuzz;
function hb_face_reference_blob(face: Phb_face_t): Phb_blob_t; cdecl; external libharfbuzz;
procedure hb_face_set_index(face: Phb_face_t; index: dword); cdecl; external libharfbuzz;
function hb_face_get_index(face: Phb_face_t): dword; cdecl; external libharfbuzz;
procedure hb_face_set_upem(face: Phb_face_t; upem: dword); cdecl; external libharfbuzz;
function hb_face_get_upem(face: Phb_face_t): dword; cdecl; external libharfbuzz;
procedure hb_face_set_glyph_count(face: Phb_face_t; glyph_count: dword); cdecl; external libharfbuzz;
function hb_face_get_glyph_count(face: Phb_face_t): dword; cdecl; external libharfbuzz;
function hb_face_get_table_tags(face: Phb_face_t; start_offset: dword; table_count: Pdword; table_tags: Phb_tag_t): dword; cdecl; external libharfbuzz;
procedure hb_face_collect_unicodes(face: Phb_face_t; out_: Phb_set_t); cdecl; external libharfbuzz;
procedure hb_face_collect_nominal_glyph_mapping(face: Phb_face_t; mapping: Phb_map_t; unicodes: Phb_set_t); cdecl; external libharfbuzz;
procedure hb_face_collect_variation_selectors(face: Phb_face_t; out_: Phb_set_t); cdecl; external libharfbuzz;
procedure hb_face_collect_variation_unicodes(face: Phb_face_t; variation_selector: Thb_codepoint_t; out_: Phb_set_t); cdecl; external libharfbuzz;
function hb_face_builder_create: Phb_face_t; cdecl; external libharfbuzz;
function hb_face_builder_add_table(face: Phb_face_t; tag: Thb_tag_t; blob: Phb_blob_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_face_builder_sort_tables(face: Phb_face_t; tags: Phb_tag_t); cdecl; external libharfbuzz;

// === Konventiert am: 25-12-24 19:51:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

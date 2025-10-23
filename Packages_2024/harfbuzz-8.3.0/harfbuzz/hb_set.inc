{$IFDEF read_interface}

const
  HB_SET_VALUE_INVALID = HB_CODEPOINT_INVALID;

type
  Thb_set_t = record
  end;
  Phb_set_t = ^Thb_set_t;

function hb_set_create: Phb_set_t; cdecl; external libharfbuzz;
function hb_set_get_empty: Phb_set_t; cdecl; external libharfbuzz;
function hb_set_reference(set_: Phb_set_t): Phb_set_t; cdecl; external libharfbuzz;
procedure hb_set_destroy(set_: Phb_set_t); cdecl; external libharfbuzz;
function hb_set_set_user_data(set_: Phb_set_t; key: Phb_user_data_key_t; Data: pointer; Destroy: Thb_destroy_func_t; replace: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_set_get_user_data(set_: Phb_set_t; key: Phb_user_data_key_t): pointer; cdecl; external libharfbuzz;
function hb_set_allocation_successful(set_: Phb_set_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_set_copy(set_: Phb_set_t): Phb_set_t; cdecl; external libharfbuzz;
procedure hb_set_clear(set_: Phb_set_t); cdecl; external libharfbuzz;
function hb_set_is_empty(set_: Phb_set_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_set_invert(set_: Phb_set_t); cdecl; external libharfbuzz;
function hb_set_is_inverted(set_: Phb_set_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_set_has(set_: Phb_set_t; codepoint: Thb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_set_add(set_: Phb_set_t; codepoint: Thb_codepoint_t); cdecl; external libharfbuzz;
procedure hb_set_add_range(set_: Phb_set_t; First: Thb_codepoint_t; last: Thb_codepoint_t); cdecl; external libharfbuzz;
procedure hb_set_add_sorted_array(set_: Phb_set_t; sorted_codepoints: Phb_codepoint_t; num_codepoints: dword); cdecl; external libharfbuzz;
procedure hb_set_del(set_: Phb_set_t; codepoint: Thb_codepoint_t); cdecl; external libharfbuzz;
procedure hb_set_del_range(set_: Phb_set_t; First: Thb_codepoint_t; last: Thb_codepoint_t); cdecl; external libharfbuzz;
function hb_set_is_equal(set_: Phb_set_t; other: Phb_set_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_set_hash(set_: Phb_set_t): dword; cdecl; external libharfbuzz;
function hb_set_is_subset(set_: Phb_set_t; larger_set_: Phb_set_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_set_set(set_: Phb_set_t; other: Phb_set_t); cdecl; external libharfbuzz;
procedure hb_set_union(set_: Phb_set_t; other: Phb_set_t); cdecl; external libharfbuzz;
procedure hb_set_intersect(set_: Phb_set_t; other: Phb_set_t); cdecl; external libharfbuzz;
procedure hb_set_subtract(set_: Phb_set_t; other: Phb_set_t); cdecl; external libharfbuzz;
procedure hb_set_symmetric_difference(set_: Phb_set_t; other: Phb_set_t); cdecl; external libharfbuzz;
function hb_set_get_population(set_: Phb_set_t): dword; cdecl; external libharfbuzz;
function hb_set_get_min(set_: Phb_set_t): Thb_codepoint_t; cdecl; external libharfbuzz;
function hb_set_get_max(set_: Phb_set_t): Thb_codepoint_t; cdecl; external libharfbuzz;
function hb_set_next(set_: Phb_set_t; codepoint: Phb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_set_previous(set_: Phb_set_t; codepoint: Phb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_set_next_range(set_: Phb_set_t; First: Phb_codepoint_t; last: Phb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_set_previous_range(set_: Phb_set_t; First: Phb_codepoint_t; last: Phb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_set_next_many(set_: Phb_set_t; codepoint: Thb_codepoint_t; out_: Phb_codepoint_t; size: dword): dword; cdecl; external libharfbuzz;


// === Konventiert am: 25-12-24 19:54:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

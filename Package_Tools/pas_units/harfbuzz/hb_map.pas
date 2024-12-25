unit hb_map;

interface

uses
  fp_glib2, hb_common, hb_set;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  HB_MAP_VALUE_INVALID = HB_CODEPOINT_INVALID;

type
  Thb_map_t = record
  end;
  Phb_map_t = ^Thb_map_t;

function hb_map_create: Phb_map_t; cdecl; external libharfbuzz;
function hb_map_get_empty: Phb_map_t; cdecl; external libharfbuzz;
function hb_map_reference(map: Phb_map_t): Phb_map_t; cdecl; external libharfbuzz;
procedure hb_map_destroy(map: Phb_map_t); cdecl; external libharfbuzz;
function hb_map_set_user_data(map: Phb_map_t; key: Phb_user_data_key_t; Data: pointer; Destroy: Thb_destroy_func_t; replace: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_map_get_user_data(map: Phb_map_t; key: Phb_user_data_key_t): pointer; cdecl; external libharfbuzz;
function hb_map_allocation_successful(map: Phb_map_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_map_copy(map: Phb_map_t): Phb_map_t; cdecl; external libharfbuzz;
procedure hb_map_clear(map: Phb_map_t); cdecl; external libharfbuzz;
function hb_map_is_empty(map: Phb_map_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_map_get_population(map: Phb_map_t): dword; cdecl; external libharfbuzz;
function hb_map_is_equal(map: Phb_map_t; other: Phb_map_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_map_hash(map: Phb_map_t): dword; cdecl; external libharfbuzz;
procedure hb_map_set(map: Phb_map_t; key: Thb_codepoint_t; Value: Thb_codepoint_t); cdecl; external libharfbuzz;
function hb_map_get(map: Phb_map_t; key: Thb_codepoint_t): Thb_codepoint_t; cdecl; external libharfbuzz;
procedure hb_map_del(map: Phb_map_t; key: Thb_codepoint_t); cdecl; external libharfbuzz;
function hb_map_has(map: Phb_map_t; key: Thb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_map_update(map: Phb_map_t; other: Phb_map_t); cdecl; external libharfbuzz;
function hb_map_next(map: Phb_map_t; idx: Plongint; key: Phb_codepoint_t; Value: Phb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_map_keys(map: Phb_map_t; keys: Phb_set_t); cdecl; external libharfbuzz;
procedure hb_map_values(map: Phb_map_t; values: Phb_set_t); cdecl; external libharfbuzz;

// === Konventiert am: 25-12-24 19:57:27 ===


implementation



end.

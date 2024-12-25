unit hb_draw;

interface

uses
  fp_glib2, hb_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Thb_draw_state_t = record
    path_open: Thb_bool_t;
    path_start_x: single;
    path_start_y: single;
    current_x: single;
    current_y: single;
    reserved1: Thb_var_num_t;
    reserved2: Thb_var_num_t;
    reserved3: Thb_var_num_t;
    reserved4: Thb_var_num_t;
    reserved5: Thb_var_num_t;
    reserved6: Thb_var_num_t;
    reserved7: Thb_var_num_t;
  end;
  Phb_draw_state_t = ^Thb_draw_state_t;

  Thb_draw_funcs_t = record
  end;
  Phb_draw_funcs_t = ^Thb_draw_funcs_t;

  Thb_draw_move_to_func_t = procedure(dfuncs: Phb_draw_funcs_t; draw_data: pointer; st: Phb_draw_state_t; to_x: single; to_y: single;
    user_data: pointer); cdecl;
  Thb_draw_line_to_func_t = procedure(dfuncs: Phb_draw_funcs_t; draw_data: pointer; st: Phb_draw_state_t; to_x: single; to_y: single;
    user_data: pointer); cdecl;
  Thb_draw_quadratic_to_func_t = procedure(dfuncs: Phb_draw_funcs_t; draw_data: pointer; st: Phb_draw_state_t; control_x: single; control_y: single;
    to_x: single; to_y: single; user_data: pointer); cdecl;
  Thb_draw_cubic_to_func_t = procedure(dfuncs: Phb_draw_funcs_t; draw_data: pointer; st: Phb_draw_state_t; control1_x: single; control1_y: single;
    control2_x: single; control2_y: single; to_x: single; to_y: single; user_data: pointer); cdecl;
  Thb_draw_close_path_func_t = procedure(dfuncs: Phb_draw_funcs_t; draw_data: pointer; st: Phb_draw_state_t; user_data: pointer); cdecl;

procedure hb_draw_funcs_set_move_to_func(dfuncs: Phb_draw_funcs_t; func: Thb_draw_move_to_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_draw_funcs_set_line_to_func(dfuncs: Phb_draw_funcs_t; func: Thb_draw_line_to_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_draw_funcs_set_quadratic_to_func(dfuncs: Phb_draw_funcs_t; func: Thb_draw_quadratic_to_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_draw_funcs_set_cubic_to_func(dfuncs: Phb_draw_funcs_t; func: Thb_draw_cubic_to_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_draw_funcs_set_close_path_func(dfuncs: Phb_draw_funcs_t; func: Thb_draw_close_path_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
function hb_draw_funcs_create: Phb_draw_funcs_t; cdecl; external libharfbuzz;
function hb_draw_funcs_get_empty: Phb_draw_funcs_t; cdecl; external libharfbuzz;
function hb_draw_funcs_reference(dfuncs: Phb_draw_funcs_t): Phb_draw_funcs_t; cdecl; external libharfbuzz;
procedure hb_draw_funcs_destroy(dfuncs: Phb_draw_funcs_t); cdecl; external libharfbuzz;
function hb_draw_funcs_set_user_data(dfuncs: Phb_draw_funcs_t; key: Phb_user_data_key_t; Data: pointer; Destroy: Thb_destroy_func_t; replace: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_draw_funcs_get_user_data(dfuncs: Phb_draw_funcs_t; key: Phb_user_data_key_t): pointer; cdecl; external libharfbuzz;
procedure hb_draw_funcs_make_immutable(dfuncs: Phb_draw_funcs_t); cdecl; external libharfbuzz;
function hb_draw_funcs_is_immutable(dfuncs: Phb_draw_funcs_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_draw_move_to(dfuncs: Phb_draw_funcs_t; draw_data: pointer; st: Phb_draw_state_t; to_x: single; to_y: single); cdecl; external libharfbuzz;
procedure hb_draw_line_to(dfuncs: Phb_draw_funcs_t; draw_data: pointer; st: Phb_draw_state_t; to_x: single; to_y: single); cdecl; external libharfbuzz;
procedure hb_draw_quadratic_to(dfuncs: Phb_draw_funcs_t; draw_data: pointer; st: Phb_draw_state_t; control_x: single; control_y: single;
  to_x: single; to_y: single); cdecl; external libharfbuzz;
procedure hb_draw_cubic_to(dfuncs: Phb_draw_funcs_t; draw_data: pointer; st: Phb_draw_state_t; control1_x: single; control1_y: single;
  control2_x: single; control2_y: single; to_x: single; to_y: single); cdecl; external libharfbuzz;
procedure hb_draw_close_path(dfuncs: Phb_draw_funcs_t; draw_data: pointer; st: Phb_draw_state_t); cdecl; external libharfbuzz;

// === Konventiert am: 25-12-24 19:32:53 ===


implementation



end.

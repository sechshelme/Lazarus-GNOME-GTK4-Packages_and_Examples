unit elm_code_widget_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_code_common, elm_code_line, elm_scroller_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Code_Widget = ^TElm_Code_Widget;
  TElm_Code_Widget = TEo;

procedure elm_code_widget_code_set(obj: PElm_Code_Widget; code: PElm_Code); cdecl; external libelementary;
function elm_code_widget_code_get(obj: PElm_Code_Widget): PElm_Code; cdecl; external libelementary;
procedure elm_code_widget_font_set(obj: PElm_Code_Widget; name: pchar; size: longint); cdecl; external libelementary;
procedure elm_code_widget_font_get(obj: PElm_Code_Widget; name: PPchar; size: Plongint); cdecl; external libelementary;
function elm_code_widget_columns_get(obj: PElm_Code_Widget): dword; cdecl; external libelementary;
procedure elm_code_widget_gravity_set(obj: PElm_Code_Widget; x: double; y: double); cdecl; external libelementary;
procedure elm_code_widget_gravity_get(obj: PElm_Code_Widget; x: Pdouble; y: Pdouble); cdecl; external libelementary;
procedure elm_code_widget_policy_set(obj: PElm_Code_Widget; policy_h: TElm_Scroller_Policy; policy_v: TElm_Scroller_Policy); cdecl; external libelementary;
procedure elm_code_widget_policy_get(obj: PElm_Code_Widget; policy_h: PElm_Scroller_Policy; policy_v: PElm_Scroller_Policy); cdecl; external libelementary;
procedure elm_code_widget_tabstop_set(obj: PElm_Code_Widget; tabstop: dword); cdecl; external libelementary;
function elm_code_widget_tabstop_get(obj: PElm_Code_Widget): dword; cdecl; external libelementary;
procedure elm_code_widget_editable_set(obj: PElm_Code_Widget; editable: TEina_Bool); cdecl; external libelementary;
function elm_code_widget_editable_get(obj: PElm_Code_Widget): TEina_Bool; cdecl; external libelementary;
procedure elm_code_widget_line_numbers_set(obj: PElm_Code_Widget; line_numbers: TEina_Bool); cdecl; external libelementary;
function elm_code_widget_line_numbers_get(obj: PElm_Code_Widget): TEina_Bool; cdecl; external libelementary;
procedure elm_code_widget_line_width_marker_set(obj: PElm_Code_Widget; line_width_marker: dword); cdecl; external libelementary;
function elm_code_widget_line_width_marker_get(obj: PElm_Code_Widget): dword; cdecl; external libelementary;
procedure elm_code_widget_show_whitespace_set(obj: PElm_Code_Widget; show_whitespace: TEina_Bool); cdecl; external libelementary;
function elm_code_widget_show_whitespace_get(obj: PElm_Code_Widget): TEina_Bool; cdecl; external libelementary;
procedure elm_code_widget_alpha_set(obj: PElm_Code_Widget; alpha: longint); cdecl; external libelementary;
function elm_code_widget_alpha_get(obj: PElm_Code_Widget): longint; cdecl; external libelementary;
procedure elm_code_widget_syntax_enabled_set(obj: PElm_Code_Widget; syntax_enabled: TEina_Bool); cdecl; external libelementary;
function elm_code_widget_syntax_enabled_get(obj: PElm_Code_Widget): TEina_Bool; cdecl; external libelementary;
procedure elm_code_widget_tab_inserts_spaces_set(obj: PElm_Code_Widget; tab_inserts_spaces: TEina_Bool); cdecl; external libelementary;
function elm_code_widget_tab_inserts_spaces_get(obj: PElm_Code_Widget): TEina_Bool; cdecl; external libelementary;
procedure elm_code_widget_cursor_position_set(obj: PElm_Code_Widget; row: dword; col: dword); cdecl; external libelementary;
procedure elm_code_widget_cursor_position_get(obj: PElm_Code_Widget; row: Pdword; col: Pdword); cdecl; external libelementary;
procedure elm_code_widget_theme_refresh(obj: PElm_Code_Widget); cdecl; external libelementary;
procedure elm_code_widget_line_refresh(obj: PElm_Code_Widget; line: PElm_Code_Line); cdecl; external libelementary;
function elm_code_widget_line_visible_get(obj: PElm_Code_Widget; line: PElm_Code_Line): TEina_Bool; cdecl; external libelementary;
function elm_code_widget_lines_visible_get(obj: PElm_Code_Widget): dword; cdecl; external libelementary;
function elm_code_widget_position_at_coordinates_get(obj: PElm_Code_Widget; x: longint; y: longint; row: Pdword; col: Plongint): TEina_Bool; cdecl; external libelementary;
function elm_code_widget_geometry_for_position_get(obj: PElm_Code_Widget; row: dword; col: longint; x: Plongint; y: Plongint;
  w: Plongint; h: Plongint): TEina_Bool; cdecl; external libelementary;
function elm_code_widget_text_left_gutter_width_get(obj: PElm_Code_Widget): longint; cdecl; external libelementary;
function elm_code_widget_text_between_positions_get(obj: PElm_Code_Widget; start_line: dword; start_col: dword; end_line: dword; end_col: dword): pchar; cdecl; external libelementary;
procedure elm_code_widget_text_at_cursor_insert(obj: PElm_Code_Widget; text: pchar); cdecl; external libelementary;
function elm_code_widget_line_text_column_width_to_position(obj: PElm_Code_Widget; line: PElm_Code_Line; position: dword): dword; cdecl; external libelementary;
function elm_code_widget_line_text_column_width_get(obj: PElm_Code_Widget; line: PElm_Code_Line): dword; cdecl; external libelementary;
function elm_code_widget_line_text_position_for_column_get(obj: PElm_Code_Widget; line: PElm_Code_Line; column: dword): dword; cdecl; external libelementary;
function elm_code_widget_text_tabwidth_at_column_get(obj: PElm_Code_Widget; column: dword): dword; cdecl; external libelementary;
procedure elm_code_widget_line_status_toggle(obj: PElm_Code_Widget; line: PElm_Code_Line); cdecl; external libelementary;
procedure elm_code_widget_undo(obj: PElm_Code_Widget); cdecl; external libelementary;
function elm_code_widget_can_undo_get(obj: PElm_Code_Widget): TEina_Bool; cdecl; external libelementary;
procedure elm_code_widget_redo(obj: PElm_Code_Widget); cdecl; external libelementary;
function elm_code_widget_can_redo_get(obj: PElm_Code_Widget): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 26-5-25 16:44:56 ===


implementation



end.

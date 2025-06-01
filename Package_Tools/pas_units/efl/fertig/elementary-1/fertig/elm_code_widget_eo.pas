unit elm_code_widget_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_code_common, elm_code_line;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Code_Widget = ^TElm_Code_Widget;
  TElm_Code_Widget = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PElm_Code_Widget_Scroller_Policy = ^TElm_Code_Widget_Scroller_Policy;
  TElm_Code_Widget_Scroller_Policy = longint;

const
  ELM_CODE_WIDGET_SCROLLER_POLICY_AUTO = 0;
  ELM_CODE_WIDGET_SCROLLER_POLICY_ON = 1;
  ELM_CODE_WIDGET_SCROLLER_POLICY_OFF = 2;
  ELM_CODE_WIDGET_SCROLLER_POLICY_LAST = 3;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_CODE_WIDGET_CLASS: PEfl_Class;

function elm_code_widget_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_code_widget_code_set(obj: PEo; code: PElm_Code); cdecl; external libelementary;
function efl_ui_code_widget_code_get(obj: PEo): PElm_Code; cdecl; external libelementary;
procedure efl_ui_code_widget_font_set(obj: PEo; name: pchar; size: longint); cdecl; external libelementary;
procedure efl_ui_code_widget_font_get(obj: PEo; name: PPchar; size: Plongint); cdecl; external libelementary;
function efl_ui_code_widget_columns_get(obj: PEo): dword; cdecl; external libelementary;
procedure efl_ui_code_widget_gravity_set(obj: PEo; x: double; y: double); cdecl; external libelementary;
procedure efl_ui_code_widget_gravity_get(obj: PEo; x: Pdouble; y: Pdouble); cdecl; external libelementary;
procedure efl_ui_code_widget_policy_set(obj: PEo; policy_h: TElm_Code_Widget_Scroller_Policy; policy_v: TElm_Code_Widget_Scroller_Policy); cdecl; external libelementary;
procedure efl_ui_code_widget_policy_get(obj: PEo; policy_h: PElm_Code_Widget_Scroller_Policy; policy_v: PElm_Code_Widget_Scroller_Policy); cdecl; external libelementary;
procedure efl_ui_code_widget_tabstop_set(obj: PEo; tabstop: dword); cdecl; external libelementary;
function efl_ui_code_widget_tabstop_get(obj: PEo): dword; cdecl; external libelementary;
procedure efl_ui_code_widget_editable_set(obj: PEo; editable: TEina_Bool); cdecl; external libelementary;
function efl_ui_code_widget_editable_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_code_widget_line_numbers_set(obj: PEo; line_numbers: TEina_Bool); cdecl; external libelementary;
function efl_ui_code_widget_line_numbers_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_code_widget_line_width_marker_set(obj: PEo; line_width_marker: dword); cdecl; external libelementary;
function efl_ui_code_widget_line_width_marker_get(obj: PEo): dword; cdecl; external libelementary;
procedure efl_ui_code_widget_show_whitespace_set(obj: PEo; show_whitespace: TEina_Bool); cdecl; external libelementary;
function efl_ui_code_widget_show_whitespace_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_code_widget_alpha_set(obj: PEo; alpha: longint); cdecl; external libelementary;
function efl_ui_code_widget_alpha_get(obj: PEo): longint; cdecl; external libelementary;
procedure efl_ui_code_widget_syntax_enabled_set(obj: PEo; syntax_enabled: TEina_Bool); cdecl; external libelementary;
function efl_ui_code_widget_syntax_enabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_code_widget_tab_inserts_spaces_set(obj: PEo; tab_inserts_spaces: TEina_Bool); cdecl; external libelementary;
function efl_ui_code_widget_tab_inserts_spaces_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_code_widget_cursor_position_set(obj: PEo; row: dword; col: dword); cdecl; external libelementary;
procedure efl_ui_code_widget_cursor_position_get(obj: PEo; row: Pdword; col: Pdword); cdecl; external libelementary;
procedure efl_ui_code_widget_theme_refresh(obj: PEo); cdecl; external libelementary;
procedure efl_ui_code_widget_line_refresh(obj: PEo; line: PElm_Code_Line); cdecl; external libelementary;
function efl_ui_code_widget_line_visible_get(obj: PEo; line: PElm_Code_Line): TEina_Bool; cdecl; external libelementary;
function efl_ui_code_widget_lines_visible_get(obj: PEo): dword; cdecl; external libelementary;
function efl_ui_code_widget_position_at_coordinates_get(obj: PEo; x: longint; y: longint; row: Pdword; col: Plongint): TEina_Bool; cdecl; external libelementary;
function efl_ui_code_widget_geometry_for_position_get(obj: PEo; row: dword; col: longint; x: Plongint; y: Plongint;
  w: Plongint; h: Plongint): TEina_Bool; cdecl; external libelementary;
function efl_ui_code_widget_text_left_gutter_width_get(obj: PEo): longint; cdecl; external libelementary;
function efl_ui_code_widget_text_between_positions_get(obj: PEo; start_line: dword; start_col: dword; end_line: dword; end_col: dword): pchar; cdecl; external libelementary;
procedure efl_ui_code_widget_text_at_cursor_insert(obj: PEo; text: pchar); cdecl; external libelementary;
function efl_ui_code_widget_line_text_column_width_to_position(obj: PEo; line: PElm_Code_Line; position: dword): dword; cdecl; external libelementary;
function efl_ui_code_widget_line_text_column_width_get(obj: PEo; line: PElm_Code_Line): dword; cdecl; external libelementary;
function efl_ui_code_widget_line_text_position_for_column_get(obj: PEo; line: PElm_Code_Line; column: dword): dword; cdecl; external libelementary;
function efl_ui_code_widget_text_tabwidth_at_column_get(obj: PEo; column: dword): dword; cdecl; external libelementary;
procedure efl_ui_code_widget_line_status_toggle(obj: PEo; line: PElm_Code_Line); cdecl; external libelementary;
procedure efl_ui_code_widget_undo(obj: PEo); cdecl; external libelementary;
function efl_ui_code_widget_can_undo_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_code_widget_redo(obj: PEo); cdecl; external libelementary;
function efl_ui_code_widget_can_redo_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

var
  _EFL_UI_CODE_WIDGET_EVENT_LINE_CLICKED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_CODE_WIDGET_EVENT_LINE_GUTTER_CLICKED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_CODE_WIDGET_EVENT_CHANGED_USER: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_CODE_WIDGET_EVENT_CURSOR_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_START: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CLEARED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CUT: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_COPY: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_PASTE: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_CODE_WIDGET_EVENT_LINE_CLICKED: PEfl_Event_Description;
function EFL_UI_CODE_WIDGET_EVENT_LINE_GUTTER_CLICKED: PEfl_Event_Description;
function EFL_UI_CODE_WIDGET_EVENT_CHANGED_USER: PEfl_Event_Description;
function EFL_UI_CODE_WIDGET_EVENT_CURSOR_CHANGED: PEfl_Event_Description;
function EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_START: PEfl_Event_Description;
function EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CHANGED: PEfl_Event_Description;
function EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CLEARED: PEfl_Event_Description;
function EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CUT: PEfl_Event_Description;
function EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_COPY: PEfl_Event_Description;
function EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_PASTE: PEfl_Event_Description;
{$endif}

// === Konventiert am: 26-5-25 13:35:43 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_CODE_WIDGET_CLASS: PEfl_Class;
begin
  ELM_CODE_WIDGET_CLASS := elm_code_widget_class_get;
end;

function EFL_UI_CODE_WIDGET_EVENT_LINE_CLICKED: PEfl_Event_Description;
begin
  EFL_UI_CODE_WIDGET_EVENT_LINE_CLICKED := @(_EFL_UI_CODE_WIDGET_EVENT_LINE_CLICKED);
end;

function EFL_UI_CODE_WIDGET_EVENT_LINE_GUTTER_CLICKED: PEfl_Event_Description;
begin
  EFL_UI_CODE_WIDGET_EVENT_LINE_GUTTER_CLICKED := @(_EFL_UI_CODE_WIDGET_EVENT_LINE_GUTTER_CLICKED);
end;

function EFL_UI_CODE_WIDGET_EVENT_CHANGED_USER: PEfl_Event_Description;
begin
  EFL_UI_CODE_WIDGET_EVENT_CHANGED_USER := @(_EFL_UI_CODE_WIDGET_EVENT_CHANGED_USER);
end;

function EFL_UI_CODE_WIDGET_EVENT_CURSOR_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_CODE_WIDGET_EVENT_CURSOR_CHANGED := @(_EFL_UI_CODE_WIDGET_EVENT_CURSOR_CHANGED);
end;

function EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_START: PEfl_Event_Description;
begin
  EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_START := @(_EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_START);
end;

function EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CHANGED := @(_EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CHANGED);
end;

function EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CLEARED: PEfl_Event_Description;
begin
  EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CLEARED := @(_EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CLEARED);
end;

function EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CUT: PEfl_Event_Description;
begin
  EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CUT := @(_EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_CUT);
end;

function EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_COPY: PEfl_Event_Description;
begin
  EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_COPY := @(_EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_COPY);
end;

function EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_PASTE: PEfl_Event_Description;
begin
  EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_PASTE := @(_EFL_UI_CODE_WIDGET_EVENT_CODE_SELECTION_PASTE);
end;
{$endif}


end.

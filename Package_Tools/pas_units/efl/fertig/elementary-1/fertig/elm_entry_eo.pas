unit elm_entry_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, elm_general, elm_entry_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Entry = ^TElm_Entry;
  TElm_Entry = TEo;

function ELM_ENTRY_CLASS: PEfl_Class;

function elm_entry_class_get: PEfl_Class; cdecl; external libelementary;
procedure elm_obj_entry_scrollable_set(obj: PEo; scroll: TEina_Bool); cdecl; external libelementary;
function elm_obj_entry_scrollable_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_input_panel_show_on_demand_set(obj: PEo; ondemand: TEina_Bool); cdecl; external libelementary;
function elm_obj_entry_input_panel_show_on_demand_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_context_menu_disabled_set(obj: PEo; disabled: TEina_Bool); cdecl; external libelementary;
function elm_obj_entry_context_menu_disabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_cnp_mode_set(obj: PEo; cnp_mode: TElm_Cnp_Mode); cdecl; external libelementary;
function elm_obj_entry_cnp_mode_get(obj: PEo): TElm_Cnp_Mode; cdecl; external libelementary;
procedure elm_obj_entry_file_text_format_set(obj: PEo; format: TElm_Text_Format); cdecl; external libelementary;
procedure elm_obj_entry_input_panel_language_set(obj: PEo; lang: TElm_Input_Panel_Lang); cdecl; external libelementary;
function elm_obj_entry_input_panel_language_get(obj: PEo): TElm_Input_Panel_Lang; cdecl; external libelementary;
procedure elm_obj_entry_selection_handler_disabled_set(obj: PEo; disabled: TEina_Bool); cdecl; external libelementary;
function elm_obj_entry_selection_handler_disabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_input_panel_layout_variation_set(obj: PEo; variation: longint); cdecl; external libelementary;
function elm_obj_entry_input_panel_layout_variation_get(obj: PEo): longint; cdecl; external libelementary;
procedure elm_obj_entry_autocapital_type_set(obj: PEo; autocapital_type: TElm_Autocapital_Type); cdecl; external libelementary;
function elm_obj_entry_autocapital_type_get(obj: PEo): TElm_Autocapital_Type; cdecl; external libelementary;
procedure elm_obj_entry_editable_set(obj: PEo; editable: TEina_Bool); cdecl; external libelementary;
function elm_obj_entry_editable_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_anchor_hover_style_set(obj: PEo; style: pchar); cdecl; external libelementary;
function elm_obj_entry_anchor_hover_style_get(obj: PEo): pchar; cdecl; external libelementary;
procedure elm_obj_entry_single_line_set(obj: PEo; single_line: TEina_Bool); cdecl; external libelementary;
function elm_obj_entry_single_line_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_password_set(obj: PEo; password: TEina_Bool); cdecl; external libelementary;
function elm_obj_entry_password_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_input_panel_return_key_disabled_set(obj: PEo; disabled: TEina_Bool); cdecl; external libelementary;
function elm_obj_entry_input_panel_return_key_disabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_autosave_set(obj: PEo; auto_save: TEina_Bool); cdecl; external libelementary;
function elm_obj_entry_autosave_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_anchor_hover_parent_set(obj: PEo; parent: PEfl_Canvas_Object); cdecl; external libelementary;
function elm_obj_entry_anchor_hover_parent_get(obj: PEo): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_obj_entry_prediction_allow_set(obj: PEo; prediction: TEina_Bool); cdecl; external libelementary;
function elm_obj_entry_prediction_allow_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_input_hint_set(obj: PEo; hints: TElm_Input_Hints); cdecl; external libelementary;
function elm_obj_entry_input_hint_get(obj: PEo): TElm_Input_Hints; cdecl; external libelementary;
procedure elm_obj_entry_input_panel_layout_set(obj: PEo; layout: TElm_Input_Panel_Layout); cdecl; external libelementary;
function elm_obj_entry_input_panel_layout_get(obj: PEo): TElm_Input_Panel_Layout; cdecl; external libelementary;
procedure elm_obj_entry_input_panel_return_key_type_set(obj: PEo; return_key_type: TElm_Input_Panel_Return_Key_Type); cdecl; external libelementary;
function elm_obj_entry_input_panel_return_key_type_get(obj: PEo): TElm_Input_Panel_Return_Key_Type; cdecl; external libelementary;
procedure elm_obj_entry_input_panel_enabled_set(obj: PEo; enabled: TEina_Bool); cdecl; external libelementary;
function elm_obj_entry_input_panel_enabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_line_wrap_set(obj: PEo; wrap: TElm_Wrap_Type); cdecl; external libelementary;
function elm_obj_entry_line_wrap_get(obj: PEo): TElm_Wrap_Type; cdecl; external libelementary;
procedure elm_obj_entry_cursor_pos_set(obj: PEo; pos: longint); cdecl; external libelementary;
function elm_obj_entry_cursor_pos_get(obj: PEo): longint; cdecl; external libelementary;
procedure elm_obj_entry_icon_visible_set(obj: PEo; setting: TEina_Bool); cdecl; external libelementary;
procedure elm_obj_entry_cursor_line_end_set(obj: PEo); cdecl; external libelementary;
procedure elm_obj_entry_select_region_set(obj: PEo; start: longint; end_: longint); cdecl; external libelementary;
procedure elm_obj_entry_select_region_get(obj: PEo; start: Plongint; end_: Plongint); cdecl; external libelementary;
procedure elm_obj_entry_input_panel_return_key_autoenabled_set(obj: PEo; enabled: TEina_Bool); cdecl; external libelementary;
procedure elm_obj_entry_end_visible_set(obj: PEo; setting: TEina_Bool); cdecl; external libelementary;
procedure elm_obj_entry_cursor_begin_set(obj: PEo); cdecl; external libelementary;
procedure elm_obj_entry_cursor_line_begin_set(obj: PEo); cdecl; external libelementary;
procedure elm_obj_entry_cursor_end_set(obj: PEo); cdecl; external libelementary;
function elm_obj_entry_textblock_get(obj: PEo): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_obj_entry_textblock_cursor_geometry_get(obj: PEo; x: Plongint; y: Plongint; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libelementary;
function elm_obj_entry_imf_context_get(obj: PEo): pointer; cdecl; external libelementary;
function elm_obj_entry_cursor_is_format_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
function elm_obj_entry_textblock_cursor_content_get(obj: PEo): pchar; cdecl; external libelementary;
function elm_obj_entry_selection_get(obj: PEo): pchar; cdecl; external libelementary;
function elm_obj_entry_cursor_is_visible_format_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_select_allow_set(obj: PEo; allow: TEina_Bool); cdecl; external libelementary;
function elm_obj_entry_select_allow_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
function elm_obj_entry_cursor_prev(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_text_style_user_pop(obj: PEo); cdecl; external libelementary;
procedure elm_obj_entry_item_provider_prepend(obj: PEo; func: TElm_Entry_Item_Provider_Cb; data: pointer); cdecl; external libelementary;
procedure elm_obj_entry_input_panel_show(obj: PEo); cdecl; external libelementary;
procedure elm_obj_entry_imf_context_reset(obj: PEo); cdecl; external libelementary;
procedure elm_obj_entry_anchor_hover_end(obj: PEo); cdecl; external libelementary;
procedure elm_obj_entry_cursor_selection_begin(obj: PEo); cdecl; external libelementary;
function elm_obj_entry_cursor_down(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_file_save(obj: PEo); cdecl; external libelementary;
procedure elm_obj_entry_selection_copy(obj: PEo); cdecl; external libelementary;
procedure elm_obj_entry_text_style_user_push(obj: PEo; style: pchar); cdecl; external libelementary;
procedure elm_obj_entry_item_provider_remove(obj: PEo; func: TElm_Entry_Item_Provider_Cb; data: pointer); cdecl; external libelementary;
function elm_obj_entry_text_style_user_peek(obj: PEo): pchar; cdecl; external libelementary;
procedure elm_obj_entry_context_menu_clear(obj: PEo); cdecl; external libelementary;
function elm_obj_entry_cursor_up(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_insert(obj: PEo; entry: pchar); cdecl; external libelementary;
procedure elm_obj_entry_input_panel_imdata_set(obj: PEo; data: pointer; len: longint); cdecl; external libelementary;
procedure elm_obj_entry_input_panel_imdata_get(obj: PEo; data: pointer; len: Plongint); cdecl; external libelementary;
procedure elm_obj_entry_selection_paste(obj: PEo); cdecl; external libelementary;
function elm_obj_entry_cursor_next(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_select_none(obj: PEo); cdecl; external libelementary;
procedure elm_obj_entry_input_panel_hide(obj: PEo); cdecl; external libelementary;
procedure elm_obj_entry_select_all(obj: PEo); cdecl; external libelementary;
procedure elm_obj_entry_cursor_selection_end(obj: PEo); cdecl; external libelementary;
procedure elm_obj_entry_selection_cut(obj: PEo); cdecl; external libelementary;
function elm_obj_entry_is_empty(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_entry_markup_filter_remove(obj: PEo; func: TElm_Entry_Filter_Cb; data: pointer); cdecl; external libelementary;
procedure elm_obj_entry_item_provider_append(obj: PEo; func: TElm_Entry_Item_Provider_Cb; data: pointer); cdecl; external libelementary;
procedure elm_obj_entry_markup_filter_append(obj: PEo; func: TElm_Entry_Filter_Cb; data: pointer); cdecl; external libelementary;
procedure elm_obj_entry_append(obj: PEo; str: pchar); cdecl; external libelementary;
procedure elm_obj_entry_context_menu_item_add(obj: PEo; _label: pchar; icon_file: pchar; icon_type: TElm_Icon_Type; func: TEvas_Smart_Cb; data: pointer); cdecl; external libelementary;
procedure elm_obj_entry_markup_filter_prepend(obj: PEo; func: TElm_Entry_Filter_Cb; data: pointer); cdecl; external libelementary;
procedure elm_obj_entry_prediction_hint_set(obj: PEo; prediction_hint: pchar); cdecl; external libelementary;
function elm_obj_entry_prediction_hint_hash_set(obj: PEo; key: pchar; value: pchar): TEina_Bool; cdecl; external libelementary;
function elm_obj_entry_prediction_hint_hash_del(obj: PEo; key: pchar): TEina_Bool; cdecl; external libelementary;

var
  _ELM_ENTRY_EVENT_ACTIVATED: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_CHANGED_USER: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_VALIDATE: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_CONTEXT_OPEN: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_ANCHOR_CLICKED: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_REJECTED: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_MAXLENGTH_REACHED: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_PREEDIT_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_PRESS: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_REDO_REQUEST: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_UNDO_REQUEST: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_TEXT_SET_DONE: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_ABORTED: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_ANCHOR_DOWN: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_ANCHOR_HOVER_OPENED: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_ANCHOR_IN: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_ANCHOR_OUT: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_ANCHOR_UP: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_CURSOR_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _ELM_ENTRY_EVENT_CURSOR_CHANGED_MANUAL: TEfl_Event_Description; cvar;external libelementary;

function ELM_ENTRY_EVENT_ACTIVATED: PEfl_Event_Description;
function ELM_ENTRY_EVENT_CHANGED: PEfl_Event_Description;
function ELM_ENTRY_EVENT_CHANGED_USER: PEfl_Event_Description;
function ELM_ENTRY_EVENT_VALIDATE: PEfl_Event_Description;
function ELM_ENTRY_EVENT_CONTEXT_OPEN: PEfl_Event_Description;
function ELM_ENTRY_EVENT_ANCHOR_CLICKED: PEfl_Event_Description;
function ELM_ENTRY_EVENT_REJECTED: PEfl_Event_Description;
function ELM_ENTRY_EVENT_MAXLENGTH_REACHED: PEfl_Event_Description;
function ELM_ENTRY_EVENT_PREEDIT_CHANGED: PEfl_Event_Description;
function ELM_ENTRY_EVENT_PRESS: PEfl_Event_Description;
function ELM_ENTRY_EVENT_REDO_REQUEST: PEfl_Event_Description;
function ELM_ENTRY_EVENT_UNDO_REQUEST: PEfl_Event_Description;
function ELM_ENTRY_EVENT_TEXT_SET_DONE: PEfl_Event_Description;
function ELM_ENTRY_EVENT_ABORTED: PEfl_Event_Description;
function ELM_ENTRY_EVENT_ANCHOR_DOWN: PEfl_Event_Description;
function ELM_ENTRY_EVENT_ANCHOR_HOVER_OPENED: PEfl_Event_Description;
function ELM_ENTRY_EVENT_ANCHOR_IN: PEfl_Event_Description;
function ELM_ENTRY_EVENT_ANCHOR_OUT: PEfl_Event_Description;
function ELM_ENTRY_EVENT_ANCHOR_UP: PEfl_Event_Description;
function ELM_ENTRY_EVENT_CURSOR_CHANGED: PEfl_Event_Description;
function ELM_ENTRY_EVENT_CURSOR_CHANGED_MANUAL: PEfl_Event_Description;

// === Konventiert am: 25-5-25 18:43:44 ===


implementation


function ELM_ENTRY_CLASS: PEfl_Class;
begin
  ELM_ENTRY_CLASS := elm_entry_class_get;
end;

function ELM_ENTRY_EVENT_ACTIVATED: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_ACTIVATED := @(_ELM_ENTRY_EVENT_ACTIVATED);
end;

function ELM_ENTRY_EVENT_CHANGED: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_CHANGED := @(_ELM_ENTRY_EVENT_CHANGED);
end;

function ELM_ENTRY_EVENT_CHANGED_USER: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_CHANGED_USER := @(_ELM_ENTRY_EVENT_CHANGED_USER);
end;

function ELM_ENTRY_EVENT_VALIDATE: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_VALIDATE := @(_ELM_ENTRY_EVENT_VALIDATE);
end;

function ELM_ENTRY_EVENT_CONTEXT_OPEN: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_CONTEXT_OPEN := @(_ELM_ENTRY_EVENT_CONTEXT_OPEN);
end;

function ELM_ENTRY_EVENT_ANCHOR_CLICKED: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_ANCHOR_CLICKED := @(_ELM_ENTRY_EVENT_ANCHOR_CLICKED);
end;

function ELM_ENTRY_EVENT_REJECTED: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_REJECTED := @(_ELM_ENTRY_EVENT_REJECTED);
end;

function ELM_ENTRY_EVENT_MAXLENGTH_REACHED: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_MAXLENGTH_REACHED := @(_ELM_ENTRY_EVENT_MAXLENGTH_REACHED);
end;

function ELM_ENTRY_EVENT_PREEDIT_CHANGED: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_PREEDIT_CHANGED := @(_ELM_ENTRY_EVENT_PREEDIT_CHANGED);
end;

function ELM_ENTRY_EVENT_PRESS: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_PRESS := @(_ELM_ENTRY_EVENT_PRESS);
end;

function ELM_ENTRY_EVENT_REDO_REQUEST: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_REDO_REQUEST := @(_ELM_ENTRY_EVENT_REDO_REQUEST);
end;

function ELM_ENTRY_EVENT_UNDO_REQUEST: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_UNDO_REQUEST := @(_ELM_ENTRY_EVENT_UNDO_REQUEST);
end;

function ELM_ENTRY_EVENT_TEXT_SET_DONE: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_TEXT_SET_DONE := @(_ELM_ENTRY_EVENT_TEXT_SET_DONE);
end;

function ELM_ENTRY_EVENT_ABORTED: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_ABORTED := @(_ELM_ENTRY_EVENT_ABORTED);
end;

function ELM_ENTRY_EVENT_ANCHOR_DOWN: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_ANCHOR_DOWN := @(_ELM_ENTRY_EVENT_ANCHOR_DOWN);
end;

function ELM_ENTRY_EVENT_ANCHOR_HOVER_OPENED: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_ANCHOR_HOVER_OPENED := @(_ELM_ENTRY_EVENT_ANCHOR_HOVER_OPENED);
end;

function ELM_ENTRY_EVENT_ANCHOR_IN: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_ANCHOR_IN := @(_ELM_ENTRY_EVENT_ANCHOR_IN);
end;

function ELM_ENTRY_EVENT_ANCHOR_OUT: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_ANCHOR_OUT := @(_ELM_ENTRY_EVENT_ANCHOR_OUT);
end;

function ELM_ENTRY_EVENT_ANCHOR_UP: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_ANCHOR_UP := @(_ELM_ENTRY_EVENT_ANCHOR_UP);
end;

function ELM_ENTRY_EVENT_CURSOR_CHANGED: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_CURSOR_CHANGED := @(_ELM_ENTRY_EVENT_CURSOR_CHANGED);
end;

function ELM_ENTRY_EVENT_CURSOR_CHANGED_MANUAL: PEfl_Event_Description;
begin
  ELM_ENTRY_EVENT_CURSOR_CHANGED_MANUAL := @(_ELM_ENTRY_EVENT_CURSOR_CHANGED_MANUAL);
end;


end.

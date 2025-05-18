unit elm_entry_eo_legacy;

interface

uses
  ctypes, efl, fp_eina,fp_eo, Evas_Common, elm_general, elm_entry_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PElm_Entry = ^TElm_Entry;
  TElm_Entry = TEo;

procedure elm_entry_scrollable_set(obj: PElm_Entry; scroll: TEina_Bool); cdecl; external libelementary;
function elm_entry_scrollable_get(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_input_panel_show_on_demand_set(obj: PElm_Entry; ondemand: TEina_Bool); cdecl; external libelementary;
function elm_entry_input_panel_show_on_demand_get(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_context_menu_disabled_set(obj: PElm_Entry; disabled: TEina_Bool); cdecl; external libelementary;
function elm_entry_context_menu_disabled_get(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_cnp_mode_set(obj: PElm_Entry; cnp_mode: TElm_Cnp_Mode); cdecl; external libelementary;
function elm_entry_cnp_mode_get(obj: PElm_Entry): TElm_Cnp_Mode; cdecl; external libelementary;
procedure elm_entry_file_text_format_set(obj: PElm_Entry; format: TElm_Text_Format); cdecl; external libelementary;
procedure elm_entry_input_panel_language_set(obj: PElm_Entry; lang: TElm_Input_Panel_Lang); cdecl; external libelementary;
function elm_entry_input_panel_language_get(obj: PElm_Entry): TElm_Input_Panel_Lang; cdecl; external libelementary;
procedure elm_entry_selection_handler_disabled_set(obj: PElm_Entry; disabled: TEina_Bool); cdecl; external libelementary;
procedure elm_entry_input_panel_layout_variation_set(obj: PElm_Entry; variation: longint); cdecl; external libelementary;
function elm_entry_input_panel_layout_variation_get(obj: PElm_Entry): longint; cdecl; external libelementary;
procedure elm_entry_autocapital_type_set(obj: PElm_Entry; autocapital_type: TElm_Autocapital_Type); cdecl; external libelementary;
function elm_entry_autocapital_type_get(obj: PElm_Entry): TElm_Autocapital_Type; cdecl; external libelementary;
procedure elm_entry_editable_set(obj: PElm_Entry; editable: TEina_Bool); cdecl; external libelementary;
function elm_entry_editable_get(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_anchor_hover_style_set(obj: PElm_Entry; style: pchar); cdecl; external libelementary;
function elm_entry_anchor_hover_style_get(obj: PElm_Entry): pchar; cdecl; external libelementary;
procedure elm_entry_single_line_set(obj: PElm_Entry; single_line: TEina_Bool); cdecl; external libelementary;
function elm_entry_single_line_get(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_password_set(obj: PElm_Entry; password: TEina_Bool); cdecl; external libelementary;
function elm_entry_password_get(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_input_panel_return_key_disabled_set(obj: PElm_Entry; disabled: TEina_Bool); cdecl; external libelementary;
function elm_entry_input_panel_return_key_disabled_get(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_autosave_set(obj: PElm_Entry; auto_save: TEina_Bool); cdecl; external libelementary;
function elm_entry_autosave_get(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_anchor_hover_parent_set(obj: PElm_Entry; parent: PEfl_Canvas_Object); cdecl; external libelementary;
function elm_entry_anchor_hover_parent_get(obj: PElm_Entry): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_entry_prediction_allow_set(obj: PElm_Entry; prediction: TEina_Bool); cdecl; external libelementary;
function elm_entry_prediction_allow_get(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_input_hint_set(obj: PElm_Entry; hints: TElm_Input_Hints); cdecl; external libelementary;
function elm_entry_input_hint_get(obj: PElm_Entry): TElm_Input_Hints; cdecl; external libelementary;
procedure elm_entry_input_panel_layout_set(obj: PElm_Entry; layout: TElm_Input_Panel_Layout); cdecl; external libelementary;
function elm_entry_input_panel_layout_get(obj: PElm_Entry): TElm_Input_Panel_Layout; cdecl; external libelementary;
procedure elm_entry_input_panel_return_key_type_set(obj: PElm_Entry; return_key_type: TElm_Input_Panel_Return_Key_Type); cdecl; external libelementary;
function elm_entry_input_panel_return_key_type_get(obj: PElm_Entry): TElm_Input_Panel_Return_Key_Type; cdecl; external libelementary;
procedure elm_entry_input_panel_enabled_set(obj: PElm_Entry; enabled: TEina_Bool); cdecl; external libelementary;
function elm_entry_input_panel_enabled_get(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_line_wrap_set(obj: PElm_Entry; wrap: TElm_Wrap_Type); cdecl; external libelementary;
function elm_entry_line_wrap_get(obj: PElm_Entry): TElm_Wrap_Type; cdecl; external libelementary;
procedure elm_entry_cursor_pos_set(obj: PElm_Entry; pos: longint); cdecl; external libelementary;
function elm_entry_cursor_pos_get(obj: PElm_Entry): longint; cdecl; external libelementary;
procedure elm_entry_icon_visible_set(obj: PElm_Entry; setting: TEina_Bool); cdecl; external libelementary;
procedure elm_entry_cursor_line_end_set(obj: PElm_Entry); cdecl; external libelementary;
procedure elm_entry_select_region_set(obj: PElm_Entry; start: longint; end_: longint); cdecl; external libelementary;
procedure elm_entry_select_region_get(obj: PElm_Entry; start: Plongint; end_: Plongint); cdecl; external libelementary;
procedure elm_entry_input_panel_return_key_autoenabled_set(obj: PElm_Entry; enabled: TEina_Bool); cdecl; external libelementary;
procedure elm_entry_end_visible_set(obj: PElm_Entry; setting: TEina_Bool); cdecl; external libelementary;
procedure elm_entry_cursor_begin_set(obj: PElm_Entry); cdecl; external libelementary;
procedure elm_entry_cursor_line_begin_set(obj: PElm_Entry); cdecl; external libelementary;
procedure elm_entry_cursor_end_set(obj: PElm_Entry); cdecl; external libelementary;
function elm_entry_textblock_get(obj: PElm_Entry): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_entry_cursor_geometry_get(obj: PElm_Entry; x: Plongint; y: Plongint; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libelementary;
function elm_entry_imf_context_get(obj: PElm_Entry): pointer; cdecl; external libelementary;
function elm_entry_cursor_is_format_get(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
function elm_entry_cursor_content_get(obj: PElm_Entry): pchar; cdecl; external libelementary;
function elm_entry_selection_get(obj: PElm_Entry): pchar; cdecl; external libelementary;
function elm_entry_cursor_is_visible_format_get(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_select_allow_set(obj: PElm_Entry; allow: TEina_Bool); cdecl; external libelementary;
function elm_entry_select_allow_get(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
function elm_entry_cursor_prev(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_text_style_user_pop(obj: PElm_Entry); cdecl; external libelementary;
procedure elm_entry_item_provider_prepend(obj: PElm_Entry; func: TElm_Entry_Item_Provider_Cb; data: pointer); cdecl; external libelementary;
procedure elm_entry_input_panel_show(obj: PElm_Entry); cdecl; external libelementary;
procedure elm_entry_imf_context_reset(obj: PElm_Entry); cdecl; external libelementary;
procedure elm_entry_anchor_hover_end(obj: PElm_Entry); cdecl; external libelementary;
procedure elm_entry_cursor_selection_begin(obj: PElm_Entry); cdecl; external libelementary;
function elm_entry_cursor_down(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_file_save(obj: PElm_Entry); cdecl; external libelementary;
procedure elm_entry_selection_copy(obj: PElm_Entry); cdecl; external libelementary;
procedure elm_entry_text_style_user_push(obj: PElm_Entry; style: pchar); cdecl; external libelementary;
procedure elm_entry_item_provider_remove(obj: PElm_Entry; func: TElm_Entry_Item_Provider_Cb; data: pointer); cdecl; external libelementary;
function elm_entry_text_style_user_peek(obj: PElm_Entry): pchar; cdecl; external libelementary;
procedure elm_entry_context_menu_clear(obj: PElm_Entry); cdecl; external libelementary;
function elm_entry_cursor_up(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_entry_insert(obj: PElm_Entry; entry: pchar); cdecl; external libelementary;
procedure elm_entry_input_panel_imdata_set(obj: PElm_Entry; data: pointer; len: longint); cdecl; external libelementary;
procedure elm_entry_input_panel_imdata_get(obj: PElm_Entry; data: pointer; len: Plongint); cdecl; external libelementary;
procedure elm_entry_selection_paste(obj: PElm_Entry); cdecl; external libelementary;
function elm_entry_cursor_next(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_select_none(obj: PElm_Entry); cdecl; external libelementary;
procedure elm_entry_input_panel_hide(obj: PElm_Entry); cdecl; external libelementary;
procedure elm_entry_select_all(obj: PElm_Entry); cdecl; external libelementary;
procedure elm_entry_cursor_selection_end(obj: PElm_Entry); cdecl; external libelementary;
procedure elm_entry_selection_cut(obj: PElm_Entry); cdecl; external libelementary;
function elm_entry_is_empty(obj: PElm_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_markup_filter_remove(obj: PElm_Entry; func: TElm_Entry_Filter_Cb; data: pointer); cdecl; external libelementary;
procedure elm_entry_item_provider_append(obj: PElm_Entry; func: TElm_Entry_Item_Provider_Cb; data: pointer); cdecl; external libelementary;
procedure elm_entry_markup_filter_append(obj: PElm_Entry; func: TElm_Entry_Filter_Cb; data: pointer); cdecl; external libelementary;
procedure elm_entry_entry_append(obj: PElm_Entry; str: pchar); cdecl; external libelementary;
procedure elm_entry_context_menu_item_add(obj: PElm_Entry; _label: pchar; icon_file: pchar; icon_type: TElm_Icon_Type; func: TEvas_Smart_Cb; data: pointer); cdecl; external libelementary;
procedure elm_entry_markup_filter_prepend(obj: PElm_Entry; func: TElm_Entry_Filter_Cb; data: pointer); cdecl; external libelementary;
procedure elm_entry_prediction_hint_set(obj: PElm_Entry; prediction_hint: pchar); cdecl; external libelementary;
function elm_entry_prediction_hint_hash_set(obj: PElm_Entry; key: pchar; value: pchar): TEina_Bool; cdecl; external libelementary;
function elm_entry_prediction_hint_hash_del(obj: PElm_Entry; key: pchar): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 13-5-25 14:06:07 ===


implementation



end.

{$IFDEF read_interface}


function edje_object_add(evas: PEvas): PEvas_Object; cdecl; external libedje;
function edje_object_preload(obj: PEvas_Object; cancel: TEina_Bool): TEina_Bool; cdecl; external libedje;
procedure edje_object_signal_callback_add(obj: PEvas_Object; emission: pchar; source: pchar; func: TEdje_Signal_Cb; data: pointer); cdecl; external libedje;
procedure edje_object_signal_emit(obj: PEvas_Object; emission: pchar; source: pchar); cdecl; external libedje;
function edje_object_signal_callback_del(obj: PEvas_Object; emission: pchar; source: pchar; func: TEdje_Signal_Cb): pointer; cdecl; external libedje;
function edje_object_signal_callback_del_full(obj: PEvas_Object; emission: pchar; source: pchar; func: TEdje_Signal_Cb; data: pointer): pointer; cdecl; external libedje;

type
  PEdje_Load_Error = ^TEdje_Load_Error;
  TEdje_Load_Error = longint;

const
  EDJE_LOAD_ERROR_NONE = 0;
  EDJE_LOAD_ERROR_GENERIC = 1;
  EDJE_LOAD_ERROR_DOES_NOT_EXIST = 2;
  EDJE_LOAD_ERROR_PERMISSION_DENIED = 3;
  EDJE_LOAD_ERROR_RESOURCE_ALLOCATION_FAILED = 4;
  EDJE_LOAD_ERROR_CORRUPT_FILE = 5;
  EDJE_LOAD_ERROR_UNKNOWN_FORMAT = 6;
  EDJE_LOAD_ERROR_INCOMPATIBLE_FILE = 7;
  EDJE_LOAD_ERROR_UNKNOWN_COLLECTION = 8;
  EDJE_LOAD_ERROR_RECURSIVE_REFERENCE = 9;

function edje_object_load_error_get(obj: PEvas_Object): TEdje_Load_Error; cdecl; external libedje;
function edje_load_error_str(error: TEdje_Load_Error): pchar; cdecl; external libedje;
function edje_object_part_geometry_get(obj: PEvas_Object; part: pchar; x: Plongint; y: Plongint; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libedje;
function edje_object_part_state_get(obj: PEvas_Object; part: pchar; val_ret: Pdouble): pchar; cdecl; external libedje;
function edje_object_part_object_get(obj: PEvas_Object; part: pchar): PEfl_Canvas_Object; cdecl; external libedje;
procedure edje_object_update_hints_set(obj: PEvas_Object; update: TEina_Bool); cdecl; external libedje;
function edje_object_update_hints_get(obj: PEvas_Object): TEina_Bool; cdecl; external libedje;
procedure edje_object_size_min_calc(obj: PEvas_Object; minw: Plongint; minh: Plongint); cdecl; external libedje;
procedure edje_object_size_min_restricted_calc(obj: PEvas_Object; minw: Plongint; minh: Plongint; restrictedw: longint; restrictedh: longint); cdecl; external libedje;
function edje_object_parts_extends_calc(obj: PEvas_Object; x: Plongint; y: Plongint; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libedje;
procedure edje_object_calc_force(obj: PEvas_Object); cdecl; external libedje;
function edje_object_freeze(obj: PEvas_Object): longint; cdecl; external libedje;
function edje_object_thaw(obj: PEvas_Object): longint; cdecl; external libedje;

type
  TEdje_Text_Change_Cb = procedure(data: pointer; obj: PEvas_Object; part: pchar); cdecl;

procedure edje_object_text_change_cb_set(obj: PEvas_Object; func: TEdje_Text_Change_Cb; data: pointer); cdecl; external libedje;

type
  TEdje_Message_String = record
    str: pchar;
  end;
  PEdje_Message_String = ^TEdje_Message_String;

  TEdje_Message_Int = record
    val: longint;
  end;
  PEdje_Message_Int = ^TEdje_Message_Int;

  TEdje_Message_Float = record
    val: double;
  end;
  PEdje_Message_Float = ^TEdje_Message_Float;

  TEdje_Message_String_Set = record
    count: longint;
    str: array[0..0] of pchar;
  end;
  PEdje_Message_String_Set = ^TEdje_Message_String_Set;

  TEdje_Message_Int_Set = record
    count: longint;
    val: array[0..0] of longint;
  end;
  PEdje_Message_Int_Set = ^TEdje_Message_Int_Set;

  TEdje_Message_Float_Set = record
    count: longint;
    val: array[0..0] of double;
  end;
  PEdje_Message_Float_Set = ^TEdje_Message_Float_Set;

  TEdje_Message_String_Int = record
    str: pchar;
    val: longint;
  end;
  PEdje_Message_String_Int = ^TEdje_Message_String_Int;

  TEdje_Message_String_Float = record
    str: pchar;
    val: double;
  end;
  PEdje_Message_String_Float = ^TEdje_Message_String_Float;

  TEdje_Message_String_Int_Set = record
    str: pchar;
    count: longint;
    val: array[0..0] of longint;
  end;
  PEdje_Message_String_Int_Set = ^TEdje_Message_String_Int_Set;

  TEdje_Message_String_Float_Set = record
    str: pchar;
    count: longint;
    val: array[0..0] of double;
  end;
  PEdje_Message_String_Float_Set = ^TEdje_Message_String_Float_Set;


  PEdje_Message_Type = ^TEdje_Message_Type;
  TEdje_Message_Type = longint;

const
  EDJE_MESSAGE_NONE = 0;
  EDJE_MESSAGE_SIGNAL = 1;
  EDJE_MESSAGE_STRING = 2;
  EDJE_MESSAGE_INT = 3;
  EDJE_MESSAGE_FLOAT = 4;
  EDJE_MESSAGE_STRING_SET = 5;
  EDJE_MESSAGE_INT_SET = 6;
  EDJE_MESSAGE_FLOAT_SET = 7;
  EDJE_MESSAGE_STRING_INT = 8;
  EDJE_MESSAGE_STRING_FLOAT = 9;
  EDJE_MESSAGE_STRING_INT_SET = 10;
  EDJE_MESSAGE_STRING_FLOAT_SET = 11;

type
  TEdje_Message_Handler_Cb = procedure(data: pointer; obj: PEvas_Object; _type: TEdje_Message_Type; id: longint; msg: pointer); cdecl;

procedure edje_object_message_handler_set(obj: PEvas_Object; func: TEdje_Message_Handler_Cb; data: pointer); cdecl; external libedje;
procedure edje_object_message_send(obj: PEvas_Object; _type: TEdje_Message_Type; id: longint; msg: pointer); cdecl; external libedje;
procedure edje_object_message_signal_process(obj: PEvas_Object); cdecl; external libedje;
procedure edje_object_message_signal_recursive_process(obj: PEvas_Object); cdecl; external libedje;
function edje_object_part_external_param_type_get(obj: PEvas_Object; part: pchar; param: pchar): TEdje_External_Param_Type; cdecl; external libedje;
function edje_object_part_external_param_set(obj: PEvas_Object; part: pchar; param: PEdje_External_Param): TEina_Bool; cdecl; external libedje;
function edje_object_part_external_param_get(obj: PEvas_Object; part: pchar; param: PEdje_External_Param): TEina_Bool; cdecl; external libedje;
function edje_object_part_external_object_get(obj: PEvas_Object; part: pchar): PEvas_Object; cdecl; external libedje;
function edje_object_part_external_content_get(obj: PEvas_Object; part: pchar; content: pchar): PEvas_Object; cdecl; external libedje;
procedure edje_extern_object_min_size_set(obj: PEvas_Object; minw: TEvas_Coord; minh: TEvas_Coord); cdecl; external libedje; deprecated;
procedure edje_extern_object_max_size_set(obj: PEvas_Object; maxw: TEvas_Coord; maxh: TEvas_Coord); cdecl; external libedje; deprecated;
procedure edje_extern_object_aspect_set(obj: PEvas_Object; aspect: TEdje_Aspect_Control; aw: TEvas_Coord; ah: TEvas_Coord); cdecl; external libedje; deprecated;
function edje_object_file_set(obj: PEvas_Object; file_: pchar; group: pchar): TEina_Bool; cdecl; external libedje;
procedure edje_object_file_get(obj: PEvas_Object; file_: PPchar; group: PPchar); cdecl; external libedje;
function edje_object_mmap_set(obj: PEvas_Object; file_: PEina_File; group: pchar): TEina_Bool; cdecl; external libedje;
function edje_object_part_swallow(obj: PEvas_Object; part: pchar; obj_swallow: PEvas_Object): TEina_Bool; cdecl; external libedje;
function edje_object_part_swallow_get(obj: PEvas_Object; part: pchar): PEvas_Object; cdecl; external libedje;
procedure edje_object_part_unswallow(obj: PEvas_Object; obj_swallow: PEvas_Object); cdecl; external libedje;
function edje_object_access_part_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_object_part_box_append(obj: PEvas_Object; part: pchar; child: PEvas_Object): TEina_Bool; cdecl; external libedje;
function edje_object_part_box_prepend(obj: PEvas_Object; part: pchar; child: PEvas_Object): TEina_Bool; cdecl; external libedje;
function edje_object_part_box_insert_before(obj: PEvas_Object; part: pchar; child: PEvas_Object; reference: PEvas_Object): TEina_Bool; cdecl; external libedje;
function edje_object_part_box_insert_after(obj: PEvas_Object; part: pchar; child: PEvas_Object; reference: PEvas_Object): TEina_Bool; cdecl; external libedje;
function edje_object_part_box_insert_at(obj: PEvas_Object; part: pchar; child: PEvas_Object; pos: dword): TEina_Bool; cdecl; external libedje;
function edje_object_part_box_remove_at(obj: PEvas_Object; part: pchar; pos: dword): PEvas_Object; cdecl; external libedje;
function edje_object_part_box_remove(obj: PEvas_Object; part: pchar; child: PEvas_Object): PEvas_Object; cdecl; external libedje;
function edje_object_part_box_remove_all(obj: PEvas_Object; part: pchar; clear: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_object_part_table_pack(obj: PEvas_Object; part: pchar; child_obj: PEvas_Object; col: word; row: word; colspan: word; rowspan: word): TEina_Bool; cdecl; external libedje;
function edje_object_part_table_unpack(obj: PEvas_Object; part: pchar; child_obj: PEvas_Object): TEina_Bool; cdecl; external libedje;
function edje_object_part_table_col_row_size_get(obj: PEvas_Object; part: pchar; cols: Plongint; rows: Plongint): TEina_Bool; cdecl; external libedje;
function edje_object_part_table_child_get(obj: PEvas_Object; part: pchar; col: dword; row: dword): PEvas_Object; cdecl; external libedje;
function edje_object_part_table_clear(obj: PEvas_Object; part: pchar; clear: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_object_color_class_set(obj: PEvas_Object; color_class: pchar; r: longint; g: longint; b: longint; a: longint; r2: longint; g2: longint; b2: longint; a2: longint; r3: longint; g3: longint; b3: longint; a3: longint): TEina_Bool; cdecl; external libedje;
function edje_object_color_class_get(obj: PEvas_Object; color_class: pchar; r: Plongint; g: Plongint; b: Plongint; a: Plongint; r2: Plongint; g2: Plongint; b2: Plongint; a2: Plongint; r3: Plongint; g3: Plongint; b3: Plongint; a3: Plongint): TEina_Bool; cdecl; external libedje;
procedure edje_object_color_class_del(obj: PEvas_Object; color_class: pchar); cdecl; external libedje;
function edje_object_color_class_clear(obj: PEvas_Object): TEina_Bool; cdecl; external libedje;
function edje_object_text_class_set(obj: PEvas_Object; text_class: pchar; font: pchar; size: TEvas_Font_Size): TEina_Bool; cdecl; external libedje;
function edje_object_text_class_get(obj: PEvas_Object; text_class: pchar; font: PPchar; size: PEvas_Font_Size): TEina_Bool; cdecl; external libedje;
procedure edje_object_text_class_del(obj: PEvas_Object; text_class: pchar); cdecl; external libedje;
function edje_object_size_class_set(obj: PEvas_Object; size_class: pchar; minw: longint; minh: longint; maxw: longint; maxh: longint): TEina_Bool; cdecl; external libedje;
function edje_object_size_class_get(obj: PEvas_Object; size_class: pchar; minw: Plongint; minh: Plongint; maxw: Plongint; maxh: Plongint): TEina_Bool; cdecl; external libedje;
procedure edje_object_size_class_del(obj: PEvas_Object; size_class: pchar); cdecl; external libedje;
procedure edje_object_part_text_select_allow_set(obj: PEvas_Object; part: pchar; allow: TEina_Bool); cdecl; external libedje;
procedure edje_object_mirrored_set(obj: PEvas_Object; rtl: TEina_Bool); cdecl; external libedje;
function edje_object_mirrored_get(obj: PEvas_Object): TEina_Bool; cdecl; external libedje;
procedure edje_object_language_set(obj: PEvas_Object; language: pchar); cdecl; external libedje;
function edje_object_language_get(obj: PEvas_Object): pchar; cdecl; external libedje;
function edje_object_scale_set(obj: PEvas_Object; scale: double): TEina_Bool; cdecl; external libedje;
function edje_object_scale_get(obj: PEvas_Object): double; cdecl; external libedje;
function edje_object_base_scale_get(obj: PEvas_Object): double; cdecl; external libedje;

type
  PEdje_Drag_Dir = ^TEdje_Drag_Dir;
  TEdje_Drag_Dir = longint;

const
  EDJE_DRAG_DIR_NONE = 0;
  EDJE_DRAG_DIR_X = 1;
  EDJE_DRAG_DIR_Y = 2;
  EDJE_DRAG_DIR_XY = 3;

function edje_object_part_drag_value_set(obj: PEvas_Object; part: pchar; dx: double; dy: double): TEina_Bool; cdecl; external libedje;
function edje_object_part_drag_value_get(obj: PEvas_Object; part: pchar; dx: Pdouble; dy: Pdouble): TEina_Bool; cdecl; external libedje;
function edje_object_part_drag_size_set(obj: PEvas_Object; part: pchar; dw: double; dh: double): TEina_Bool; cdecl; external libedje;
function edje_object_part_drag_size_get(obj: PEvas_Object; part: pchar; dw: Pdouble; dh: Pdouble): TEina_Bool; cdecl; external libedje;
function edje_object_part_drag_dir_get(obj: PEvas_Object; part: pchar): TEdje_Drag_Dir; cdecl; external libedje;
function edje_object_part_drag_step_set(obj: PEvas_Object; part: pchar; dx: double; dy: double): TEina_Bool; cdecl; external libedje;
function edje_object_part_drag_step_get(obj: PEvas_Object; part: pchar; dx: Pdouble; dy: Pdouble): TEina_Bool; cdecl; external libedje;
function edje_object_part_drag_step(obj: PEvas_Object; part: pchar; dx: double; dy: double): TEina_Bool; cdecl; external libedje;
function edje_object_part_drag_page_set(obj: PEvas_Object; part: pchar; dx: double; dy: double): TEina_Bool; cdecl; external libedje;
function edje_object_part_drag_page_get(obj: PEvas_Object; part: pchar; dx: Pdouble; dy: Pdouble): TEina_Bool; cdecl; external libedje;
function edje_object_part_drag_page(obj: PEvas_Object; part: pchar; dx: double; dy: double): TEina_Bool; cdecl; external libedje;
function edje_object_part_text_set(obj: PEvas_Object; part: pchar; text: pchar): TEina_Bool; cdecl; external libedje;
function edje_object_part_text_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
procedure edje_object_part_text_cursor_begin_set(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor); cdecl; external libedje;
procedure edje_object_part_text_cursor_end_set(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor); cdecl; external libedje;
procedure edje_object_part_text_cursor_pos_set(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor; pos: longint); cdecl; external libedje;
function edje_object_part_text_cursor_pos_get(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor): longint; cdecl; external libedje;
function edje_object_part_text_cursor_coord_set(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor; x: longint; y: longint): TEina_Bool; cdecl; external libedje;
procedure edje_object_part_text_cursor_line_begin_set(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor); cdecl; external libedje;
procedure edje_object_part_text_cursor_line_end_set(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor); cdecl; external libedje;
function edje_object_part_text_cursor_prev(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor): TEina_Bool; cdecl; external libedje;
function edje_object_part_text_cursor_next(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor): TEina_Bool; cdecl; external libedje;
function edje_object_part_text_cursor_up(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor): TEina_Bool; cdecl; external libedje;
function edje_object_part_text_cursor_down(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor): TEina_Bool; cdecl; external libedje;
procedure edje_object_part_text_cursor_copy(obj: PEvas_Object; part: pchar; src: TEdje_Cursor; dst: TEdje_Cursor); cdecl; external libedje;
function edje_object_part_text_cursor_content_get(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor): pchar; cdecl; external libedje;
procedure edje_object_part_text_cursor_geometry_get(obj: PEvas_Object; part: pchar; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libedje;
function edje_object_part_text_hide_visible_password(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_object_part_text_cursor_is_format_get(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor): TEina_Bool; cdecl; external libedje;
function edje_object_part_text_cursor_is_visible_format_get(obj: PEvas_Object; part: pchar; cur: TEdje_Cursor): TEina_Bool; cdecl; external libedje;
function edje_object_part_text_anchor_geometry_get(obj: PEvas_Object; part: pchar; anchor: pchar): PEina_List; cdecl; external libedje;
function edje_object_part_text_anchor_list_get(obj: PEvas_Object; part: pchar): PEina_List; cdecl; external libedje;
function edje_object_part_text_style_user_peek(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
procedure edje_object_part_text_style_user_push(obj: PEvas_Object; part: pchar; style: pchar); cdecl; external libedje;
procedure edje_object_part_text_style_user_pop(obj: PEvas_Object; part: pchar); cdecl; external libedje;
function edje_object_part_text_item_geometry_get(obj: PEvas_Object; part: pchar; item: pchar; cx: Plongint; cy: Plongint; cw: Plongint; ch: Plongint): TEina_Bool; cdecl; external libedje;
function edje_object_part_text_item_list_get(obj: PEvas_Object; part: pchar): PEina_List; cdecl; external libedje;
procedure edje_object_text_insert_filter_callback_add(obj: PEvas_Object; part: pchar; func: TEdje_Text_Filter_Cb; data: pointer); cdecl; external libedje;
function edje_object_text_insert_filter_callback_del(obj: PEvas_Object; part: pchar; func: TEdje_Text_Filter_Cb): pointer; cdecl; external libedje;
function edje_object_text_insert_filter_callback_del_full(obj: PEvas_Object; part: pchar; func: TEdje_Text_Filter_Cb; data: pointer): pointer; cdecl; external libedje;
procedure edje_object_text_markup_filter_callback_add(obj: PEvas_Object; part: pchar; func: TEdje_Markup_Filter_Cb; data: pointer); cdecl; external libedje;
function edje_object_text_markup_filter_callback_del(obj: PEvas_Object; part: pchar; func: TEdje_Markup_Filter_Cb): pointer; cdecl; external libedje;
function edje_object_text_markup_filter_callback_del_full(obj: PEvas_Object; part: pchar; func: TEdje_Markup_Filter_Cb; data: pointer): pointer; cdecl; external libedje;
procedure edje_object_part_text_user_insert(obj: PEvas_Object; part: pchar; text: pchar); cdecl; external libedje;
procedure edje_object_part_text_append(obj: PEvas_Object; part: pchar; text: pchar); cdecl; external libedje;
function edje_object_part_text_escaped_set(obj: PEvas_Object; part: pchar; text: pchar): TEina_Bool; cdecl; external libedje;
function edje_object_part_text_unescaped_set(obj: PEvas_Object; part: pchar; text_to_escape: pchar): TEina_Bool; cdecl; external libedje;
function edje_object_part_text_unescaped_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
procedure edje_object_part_text_insert(obj: PEvas_Object; part: pchar; text: pchar); cdecl; external libedje;
procedure edje_object_part_text_autocapital_type_set(obj: PEvas_Object; part: pchar; autocapital_type: TEdje_Text_Autocapital_Type); cdecl; external libedje;
function edje_object_part_text_autocapital_type_get(obj: PEvas_Object; part: pchar): TEdje_Text_Autocapital_Type; cdecl; external libedje;
procedure edje_object_part_text_prediction_allow_set(obj: PEvas_Object; part: pchar; prediction: TEina_Bool); cdecl; external libedje;
function edje_object_part_text_prediction_allow_get(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_object_part_text_imf_context_get(obj: PEvas_Object; part: pchar): pointer; cdecl; external libedje;
procedure edje_object_part_text_imf_context_reset(obj: PEvas_Object; part: pchar); cdecl; external libedje;
procedure edje_object_part_text_input_hint_set(obj: PEvas_Object; part: pchar; input_hints: TEdje_Input_Hints); cdecl; external libedje;
function edje_object_part_text_input_hint_get(obj: PEvas_Object; part: pchar): TEdje_Input_Hints; cdecl; external libedje;
procedure edje_object_part_text_input_panel_show(obj: PEvas_Object; part: pchar); cdecl; external libedje;
procedure edje_object_part_text_input_panel_hide(obj: PEvas_Object; part: pchar); cdecl; external libedje;
procedure edje_object_part_text_input_panel_imdata_set(obj: PEvas_Object; part: pchar; data: pointer; len: longint); cdecl; external libedje;
procedure edje_object_part_text_input_panel_imdata_get(obj: PEvas_Object; part: pchar; data: pointer; len: Plongint); cdecl; external libedje;
procedure edje_object_part_text_input_panel_layout_set(obj: PEvas_Object; part: pchar; layout: TEdje_Input_Panel_Layout); cdecl; external libedje;
function edje_object_part_text_input_panel_layout_get(obj: PEvas_Object; part: pchar): TEdje_Input_Panel_Layout; cdecl; external libedje;
procedure edje_object_part_text_input_panel_language_set(obj: PEvas_Object; part: pchar; lang: TEdje_Input_Panel_Lang); cdecl; external libedje;
function edje_object_part_text_input_panel_language_get(obj: PEvas_Object; part: pchar): TEdje_Input_Panel_Lang; cdecl; external libedje;
procedure edje_object_part_text_input_panel_layout_variation_set(obj: PEvas_Object; part: pchar; variation: longint); cdecl; external libedje;
function edje_object_part_text_input_panel_layout_variation_get(obj: PEvas_Object; part: pchar): longint; cdecl; external libedje;
procedure edje_object_part_text_input_panel_enabled_set(obj: PEvas_Object; part: pchar; enabled: TEina_Bool); cdecl; external libedje;
function edje_object_part_text_input_panel_enabled_get(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
procedure edje_object_part_text_input_panel_return_key_disabled_set(obj: PEvas_Object; part: pchar; disabled: TEina_Bool); cdecl; external libedje;
function edje_object_part_text_input_panel_return_key_disabled_get(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
procedure edje_object_part_text_input_panel_return_key_type_set(obj: PEvas_Object; part: pchar; return_key_type: TEdje_Input_Panel_Return_Key_Type); cdecl; external libedje;
function edje_object_part_text_input_panel_return_key_type_get(obj: PEvas_Object; part: pchar): TEdje_Input_Panel_Return_Key_Type; cdecl; external libedje;
procedure edje_object_part_text_input_panel_show_on_demand_set(obj: PEvas_Object; part: pchar; ondemand: TEina_Bool); cdecl; external libedje;
function edje_object_part_text_input_panel_show_on_demand_get(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
procedure edje_object_part_text_prediction_hint_set(obj: PEvas_Object; part: pchar; prediction_hint: pchar); cdecl; external libedje;
function edje_object_part_text_prediction_hint_hash_set(obj: PEvas_Object; part: pchar; key: pchar; value: pchar): TEina_Bool; cdecl; external libedje;
function edje_object_part_text_prediction_hint_hash_del(obj: PEvas_Object; part: pchar; key: pchar): TEina_Bool; cdecl; external libedje;
procedure edje_object_part_text_select_begin(obj: PEvas_Object; part: pchar); cdecl; external libedje;
procedure edje_object_part_text_select_abort(obj: PEvas_Object; part: pchar); cdecl; external libedje;
procedure edje_object_part_text_select_extend(obj: PEvas_Object; part: pchar); cdecl; external libedje;
procedure edje_object_part_text_select_all(obj: PEvas_Object; part: pchar); cdecl; external libedje;
procedure edje_object_part_text_select_none(obj: PEvas_Object; part: pchar); cdecl; external libedje;
function edje_object_part_text_selection_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
procedure edje_object_play_set(obj: PEvas_Object; play: TEina_Bool); cdecl; external libedje;
function edje_object_play_get(obj: PEvas_Object): TEina_Bool; cdecl; external libedje;
procedure edje_object_transition_duration_factor_set(obj: PEvas_Object; scale: double); cdecl; external libedje;
function edje_object_transition_duration_factor_get(obj: PEvas_Object): double; cdecl; external libedje;
procedure edje_object_size_min_get(obj: PEvas_Object; minw: Plongint; minh: Plongint); cdecl; external libedje;
procedure edje_object_size_max_get(obj: PEvas_Object; maxw: Plongint; maxh: Plongint); cdecl; external libedje;
function edje_object_part_exists(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
procedure edje_object_item_provider_set(obj: PEdje_Object; func: TEdje_Item_Provider_Cb; data: pointer); cdecl; external libedje;
function edje_object_color_class_description_get(obj: PEdje_Object; color_class: pchar): pchar; cdecl; external libedje;
function edje_perspective_new(e: PEvas): PEdje_Perspective; cdecl; external libedje;
procedure edje_perspective_free(ps: PEdje_Perspective); cdecl; external libedje;
procedure edje_perspective_set(ps: PEdje_Perspective; px: TEvas_Coord; py: TEvas_Coord; z0: TEvas_Coord; foc: TEvas_Coord); cdecl; external libedje;
procedure edje_perspective_global_set(ps: PEdje_Perspective; global: TEina_Bool); cdecl; external libedje;
function edje_perspective_global_get(ps: PEdje_Perspective): TEina_Bool; cdecl; external libedje;
function edje_evas_global_perspective_get(e: PEvas): PEdje_Perspective; cdecl; external libedje;
procedure edje_object_perspective_set(obj: PEvas_Object; ps: PEdje_Perspective); cdecl; external libedje;
function edje_object_perspective_get(obj: PEvas_Object): PEdje_Perspective; cdecl; external libedje;
function edje_file_text_class_set(file_: pchar; text_class: pchar; font: pchar; size: TEvas_Font_Size): TEina_Bool; cdecl; external libedje;
function edje_file_text_class_del(file_: pchar; text_class: pchar): TEina_Bool; cdecl; external libedje;
function edje_file_text_class_get(file_: pchar; text_class: pchar; font: PPchar; size: PEvas_Font_Size): TEina_Bool; cdecl; external libedje;

type
  PEdje_Part_Type = ^TEdje_Part_Type;
  TEdje_Part_Type = longint;

const
  EDJE_PART_TYPE_NONE = 0;
  EDJE_PART_TYPE_RECTANGLE = 1;
  EDJE_PART_TYPE_TEXT = 2;
  EDJE_PART_TYPE_IMAGE = 3;
  EDJE_PART_TYPE_SWALLOW = 4;
  EDJE_PART_TYPE_TEXTBLOCK = 5;
  EDJE_PART_TYPE_GRADIENT = 6;
  EDJE_PART_TYPE_GROUP = 7;
  EDJE_PART_TYPE_BOX = 8;
  EDJE_PART_TYPE_TABLE = 9;
  EDJE_PART_TYPE_EXTERNAL = 10;
  EDJE_PART_TYPE_PROXY = 11;
  EDJE_PART_TYPE_SPACER = 12;
  EDJE_PART_TYPE_MESH_NODE = 13;
  EDJE_PART_TYPE_LIGHT = 14;
  EDJE_PART_TYPE_CAMERA = 15;
  EDJE_PART_TYPE_SNAPSHOT = 16;
  EDJE_PART_TYPE_VECTOR = 17;
  EDJE_PART_TYPE_LAST = 18;

  // === Konventiert am: 22-5-25 17:55:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

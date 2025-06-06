unit Edje_Edit;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, Edje_Legacy, Edje_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$warning "Do not use the Edje_Edit API unless you know what you are doing. It's meant only for writing editors and nothing else."}
type
  PEdje_Edit_Image_Comp = ^TEdje_Edit_Image_Comp;
  TEdje_Edit_Image_Comp = longint;

const
  EDJE_EDIT_IMAGE_COMP_RAW = 0;
  EDJE_EDIT_IMAGE_COMP_USER = 1;
  EDJE_EDIT_IMAGE_COMP_COMP = 2;
  EDJE_EDIT_IMAGE_COMP_LOSSY = 3;
  EDJE_EDIT_IMAGE_COMP_LOSSY_ETC1 = 4;
  EDJE_EDIT_IMAGE_COMP_LOSSY_ETC2 = 5;

type
  PEdje_Edit_Select_Mode = ^TEdje_Edit_Select_Mode;
  TEdje_Edit_Select_Mode = longint;

const
  EDJE_EDIT_SELECT_MODE_DEFAULT = 0;
  EDJE_EDIT_SELECT_MODE_EXPLICIT = 1;

type
  PEdje_Edit_Sound_Comp = ^TEdje_Edit_Sound_Comp;
  TEdje_Edit_Sound_Comp = longint;

const
  EDJE_EDIT_SOUND_COMP_NONE = 0;
  EDJE_EDIT_SOUND_COMP_RAW = 1;
  EDJE_EDIT_SOUND_COMP_COMP = 2;
  EDJE_EDIT_SOUND_COMP_LOSSY = 3;
  EDJE_EDIT_SOUND_COMP_AS_IS = 4;

type
  PEdje_Edit_Entry_Mode = ^TEdje_Edit_Entry_Mode;
  TEdje_Edit_Entry_Mode = longint;

const
  EDJE_EDIT_ENTRY_MODE_NONE = 0;
  EDJE_EDIT_ENTRY_MODE_PLAIN = 1;
  EDJE_EDIT_ENTRY_MODE_EDITABLE = 2;
  EDJE_EDIT_ENTRY_MODE_PASSWORD = 3;

type
  TEdje_Edit_Script_Error = record
    program_name: pchar;
    line: longint;
    error_str: pchar;
  end;
  PEdje_Edit_Script_Error = ^TEdje_Edit_Script_Error;

  TEdje_Part_Image_Use = record
    group: pchar;
    part: pchar;
    state: record
      name: pchar;
      value: double;
      end;
  end;
  PEdje_Part_Image_Use = ^TEdje_Part_Image_Use;

  TEdje_Edit_Limit = record
    name: PEina_Stringshare;
    value: longint;
  end;
  PEdje_Edit_Limit = ^TEdje_Edit_Limit;

  {**************************************************************************** }
  {*************************   GENERAL API   ********************************** }
  {**************************************************************************** }

function edje_edit_object_add(e: PEvas): PEvas_Object; cdecl; external libedje;
procedure edje_edit_string_list_free(lst: PEina_List); cdecl; external libedje;
procedure edje_edit_string_free(str: pchar); cdecl; external libedje;
function edje_edit_compiler_get(obj: PEvas_Object): pchar; cdecl; external libedje;
function edje_edit_save(obj: PEvas_Object): TEina_Bool; cdecl; external libedje;
function edje_edit_save_all(obj: PEvas_Object): TEina_Bool; cdecl; external libedje;
function edje_edit_clean_save_as(obj: PEvas_Object; new_file_name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_without_source_save(obj: PEvas_Object; current_group: TEina_Bool): TEina_Bool; cdecl; external libedje;
procedure edje_edit_print_internal_status(obj: PEvas_Object); cdecl; external libedje;
function edje_edit_group_add(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_group_copy(obj: PEvas_Object; group_name: pchar; copy_name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_group_del(obj: PEvas_Object; group_name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_group_exist(obj: PEvas_Object; group: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_group_name_set(obj: PEvas_Object; new_name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_group_min_w_get(obj: PEvas_Object): longint; cdecl; external libedje;
function edje_edit_group_min_w_set(obj: PEvas_Object; w: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_group_min_h_get(obj: PEvas_Object): longint; cdecl; external libedje;
function edje_edit_group_min_h_set(obj: PEvas_Object; h: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_group_max_w_get(obj: PEvas_Object): longint; cdecl; external libedje;
function edje_edit_group_max_w_set(obj: PEvas_Object; w: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_group_max_h_get(obj: PEvas_Object): longint; cdecl; external libedje;
function edje_edit_group_max_h_set(obj: PEvas_Object; h: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_group_broadcast_signal_get(obj: PEvas_Object): TEina_Bool; cdecl; external libedje;
function edje_edit_group_broadcast_signal_set(obj: PEvas_Object; bs: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_group_limits_vertical_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_group_limits_vertical_del(obj: PEvas_Object; name: pchar; value: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_group_limits_vertical_add(obj: PEvas_Object; name: pchar; value: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_group_limits_horizontal_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_group_limits_horizontal_del(obj: PEvas_Object; name: pchar; value: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_group_limits_horizontal_add(obj: PEvas_Object; name: pchar; value: longint): TEina_Bool; cdecl; external libedje;
procedure edje_edit_limits_list_free(lst: PEina_List); cdecl; external libedje;
function edje_edit_group_aliases_get(obj: PEvas_Object; group_name: pchar): PEina_List; cdecl; external libedje;
function edje_edit_group_alias_is(obj: PEvas_Object; alias_name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_group_aliased_get(obj: PEvas_Object; alias_name: pchar): pchar; cdecl; external libedje;
function edje_edit_group_alias_add(obj: PEvas_Object; group_name: pchar; alias_name: pchar): TEina_Bool; cdecl; external libedje;

{**************************************************************************** }
{*************************   DATA API   ************************************* }
{**************************************************************************** }

function edje_edit_data_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_data_add(obj: PEvas_Object; itemname: pchar; value: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_data_del(obj: PEvas_Object; itemname: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_data_value_get(obj: PEvas_Object; itemname: pchar): pchar; cdecl; external libedje;
function edje_edit_data_value_set(obj: PEvas_Object; itemname: pchar; value: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_data_name_set(obj: PEvas_Object; itemname: pchar; newname: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_group_data_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_group_data_add(obj: PEvas_Object; itemname: pchar; value: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_group_data_del(obj: PEvas_Object; itemname: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_group_data_value_get(obj: PEvas_Object; itemname: pchar): pchar; cdecl; external libedje;
function edje_edit_group_data_value_set(obj: PEvas_Object; itemname: pchar; value: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_group_data_name_set(obj: PEvas_Object; itemname: pchar; newname: pchar): TEina_Bool; cdecl; external libedje;

{*************************************************************************** }
{**********************   SIZE CLASSES API   ******************************* }
{*************************************************************************** }

function edje_edit_size_classes_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_size_class_add(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_size_class_del(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_size_class_name_set(obj: PEvas_Object; name: pchar; newname: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_size_class_min_w_get(obj: PEvas_Object; class_name: pchar): TEvas_Coord; cdecl; external libedje;
function edje_edit_size_class_min_w_set(obj: PEvas_Object; class_name: pchar; size: TEvas_Coord): TEina_Bool; cdecl; external libedje;
function edje_edit_size_class_max_w_get(obj: PEvas_Object; class_name: pchar): TEvas_Coord; cdecl; external libedje;
function edje_edit_size_class_max_w_set(obj: PEvas_Object; class_name: pchar; size: TEvas_Coord): TEina_Bool; cdecl; external libedje;
function edje_edit_size_class_min_h_get(obj: PEvas_Object; class_name: pchar): TEvas_Coord; cdecl; external libedje;
function edje_edit_size_class_min_h_set(obj: PEvas_Object; class_name: pchar; size: TEvas_Coord): TEina_Bool; cdecl; external libedje;
function edje_edit_size_class_max_h_get(obj: PEvas_Object; class_name: pchar): TEvas_Coord; cdecl; external libedje;
function edje_edit_size_class_max_h_set(obj: PEvas_Object; class_name: pchar; size: TEvas_Coord): TEina_Bool; cdecl; external libedje;

{*************************************************************************** }
{**********************   TEXT CLASSES API   ******************************* }
{*************************************************************************** }

function edje_edit_text_classes_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_text_class_add(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_text_class_del(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_text_class_name_set(obj: PEvas_Object; name: pchar; newname: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_text_class_font_get(obj: PEvas_Object; class_name: pchar): PEina_Stringshare; cdecl; external libedje;
function edje_edit_text_class_font_set(obj: PEvas_Object; class_name: pchar; font: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_text_class_size_get(obj: PEvas_Object; class_name: pchar): TEvas_Font_Size; cdecl; external libedje;
function edje_edit_text_class_size_set(obj: PEvas_Object; class_name: pchar; size: TEvas_Font_Size): TEina_Bool; cdecl; external libedje;

{**************************************************************************** }
{**********************   COLOR CLASSES API   ******************************* }
{**************************************************************************** }

function edje_edit_color_classes_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_color_class_add(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_color_class_del(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_color_class_colors_get(obj: PEvas_Object; class_name: pchar; r: Plongint; g: Plongint; b: Plongint; a: Plongint; r2: Plongint; g2: Plongint; b2: Plongint; a2: Plongint; r3: Plongint; g3: Plongint; b3: Plongint; a3: Plongint): TEina_Bool; cdecl; external libedje;
function edje_edit_color_class_colors_set(obj: PEvas_Object; class_name: pchar; r: longint; g: longint; b: longint; a: longint; r2: longint; g2: longint; b2: longint; a2: longint; r3: longint; g3: longint; b3: longint; a3: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_color_class_name_set(obj: PEvas_Object; name: pchar; newname: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_color_class_description_get(obj: PEvas_Object; class_name: pchar): PEina_Stringshare; cdecl; external libedje;
function edje_edit_color_class_description_set(obj: PEvas_Object; class_name: pchar; desc: pchar): TEina_Bool; cdecl; external libedje;

{**************************************************************************** }
{*************************   TEXT STYLES ************************************ }
{**************************************************************************** }

function edje_edit_styles_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_style_add(obj: PEvas_Object; style: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_style_del(obj: PEvas_Object; style: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_style_tags_list_get(obj: PEvas_Object; style: pchar): PEina_List; cdecl; external libedje;
function edje_edit_style_tag_value_get(obj: PEvas_Object; style: pchar; tag: pchar): pchar; cdecl; external libedje;
function edje_edit_style_tag_value_set(obj: PEvas_Object; style: pchar; tag: pchar; new_value: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_style_tag_name_set(obj: PEvas_Object; style: pchar; tag: pchar; new_name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_style_tag_add(obj: PEvas_Object; style: pchar; tag_name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_style_tag_del(obj: PEvas_Object; style: pchar; tag: pchar): TEina_Bool; cdecl; external libedje;

{**************************************************************************** }
{***********************   EXTERNALS API   ********************************** }
{**************************************************************************** }

function edje_edit_externals_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_external_add(obj: PEvas_Object; external: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_external_del(obj: PEvas_Object; external: pchar): TEina_Bool; cdecl; external libedje;

{**************************************************************************** }
{*************************   PARTS API   ************************************ }
{**************************************************************************** }

function edje_edit_part_select_mode_get(obj: PEvas_Object; part: pchar): TEdje_Edit_Select_Mode; cdecl; external libedje;
function edje_edit_part_select_mode_set(obj: PEvas_Object; part: pchar; mode: TEdje_Edit_Select_Mode): TEina_Bool; cdecl; external libedje;
function edje_edit_part_entry_mode_get(obj: PEvas_Object; part: pchar): TEdje_Edit_Entry_Mode; cdecl; external libedje;
function edje_edit_part_entry_mode_set(obj: PEvas_Object; part: pchar; mode: TEdje_Edit_Entry_Mode): TEina_Bool; cdecl; external libedje;
function edje_edit_parts_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_part_add(obj: PEvas_Object; name: pchar; _type: TEdje_Part_Type): TEina_Bool; cdecl; external libedje;
function edje_edit_part_external_add(obj: PEvas_Object; name: pchar; source: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_del(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_copy(obj: PEvas_Object; part: pchar; new_copy: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_exist(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_above_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_below_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_restack_below(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_restack_part_below(obj: PEvas_Object; part: pchar; below: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_restack_above(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_restack_part_above(obj: PEvas_Object; part: pchar; above: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_name_set(obj: PEvas_Object; part: pchar; new_name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_api_name_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_api_description_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_api_name_set(obj: PEvas_Object; part: pchar; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_api_description_set(obj: PEvas_Object; part: pchar; description: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_type_get(obj: PEvas_Object; part: pchar): TEdje_Part_Type; cdecl; external libedje;
function edje_edit_part_clip_to_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_clip_to_set(obj: PEvas_Object; part: pchar; clip_to: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_source_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_source_set(obj: PEvas_Object; part: pchar; source: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_source2_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_source2_set(obj: PEvas_Object; part: pchar; source: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_source3_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_source3_set(obj: PEvas_Object; part: pchar; source: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_source4_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_source4_set(obj: PEvas_Object; part: pchar; source: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_source5_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_source5_set(obj: PEvas_Object; part: pchar; source: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_source6_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_source6_set(obj: PEvas_Object; part: pchar; source: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_effect_get(obj: PEvas_Object; part: pchar): TEdje_Text_Effect; cdecl; external libedje;
function edje_edit_part_effect_set(obj: PEvas_Object; part: pchar; effect: TEdje_Text_Effect): TEina_Bool; cdecl; external libedje;
function edje_edit_part_selected_state_get(obj: PEvas_Object; part: pchar; value: Pdouble): pchar; cdecl; external libedje;
function edje_edit_part_selected_state_set(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_part_mouse_events_get(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_mouse_events_set(obj: PEvas_Object; part: pchar; mouse_events: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_part_required_get(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_anti_alias_get(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_anti_alias_set(obj: PEvas_Object; part: pchar; anti_alias: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_part_repeat_events_get(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_repeat_events_set(obj: PEvas_Object; part: pchar; repeat_events: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_part_use_alternate_font_metrics_get(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_use_alternate_font_metrics_set(obj: PEvas_Object; part: pchar; use: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_part_multiline_get(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_multiline_set(obj: PEvas_Object; part: pchar; multiline: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_part_precise_is_inside_get(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_precise_is_inside_set(obj: PEvas_Object; part: pchar; precise_is_inside: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_part_access_get(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_access_set(obj: PEvas_Object; part: pchar; access: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_part_ignore_flags_get(obj: PEvas_Object; part: pchar): TEvas_Event_Flags; cdecl; external libedje;
function edje_edit_part_ignore_flags_set(obj: PEvas_Object; part: pchar; ignore_flags: TEvas_Event_Flags): TEina_Bool; cdecl; external libedje;
function edje_edit_part_mask_flags_get(obj: PEvas_Object; part: pchar): TEvas_Event_Flags; cdecl; external libedje;
function edje_edit_part_mask_flags_set(obj: PEvas_Object; part: pchar; mask_flags: TEvas_Event_Flags): TEina_Bool; cdecl; external libedje;
function edje_edit_part_pointer_mode_get(obj: PEvas_Object; part: pchar): TEvas_Object_Pointer_Mode; cdecl; external libedje;
function edje_edit_part_pointer_mode_set(obj: PEvas_Object; part: pchar; pointer_mode: TEvas_Object_Pointer_Mode): TEina_Bool; cdecl; external libedje;
function edje_edit_part_cursor_mode_get(obj: PEvas_Object; part: pchar): byte; cdecl; external libedje;
function edje_edit_part_cursor_mode_set(obj: PEvas_Object; part: pchar; cursor_mode: byte): TEina_Bool; cdecl; external libedje;
function edje_edit_part_scale_set(obj: PEvas_Object; part: pchar; scale: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_part_scale_get(obj: PEvas_Object; part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_drag_x_get(obj: PEvas_Object; part: pchar): longint; cdecl; external libedje;
function edje_edit_part_drag_x_set(obj: PEvas_Object; part: pchar; drag: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_drag_y_get(obj: PEvas_Object; part: pchar): longint; cdecl; external libedje;
function edje_edit_part_drag_y_set(obj: PEvas_Object; part: pchar; drag: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_drag_step_x_get(obj: PEvas_Object; part: pchar): longint; cdecl; external libedje;
function edje_edit_part_drag_step_x_set(obj: PEvas_Object; part: pchar; step: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_drag_step_y_get(obj: PEvas_Object; part: pchar): longint; cdecl; external libedje;
function edje_edit_part_drag_step_y_set(obj: PEvas_Object; part: pchar; step: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_drag_count_x_get(obj: PEvas_Object; part: pchar): longint; cdecl; external libedje;
function edje_edit_part_drag_count_x_set(obj: PEvas_Object; part: pchar; count: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_drag_count_y_get(obj: PEvas_Object; part: pchar): longint; cdecl; external libedje;
function edje_edit_part_drag_count_y_set(obj: PEvas_Object; part: pchar; count: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_drag_confine_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_drag_confine_set(obj: PEvas_Object; part: pchar; confine: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_drag_event_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_drag_event_set(obj: PEvas_Object; part: pchar; event: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_drag_threshold_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libedje;
function edje_edit_part_drag_threshold_set(obj: PEvas_Object; part: pchar; threshold: pchar): TEina_Bool; cdecl; external libedje;

{**************************************************************************** }
{******************************      BOX API      *************************** }
{**************************************************************************** }

function edje_edit_state_box_layout_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): PEina_Stringshare; cdecl; external libedje;
function edje_edit_state_box_layout_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; layout: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_box_alt_layout_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): PEina_Stringshare; cdecl; external libedje;
function edje_edit_state_box_alt_layout_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; layout: pchar): TEina_Bool; cdecl; external libedje;

{**************************************************************************** }
{*************************   TABLE API   ************************************ }
{**************************************************************************** }

function edje_edit_state_table_homogeneous_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; homogeneous: byte): TEina_Bool; cdecl; external libedje;
function edje_edit_state_table_homogeneous_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): byte; cdecl; external libedje;
function edje_edit_state_container_min_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; h: PEina_Bool; v: PEina_Bool): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_state_container_min_h_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_container_min_v_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_container_min_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; h: TEina_Bool; v: TEina_Bool): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_state_container_min_h_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; h: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_container_min_v_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; v: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_container_padding_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: Plongint; y: Plongint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_state_container_padding_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_container_padding_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_container_padding_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: longint; y: longint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_state_container_padding_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_container_padding_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; y: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_container_align_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: double; y: double): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_state_container_align_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_container_align_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; y: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_container_align_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: Pdouble; y: Pdouble): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_state_container_align_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_container_align_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;

{**************************************************************************** }
{*************************   BOX & TABLE ITEMS API   ************************ }
{**************************************************************************** }

function edje_edit_part_item_append(obj: PEvas_Object; part: pchar; item_name: pchar; source_group: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_insert_before(obj: PEvas_Object; part: pchar; item_name: pchar; item_before: pchar; source_group: pchar): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_insert_before_index(obj: PEvas_Object; part: pchar; item_name: pchar; index: dword; source_group: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_insert_after(obj: PEvas_Object; part: pchar; item_name: pchar; item_after: pchar; source_group: pchar): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_insert_after_index(obj: PEvas_Object; part: pchar; item_name: pchar; index: dword; source_group: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_insert_at(obj: PEvas_Object; part: pchar; item_name: pchar; source_group: pchar; place: dword): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_move_above(obj: PEvas_Object; part: pchar; item_name: pchar): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_move_above_index(obj: PEvas_Object; part: pchar; index: dword): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_move_below(obj: PEvas_Object; part: pchar; item_name: pchar): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_move_below_index(obj: PEvas_Object; part: pchar; index: dword): TEina_Bool; cdecl; external libedje;
function edje_edit_part_items_list_get(obj: PEvas_Object; part: pchar): PEina_List; cdecl; external libedje; deprecated;
function edje_edit_part_items_count_get(obj: PEvas_Object; part: pchar): longint; cdecl; external libedje;
function edje_edit_part_item_del(obj: PEvas_Object; part: pchar; name: pchar): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_del(obj: PEvas_Object; part: pchar; index: dword): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_name_set(obj: PEvas_Object; part: pchar; index: dword; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_name_get(obj: PEvas_Object; part: pchar; index: dword): pchar; cdecl; external libedje;
function edje_edit_part_item_source_set(obj: PEvas_Object; part: pchar; item_name: pchar; source_group: pchar): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_source_set(obj: PEvas_Object; part: pchar; index: dword; source_group: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_source_get(obj: PEvas_Object; part: pchar; item_name: pchar): pchar; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_source_get(obj: PEvas_Object; part: pchar; index: dword): pchar; cdecl; external libedje;
function edje_edit_part_item_min_w_get(obj: PEvas_Object; part: pchar; item: pchar): longint; cdecl; external libedje; deprecated;
function edje_edit_part_item_min_w_set(obj: PEvas_Object; part: pchar; item: pchar; min_w: longint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_min_h_get(obj: PEvas_Object; part: pchar; item: pchar): longint; cdecl; external libedje; deprecated;
function edje_edit_part_item_min_h_set(obj: PEvas_Object; part: pchar; item: pchar; min_h: longint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_max_w_get(obj: PEvas_Object; part: pchar; item: pchar): longint; cdecl; external libedje; deprecated;
function edje_edit_part_item_max_w_set(obj: PEvas_Object; part: pchar; item: pchar; max_w: longint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_max_h_get(obj: PEvas_Object; part: pchar; item: pchar): longint; cdecl; external libedje; deprecated;
function edje_edit_part_item_max_h_set(obj: PEvas_Object; part: pchar; item: pchar; max_h: longint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_aspect_w_get(obj: PEvas_Object; part: pchar; item: pchar): longint; cdecl; external libedje; deprecated;
function edje_edit_part_item_aspect_w_set(obj: PEvas_Object; part: pchar; item: pchar; aspect_w: longint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_aspect_h_get(obj: PEvas_Object; part: pchar; item: pchar): longint; cdecl; external libedje; deprecated;
function edje_edit_part_item_aspect_h_set(obj: PEvas_Object; part: pchar; item: pchar; aspect_h: longint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_prefer_w_get(obj: PEvas_Object; part: pchar; item: pchar): longint; cdecl; external libedje; deprecated;
function edje_edit_part_item_aspect_mode_get(obj: PEvas_Object; part: pchar; item: pchar): TEdje_Aspect_Control; cdecl; external libedje; deprecated;
function edje_edit_part_item_aspect_mode_set(obj: PEvas_Object; part: pchar; item: pchar; mode: TEdje_Aspect_Control): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_prefer_w_set(obj: PEvas_Object; part: pchar; item: pchar; prefer_w: longint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_prefer_h_get(obj: PEvas_Object; part: pchar; item: pchar): longint; cdecl; external libedje; deprecated;
function edje_edit_part_item_prefer_h_set(obj: PEvas_Object; part: pchar; item: pchar; prefer_h: longint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_spread_w_get(obj: PEvas_Object; part: pchar; item: pchar): longint; cdecl; external libedje; deprecated;
function edje_edit_part_item_spread_w_set(obj: PEvas_Object; part: pchar; item: pchar; spread_w: longint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_spread_h_get(obj: PEvas_Object; part: pchar; item: pchar): longint; cdecl; external libedje; deprecated;
function edje_edit_part_item_spread_h_set(obj: PEvas_Object; part: pchar; item: pchar; spread_h: longint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_min_w_get(obj: PEvas_Object; part: pchar; index: dword): longint; cdecl; external libedje;
function edje_edit_part_item_index_min_w_set(obj: PEvas_Object; part: pchar; index: dword; min_w: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_min_h_get(obj: PEvas_Object; part: pchar; index: dword): longint; cdecl; external libedje;
function edje_edit_part_item_index_min_h_set(obj: PEvas_Object; part: pchar; index: dword; min_h: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_max_w_get(obj: PEvas_Object; part: pchar; index: dword): longint; cdecl; external libedje;
function edje_edit_part_item_index_max_w_set(obj: PEvas_Object; part: pchar; index: dword; max_w: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_max_h_get(obj: PEvas_Object; part: pchar; index: dword): longint; cdecl; external libedje;
function edje_edit_part_item_index_max_h_set(obj: PEvas_Object; part: pchar; index: dword; max_h: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_aspect_w_get(obj: PEvas_Object; part: pchar; index: dword): longint; cdecl; external libedje;
function edje_edit_part_item_index_aspect_w_set(obj: PEvas_Object; part: pchar; index: dword; aspect_w: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_aspect_h_get(obj: PEvas_Object; part: pchar; index: dword): longint; cdecl; external libedje;
function edje_edit_part_item_index_aspect_h_set(obj: PEvas_Object; part: pchar; index: dword; aspect_h: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_prefer_w_get(obj: PEvas_Object; part: pchar; index: dword): longint; cdecl; external libedje;
function edje_edit_part_item_index_aspect_mode_get(obj: PEvas_Object; part: pchar; index: dword): TEdje_Aspect_Control; cdecl; external libedje;
function edje_edit_part_item_index_aspect_mode_set(obj: PEvas_Object; part: pchar; index: dword; mode: TEdje_Aspect_Control): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_prefer_w_set(obj: PEvas_Object; part: pchar; index: dword; prefer_w: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_prefer_h_get(obj: PEvas_Object; part: pchar; index: dword): longint; cdecl; external libedje;
function edje_edit_part_item_index_prefer_h_set(obj: PEvas_Object; part: pchar; index: dword; prefer_h: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_spread_w_get(obj: PEvas_Object; part: pchar; index: dword): longint; cdecl; external libedje;
function edje_edit_part_item_index_spread_w_set(obj: PEvas_Object; part: pchar; index: dword; spread_w: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_spread_h_get(obj: PEvas_Object; part: pchar; index: dword): longint; cdecl; external libedje;
function edje_edit_part_item_index_spread_h_set(obj: PEvas_Object; part: pchar; index: dword; spread_h: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_padding_get(obj: PEvas_Object; part: pchar; item_name: pchar; l: Plongint; r: Plongint; t: Plongint; b: Plongint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_padding_set(obj: PEvas_Object; part: pchar; item_name: pchar; l: longint; r: longint; t: longint; b: longint): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_padding_get(obj: PEvas_Object; part: pchar; index: dword; l: Plongint; r: Plongint; t: Plongint; b: Plongint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_padding_set(obj: PEvas_Object; part: pchar; index: dword; l: longint; r: longint; t: longint; b: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_align_x_get(obj: PEvas_Object; part: pchar; item: pchar): double; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_align_x_get(obj: PEvas_Object; part: pchar; index: dword): double; cdecl; external libedje;
function edje_edit_part_item_align_x_set(obj: PEvas_Object; part: pchar; item: pchar; align_x: double): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_align_x_set(obj: PEvas_Object; part: pchar; index: dword; align_x: double): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_align_y_get(obj: PEvas_Object; part: pchar; item: pchar): double; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_align_y_get(obj: PEvas_Object; part: pchar; index: dword): double; cdecl; external libedje;
function edje_edit_part_item_align_y_set(obj: PEvas_Object; part: pchar; item: pchar; align_y: double): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_align_y_set(obj: PEvas_Object; part: pchar; index: dword; align_y: double): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_weight_x_get(obj: PEvas_Object; part: pchar; item: pchar): double; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_weight_x_get(obj: PEvas_Object; part: pchar; index: dword): double; cdecl; external libedje;
function edje_edit_part_item_weight_x_set(obj: PEvas_Object; part: pchar; item: pchar; weight_x: double): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_weight_x_set(obj: PEvas_Object; part: pchar; index: dword; weight_x: double): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_weight_y_get(obj: PEvas_Object; part: pchar; item: pchar): double; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_weight_y_get(obj: PEvas_Object; part: pchar; index: dword): double; cdecl; external libedje;
function edje_edit_part_item_weight_y_set(obj: PEvas_Object; part: pchar; item: pchar; weight_y: double): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_weight_y_set(obj: PEvas_Object; part: pchar; index: dword; weight_y: double): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_position_get(obj: PEvas_Object; part: pchar; item_name: pchar; col: Pword; row: Pword): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_item_align_x_get(obj: PEvas_Object; part: pchar; index: dword): double; cdecl; external libedje;
function edje_edit_part_item_item_align_x_set(obj: PEvas_Object; part: pchar; index: dword; align_x: double): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_item_align_y_get(obj: PEvas_Object; part: pchar; index: dword): double; cdecl; external libedje;
function edje_edit_part_item_item_align_y_set(obj: PEvas_Object; part: pchar; index: dword; align_y: double): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_item_weight_x_get(obj: PEvas_Object; part: pchar; index: dword): double; cdecl; external libedje;
function edje_edit_part_item_item_weight_x_set(obj: PEvas_Object; part: pchar; index: dword; weight_x: double): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_item_weight_y_get(obj: PEvas_Object; part: pchar; index: dword): double; cdecl; external libedje;
function edje_edit_part_item_item_weight_y_set(obj: PEvas_Object; part: pchar; index: dword; weight_y: double): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_position_col_get(obj: PEvas_Object; part: pchar; item_name: pchar): word; cdecl; external libedje; deprecated;
function edje_edit_part_item_position_row_get(obj: PEvas_Object; part: pchar; item_name: pchar): word; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_position_col_get(obj: PEvas_Object; part: pchar; index: dword): word; cdecl; external libedje;
function edje_edit_part_item_index_position_row_get(obj: PEvas_Object; part: pchar; index: dword): word; cdecl; external libedje;
function edje_edit_part_item_position_set(obj: PEvas_Object; part: pchar; item_name: pchar; col: word; row: word): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_position_col_set(obj: PEvas_Object; part: pchar; item_name: pchar; col: word): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_position_row_set(obj: PEvas_Object; part: pchar; item_name: pchar; row: word): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_position_col_set(obj: PEvas_Object; part: pchar; index: dword; col: word): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_position_row_set(obj: PEvas_Object; part: pchar; index: dword; row: word): TEina_Bool; cdecl; external libedje;
procedure edje_edit_part_item_span_get(obj: PEvas_Object; part: pchar; item: pchar; col: pbyte; row: pbyte); cdecl; external libedje; deprecated;
function edje_edit_part_item_span_col_get(obj: PEvas_Object; part: pchar; item: pchar): word; cdecl; external libedje; deprecated;
function edje_edit_part_item_span_row_get(obj: PEvas_Object; part: pchar; item: pchar): word; cdecl; external libedje; deprecated;
function edje_edit_part_item_span_set(obj: PEvas_Object; part: pchar; item: pchar; col: byte; row: byte): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_span_col_set(obj: PEvas_Object; part: pchar; item: pchar; col: word): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_span_row_set(obj: PEvas_Object; part: pchar; item: pchar; row: word): TEina_Bool; cdecl; external libedje; deprecated;
function edje_edit_part_item_index_span_col_set(obj: PEvas_Object; part: pchar; index: dword; col: word): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_span_row_set(obj: PEvas_Object; part: pchar; index: dword; row: word): TEina_Bool; cdecl; external libedje;
function edje_edit_part_item_index_span_col_get(obj: PEvas_Object; part: pchar; index: dword): word; cdecl; external libedje;
function edje_edit_part_item_index_span_row_get(obj: PEvas_Object; part: pchar; index: dword): word; cdecl; external libedje;

{**************************************************************************** }
{*************************   STATES API   *********************************** }
{**************************************************************************** }

function edje_edit_part_states_list_get(obj: PEvas_Object; part: pchar): PEina_List; cdecl; external libedje;
function edje_edit_state_name_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; new_name: pchar; new_value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_add(obj: PEvas_Object; part: pchar; name: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_del(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_exist(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_copy(obj: PEvas_Object; part: pchar; from: pchar; val_from: double; to_: pchar; val_to: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_rel1_relative_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_rel1_relative_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_rel2_relative_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_rel2_relative_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_rel1_relative_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_rel1_relative_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; y: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_rel2_relative_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_rel2_relative_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; y: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_rel1_offset_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_rel1_offset_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_rel2_offset_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_rel2_offset_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_rel1_offset_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_rel1_offset_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; y: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_rel2_offset_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_rel2_offset_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; y: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_rel1_to_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_rel1_to_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_rel2_to_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_rel2_to_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_rel1_to_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; rel_to: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_rel1_to_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; rel_to: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_rel2_to_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; rel_to: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_rel2_to_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; rel_to: pchar): TEina_Bool; cdecl; external libedje;
procedure edje_edit_state_color_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libedje;
procedure edje_edit_state_color2_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libedje;
procedure edje_edit_state_color3_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libedje;
function edje_edit_state_color_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; r: longint; g: longint; b: longint; a: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_color2_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; r: longint; g: longint; b: longint; a: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_color3_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; r: longint; g: longint; b: longint; a: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_align_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_align_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_align_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; align: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_align_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; align: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_min_w_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_min_w_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; min_w: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_min_h_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_min_h_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; min_h: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_max_w_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_max_w_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; max_w: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_max_h_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_max_h_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; max_h: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_minmul_w_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_minmul_w_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; minmul_w: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_minmul_h_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_minmul_h_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; minmul_h: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fixed_w_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fixed_w_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; fixed: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fixed_h_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fixed_h_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; fixed: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_aspect_min_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_aspect_max_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_aspect_min_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; aspect: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_aspect_max_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; aspect: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_aspect_pref_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): byte; cdecl; external libedje;
function edje_edit_state_aspect_pref_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; pref: byte): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fill_smooth_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fill_smooth_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; smooth: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fill_type_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): byte; cdecl; external libedje;
function edje_edit_state_fill_type_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; fill_type: byte): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fill_origin_relative_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_fill_origin_relative_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_fill_origin_offset_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_fill_origin_offset_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_fill_origin_relative_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fill_origin_relative_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; y: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fill_origin_offset_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fill_origin_offset_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; y: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fill_size_relative_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_fill_size_relative_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_fill_size_offset_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_fill_size_offset_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_fill_size_relative_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fill_size_relative_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fill_size_offset_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_fill_size_offset_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; y: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_visible_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_visible_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; visible: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_color_class_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_color_class_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; color_class: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_external_params_list_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): PEina_List; cdecl; external libedje;
function edje_edit_state_external_param_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; param: pchar; _type: PEdje_External_Param_Type; val: Ppointer): TEina_Bool; cdecl; external libedje;
function edje_edit_state_external_param_int_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; param: pchar; val: Plongint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_external_param_bool_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; param: pchar; val: PEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_external_param_double_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; param: pchar; val: Pdouble): TEina_Bool; cdecl; external libedje;
function edje_edit_state_external_param_string_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; param: pchar; val: PPchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_external_param_choice_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; param: pchar; val: PPchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_external_param_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; param: pchar; _type: TEdje_External_Param_Type; args: array of const): TEina_Bool; cdecl; external libedje;
function edje_edit_state_external_param_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; param: pchar; _type: TEdje_External_Param_Type): TEina_Bool; cdecl; external libedje;
function edje_edit_state_external_param_int_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; param: pchar; val: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_external_param_bool_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; param: pchar; val: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_external_param_double_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; param: pchar; val: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_external_param_string_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; param: pchar; val: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_external_param_choice_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; param: pchar; val: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_step_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; step_x: longint; step_y: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_step_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; step_x: Plongint; step_y: Plongint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_limit_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; limit: byte): TEina_Bool; cdecl; external libedje;
function edje_edit_state_limit_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): byte; cdecl; external libedje;

{**************************************************************************** }
{*************************   MAP API   *********************************** }
{**************************************************************************** }

function edje_edit_state_map_on_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_on_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; on: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_perspective_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_map_perspective_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; source_part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_light_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_map_light_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; source_part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_backface_cull_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_backface_cull_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; backface_cull: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_perspective_on_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_perspective_on_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; perspective_on: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_alpha_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_alpha_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; alpha: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_smooth_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_smooth_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; smooth: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_rotation_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: Pdouble; y: Pdouble; z: Pdouble): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_rotation_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: double; y: double; z: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_perspective_focal_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_map_perspective_focal_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; focal: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_perspective_zplane_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_map_perspective_zplane_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; zplane: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_rotation_center_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_map_zoom_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: double; y: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_zoom_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; x: Pdouble; y: Pdouble): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_rotation_center_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; source_part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_point_color_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; idx: longint; r: longint; g: longint; b: longint; a: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_map_point_color_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; idx: longint; r: Plongint; g: Plongint; b: Plongint; a: Plongint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_proxy_source_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; source_name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_proxy_source_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): PEina_Stringshare; cdecl; external libedje;
function edje_edit_state_proxy_source_clip_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; clip: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_proxy_source_clip_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_proxy_source_visible_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; visibility: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_proxy_source_visible_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;

{**************************************************************************** }
{*************************   TEXT API   *********************************** }
{**************************************************************************** }

function edje_edit_state_text_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_text_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; text: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_font_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_font_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; font: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_size_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): longint; cdecl; external libedje;
function edje_edit_state_text_size_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; size: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_align_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_text_align_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_text_align_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; align: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_align_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; align: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_elipsis_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_text_elipsis_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; balance: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_fit_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_fit_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; fit: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_fit_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_fit_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; fit: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_min_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_max_x_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_min_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_max_y_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_min_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; v: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_max_x_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; v: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_min_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; v: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_max_y_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; v: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_style_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_text_style_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; style: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_text_source_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_text_text_source_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; source: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_source_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_text_source_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; source: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_class_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_text_class_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; text_class: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_repch_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_text_repch_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; repch: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_size_range_min_max_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; min: Plongint; max: Plongint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_text_size_range_min_max_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; min: longint; max: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_fonts_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_font_add(obj: PEvas_Object; path: pchar; alias: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_font_del(obj: PEvas_Object; alias: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_font_path_get(obj: PEvas_Object; alias: pchar): pchar; cdecl; external libedje;

{**************************************************************************** }
{***********************   IMAGE SET API   ********************************** }
{**************************************************************************** }

function edje_edit_image_set_exists(obj: PEvas_Object; image: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_image_set_id_get(obj: PEvas_Object; name: pchar): longint; cdecl; external libedje;
function edje_edit_image_set_rename(obj: PEvas_Object; set_: pchar; new_set: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_image_set_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_set_usage_list_get(obj: PEvas_Object; name: pchar; first_only: TEina_Bool): PEina_List; cdecl; external libedje;
function edje_edit_image_set_add(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_image_set_del(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_image_set_images_list_get(obj: PEvas_Object; name: pchar): PEina_List; cdecl; external libedje;
function edje_edit_image_set_image_add(obj: PEvas_Object; set_name: pchar; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_image_set_image_del(obj: PEvas_Object; set_name: pchar; place: dword): TEina_Bool; cdecl; external libedje;
function edje_edit_image_set_image_min_get(obj: PEvas_Object; set_name: pchar; place: dword; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libedje;
function edje_edit_image_set_image_min_set(obj: PEvas_Object; set_name: pchar; place: dword; w: longint; h: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_image_set_image_max_get(obj: PEvas_Object; set_name: pchar; place: dword; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libedje;
function edje_edit_image_set_image_max_set(obj: PEvas_Object; set_name: pchar; place: dword; w: longint; h: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_image_set_image_border_get(obj: PEvas_Object; set_name: pchar; place: dword; l: Plongint; r: Plongint; b: Plongint; t: Plongint): TEina_Bool; cdecl; external libedje;
function edje_edit_image_set_image_border_set(obj: PEvas_Object; set_name: pchar; place: dword; l: longint; r: longint; b: longint; t: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_image_set_image_border_scale_get(obj: PEvas_Object; set_name: pchar; place: dword): double; cdecl; external libedje;
function edje_edit_image_set_image_border_scale_set(obj: PEvas_Object; set_name: pchar; place: dword; scale_by: double): TEina_Bool; cdecl; external libedje;

{**************************************************************************** }
{*************************   IMAGES API   *********************************** }
{**************************************************************************** }

function edje_edit_images_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_image_add(obj: PEvas_Object; path: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_image_del(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_image_replace(obj: PEvas_Object; name: pchar; new_name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_image_rename(obj: PEvas_Object; name: pchar; new_name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_image_usage_list_get(obj: PEvas_Object; name: pchar; first_only: TEina_Bool): PEina_List; cdecl; external libedje;
procedure edje_edit_image_usage_list_free(lst: PEina_List); cdecl; external libedje;
function edje_edit_image_data_add(obj: PEvas_Object; name: pchar; id: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_image_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_image_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; image: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_vector_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): pchar; cdecl; external libedje;
function edje_edit_state_vector_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; image: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_image_id_get(obj: PEvas_Object; image_name: pchar): longint; cdecl; external libedje;
function edje_edit_image_compression_type_get(obj: PEvas_Object; image: pchar): TEdje_Edit_Image_Comp; cdecl; external libedje;
function edje_edit_image_compression_type_set(obj: PEvas_Object; image: pchar; ic: TEdje_Edit_Image_Comp): TEina_Bool; cdecl; external libedje;
function edje_edit_image_compression_rate_get(obj: PEvas_Object; image: pchar): longint; cdecl; external libedje;
procedure edje_edit_state_image_border_get(obj: PEvas_Object; part: pchar; state: pchar; value: double; l: Plongint; r: Plongint; t: Plongint; b: Plongint); cdecl; external libedje;
function edje_edit_state_image_border_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; l: longint; r: longint; t: longint; b: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_image_border_scale_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_image_border_scale_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; scale: TEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_edit_state_image_border_scale_by_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): double; cdecl; external libedje;
function edje_edit_state_image_border_scale_by_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; scale: double): TEina_Bool; cdecl; external libedje;
function edje_edit_state_image_border_fill_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): byte; cdecl; external libedje;
function edje_edit_state_image_border_fill_set(obj: PEvas_Object; part: pchar; state: pchar; value: double; fill: byte): TEina_Bool; cdecl; external libedje;
function edje_edit_state_tweens_list_get(obj: PEvas_Object; part: pchar; state: pchar; value: double): PEina_List; cdecl; external libedje;
function edje_edit_state_tween_add(obj: PEvas_Object; part: pchar; state: pchar; value: double; tween: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_state_tween_insert_at(obj: PEvas_Object; part: pchar; state: pchar; value: double; tween: pchar; place: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_state_tween_del(obj: PEvas_Object; part: pchar; state: pchar; value: double; tween: pchar): TEina_Bool; cdecl; external libedje;

{**************************************************************************** }
{*************************   VECTORS API   *********************************** }
{**************************************************************************** }

function edje_edit_vector_id_get(obj: PEvas_Object; vector_name: pchar): longint; cdecl; external libedje;
function edje_edit_vectors_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_vector_del(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_vector_usage_list_get(obj: PEvas_Object; name: pchar; first_only: TEina_Bool): PEina_List; cdecl; external libedje;

{**************************************************************************** }
{*************************   SOUNDS API   *********************************** }
{**************************************************************************** }

function edje_edit_sound_samples_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_sound_tones_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_sound_sample_add(obj: PEvas_Object; name: pchar; snd_src: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_sound_sample_del(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_sound_tone_add(obj: PEvas_Object; name: pchar; frequency: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_sound_tone_del(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_sound_compression_rate_get(obj: PEvas_Object; sound: pchar): double; cdecl; external libedje;
function edje_edit_sound_compression_rate_set(obj: PEvas_Object; sound: pchar; rate: double): TEina_Bool; cdecl; external libedje;
function edje_edit_sound_tone_frequency_set(obj: PEvas_Object; name: pchar; frequency: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_sound_tone_frequency_get(obj: PEvas_Object; name: pchar): longint; cdecl; external libedje;
function edje_edit_sound_compression_type_get(obj: PEvas_Object; name: pchar): TEdje_Edit_Sound_Comp; cdecl; external libedje;
function edje_edit_sound_compression_type_set(obj: PEvas_Object; name: pchar; sc: TEdje_Edit_Sound_Comp): TEina_Bool; cdecl; external libedje;
function edje_edit_sound_samplebuffer_get(obj: PEvas_Object; sample_name: pchar): PEina_Binbuf; cdecl; external libedje;
function edje_edit_sound_samplesource_get(obj: PEvas_Object; sample_name: pchar): pchar; cdecl; external libedje;

{**************************************************************************** }
{************************   SPECTRUM API   ********************************** }
{**************************************************************************** }

function edje_edit_spectrum_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_spectra_add(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_spectra_del(obj: PEvas_Object; spectra: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_spectra_name_set(obj: PEvas_Object; spectra: pchar; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_spectra_stop_num_get(obj: PEvas_Object; spectra: pchar): longint; cdecl; external libedje;
function edje_edit_spectra_stop_num_set(obj: PEvas_Object; spectra: pchar; num: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_spectra_stop_color_get(obj: PEvas_Object; spectra: pchar; stop_number: longint; r: Plongint; g: Plongint; b: Plongint; a: Plongint; d: Plongint): TEina_Bool; cdecl; external libedje;
function edje_edit_spectra_stop_color_set(obj: PEvas_Object; spectra: pchar; stop_number: longint; r: longint; g: longint; b: longint; a: longint; d: longint): TEina_Bool; cdecl; external libedje;

{**************************************************************************** }
{************************   PROGRAMS API   ********************************** }
{**************************************************************************** }

function edje_edit_programs_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_program_add(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_del(obj: PEvas_Object; prog: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_exist(obj: PEvas_Object; prog: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_run(obj: PEvas_Object; prog: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_stop_all(obj: PEvas_Object): TEina_Bool; cdecl; external libedje;
function edje_edit_program_transition_state_set(obj: PEvas_Object; prog: pchar; pos: double): TEina_Bool; cdecl; external libedje;
function edje_edit_program_name_set(obj: PEvas_Object; prog: pchar; new_name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_source_get(obj: PEvas_Object; prog: pchar): pchar; cdecl; external libedje;
function edje_edit_program_source_set(obj: PEvas_Object; prog: pchar; source: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_signal_get(obj: PEvas_Object; prog: pchar): pchar; cdecl; external libedje;
function edje_edit_program_signal_set(obj: PEvas_Object; prog: pchar; signal: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_in_from_get(obj: PEvas_Object; prog: pchar): double; cdecl; external libedje;
function edje_edit_program_in_from_set(obj: PEvas_Object; prog: pchar; seconds: double): TEina_Bool; cdecl; external libedje;
function edje_edit_program_in_range_get(obj: PEvas_Object; prog: pchar): double; cdecl; external libedje;
function edje_edit_program_in_range_set(obj: PEvas_Object; prog: pchar; seconds: double): TEina_Bool; cdecl; external libedje;
function edje_edit_program_action_get(obj: PEvas_Object; prog: pchar): TEdje_Action_Type; cdecl; external libedje;
function edje_edit_program_action_set(obj: PEvas_Object; prog: pchar; action: TEdje_Action_Type): TEina_Bool; cdecl; external libedje;
function edje_edit_program_targets_get(obj: PEvas_Object; prog: pchar): PEina_List; cdecl; external libedje;
function edje_edit_program_target_add(obj: PEvas_Object; prog: pchar; target: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_target_insert_at(obj: PEvas_Object; prog: pchar; target: pchar; place: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_program_target_del(obj: PEvas_Object; prog: pchar; target: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_targets_clear(obj: PEvas_Object; prog: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_afters_get(obj: PEvas_Object; prog: pchar): PEina_List; cdecl; external libedje;
function edje_edit_program_after_add(obj: PEvas_Object; prog: pchar; after: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_after_insert_at(obj: PEvas_Object; prog: pchar; after: pchar; place: longint): TEina_Bool; cdecl; external libedje;
function edje_edit_program_after_del(obj: PEvas_Object; prog: pchar; after: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_afters_clear(obj: PEvas_Object; prog: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_state_get(obj: PEvas_Object; prog: pchar): pchar; cdecl; external libedje;
function edje_edit_program_api_name_get(obj: PEvas_Object; prog: pchar): pchar; cdecl; external libedje;
function edje_edit_program_api_description_get(obj: PEvas_Object; prog: pchar): pchar; cdecl; external libedje;
function edje_edit_program_api_name_set(obj: PEvas_Object; prog: pchar; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_api_description_set(obj: PEvas_Object; prog: pchar; description: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_state_set(obj: PEvas_Object; prog: pchar; state: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_value_get(obj: PEvas_Object; prog: pchar): double; cdecl; external libedje;
function edje_edit_program_value_set(obj: PEvas_Object; prog: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_program_state2_get(obj: PEvas_Object; prog: pchar): pchar; cdecl; external libedje;
function edje_edit_program_state2_set(obj: PEvas_Object; prog: pchar; state2: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_value2_get(obj: PEvas_Object; prog: pchar): double; cdecl; external libedje;
function edje_edit_program_value2_set(obj: PEvas_Object; prog: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_program_transition_get(obj: PEvas_Object; prog: pchar): TEdje_Tween_Mode; cdecl; external libedje;
function edje_edit_program_transition_set(obj: PEvas_Object; prog: pchar; transition: TEdje_Tween_Mode): TEina_Bool; cdecl; external libedje;
function edje_edit_program_transition_value1_get(obj: PEvas_Object; prog: pchar): double; cdecl; external libedje;
function edje_edit_program_transition_value1_set(obj: PEvas_Object; prog: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_program_transition_value2_get(obj: PEvas_Object; prog: pchar): double; cdecl; external libedje;
function edje_edit_program_transition_value2_set(obj: PEvas_Object; prog: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_program_transition_value3_get(obj: PEvas_Object; prog: pchar): double; cdecl; external libedje;
function edje_edit_program_transition_value3_set(obj: PEvas_Object; prog: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_program_transition_value4_get(obj: PEvas_Object; prog: pchar): double; cdecl; external libedje;
function edje_edit_program_transition_value4_set(obj: PEvas_Object; prog: pchar; value: double): TEina_Bool; cdecl; external libedje;
function edje_edit_program_transition_time_get(obj: PEvas_Object; prog: pchar): double; cdecl; external libedje;
function edje_edit_program_transition_time_set(obj: PEvas_Object; prog: pchar; seconds: double): TEina_Bool; cdecl; external libedje;
function edje_edit_program_sample_name_get(obj: PEvas_Object; prog: pchar): pchar; cdecl; external libedje;
function edje_edit_program_sample_name_set(obj: PEvas_Object; prog: pchar; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_tone_name_get(obj: PEvas_Object; prog: pchar): pchar; cdecl; external libedje;
function edje_edit_program_tone_name_set(obj: PEvas_Object; prog: pchar; name: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_sample_speed_get(obj: PEvas_Object; prog: pchar): double; cdecl; external libedje;
function edje_edit_program_sample_speed_set(obj: PEvas_Object; prog: pchar; speed: double): TEina_Bool; cdecl; external libedje;
function edje_edit_program_tone_duration_get(obj: PEvas_Object; prog: pchar): double; cdecl; external libedje;
function edje_edit_program_tone_duration_set(obj: PEvas_Object; prog: pchar; duration: double): TEina_Bool; cdecl; external libedje;
function edje_edit_program_channel_get(obj: PEvas_Object; prog: pchar): byte; cdecl; external libedje;
function edje_edit_program_channel_set(obj: PEvas_Object; prog: pchar; channel: TEdje_Channel): TEina_Bool; cdecl; external libedje;
function edje_edit_program_filter_part_get(obj: PEvas_Object; prog: pchar): pchar; cdecl; external libedje;
function edje_edit_program_filter_part_set(obj: PEvas_Object; prog: pchar; filter_part: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_program_filter_state_get(obj: PEvas_Object; prog: pchar): pchar; cdecl; external libedje;
function edje_edit_program_filter_state_set(obj: PEvas_Object; prog: pchar; filter_state: pchar): TEina_Bool; cdecl; external libedje;

{**************************************************************************** }
{*************************   SCRIPTS API   ********************************** }
{**************************************************************************** }

function edje_edit_script_get(obj: PEvas_Object): pchar; cdecl; external libedje;
function edje_edit_script_set(obj: PEvas_Object; code: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_script_program_get(obj: PEvas_Object; prog: pchar): pchar; cdecl; external libedje;
function edje_edit_script_program_set(obj: PEvas_Object; prog: pchar; code: pchar): TEina_Bool; cdecl; external libedje;
function edje_edit_script_compile(obj: PEvas_Object): TEina_Bool; cdecl; external libedje;
function edje_edit_script_error_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;

{**************************************************************************** }
{***********************   SOURCE CODE API   ******************************** }
{**************************************************************************** }

function edje_edit_source_generate(obj: PEvas_Object): pchar; cdecl; external libedje;
function edje_edit_object_source_generate(obj: PEvas_Object): pchar; cdecl; external libedje;
function edje_edit_full_source_generate(obj: PEvas_Object): pchar; cdecl; external libedje;
function edje_edit_data_source_generate(obj: PEvas_Object): pchar; cdecl; external libedje;
function edje_edit_object_color_class_list_get(obj: PEvas_Object): PEina_List; cdecl; external libedje;
function edje_edit_color_classes_source_generate(obj: PEvas_Object; color_classes: PEina_List): pchar; cdecl; external libedje;

{**************************************************************************** }
{*************************   ERROR API   ********************************** }
{**************************************************************************** }

var
  EDJE_EDIT_ERROR_GROUP_CURRENTLY_USED: TEina_Error; cvar;external libedje;
  EDJE_EDIT_ERROR_GROUP_REFERENCED: TEina_Error; cvar;external libedje;
  EDJE_EDIT_ERROR_GROUP_DOES_NOT_EXIST: TEina_Error; cvar;external libedje;

  // === Konventiert am: 22-5-25 17:10:09 ===


implementation



end.

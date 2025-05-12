unit evas_canvas_eo_legacy;

interface

uses
  ctypes, elf, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEvas_Canvas = ^TEvas_Canvas;
  TEvas_Canvas = TEo;

procedure evas_image_cache_set(obj: PEvas_Canvas; size: longint); cdecl; external libevas;
function evas_image_cache_get(obj: PEvas_Canvas): longint; cdecl; external libevas;
procedure evas_event_default_flags_set(obj: PEvas_Canvas; flags: TEvas_Event_Flags); cdecl; external libevas;
function evas_event_default_flags_get(obj: PEvas_Canvas): TEvas_Event_Flags; cdecl; external libevas;
procedure evas_font_cache_set(obj: PEvas_Canvas; size: longint); cdecl; external libevas;
function evas_font_cache_get(obj: PEvas_Canvas): longint; cdecl; external libevas;
procedure evas_data_attach_set(obj: PEvas_Canvas; data: pointer); cdecl; external libevas;
function evas_data_attach_get(obj: PEvas_Canvas): pointer; cdecl; external libevas;
function evas_focus_get(obj: PEvas_Canvas): PEfl_Canvas_Object; cdecl; external libevas;
function evas_seat_focus_get(obj: PEvas_Canvas; seat: PEvas_Device): PEfl_Canvas_Object; cdecl; external libevas;
function evas_object_top_get(obj: PEvas_Canvas): PEfl_Canvas_Object; cdecl; external libevas;
procedure evas_pointer_canvas_xy_by_device_get(obj: PEvas_Canvas; dev: PEvas_Device; x: Plongint; y: Plongint); cdecl; external libevas;
procedure evas_pointer_canvas_xy_get(obj: PEvas_Canvas; x: Plongint; y: Plongint); cdecl; external libevas;
function evas_event_down_count_get(obj: PEvas_Canvas): longint; cdecl; external libevas;
function evas_smart_objects_calculate_count_get(obj: PEvas_Canvas): longint; cdecl; external libevas;
function evas_focus_state_get(obj: PEvas_Canvas): TEina_Bool; cdecl; external libevas;
function evas_seat_focus_state_get(obj: PEvas_Canvas; seat: PEvas_Device): TEina_Bool; cdecl; external libevas;
function evas_changed_get(obj: PEvas_Canvas): TEina_Bool; cdecl; external libevas;
procedure evas_pointer_output_xy_by_device_get(obj: PEvas_Canvas; dev: PEvas_Device; x: Plongint; y: Plongint); cdecl; external libevas;
procedure evas_pointer_output_xy_get(obj: PEvas_Canvas; x: Plongint; y: Plongint); cdecl; external libevas;
function evas_object_bottom_get(obj: PEvas_Canvas): PEfl_Canvas_Object; cdecl; external libevas;
function evas_pointer_button_down_mask_by_device_get(obj: PEvas_Canvas; dev: PEvas_Device): dword; cdecl; external libevas;
function evas_pointer_button_down_mask_get(obj: PEvas_Canvas): dword; cdecl; external libevas;
function evas_tree_objects_at_xy_get(obj: PEvas_Canvas; stop: PEfl_Canvas_Object; x: longint; y: longint): PEina_List; cdecl; external libevas;
procedure evas_key_lock_on(obj: PEvas_Canvas; keyname: pchar); cdecl; external libevas;
procedure evas_seat_key_lock_on(obj: PEvas_Canvas; keyname: pchar; seat: PEvas_Device); cdecl; external libevas;
procedure evas_seat_key_lock_off(obj: PEvas_Canvas; keyname: pchar; seat: PEvas_Device); cdecl; external libevas;
procedure evas_key_modifier_add(obj: PEvas_Canvas; keyname: pchar); cdecl; external libevas;
procedure evas_key_modifier_off(obj: PEvas_Canvas; keyname: pchar); cdecl; external libevas;
function evas_render_async(obj: PEvas_Canvas): TEina_Bool; cdecl; external libevas;
procedure evas_focus_out(obj: PEvas_Canvas); cdecl; external libevas;
procedure evas_norender(obj: PEvas_Canvas); cdecl; external libevas;
procedure evas_norender_with_updates(eo_e: PEo); cdecl; external libevas;
procedure evas_nochange_pop(obj: PEvas_Canvas); cdecl; external libevas;
procedure evas_key_lock_off(obj: PEvas_Canvas; keyname: pchar); cdecl; external libevas;
procedure evas_nochange_push(obj: PEvas_Canvas); cdecl; external libevas;
procedure evas_font_cache_flush(obj: PEvas_Canvas); cdecl; external libevas;
procedure evas_key_modifier_on(obj: PEvas_Canvas; keyname: pchar); cdecl; external libevas;
procedure evas_seat_key_modifier_on(obj: PEvas_Canvas; keyname: pchar; seat: PEvas_Device); cdecl; external libevas;
procedure evas_seat_key_modifier_off(obj: PEvas_Canvas; keyname: pchar; seat: PEvas_Device); cdecl; external libevas;
function evas_font_available_list(obj: PEvas_Canvas): PEina_List; cdecl; external libevas;
function evas_object_name_find(obj: PEvas_Canvas; name: pchar): PEfl_Canvas_Object; cdecl; external libevas;
procedure evas_font_path_append(obj: PEvas_Canvas; path: pchar); cdecl; external libevas;
procedure evas_font_path_clear(obj: PEvas_Canvas); cdecl; external libevas;
procedure evas_key_lock_del(obj: PEvas_Canvas; keyname: pchar); cdecl; external libevas;
procedure evas_damage_rectangle_add(obj: PEvas_Canvas; x: longint; y: longint; w: longint; h: longint); cdecl; external libevas;
procedure evas_sync(obj: PEvas_Canvas); cdecl; external libevas;
function evas_font_path_list(obj: PEvas_Canvas): PEina_List; cdecl; external libevas;
procedure evas_image_cache_reload(obj: PEvas_Canvas); cdecl; external libevas;
function evas_coord_world_x_to_screen(obj: PEvas_Canvas; x: longint): longint; cdecl; external libevas;
function evas_render_updates(obj: PEvas_Canvas): PEina_List; cdecl; external libevas;
procedure evas_image_cache_flush(obj: PEvas_Canvas); cdecl; external libevas;
function evas_coord_screen_y_to_world(obj: PEvas_Canvas; y: longint): longint; cdecl; external libevas;
procedure evas_key_modifier_del(obj: PEvas_Canvas; keyname: pchar); cdecl; external libevas;
procedure evas_focus_in(obj: PEvas_Canvas); cdecl; external libevas;
procedure evas_obscured_rectangle_add(obj: PEvas_Canvas; x: longint; y: longint; w: longint; h: longint); cdecl; external libevas;
procedure evas_render_dump(obj: PEvas_Canvas); cdecl; external libevas;
procedure evas_render(obj: PEvas_Canvas); cdecl; external libevas;
procedure evas_font_path_prepend(obj: PEvas_Canvas; path: pchar); cdecl; external libevas;
procedure evas_obscured_clear(obj: PEvas_Canvas); cdecl; external libevas;
function evas_coord_screen_x_to_world(obj: PEvas_Canvas; x: longint): longint; cdecl; external libevas;
procedure evas_key_lock_add(obj: PEvas_Canvas; keyname: pchar); cdecl; external libevas;
procedure evas_render_idle_flush(obj: PEvas_Canvas); cdecl; external libevas;
function evas_default_device_get(obj: PEvas_Canvas; _type: TEvas_Device_Class): PEvas_Device; cdecl; external libevas;
function evas_coord_world_y_to_screen(obj: PEvas_Canvas; y: longint): longint; cdecl; external libevas;

// === Konventiert am: 11-5-25 19:38:08 ===


implementation



end.

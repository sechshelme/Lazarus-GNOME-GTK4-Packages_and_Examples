

  {$IFDEF read_struct}
type
  Twl_display_interface = record
    sync: procedure(client: Pwl_client; resource: Pwl_resource; callback: Tuint32_t); cdecl;
    get_registry: procedure(client: Pwl_client; resource: Pwl_resource; registry: Tuint32_t); cdecl;
  end;
  Pwl_display_interface = ^Twl_display_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_DISPLAY_ERROR = 0;
  WL_DISPLAY_DELETE_ID = 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_registry_interface = record
    bind: procedure(client: Pwl_client; resource: Pwl_resource; name: Tuint32_t; iface: pchar; version: Tuint32_t; id: Tuint32_t); cdecl;
  end;
  Pwl_registry_interface = ^Twl_registry_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_REGISTRY_GLOBAL = 0;
  WL_REGISTRY_GLOBAL_REMOVE = 1;
  WL_CALLBACK_DONE = 0;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_compositor_interface = record
    create_surface: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t); cdecl;
    create_region: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t); cdecl;
  end;
  Pwl_compositor_interface = ^Twl_compositor_interface;
  {$ENDIF read_struct}

  {$IFDEF read_struct}
type
  Twl_shm_pool_interface = record
    create_buffer: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t; offset: Tint32_t; width: Tint32_t; height: Tint32_t; stride: Tint32_t; format: Tuint32_t); cdecl;
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    resize: procedure(client: Pwl_client; resource: Pwl_resource; size: Tint32_t); cdecl;
  end;
  Pwl_shm_pool_interface = ^Twl_shm_pool_interface;
  {$ENDIF read_struct}

  {$IFDEF read_struct}
type
  Twl_shm_interface = record
    create_pool: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t; fd: Tint32_t; size: Tint32_t); cdecl;
  end;
  Pwl_shm_interface = ^Twl_shm_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_SHM_FORMAT = 0;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_buffer_interface = record
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;
  Pwl_buffer_interface = ^Twl_buffer_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_BUFFER_RELEASE = 0;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_data_offer_interface = record
    accept: procedure(client: Pwl_client; resource: Pwl_resource; serial: Tuint32_t; mime_type: pchar); cdecl;
    receive: procedure(client: Pwl_client; resource: Pwl_resource; mime_type: pchar; fd: Tint32_t); cdecl;
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    finish: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    set_actions: procedure(client: Pwl_client; resource: Pwl_resource; dnd_actions: Tuint32_t; preferred_action: Tuint32_t); cdecl;
  end;
  Pwl_data_offer_interface = ^Twl_data_offer_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_DATA_OFFER_OFFER = 0;
  WL_DATA_OFFER_SOURCE_ACTIONS = 1;
  WL_DATA_OFFER_ACTION = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_data_source_interface = record
    offer: procedure(client: Pwl_client; resource: Pwl_resource; mime_type: pchar); cdecl;
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    set_actions: procedure(client: Pwl_client; resource: Pwl_resource; dnd_actions: Tuint32_t); cdecl;
  end;
  Pwl_data_source_interface = ^Twl_data_source_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_DATA_SOURCE_TARGET = 0;
  WL_DATA_SOURCE_SEND = 1;
  WL_DATA_SOURCE_CANCELLED = 2;
  WL_DATA_SOURCE_DND_DROP_PERFORMED = 3;
  WL_DATA_SOURCE_DND_FINISHED = 4;
  WL_DATA_SOURCE_ACTION = 5;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_data_device_interface = record
    start_drag: procedure(client: Pwl_client; resource: Pwl_resource; source: Pwl_resource; origin: Pwl_resource; icon: Pwl_resource; serial: Tuint32_t); cdecl;
    set_selection: procedure(client: Pwl_client; resource: Pwl_resource; source: Pwl_resource; serial: Tuint32_t); cdecl;
    release: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;
  Pwl_data_device_interface = ^Twl_data_device_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_DATA_DEVICE_DATA_OFFER = 0;
  WL_DATA_DEVICE_ENTER = 1;
  WL_DATA_DEVICE_LEAVE = 2;
  WL_DATA_DEVICE_MOTION = 3;
  WL_DATA_DEVICE_DROP = 4;
  WL_DATA_DEVICE_SELECTION = 5;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_data_device_manager_interface = record
    create_data_source: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t); cdecl;
    get_data_device: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t; seat: Pwl_resource); cdecl;
  end;
  Pwl_data_device_manager_interface = ^Twl_data_device_manager_interface;
  {$ENDIF read_struct}

  {$IFDEF read_struct}
type
  Twl_shell_interface = record
    get_shell_surface: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t; surface: Pwl_resource); cdecl;
  end;
  Pwl_shell_interface = ^Twl_shell_interface;
  {$ENDIF read_struct}

  {$IFDEF read_struct}
type
  Twl_shell_surface_interface = record
    pong: procedure(client: Pwl_client; resource: Pwl_resource; serial: Tuint32_t); cdecl;
    move: procedure(client: Pwl_client; resource: Pwl_resource; seat: Pwl_resource; serial: Tuint32_t); cdecl;
    resize: procedure(client: Pwl_client; resource: Pwl_resource; seat: Pwl_resource; serial: Tuint32_t; edges: Tuint32_t); cdecl;
    set_toplevel: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    set_transient: procedure(client: Pwl_client; resource: Pwl_resource; parent: Pwl_resource; x: Tint32_t; y: Tint32_t; flags: Tuint32_t); cdecl;
    set_fullscreen: procedure(client: Pwl_client; resource: Pwl_resource; method: Tuint32_t; framerate: Tuint32_t; output: Pwl_resource); cdecl;
    set_popup: procedure(client: Pwl_client; resource: Pwl_resource; seat: Pwl_resource; serial: Tuint32_t; parent: Pwl_resource; x: Tint32_t; y: Tint32_t; flags: Tuint32_t); cdecl;
    set_maximized: procedure(client: Pwl_client; resource: Pwl_resource; output: Pwl_resource); cdecl;
    set_title: procedure(client: Pwl_client; resource: Pwl_resource; title: pchar); cdecl;
    set_class: procedure(client: Pwl_client; resource: Pwl_resource; class_: pchar); cdecl;
  end;
  Pwl_shell_surface_interface = ^Twl_shell_surface_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_SHELL_SURFACE_PING = 0;
  WL_SHELL_SURFACE_CONFIGURE = 1;
  WL_SHELL_SURFACE_POPUP_DONE = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_surface_interface = record
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    attach: procedure(client: Pwl_client; resource: Pwl_resource; buffer: Pwl_resource; x: Tint32_t; y: Tint32_t); cdecl;
    damage: procedure(client: Pwl_client; resource: Pwl_resource; x: Tint32_t; y: Tint32_t; width: Tint32_t; height: Tint32_t); cdecl;
    frame: procedure(client: Pwl_client; resource: Pwl_resource; callback: Tuint32_t); cdecl;
    set_opaque_region: procedure(client: Pwl_client; resource: Pwl_resource; region: Pwl_resource); cdecl;
    set_input_region: procedure(client: Pwl_client; resource: Pwl_resource; region: Pwl_resource); cdecl;
    commit: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    set_buffer_transform: procedure(client: Pwl_client; resource: Pwl_resource; transform: Tint32_t); cdecl;
    set_buffer_scale: procedure(client: Pwl_client; resource: Pwl_resource; scale: Tint32_t); cdecl;
    damage_buffer: procedure(client: Pwl_client; resource: Pwl_resource; x: Tint32_t; y: Tint32_t; width: Tint32_t; height: Tint32_t); cdecl;
    offset: procedure(client: Pwl_client; resource: Pwl_resource; x: Tint32_t; y: Tint32_t); cdecl;
  end;
  Pwl_surface_interface = ^Twl_surface_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_SURFACE_ENTER = 0;
  WL_SURFACE_LEAVE = 1;
  WL_SURFACE_PREFERRED_BUFFER_SCALE = 2;
  WL_SURFACE_PREFERRED_BUFFER_TRANSFORM = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_seat_interface = record
    get_pointer: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t); cdecl;
    get_keyboard: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t); cdecl;
    get_touch: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t); cdecl;
    release: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;
  Pwl_seat_interface = ^Twl_seat_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_SEAT_CAPABILITIES = 0;
  WL_SEAT_NAME = 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_pointer_interface = record
    set_cursor: procedure(client: Pwl_client; resource: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; hotspot_x: Tint32_t; hotspot_y: Tint32_t); cdecl;
    release: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;
  Pwl_pointer_interface = ^Twl_pointer_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_POINTER_ENTER = 0;
  WL_POINTER_LEAVE = 1;
  WL_POINTER_MOTION = 2;
  WL_POINTER_BUTTON = 3;
  WL_POINTER_AXIS = 4;
  WL_POINTER_FRAME = 5;
  WL_POINTER_AXIS_SOURCE = 6;
  WL_POINTER_AXIS_STOP = 7;
  WL_POINTER_AXIS_DISCRETE = 8;
  WL_POINTER_AXIS_VALUE120 = 9;
  WL_POINTER_AXIS_RELATIVE_DIRECTION = 10;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_keyboard_interface = record
    release: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;
  Pwl_keyboard_interface = ^Twl_keyboard_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_KEYBOARD_KEYMAP = 0;
  WL_KEYBOARD_ENTER = 1;
  WL_KEYBOARD_LEAVE = 2;
  WL_KEYBOARD_KEY = 3;
  WL_KEYBOARD_MODIFIERS = 4;
  WL_KEYBOARD_REPEAT_INFO = 5;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_touch_interface = record
    release: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;
  Pwl_touch_interface = ^Twl_touch_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_TOUCH_DOWN = 0;
  WL_TOUCH_UP = 1;
  WL_TOUCH_MOTION = 2;
  WL_TOUCH_FRAME = 3;
  WL_TOUCH_CANCEL = 4;
  WL_TOUCH_SHAPE = 5;
  WL_TOUCH_ORIENTATION = 6;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_output_interface = record
    release: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;
  Pwl_output_interface = ^Twl_output_interface;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  WL_OUTPUT_GEOMETRY = 0;
  WL_OUTPUT_MODE = 1;
  WL_OUTPUT_DONE = 2;
  WL_OUTPUT_SCALE = 3;
  WL_OUTPUT_NAME = 4;
  WL_OUTPUT_DESCRIPTION = 5;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Twl_region_interface = record
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    add: procedure(client: Pwl_client; resource: Pwl_resource; x: Tint32_t; y: Tint32_t; width: Tint32_t; height: Tint32_t); cdecl;
    subtract: procedure(client: Pwl_client; resource: Pwl_resource; x: Tint32_t; y: Tint32_t; width: Tint32_t; height: Tint32_t); cdecl;
  end;
  Pwl_region_interface = ^Twl_region_interface;
  {$ENDIF read_struct}

  {$IFDEF read_struct}
type
  Twl_subcompositor_interface = record
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    get_subsurface: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t; surface: Pwl_resource; parent: Pwl_resource); cdecl;
  end;
  Pwl_subcompositor_interface = ^Twl_subcompositor_interface;
  {$ENDIF read_struct}

  {$IFDEF read_struct}
type
  Twl_subsurface_interface = record
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    set_position: procedure(client: Pwl_client; resource: Pwl_resource; x: Tint32_t; y: Tint32_t); cdecl;
    place_above: procedure(client: Pwl_client; resource: Pwl_resource; sibling: Pwl_resource); cdecl;
    place_below: procedure(client: Pwl_client; resource: Pwl_resource; sibling: Pwl_resource); cdecl;
    set_sync: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    set_desync: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;
  Pwl_subsurface_interface = ^Twl_subsurface_interface;
  {$ENDIF read_struct}

  // === Konventiert am: 11-6-26 14:34:33 ===

{$IFDEF read_function}
procedure wl_registry_send_global(resource_: Pwl_resource; name: Tuint32_t; interface_: pchar; version: Tuint32_t); inline;
procedure wl_registry_send_global_remove(resource_: Pwl_resource; name: Tuint32_t); inline;
procedure wl_callback_send_done(resource_: Pwl_resource; callback_data: Tuint32_t); inline;
procedure wl_shm_send_format(resource_: Pwl_resource; format: Tuint32_t); inline;
procedure wl_buffer_send_release(resource_: Pwl_resource); inline;
procedure wl_data_offer_send_offer(resource_: Pwl_resource; mime_type: pchar); inline;
procedure wl_data_offer_send_source_actions(resource_: Pwl_resource; source_actions: Tuint32_t); inline;
procedure wl_data_offer_send_action(resource_: Pwl_resource; dnd_action: Tuint32_t); inline;
procedure wl_data_source_send_target(resource_: Pwl_resource; mime_type: pchar); inline;
procedure wl_data_source_send_send(resource_: Pwl_resource; mime_type: pchar; fd: Tint32_t); inline;
procedure wl_data_source_send_cancelled(resource_: Pwl_resource); inline;
procedure wl_data_source_send_dnd_drop_performed(resource_: Pwl_resource); inline;
procedure wl_data_source_send_dnd_finished(resource_: Pwl_resource); inline;
procedure wl_data_source_send_action(resource_: Pwl_resource; dnd_action: Tuint32_t); inline;
procedure wl_data_device_send_data_offer(resource_: Pwl_resource; id: Pwl_resource); inline;
procedure wl_data_device_send_enter(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; x: Twl_fixed_t; y: Twl_fixed_t; id: Pwl_resource); inline;
procedure wl_data_device_send_leave(resource_: Pwl_resource); inline;
procedure wl_data_device_send_motion(resource_: Pwl_resource; time: Tuint32_t; x: Twl_fixed_t; y: Twl_fixed_t); inline;
procedure wl_data_device_send_drop(resource_: Pwl_resource); inline;
procedure wl_data_device_send_selection(resource_: Pwl_resource; id: Pwl_resource); inline;
procedure wl_shell_surface_send_ping(resource_: Pwl_resource; serial: Tuint32_t); inline;
procedure wl_shell_surface_send_configure(resource_: Pwl_resource; edges: Tuint32_t; width: Tint32_t; height: Tint32_t); inline;
procedure wl_shell_surface_send_popup_done(resource_: Pwl_resource); inline;
procedure wl_surface_send_enter(resource_: Pwl_resource; output: Pwl_resource); inline;
procedure wl_surface_send_leave(resource_: Pwl_resource; output: Pwl_resource); inline;
procedure wl_surface_send_preferred_buffer_scale(resource_: Pwl_resource; factor: Tint32_t); inline;
procedure wl_surface_send_preferred_buffer_transform(resource_: Pwl_resource; transform: Tuint32_t); inline;
procedure wl_seat_send_capabilities(resource_: Pwl_resource; capabilities: Tuint32_t); inline;
procedure wl_seat_send_name(resource_: Pwl_resource; name: pchar); inline;
procedure wl_pointer_send_enter(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; surface_x: Twl_fixed_t; surface_y: Twl_fixed_t); inline;
procedure wl_pointer_send_leave(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource); inline;
procedure wl_pointer_send_motion(resource_: Pwl_resource; time: Tuint32_t; surface_x: Twl_fixed_t; surface_y: Twl_fixed_t); inline;
procedure wl_pointer_send_button(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; button: Tuint32_t; state: Tuint32_t); inline;
procedure wl_pointer_send_axis(resource_: Pwl_resource; time: Tuint32_t; axis: Tuint32_t; value: Twl_fixed_t); inline;
procedure wl_pointer_send_frame(resource_: Pwl_resource); inline;
procedure wl_pointer_send_axis_source(resource_: Pwl_resource; axis_source: Tuint32_t); inline;
procedure wl_pointer_send_axis_stop(resource_: Pwl_resource; time: Tuint32_t; axis: Tuint32_t); inline;
procedure wl_pointer_send_axis_discrete(resource_: Pwl_resource; axis: Tuint32_t; discrete: Tint32_t); inline;
procedure wl_pointer_send_axis_value120(resource_: Pwl_resource; axis: Tuint32_t; value120: Tint32_t); inline;
procedure wl_pointer_send_axis_relative_direction(resource_: Pwl_resource; axis: Tuint32_t; direction: Tuint32_t); inline;
procedure wl_keyboard_send_keymap(resource_: Pwl_resource; format: Tuint32_t; fd: Tint32_t; size: Tuint32_t); inline;
procedure wl_keyboard_send_enter(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; keys: Pwl_array); inline;
procedure wl_keyboard_send_leave(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource); inline;
procedure wl_keyboard_send_key(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; key: Tuint32_t; state: Tuint32_t); inline;
procedure wl_keyboard_send_modifiers(resource_: Pwl_resource; serial: Tuint32_t; mods_depressed: Tuint32_t; mods_latched: Tuint32_t; mods_locked: Tuint32_t; group: Tuint32_t); inline;
procedure wl_keyboard_send_repeat_info(resource_: Pwl_resource; rate: Tint32_t; delay: Tint32_t); inline;
procedure wl_touch_send_down(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; surface: Pwl_resource; id: Tint32_t; x: Twl_fixed_t; y: Twl_fixed_t); inline;
procedure wl_touch_send_up(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; id: Tint32_t); inline;
procedure wl_touch_send_motion(resource_: Pwl_resource; time: Tuint32_t; id: Tint32_t; x: Twl_fixed_t; y: Twl_fixed_t); inline;
procedure wl_touch_send_frame(resource_: Pwl_resource); inline;
procedure wl_touch_send_cancel(resource_: Pwl_resource); inline;
procedure wl_touch_send_shape(resource_: Pwl_resource; id: Tint32_t; major: Twl_fixed_t; minor: Twl_fixed_t); inline;
procedure wl_touch_send_orientation(resource_: Pwl_resource; id: Tint32_t; orientation: Twl_fixed_t); inline;
procedure wl_output_send_geometry(resource_: Pwl_resource; x: Tint32_t; y: Tint32_t; physical_width: Tint32_t; physical_height: Tint32_t; subpixel: Tint32_t; make: pchar; model: pchar; transform: Tint32_t); inline;
procedure wl_output_send_mode(resource_: Pwl_resource; flags: Tuint32_t; width: Tint32_t; height: Tint32_t; refresh: Tint32_t); inline;
procedure wl_output_send_done(resource_: Pwl_resource); inline;
procedure wl_output_send_scale(resource_: Pwl_resource; factor: Tint32_t); inline;
procedure wl_output_send_name(resource_: Pwl_resource; name: pchar); inline;
procedure wl_output_send_description(resource_: Pwl_resource; description: pchar); inline;
{$ENDIF read_function}


{$IFDEF read_implementation}
procedure wl_registry_send_global(resource_: Pwl_resource; name: Tuint32_t; interface_: pchar; version: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_REGISTRY_GLOBAL, name, interface_, version);
end;

procedure wl_registry_send_global_remove(resource_: Pwl_resource; name: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_REGISTRY_GLOBAL_REMOVE, name);
end;

procedure wl_callback_send_done(resource_: Pwl_resource; callback_data: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_CALLBACK_DONE, callback_data);
end;

procedure wl_shm_send_format(resource_: Pwl_resource; format: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_SHM_FORMAT, format);
end;

procedure wl_buffer_send_release(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_BUFFER_RELEASE);
end;

procedure wl_data_offer_send_offer(resource_: Pwl_resource; mime_type: pchar); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_OFFER_OFFER, mime_type);
end;

procedure wl_data_offer_send_source_actions(resource_: Pwl_resource; source_actions: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_OFFER_SOURCE_ACTIONS, source_actions);
end;

procedure wl_data_offer_send_action(resource_: Pwl_resource; dnd_action: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_OFFER_ACTION, dnd_action);
end;

procedure wl_data_source_send_target(resource_: Pwl_resource; mime_type: pchar); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_SOURCE_TARGET, mime_type);
end;

procedure wl_data_source_send_send(resource_: Pwl_resource; mime_type: pchar; fd: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_SOURCE_SEND, mime_type, fd);
end;

procedure wl_data_source_send_cancelled(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_SOURCE_CANCELLED);
end;

procedure wl_data_source_send_dnd_drop_performed(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_SOURCE_DND_DROP_PERFORMED);
end;

procedure wl_data_source_send_dnd_finished(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_SOURCE_DND_FINISHED);
end;

procedure wl_data_source_send_action(resource_: Pwl_resource; dnd_action: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_SOURCE_ACTION, dnd_action);
end;

procedure wl_data_device_send_data_offer(resource_: Pwl_resource; id: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_DEVICE_DATA_OFFER, id);
end;

procedure wl_data_device_send_enter(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; x: Twl_fixed_t; y: Twl_fixed_t; id: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_DEVICE_ENTER, serial, surface, x, y, id);
end;

procedure wl_data_device_send_leave(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_DEVICE_LEAVE);
end;

procedure wl_data_device_send_motion(resource_: Pwl_resource; time: Tuint32_t; x: Twl_fixed_t; y: Twl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_DEVICE_MOTION, time, x, y);
end;

procedure wl_data_device_send_drop(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_DEVICE_DROP);
end;

procedure wl_data_device_send_selection(resource_: Pwl_resource; id: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_DEVICE_SELECTION, id);
end;

procedure wl_shell_surface_send_ping(resource_: Pwl_resource; serial: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_SHELL_SURFACE_PING, serial);
end;

procedure wl_shell_surface_send_configure(resource_: Pwl_resource; edges: Tuint32_t; width: Tint32_t; height: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_SHELL_SURFACE_CONFIGURE, edges, width, height);
end;

procedure wl_shell_surface_send_popup_done(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_SHELL_SURFACE_POPUP_DONE);
end;

procedure wl_surface_send_enter(resource_: Pwl_resource; output: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_SURFACE_ENTER, output);
end;

procedure wl_surface_send_leave(resource_: Pwl_resource; output: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_SURFACE_LEAVE, output);
end;

procedure wl_surface_send_preferred_buffer_scale(resource_: Pwl_resource; factor: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_SURFACE_PREFERRED_BUFFER_SCALE, factor);
end;

procedure wl_surface_send_preferred_buffer_transform(resource_: Pwl_resource; transform: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_SURFACE_PREFERRED_BUFFER_TRANSFORM, transform);
end;

procedure wl_seat_send_capabilities(resource_: Pwl_resource; capabilities: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_SEAT_CAPABILITIES, capabilities);
end;

procedure wl_seat_send_name(resource_: Pwl_resource; name: pchar); inline;
begin
  wl_resource_post_event(resource_, WL_SEAT_NAME, name);
end;

procedure wl_pointer_send_enter(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; surface_x: Twl_fixed_t; surface_y: Twl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_ENTER, serial, surface, surface_x, surface_y);
end;

procedure wl_pointer_send_leave(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_LEAVE, serial, surface);
end;

procedure wl_pointer_send_motion(resource_: Pwl_resource; time: Tuint32_t; surface_x: Twl_fixed_t; surface_y: Twl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_MOTION, time, surface_x, surface_y);
end;

procedure wl_pointer_send_button(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; button: Tuint32_t; state: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_BUTTON, serial, time, button, state);
end;

procedure wl_pointer_send_axis(resource_: Pwl_resource; time: Tuint32_t; axis: Tuint32_t; value: Twl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_AXIS, time, axis, value);
end;

procedure wl_pointer_send_frame(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_FRAME);
end;

procedure wl_pointer_send_axis_source(resource_: Pwl_resource; axis_source: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_AXIS_SOURCE, axis_source);
end;

procedure wl_pointer_send_axis_stop(resource_: Pwl_resource; time: Tuint32_t; axis: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_AXIS_STOP, time, axis);
end;

procedure wl_pointer_send_axis_discrete(resource_: Pwl_resource; axis: Tuint32_t; discrete: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_AXIS_DISCRETE, axis, discrete);
end;

procedure wl_pointer_send_axis_value120(resource_: Pwl_resource; axis: Tuint32_t; value120: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_AXIS_VALUE120, axis, value120);
end;

procedure wl_pointer_send_axis_relative_direction(resource_: Pwl_resource; axis: Tuint32_t; direction: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_AXIS_RELATIVE_DIRECTION, axis, direction);
end;

procedure wl_keyboard_send_keymap(resource_: Pwl_resource; format: Tuint32_t; fd: Tint32_t; size: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_KEYBOARD_KEYMAP, format, fd, size);
end;

procedure wl_keyboard_send_enter(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; keys: Pwl_array); inline;
begin
  wl_resource_post_event(resource_, WL_KEYBOARD_ENTER, serial, surface, keys);
end;

procedure wl_keyboard_send_leave(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_KEYBOARD_LEAVE, serial, surface);
end;

procedure wl_keyboard_send_key(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; key: Tuint32_t; state: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_KEYBOARD_KEY, serial, time, key, state);
end;

procedure wl_keyboard_send_modifiers(resource_: Pwl_resource; serial: Tuint32_t; mods_depressed: Tuint32_t; mods_latched: Tuint32_t; mods_locked: Tuint32_t; group: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_KEYBOARD_MODIFIERS, serial, mods_depressed, mods_latched, mods_locked, group);
end;

procedure wl_keyboard_send_repeat_info(resource_: Pwl_resource; rate: Tint32_t; delay: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_KEYBOARD_REPEAT_INFO, rate, delay);
end;

procedure wl_touch_send_down(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; surface: Pwl_resource; id: Tint32_t; x: Twl_fixed_t; y: Twl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_DOWN, serial, time, surface, id, x, y);
end;

procedure wl_touch_send_up(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; id: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_UP, serial, time, id);
end;

procedure wl_touch_send_motion(resource_: Pwl_resource; time: Tuint32_t; id: Tint32_t; x: Twl_fixed_t; y: Twl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_MOTION, time, id, x, y);
end;

procedure wl_touch_send_frame(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_FRAME);
end;

procedure wl_touch_send_cancel(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_CANCEL);
end;

procedure wl_touch_send_shape(resource_: Pwl_resource; id: Tint32_t; major: Twl_fixed_t; minor: Twl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_SHAPE, id, major, minor);
end;

procedure wl_touch_send_orientation(resource_: Pwl_resource; id: Tint32_t; orientation: Twl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_ORIENTATION, id, orientation);
end;

procedure wl_output_send_geometry(resource_: Pwl_resource; x: Tint32_t; y: Tint32_t; physical_width: Tint32_t; physical_height: Tint32_t; subpixel: Tint32_t; make: pchar; model: pchar; transform: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_OUTPUT_GEOMETRY, x, y, physical_width, physical_height, subpixel, make, model, transform);
end;

procedure wl_output_send_mode(resource_: Pwl_resource; flags: Tuint32_t; width: Tint32_t; height: Tint32_t; refresh: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_OUTPUT_MODE, flags, width, height, refresh);
end;

procedure wl_output_send_done(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_OUTPUT_DONE);
end;

procedure wl_output_send_scale(resource_: Pwl_resource; factor: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_OUTPUT_SCALE, factor);
end;

procedure wl_output_send_name(resource_: Pwl_resource; name: pchar); inline;
begin
  wl_resource_post_event(resource_, WL_OUTPUT_NAME, name);
end;

procedure wl_output_send_description(resource_: Pwl_resource; description: pchar); inline;
begin
  wl_resource_post_event(resource_, WL_OUTPUT_DESCRIPTION, description);
end;

{$ENDIF read_implementation}

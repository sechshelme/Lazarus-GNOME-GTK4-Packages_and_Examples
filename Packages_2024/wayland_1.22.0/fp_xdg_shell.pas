unit fp_xdg_shell;

interface

uses
  fp_wayland;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

var
  xdg_wm_base_interface: Twl_interface; cvar;
  xdg_positioner_interface: Twl_interface; cvar;
  xdg_surface_interface: Twl_interface; cvar;
  xdg_toplevel_interface: Twl_interface; cvar;
  xdg_popup_interface: Twl_interface; cvar;

var
  xdg_shell_types: array[0..25] of Pwl_interface;

const
  xdg_wm_base_requests: array[0..3] of twl_message = (
    (name: 'destroy'; signature: ''; types: @xdg_shell_types[0]),
    (name: 'create_positioner'; signature: 'n'; types: @xdg_shell_types[4]),
    (name: 'get_xdg_surface'; signature: 'no'; types: @xdg_shell_types[5]),
    (name: 'pong'; signature: 'u'; types: @xdg_shell_types[0]));

  xdg_wm_base_events: array[0..0] of twl_message = (
    (name: 'ping'; signature: 'u'; types: @xdg_shell_types[0]));

  xdg_positioner_requests: array[0..9] of twl_message = (
    (name: 'destroy'; signature: ''; types: @xdg_shell_types[0]),
    (name: 'set_size'; signature: 'ii'; types: @xdg_shell_types[0]),
    (name: 'set_anchor_rect'; signature: 'iiii'; types: @xdg_shell_types[0]),
    (name: 'set_anchor'; signature: 'u'; types: @xdg_shell_types[0]),
    (name: 'set_gravity'; signature: 'u'; types: @xdg_shell_types[0]),
    (name: 'set_constraint_adjustment'; signature: 'u'; types: @xdg_shell_types[0]),
    (name: 'set_offset'; signature: 'ii'; types: @xdg_shell_types[0]),
    (name: 'set_reactive'; signature: '3'; types: @xdg_shell_types[0]),
    (name: 'set_parent_size'; signature: '3ii'; types: @xdg_shell_types[0]),
    (name: 'set_parent_configure'; signature: '3u'; types: @xdg_shell_types[0]));

  xdg_surface_requests: array[0..4] of twl_message = (
    (name: 'destroy'; signature: ''; types: @xdg_shell_types[0]),
    (name: 'get_toplevel'; signature: 'n'; types: @xdg_shell_types[7]),
    (name: 'get_popup'; signature: 'n?oo'; types: @xdg_shell_types[8]),
    (name: 'set_window_geometry'; signature: 'iiii'; types: @xdg_shell_types[0]),
    (name: 'ack_configure'; signature: 'u'; types: @xdg_shell_types[0]));

  xdg_surface_events: array[0..0] of twl_message = (
    (name: 'configure'; signature: 'u'; types: @xdg_shell_types[0]));

  xdg_toplevel_requests: array[0..13] of twl_message = (
    (name: 'destroy'; signature: ''; types: @xdg_shell_types[0]),
    (name: 'set_parent'; signature: '?o'; types: @xdg_shell_types[11]),
    (name: 'set_title'; signature: 's'; types: @xdg_shell_types[0]),
    (name: 'set_app_id'; signature: 's'; types: @xdg_shell_types[0]),
    (name: 'show_window_menu'; signature: 'ouii'; types: @xdg_shell_types[12]),
    (name: 'move'; signature: 'ou'; types: @xdg_shell_types[16]),
    (name: 'resize'; signature: 'ouu'; types: @xdg_shell_types[18]),
    (name: 'set_max_size'; signature: 'ii'; types: @xdg_shell_types[0]),
    (name: 'set_min_size'; signature: 'ii'; types: @xdg_shell_types[0]),
    (name: 'set_maximized'; signature: ''; types: @xdg_shell_types[0]),
    (name: 'unset_maximized'; signature: ''; types: @xdg_shell_types[0]),
    (name: 'set_fullscreen'; signature: '?o'; types: @xdg_shell_types[21]),
    (name: 'unset_fullscreen'; signature: ''; types: @xdg_shell_types[0]),
    (name: 'set_minimized'; signature: ''; types: @xdg_shell_types[0]));

  xdg_toplevel_events: array[0..3] of twl_message = (
    (name: 'configure'; signature: 'iia'; types: @xdg_shell_types[0]),
    (name: 'close'; signature: ''; types: @xdg_shell_types[0]),
    (name: 'configure_bounds'; signature: '4ii'; types: @xdg_shell_types[0]),
    (name: 'wm_capabilities'; signature: '5a'; types: @xdg_shell_types[0]));

  xdg_popup_requests: array[0..2] of twl_message = (
    (name: 'destroy'; signature: ''; types: @xdg_shell_types[0]),
    (name: 'grab'; signature: 'ou'; types: @xdg_shell_types[22]),
    (name: 'reposition'; signature: '3ou'; types: @xdg_shell_types[24]));

  xdg_popup_events: array[0..2] of twl_message = (
    (name: 'configure'; signature: 'iiii'; types: @xdg_shell_types[0]),
    (name: 'popup_done'; signature: ''; types: @xdg_shell_types[0]),
    (name: 'repositioned'; signature: '3u'; types: @xdg_shell_types[0]));

implementation

begin
  xdg_wm_base_interface.name := 'xdg_wm_base';
  xdg_wm_base_interface.version := 7;
  xdg_wm_base_interface.method_count := Length(xdg_wm_base_requests);
  xdg_wm_base_interface.methods := @xdg_wm_base_requests;
  xdg_wm_base_interface.event_count := Length(xdg_wm_base_events);
  xdg_wm_base_interface.events := @xdg_wm_base_events;

  xdg_positioner_interface.name := 'xdg_positioner';
  xdg_positioner_interface.version := 7;
  xdg_positioner_interface.method_count := Length(xdg_positioner_requests);
  xdg_positioner_interface.methods := @xdg_positioner_requests;
  xdg_positioner_interface.event_count := 0;
  xdg_positioner_interface.events := nil;

  xdg_surface_interface.name := 'xdg_surface';
  xdg_surface_interface.version := 7;
  xdg_surface_interface.method_count := Length(xdg_surface_requests);
  xdg_surface_interface.methods := @xdg_surface_requests;
  xdg_surface_interface.event_count := Length(xdg_surface_events);
  xdg_surface_interface.events := @xdg_surface_events;

  xdg_toplevel_interface.name := 'xdg_toplevel';
  xdg_toplevel_interface.version := 7;
  xdg_toplevel_interface.method_count := Length(xdg_toplevel_requests);
  xdg_toplevel_interface.methods := @xdg_toplevel_requests;
  xdg_toplevel_interface.event_count := Length(xdg_toplevel_events);
  xdg_toplevel_interface.events := @xdg_toplevel_events;

  xdg_popup_interface.name := 'xdg_popup';
  xdg_popup_interface.version := 7;
  xdg_popup_interface.method_count := Length(xdg_popup_requests);
  xdg_popup_interface.methods := @xdg_popup_requests;
  xdg_popup_interface.event_count := Length(xdg_popup_events);
  xdg_popup_interface.events := @xdg_popup_events;

  xdg_shell_types[0] := nil;
  xdg_shell_types[1] := nil;
  xdg_shell_types[2] := nil;
  xdg_shell_types[3] := nil;
  xdg_shell_types[4] := @xdg_positioner_interface;
  xdg_shell_types[5] := @xdg_surface_interface;
  xdg_shell_types[6] := @wl_surface_interface;
  xdg_shell_types[7] := @xdg_toplevel_interface;
  xdg_shell_types[8] := @xdg_popup_interface;
  xdg_shell_types[9] := @xdg_surface_interface;
  xdg_shell_types[10] := @xdg_positioner_interface;
  xdg_shell_types[11] := @xdg_toplevel_interface;
  xdg_shell_types[12] := @wl_seat_interface;
  xdg_shell_types[13] := nil;
  xdg_shell_types[14] := nil;
  xdg_shell_types[15] := nil;
  xdg_shell_types[16] := @wl_seat_interface;
  xdg_shell_types[17] := nil;
  xdg_shell_types[18] := @wl_seat_interface;
  xdg_shell_types[19] := nil;
  xdg_shell_types[20] := nil;
  xdg_shell_types[21] := @wl_output_interface;
  xdg_shell_types[22] := @wl_seat_interface;
  xdg_shell_types[23] := nil;
  xdg_shell_types[24] := @xdg_positioner_interface;
  xdg_shell_types[25] := nil;
end.

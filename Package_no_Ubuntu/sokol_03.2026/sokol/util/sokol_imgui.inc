{$IFDEF read_interface}


type
  Tsimgui_allocator_t = record
    alloc_fn: function(size: Tsize_t; user_data: pointer): pointer; cdecl;
    free_fn: procedure(ptr: pointer; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psimgui_allocator_t = ^Tsimgui_allocator_t;

  Tsimgui_logger_t = record
    func: procedure(tag: pchar; log_level: Tuint32_t; log_item_id: Tuint32_t; message_or_null: pchar; line_nr: Tuint32_t;
      filename_or_null: pchar; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psimgui_logger_t = ^Tsimgui_logger_t;

  Tsimgui_desc_t = record
    max_vertices: longint;
    color_format: Tsg_pixel_format;
    depth_format: Tsg_pixel_format;
    sample_count: longint;
    ini_filename: pchar;
    no_default_font: boolean;
    disable_paste_override: boolean;
    disable_set_mouse_cursor: boolean;
    disable_windows_resize_from_edges: boolean;
    write_alpha_channel: boolean;
    allocator: Tsimgui_allocator_t;
    logger: Tsimgui_logger_t;
  end;
  Psimgui_desc_t = ^Tsimgui_desc_t;

  Psimgui_frame_desc_t = ^Tsimgui_frame_desc_t;

  Tsimgui_frame_desc_t = record
    width: longint;
    height: longint;
    delta_time: double;
    dpi_scale: single;
  end;

  Psimgui_font_tex_desc_t = ^Tsimgui_font_tex_desc_t;

  Tsimgui_font_tex_desc_t = record
    min_filter: Tsg_filter;
    mag_filter: Tsg_filter;
  end;

procedure simgui_setup(desc: Psimgui_desc_t); cdecl; external libsokol;
procedure simgui_new_frame(desc: Psimgui_frame_desc_t); cdecl; external libsokol;
procedure simgui_render; cdecl; external libsokol;
function simgui_imtextureid(tex_view: Tsg_view): Tuint64_t; cdecl; external libsokol;
function simgui_imtextureid_with_sampler(tex_view: Tsg_view; smp: Tsg_sampler): Tuint64_t; cdecl; external libsokol;
function simgui_texture_view_from_imtextureid(imtex_id: Tuint64_t): Tsg_view; cdecl; external libsokol;
function simgui_sampler_from_imtextureid(imtex_id: Tuint64_t): Tsg_sampler; cdecl; external libsokol;
procedure simgui_add_focus_event(focus: boolean); cdecl; external libsokol;
procedure simgui_add_mouse_pos_event(x: single; y: single); cdecl; external libsokol;
procedure simgui_add_touch_pos_event(x: single; y: single); cdecl; external libsokol;
procedure simgui_add_mouse_button_event(mouse_button: longint; down: boolean); cdecl; external libsokol;
procedure simgui_add_mouse_wheel_event(wheel_x: single; wheel_y: single); cdecl; external libsokol;
procedure simgui_add_key_event(imgui_key: longint; down: boolean); cdecl; external libsokol;
procedure simgui_add_input_character(c: Tuint32_t); cdecl; external libsokol;
procedure simgui_add_input_characters_utf8(c: pchar); cdecl; external libsokol;
procedure simgui_add_touch_button_event(mouse_button: longint; down: boolean); cdecl; external libsokol;

function simgui_handle_event(ev: Psapp_event): boolean; cdecl; external libsokol;
function simgui_map_keycode(keycode: Tsapp_keycode): longint; cdecl; external libsokol;

procedure simgui_shutdown; cdecl; external libsokol;

// === Konventiert am: 24-3-26 13:40:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

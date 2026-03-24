{$IFDEF read_interface}


type
  Tsgimgui_allocator_t = record
    alloc_fn: function(size: Tsize_t; user_data: pointer): pointer; cdecl;
    free_fn: procedure(ptr: pointer; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psgimgui_allocator_t = ^Tsgimgui_allocator_t;

  Tsgimgui_desc_t = record
    allocator: Tsgimgui_allocator_t;
  end;
  Psgimgui_desc_t = ^Tsgimgui_desc_t;

procedure sgimgui_setup(desc: Psgimgui_desc_t); cdecl; external libsokol;
procedure sgimgui_shutdown; cdecl; external libsokol;
procedure sgimgui_draw; cdecl; external libsokol;
procedure sgimgui_draw_menu(title: pchar); cdecl; external libsokol;
procedure sgimgui_draw_buffer_window_content; cdecl; external libsokol;
procedure sgimgui_draw_image_window_content; cdecl; external libsokol;
procedure sgimgui_draw_sampler_window_content; cdecl; external libsokol;
procedure sgimgui_draw_shader_window_content; cdecl; external libsokol;
procedure sgimgui_draw_pipeline_window_content; cdecl; external libsokol;
procedure sgimgui_draw_view_window_content; cdecl; external libsokol;
procedure sgimgui_draw_capture_window_content; cdecl; external libsokol;
procedure sgimgui_draw_capabilities_window_content; cdecl; external libsokol;
procedure sgimgui_draw_frame_stats_window_content; cdecl; external libsokol;
procedure sgimgui_draw_buffer_window(title: pchar); cdecl; external libsokol;
procedure sgimgui_draw_image_window(title: pchar); cdecl; external libsokol;
procedure sgimgui_draw_sampler_window(title: pchar); cdecl; external libsokol;
procedure sgimgui_draw_shader_window(title: pchar); cdecl; external libsokol;
procedure sgimgui_draw_pipeline_window(title: pchar); cdecl; external libsokol;
procedure sgimgui_draw_view_window(title: pchar); cdecl; external libsokol;
procedure sgimgui_draw_capture_window(title: pchar); cdecl; external libsokol;
procedure sgimgui_draw_capabilities_window(title: pchar); cdecl; external libsokol;
procedure sgimgui_draw_frame_stats_window(title: pchar); cdecl; external libsokol;
procedure sgimgui_draw_buffer_menu_item(_label: pchar); cdecl; external libsokol;
procedure sgimgui_draw_image_menu_item(_label: pchar); cdecl; external libsokol;
procedure sgimgui_draw_sampler_menu_item(_label: pchar); cdecl; external libsokol;
procedure sgimgui_draw_shader_menu_item(_label: pchar); cdecl; external libsokol;
procedure sgimgui_draw_pipeline_menu_item(_label: pchar); cdecl; external libsokol;
procedure sgimgui_draw_view_menu_item(_label: pchar); cdecl; external libsokol;
procedure sgimgui_draw_capture_menu_item(_label: pchar); cdecl; external libsokol;
procedure sgimgui_draw_capabilities_menu_item(_label: pchar); cdecl; external libsokol;
procedure sgimgui_draw_frame_stats_menu_item(_label: pchar); cdecl; external libsokol;

// === Konventiert am: 24-3-26 13:40:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

unit sokol_nuklear;

interface

uses
  fp_sokol, sokol_gfx, sokol_app;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SNK_INVALID_ID = 0;

type
  Tsnk_image_t = record
    id: Tuint32_t;
  end;
  Psnk_image_t = ^Tsnk_image_t;

  Tsnk_image_desc_t = record
    texture_view: Tsg_view;
    sampler: Tsg_sampler;
  end;
  Psnk_image_desc_t = ^Tsnk_image_desc_t;

  Tsnk_allocator_t = record
    alloc_fn: function(size: Tsize_t; user_data: pointer): pointer; cdecl;
    free_fn: procedure(ptr: pointer; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psnk_allocator_t = ^Tsnk_allocator_t;

  Tsnk_logger_t = record
    func: procedure(tag: pchar; log_level: Tuint32_t; log_item_id: Tuint32_t; message_or_null: pchar; line_nr: Tuint32_t;
      filename_or_null: pchar; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psnk_logger_t = ^Tsnk_logger_t;

  Psnk_desc_t = ^Tsnk_desc_t;

  Tsnk_desc_t = record
    max_vertices: longint;
    image_pool_size: longint;
    color_format: Tsg_pixel_format;
    depth_format: Tsg_pixel_format;
    sample_count: longint;
    dpi_scale: single;
    no_default_font: boolean;
    enable_set_mouse_cursor: boolean;
    allocator: Tsnk_allocator_t;
    logger: Tsnk_logger_t;
  end;

procedure snk_setup(desc: Psnk_desc_t); cdecl; external libsokol;
function snk_new_frame: Pnk_context; cdecl; external libsokol;
procedure snk_render(width: longint; height: longint); cdecl; external libsokol;
function snk_make_image(desc: Psnk_image_desc_t): Tsnk_image_t; cdecl; external libsokol;
procedure snk_destroy_image(img: Tsnk_image_t); cdecl; external libsokol;
function snk_query_image_desc(img: Tsnk_image_t): Tsnk_image_desc_t; cdecl; external libsokol;
function snk_nkhandle(img: Tsnk_image_t): Tnk_handle; cdecl; external libsokol;
function snk_image_from_nkhandle(handle: Tnk_handle): Tsnk_image_t; cdecl; external libsokol;

function snk_handle_event(ev: Psapp_event): boolean; cdecl; external libsokol;
function snk_edit_string(ctx: Pnk_context; flags: Tnk_flags; memory: pchar; len: Plongint; max: longint; filter: Tnk_plugin_filter): Tnk_flags; cdecl; external libsokol;

procedure snk_shutdown; cdecl; external libsokol;

// === Konventiert am: 24-3-26 13:40:09 ===


implementation



end.

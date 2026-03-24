{$IFDEF read_interface}


type
  Tsdtx_logger_t = record
    func: procedure(tag: pchar; log_level: Tuint32_t; log_item_id: Tuint32_t; message_or_null: pchar; line_nr: Tuint32_t;
      filename_or_null: pchar; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psdtx_logger_t = ^Tsdtx_logger_t;

  Tsdtx_context = record
    id: Tuint32_t;
  end;
  Psdtx_context = ^Tsdtx_context;

  Tsdtx_range = record
    ptr: pointer;
    size: Tsize_t;
  end;
  Psdtx_range = ^Tsdtx_range;

const
  SDTX_MAX_FONTS = 8;

type
  Tsdtx_font_desc_t = record
    data: Tsdtx_range;
    first_char: Tuint8_t;
    last_char: Tuint8_t;
  end;
  Psdtx_font_desc_t = ^Tsdtx_font_desc_t;

  Tsdtx_context_desc_t = record
    max_commands: longint;
    char_buf_size: longint;
    canvas_width: single;
    canvas_height: single;
    tab_width: longint;
    color_format: Tsg_pixel_format;
    depth_format: Tsg_pixel_format;
    sample_count: longint;
  end;
  Psdtx_context_desc_t = ^Tsdtx_context_desc_t;

  Tsdtx_allocator_t = record
    alloc_fn: function(size: Tsize_t; user_data: pointer): pointer; cdecl;
    free_fn: procedure(ptr: pointer; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psdtx_allocator_t = ^Tsdtx_allocator_t;

  Tsdtx_desc_t = record
    context_pool_size: longint;
    printf_buf_size: longint;
    fonts: array[0..(SDTX_MAX_FONTS) - 1] of Tsdtx_font_desc_t;
    context: Tsdtx_context_desc_t;
    allocator: Tsdtx_allocator_t;
    logger: Tsdtx_logger_t;
  end;
  Psdtx_desc_t = ^Tsdtx_desc_t;

procedure sdtx_setup(desc: Psdtx_desc_t); cdecl; external libsokol;
procedure sdtx_shutdown; cdecl; external libsokol;

function sdtx_font_kc853: Tsdtx_font_desc_t; cdecl; external libsokol;
function sdtx_font_kc854: Tsdtx_font_desc_t; cdecl; external libsokol;
function sdtx_font_z1013: Tsdtx_font_desc_t; cdecl; external libsokol;
function sdtx_font_cpc: Tsdtx_font_desc_t; cdecl; external libsokol;
function sdtx_font_c64: Tsdtx_font_desc_t; cdecl; external libsokol;
function sdtx_font_oric: Tsdtx_font_desc_t; cdecl; external libsokol;

function sdtx_make_context(desc: Psdtx_context_desc_t): Tsdtx_context; cdecl; external libsokol;
procedure sdtx_destroy_context(ctx: Tsdtx_context); cdecl; external libsokol;
procedure sdtx_set_context(ctx: Tsdtx_context); cdecl; external libsokol;
function sdtx_get_context: Tsdtx_context; cdecl; external libsokol;
function sdtx_default_context: Tsdtx_context; cdecl; external libsokol;

procedure sdtx_draw; cdecl; external libsokol;
procedure sdtx_context_draw(ctx: Tsdtx_context); cdecl; external libsokol;
procedure sdtx_draw_layer(layer_id: longint); cdecl; external libsokol;
procedure sdtx_context_draw_layer(ctx: Tsdtx_context; layer_id: longint); cdecl; external libsokol;

procedure sdtx_layer(layer_id: longint); cdecl; external libsokol;

procedure sdtx_font(font_index: longint); cdecl; external libsokol;

procedure sdtx_canvas(w: single; h: single); cdecl; external libsokol;

procedure sdtx_origin(x: single; y: single); cdecl; external libsokol;

procedure sdtx_home; cdecl; external libsokol;
procedure sdtx_pos(x: single; y: single); cdecl; external libsokol;
procedure sdtx_pos_x(x: single); cdecl; external libsokol;
procedure sdtx_pos_y(y: single); cdecl; external libsokol;
procedure sdtx_move(dx: single; dy: single); cdecl; external libsokol;
procedure sdtx_move_x(dx: single); cdecl; external libsokol;
procedure sdtx_move_y(dy: single); cdecl; external libsokol;
procedure sdtx_crlf; cdecl; external libsokol;

procedure sdtx_color3b(r: Tuint8_t; g: Tuint8_t; b: Tuint8_t); cdecl; external libsokol;
procedure sdtx_color3f(r: single; g: single; b: single); cdecl; external libsokol;
procedure sdtx_color4b(r: Tuint8_t; g: Tuint8_t; b: Tuint8_t; a: Tuint8_t); cdecl; external libsokol;
procedure sdtx_color4f(r: single; g: single; b: single; a: single); cdecl; external libsokol;
procedure sdtx_color1i(rgba: Tuint32_t); cdecl; external libsokol;

procedure sdtx_putc(c: char); cdecl; external libsokol;
procedure sdtx_puts(str: pchar); cdecl; external libsokol;
procedure sdtx_putr(str: pchar; len: longint); cdecl; external libsokol;

function sdtx_printf(fmt: pchar): longint; cdecl; varargs; external libsokol;
function sdtx_vprintf(fmt: pchar; args: Tva_list): longint; cdecl; external libsokol;
function sdtx_get_cleared_fmt_buffer: Tsdtx_range; cdecl; external libsokol;

// === Konventiert am: 24-3-26 13:39:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

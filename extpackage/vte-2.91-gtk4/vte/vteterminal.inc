{$IFDEF read_interface}


type
  TVteEventContext = record
  end;
  PVteEventContext = ^TVteEventContext;

  TVteTerminalClassPrivate = record
  end;
  PVteTerminalClassPrivate = ^TVteTerminalClassPrivate;

  TVteTerminal = record
    widget: TGtkWidget;
    _unused_padding: array[0..0] of Pgpointer;
  end;
  PVteTerminal = ^TVteTerminal;

  TVteTerminalClass = record
    parent_class: TGtkWidgetClass;
    eof: procedure(terminal: PVteTerminal); cdecl;
    child_exited: procedure(terminal: PVteTerminal; status: longint); cdecl;
    encoding_changed: procedure(terminal: PVteTerminal); cdecl;
    char_size_changed: procedure(terminal: PVteTerminal; char_width: Tguint; char_height: Tguint); cdecl;
    window_title_changed: procedure(terminal: PVteTerminal); cdecl;
    icon_title_changed: procedure(terminal: PVteTerminal); cdecl;
    selection_changed: procedure(terminal: PVteTerminal); cdecl;
    contents_changed: procedure(terminal: PVteTerminal); cdecl;
    cursor_moved: procedure(terminal: PVteTerminal); cdecl;
    commit: procedure(terminal: PVteTerminal; text: Pgchar; size: Tguint); cdecl;
    deiconify_window: procedure(terminal: PVteTerminal); cdecl;
    iconify_window: procedure(terminal: PVteTerminal); cdecl;
    raise_window: procedure(terminal: PVteTerminal); cdecl;
    lower_window: procedure(terminal: PVteTerminal); cdecl;
    refresh_window: procedure(terminal: PVteTerminal); cdecl;
    restore_window: procedure(terminal: PVteTerminal); cdecl;
    maximize_window: procedure(terminal: PVteTerminal); cdecl;
    resize_window: procedure(terminal: PVteTerminal; width: Tguint; height: Tguint); cdecl;
    move_window: procedure(terminal: PVteTerminal; x: Tguint; y: Tguint); cdecl;
    increase_font_size: procedure(terminal: PVteTerminal); cdecl;
    decrease_font_size: procedure(terminal: PVteTerminal); cdecl;
    copy_clipboard: procedure(terminal: PVteTerminal); cdecl;
    paste_clipboard: procedure(terminal: PVteTerminal); cdecl;
    bell: procedure(terminal: PVteTerminal); cdecl;
    setup_context_menu: procedure(terminal: PVteTerminal; context: PVteEventContext); cdecl;
    _padding: array[0..14] of Tgpointer;
    priv: PVteTerminalClassPrivate;
  end;
  PVteTerminalClass = ^TVteTerminalClass;

function vte_terminal_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function vte_terminal_new: PGtkWidget; cdecl; external libvte_2_91_gtk4;
function vte_terminal_pty_new_sync(terminal: PVteTerminal; flags: TVtePtyFlags; cancellable: PGCancellable; error: PPGError): PVtePty; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_watch_child(terminal: PVteTerminal; child_pid: TGPid); cdecl; external libvte_2_91_gtk4;

type
  TVteTerminalSpawnAsyncCallback = procedure(terminal: PVteTerminal; pid: TGPid; error: PGError; user_data: Tgpointer); cdecl;

procedure vte_terminal_spawn_async(terminal: PVteTerminal; pty_flags: TVtePtyFlags; working_directory: pchar; argv: PPchar; envv: PPchar;
  spawn_flags: TGSpawnFlags; child_setup: TGSpawnChildSetupFunc; child_setup_data: Tgpointer; child_setup_data_destroy: TGDestroyNotify; timeout: longint;
  cancellable: PGCancellable; callback: TVteTerminalSpawnAsyncCallback; user_data: Tgpointer); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_spawn_with_fds_async(terminal: PVteTerminal; pty_flags: TVtePtyFlags; working_directory: pchar; argv: PPchar; envv: PPchar;
  fds: Plongint; n_fds: longint; map_fds: Plongint; n_map_fds: longint; spawn_flags: TGSpawnFlags;
  child_setup: TGSpawnChildSetupFunc; child_setup_data: Tgpointer; child_setup_data_destroy: TGDestroyNotify; timeout: longint; cancellable: PGCancellable;
  callback: TVteTerminalSpawnAsyncCallback; user_data: Tgpointer); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_feed(terminal: PVteTerminal; data: pchar; length: Tgssize); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_feed_child(terminal: PVteTerminal; text: pchar; length: Tgssize); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_copy_clipboard_format(terminal: PVteTerminal; format: TVteFormat); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_paste_clipboard(terminal: PVteTerminal); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_paste_text(terminal: PVteTerminal; text: pchar); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_copy_primary(terminal: PVteTerminal); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_paste_primary(terminal: PVteTerminal); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_select_all(terminal: PVteTerminal); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_unselect_all(terminal: PVteTerminal); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_word_char_exceptions(terminal: PVteTerminal; exceptions: pchar); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_word_char_exceptions(terminal: PVteTerminal): pchar; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_size(terminal: PVteTerminal; columns: Tglong; rows: Tglong); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_font_scale(terminal: PVteTerminal; scale: Tgdouble); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_font_scale(terminal: PVteTerminal): Tgdouble; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_font_options(terminal: PVteTerminal; font_options: Pcairo_font_options_t); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_font_options(terminal: PVteTerminal): Pcairo_font_options_t; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_cell_width_scale(terminal: PVteTerminal; scale: Tdouble); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_cell_width_scale(terminal: PVteTerminal): Tdouble; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_cell_height_scale(terminal: PVteTerminal; scale: Tdouble); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_cell_height_scale(terminal: PVteTerminal): Tdouble; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_text_blink_mode(terminal: PVteTerminal; text_blink_mode: TVteTextBlinkMode); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_text_blink_mode(terminal: PVteTerminal): TVteTextBlinkMode; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_audible_bell(terminal: PVteTerminal; is_audible: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_audible_bell(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_scroll_on_output(terminal: PVteTerminal; scroll: Tgboolean); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_scroll_on_insert(terminal: PVteTerminal; scroll: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_scroll_on_insert(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_scroll_on_output(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_scroll_on_keystroke(terminal: PVteTerminal; scroll: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_scroll_on_keystroke(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_enable_fallback_scrolling(terminal: PVteTerminal; enable: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_enable_fallback_scrolling(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_scroll_unit_is_pixels(terminal: PVteTerminal; enable: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_scroll_unit_is_pixels(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_color_bold(terminal: PVteTerminal; bold: PGdkRGBA); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_color_foreground(terminal: PVteTerminal; foreground: PGdkRGBA); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_color_background(terminal: PVteTerminal; background: PGdkRGBA); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_color_cursor(terminal: PVteTerminal; cursor_background: PGdkRGBA); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_color_cursor_foreground(terminal: PVteTerminal; cursor_foreground: PGdkRGBA); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_color_highlight(terminal: PVteTerminal; highlight_background: PGdkRGBA); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_color_highlight_foreground(terminal: PVteTerminal; highlight_foreground: PGdkRGBA); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_colors(terminal: PVteTerminal; foreground: PGdkRGBA; background: PGdkRGBA; palette: PGdkRGBA; palette_size: Tgsize); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_default_colors(terminal: PVteTerminal); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_cursor_blink_mode(terminal: PVteTerminal; mode: TVteCursorBlinkMode); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_cursor_blink_mode(terminal: PVteTerminal): TVteCursorBlinkMode; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_cursor_shape(terminal: PVteTerminal; shape: TVteCursorShape); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_cursor_shape(terminal: PVteTerminal): TVteCursorShape; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_scrollback_lines(terminal: PVteTerminal; lines: Tglong); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_scrollback_lines(terminal: PVteTerminal): Tglong; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_font(terminal: PVteTerminal; font_desc: PPangoFontDescription); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_font(terminal: PVteTerminal): PPangoFontDescription; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_bold_is_bright(terminal: PVteTerminal; bold_is_bright: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_bold_is_bright(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_allow_hyperlink(terminal: PVteTerminal; allow_hyperlink: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_allow_hyperlink(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_has_selection(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_text_selected(terminal: PVteTerminal; format: TVteFormat): pchar; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_text_selected_full(terminal: PVteTerminal; format: TVteFormat; length: Pgsize): pchar; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_backspace_binding(terminal: PVteTerminal; binding: TVteEraseBinding); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_delete_binding(terminal: PVteTerminal; binding: TVteEraseBinding); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_enable_bidi(terminal: PVteTerminal; enable_bidi: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_enable_bidi(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_enable_shaping(terminal: PVteTerminal; enable_shaping: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_enable_shaping(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_mouse_autohide(terminal: PVteTerminal; setting: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_mouse_autohide(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_reset(terminal: PVteTerminal; clear_tabstops: Tgboolean; clear_history: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_text_format(terminal: PVteTerminal; format: TVteFormat): pchar; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_text_range_format(terminal: PVteTerminal; format: TVteFormat; start_row: longint; start_col: longint; end_row: longint;
  end_col: longint; length: Pgsize): pchar; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_get_cursor_position(terminal: PVteTerminal; column: Pglong; row: Pglong); cdecl; external libvte_2_91_gtk4;
function vte_terminal_check_hyperlink_at(terminal: PVteTerminal; x: Tdouble; y: Tdouble): pchar; cdecl; external libvte_2_91_gtk4;
function vte_terminal_match_add_regex(terminal: PVteTerminal; regex: PVteRegex; flags: Tguint32): longint; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_match_set_cursor_name(terminal: PVteTerminal; tag: longint; cursor_name: pchar); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_match_remove(terminal: PVteTerminal; tag: longint); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_match_remove_all(terminal: PVteTerminal); cdecl; external libvte_2_91_gtk4;
function vte_terminal_check_match_at(terminal: PVteTerminal; x: Tdouble; y: Tdouble; tag: Plongint): pchar; cdecl; external libvte_2_91_gtk4;
function vte_terminal_check_regex_array_at(terminal: PVteTerminal; x: Tdouble; y: Tdouble; regexes: PPVteRegex; n_regexes: Tgsize;
  match_flags: Tguint32; n_matches: Pgsize): PPchar; cdecl; external libvte_2_91_gtk4;
function vte_terminal_check_regex_simple_at(terminal: PVteTerminal; x: Tdouble; y: Tdouble; regexes: PPVteRegex; n_regexes: Tgsize;
  match_flags: Tguint32; matches: PPchar): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_search_set_regex(terminal: PVteTerminal; regex: PVteRegex; flags: Tguint32); cdecl; external libvte_2_91_gtk4;
function vte_terminal_search_get_regex(terminal: PVteTerminal): PVteRegex; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_search_set_wrap_around(terminal: PVteTerminal; wrap_around: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_search_get_wrap_around(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
function vte_terminal_search_find_previous(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
function vte_terminal_search_find_next(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_cjk_ambiguous_width(terminal: PVteTerminal; width: longint); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_cjk_ambiguous_width(terminal: PVteTerminal): longint; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_pty(terminal: PVteTerminal; pty: PVtePty); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_pty(terminal: PVteTerminal): PVtePty; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_char_width(terminal: PVteTerminal): Tglong; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_char_height(terminal: PVteTerminal): Tglong; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_row_count(terminal: PVteTerminal): Tglong; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_column_count(terminal: PVteTerminal): Tglong; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_window_title(terminal: PVteTerminal): pchar; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_current_directory_uri(terminal: PVteTerminal): pchar; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_current_file_uri(terminal: PVteTerminal): pchar; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_input_enabled(terminal: PVteTerminal; enabled: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_input_enabled(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_clear_background(terminal: PVteTerminal; setting: Tgboolean); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_get_color_background_for_draw(terminal: PVteTerminal; color: PGdkRGBA); cdecl; external libvte_2_91_gtk4;
function vte_terminal_write_contents_sync(terminal: PVteTerminal; stream: PGOutputStream; flags: TVteWriteFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_enable_sixel(terminal: PVteTerminal; enabled: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_enable_sixel(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_xalign(terminal: PVteTerminal; align: TVteAlign); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_xalign(terminal: PVteTerminal): TVteAlign; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_yalign(terminal: PVteTerminal; align: TVteAlign); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_yalign(terminal: PVteTerminal): TVteAlign; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_xfill(terminal: PVteTerminal; fill: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_xfill(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_yfill(terminal: PVteTerminal; fill: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_yfill(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_context_menu_model(terminal: PVteTerminal; model: PGMenuModel); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_context_menu_model(terminal: PVteTerminal): PGMenuModel; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_context_menu(terminal: PVteTerminal; menu: PGtkWidget); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_context_menu(terminal: PVteTerminal): PGtkWidget; cdecl; external libvte_2_91_gtk4;
function vte_event_context_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function vte_event_context_get_coordinates(context: PVteEventContext; x: Pdouble; y: Pdouble): Tgboolean; cdecl; external libvte_2_91_gtk4;

function VTE_TYPE_EVENT_CONTEXT: TGType;

// === Konventiert am: 3-5-25 17:08:15 ===

function VTE_TYPE_TERMINAL: TGType;
function VTE_TERMINAL(obj: Pointer): PVteTerminal;
function VTE_TERMINAL_CLASS(klass: Pointer): PVteTerminalClass;
function VTE_IS_TERMINAL(obj: Pointer): Tgboolean;
function VTE_IS_TERMINAL_CLASS(klass: Pointer): Tgboolean;
function VTE_TERMINAL_GET_CLASS(obj: Pointer): PVteTerminalClass;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function VTE_TYPE_TERMINAL: TGType;
begin
  VTE_TYPE_TERMINAL := vte_terminal_get_type;
end;

function VTE_TERMINAL(obj: Pointer): PVteTerminal;
begin
  Result := PVteTerminal(g_type_check_instance_cast(obj, VTE_TYPE_TERMINAL));
end;

function VTE_TERMINAL_CLASS(klass: Pointer): PVteTerminalClass;
begin
  Result := PVteTerminalClass(g_type_check_class_cast(klass, VTE_TYPE_TERMINAL));
end;

function VTE_IS_TERMINAL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VTE_TYPE_TERMINAL);
end;

function VTE_IS_TERMINAL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VTE_TYPE_TERMINAL);
end;

function VTE_TERMINAL_GET_CLASS(obj: Pointer): PVteTerminalClass;
begin
  Result := PVteTerminalClass(PGTypeInstance(obj)^.g_class);
end;


function VTE_TYPE_EVENT_CONTEXT: TGType;
begin
  VTE_TYPE_EVENT_CONTEXT := vte_event_context_get_type;
end;




{$ENDIF read_implementation}

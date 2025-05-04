{$IFDEF read_interface}


procedure vte_terminal_match_set_cursor(terminal: PVteTerminal; tag: longint; cursor: PGdkCursor); cdecl; external libvte_2_91_gtk4;
function vte_terminal_match_check(terminal: PVteTerminal; column: Tglong; row: Tglong; tag: Plongint): pchar; cdecl; external libvte_2_91_gtk4;
function vte_terminal_spawn_sync(terminal: PVteTerminal; pty_flags: TVtePtyFlags; working_directory: pchar; argv: PPchar; envv: PPchar;
  spawn_flags: TGSpawnFlags; child_setup: TGSpawnChildSetupFunc; child_setup_data: Tgpointer; child_pid: PGPid; cancellable: PGCancellable;
  error: PPGError): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_pty_close(pty: PVtePty); cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_copy_clipboard(terminal: PVteTerminal); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_icon_title(terminal: PVteTerminal): pchar; cdecl; external libvte_2_91_gtk4;
function vte_terminal_set_encoding(terminal: PVteTerminal; codeset: pchar; error: PPGError): Tgboolean; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_encoding(terminal: PVteTerminal): pchar; cdecl; external libvte_2_91_gtk4;

type
  TVteSelectionFunc = function(terminal: PVteTerminal; column: Tglong; row: Tglong; data: Tgpointer): Tgboolean; cdecl;

function vte_terminal_get_text(terminal: PVteTerminal; is_selected: TVteSelectionFunc; user_data: Tgpointer; attributes: PGArray): pchar; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_text_range(terminal: PVteTerminal; start_row: Tglong; start_col: Tglong; end_row: Tglong; end_col: Tglong;
  is_selected: TVteSelectionFunc; user_data: Tgpointer; attributes: PGArray): pchar; cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_text_include_trailing_spaces(terminal: PVteTerminal; is_selected: TVteSelectionFunc; user_data: Tgpointer; attributes: PGArray): pchar; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_rewrap_on_resize(terminal: PVteTerminal; rewrap: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_rewrap_on_resize(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_set_allow_bold(terminal: PVteTerminal; allow_bold: Tgboolean); cdecl; external libvte_2_91_gtk4;
function vte_terminal_get_allow_bold(terminal: PVteTerminal): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_terminal_feed_child_binary(terminal: PVteTerminal; data: Pguint8; length: Tgsize); cdecl; external libvte_2_91_gtk4;
function vte_get_encodings(include_aliases: Tgboolean): PPchar; cdecl; external libvte_2_91_gtk4;
function vte_get_encoding_supported(encoding: pchar): Tgboolean; cdecl; external libvte_2_91_gtk4;

type
  TVteCharAttributes = bitpacked record
    row: longint;
    column: longint;
    fore: TPangoColor;
    back: TPangoColor;
    underline: 0..1;
    strikethrough: 0..1;
    columns: 0..15;
  end;
  PVteCharAttributes = ^TVteCharAttributes;

  // === Konventiert am: 3-5-25 17:03:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

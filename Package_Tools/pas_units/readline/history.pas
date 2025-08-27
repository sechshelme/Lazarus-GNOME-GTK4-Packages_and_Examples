unit history;

interface

uses
  fp_readline, rltypedefs;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Phistdata_t = ^Thistdata_t;
  Thistdata_t = pointer;

const
  HS_HISTORY_VERSION = $0802;

type
  Thist_entry = record
    line: pchar;
    timestamp: pchar;
    data: Thistdata_t;
  end;
  PHIST_ENTRY = ^Thist_entry;
  PPHIST_ENTRY = ^PHIST_ENTRY;

function HISTENT_BYTES(hs: PHIST_ENTRY): SizeInt;

type
  Thist_state = record
    entries: ^PHIST_ENTRY;
    offset: longint;
    length: longint;
    size: longint;
    flags: longint;
  end;
  Phist_state = ^Thist_state;
  THISTORY_STATE = Thist_state;
  PHISTORY_STATE = ^THISTORY_STATE;

const
  HS_STIFLED = $01;

procedure using_history; cdecl; external libreadline;
function history_get_history_state: PHISTORY_STATE; cdecl; external libreadline;
procedure history_set_history_state(para1: PHISTORY_STATE); cdecl; external libreadline;
procedure add_history(para1: pchar); cdecl; external libreadline;
procedure add_history_time(para1: pchar); cdecl; external libreadline;
function remove_history(para1: longint): PHIST_ENTRY; cdecl; external libreadline;
function remove_history_range(para1: longint; para2: longint): PPHIST_ENTRY; cdecl; external libreadline;
function alloc_history_entry(para1: pchar; para2: pchar): PHIST_ENTRY; cdecl; external libreadline;
function copy_history_entry(para1: PHIST_ENTRY): PHIST_ENTRY; cdecl; external libreadline;
function free_history_entry(para1: PHIST_ENTRY): Thistdata_t; cdecl; external libreadline;
function replace_history_entry(para1: longint; para2: pchar; para3: Thistdata_t): PHIST_ENTRY; cdecl; external libreadline;
procedure clear_history; cdecl; external libreadline;
procedure stifle_history(para1: longint); cdecl; external libreadline;
function unstifle_history: longint; cdecl; external libreadline;
function history_is_stifled: longint; cdecl; external libreadline;
function history_list: PPHIST_ENTRY; cdecl; external libreadline;
function where_history: longint; cdecl; external libreadline;
function current_history: PHIST_ENTRY; cdecl; external libreadline;
function history_get(para1: longint): PHIST_ENTRY; cdecl; external libreadline;
function history_get_time(para1: PHIST_ENTRY): Ttime_t; cdecl; external libreadline;
function history_total_bytes: longint; cdecl; external libreadline;
function history_set_pos(para1: longint): longint; cdecl; external libreadline;
function previous_history: PHIST_ENTRY; cdecl; external libreadline;
function next_history: PHIST_ENTRY; cdecl; external libreadline;
function history_search(para1: pchar; para2: longint): longint; cdecl; external libreadline;
function history_search_prefix(para1: pchar; para2: longint): longint; cdecl; external libreadline;
function history_search_pos(para1: pchar; para2: longint; para3: longint): longint; cdecl; external libreadline;
function read_history(para1: pchar): longint; cdecl; external libreadline;
function read_history_range(para1: pchar; para2: longint; para3: longint): longint; cdecl; external libreadline;
function write_history(para1: pchar): longint; cdecl; external libreadline;
function append_history(para1: longint; para2: pchar): longint; cdecl; external libreadline;
function history_truncate_file(para1: pchar; para2: longint): longint; cdecl; external libreadline;
function history_expand(para1: pchar; para2: PPchar): longint; cdecl; external libreadline;
function history_arg_extract(para1: longint; para2: longint; para3: pchar): pchar; cdecl; external libreadline;
function get_history_event(para1: pchar; para2: Plongint; para3: longint): pchar; cdecl; external libreadline;
function history_tokenize(para1: pchar): PPchar; cdecl; external libreadline;

var
  history_base: longint; cvar;external libreadline;
  history_length: longint; cvar;external libreadline;
  history_max_entries: longint; cvar;external libreadline;
  history_offset: longint; cvar;external libreadline;
  history_lines_read_from_file: longint; cvar;external libreadline;
  history_lines_written_to_file: longint; cvar;external libreadline;
  history_expansion_char: char; cvar;external libreadline;
  history_subst_char: char; cvar;external libreadline;
  history_word_delimiters: pchar; cvar;external libreadline;
  history_comment_char: char; cvar;external libreadline;
  history_no_expand_chars: pchar; cvar;external libreadline;
  history_search_delimiter_chars: pchar; cvar;external libreadline;
  history_quotes_inhibit_expansion: longint; cvar;external libreadline;
  history_quoting_state: longint; cvar;external libreadline;
  history_write_timestamps: longint; cvar;external libreadline;
  history_multiline_entries: longint; cvar;external libreadline;
  history_file_version: longint; cvar;external libreadline;
  max_input_history: longint; cvar;external libreadline;
  history_inhibit_expansion_function: Trl_linebuf_func_t; cvar;external libreadline;

  // === Konventiert am: 27-8-25 16:55:15 ===


implementation


function HISTENT_BYTES(hs: PHIST_ENTRY): SizeInt;
begin
  HISTENT_BYTES := (strlen(hs^.line)) + (strlen(hs^.timestamp));
end;


end.

{$IFDEF read_interface}


const
  RL_READLINE_VERSION_ = $0802;
  RL_VERSION_MAJOR = 8;
  RL_VERSION_MINOR = 2;

type
  Tundo_code = longint;

const
  UNDO_DELETE = 0;
  UNDO_INSERT = 1;
  UNDO_BEGIN = 2;
  UNDO_END = 3;

type
  PUNDO_LIST = ^Tundo_list;

  Tundo_list = record
    next: ^Tundo_list;
    start: longint;
    end_: longint;
    text: pchar;
    what: Tundo_code;
  end;

var
  rl_undo_list: PUNDO_LIST; cvar;external libreadline;

type
  Tfunmap = record
    name: pchar;
    _function: Trl_command_func_t;
  end;
  PFUNMAP = ^Tfunmap;

var
  funmap: ^PFUNMAP; cvar;external libreadline;

function rl_digit_argument(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_universal_argument(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_forward_byte(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_forward_char(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_forward(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_backward_byte(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_backward_char(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_backward(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_beg_of_line(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_end_of_line(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_forward_word(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_backward_word(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_refresh_line(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_clear_screen(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_clear_display(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_skip_csi_sequence(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_arrow_keys(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_previous_screen_line(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_next_screen_line(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_insert(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_quoted_insert(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_tab_insert(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_newline(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_do_lowercase_version(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_rubout(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_delete(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_rubout_or_delete(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_delete_horizontal_space(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_delete_or_show_completions(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_insert_comment(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_upcase_word(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_downcase_word(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_capitalize_word(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_transpose_words(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_transpose_chars(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_char_search(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_backward_char_search(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_beginning_of_history(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_end_of_history(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_get_next_history(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_get_previous_history(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_operate_and_get_next(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_fetch_history(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_set_mark(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_exchange_point_and_mark(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_editing_mode(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_emacs_editing_mode(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_overwrite_mode(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_re_read_init_file(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_dump_functions(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_dump_macros(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_dump_variables(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_complete(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_possible_completions(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_insert_completions(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_old_menu_complete(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_menu_complete(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_backward_menu_complete(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_kill_word(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_backward_kill_word(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_kill_line(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_backward_kill_line(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_kill_full_line(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_unix_word_rubout(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_unix_filename_rubout(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_unix_line_discard(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_copy_region_to_kill(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_kill_region(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_copy_forward_word(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_copy_backward_word(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_yank(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_yank_pop(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_yank_nth_arg(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_yank_last_arg(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_bracketed_paste_begin(para1: longint; para2: longint): longint; cdecl; external libreadline;

{$ifdef windows}
function rl_paste_from_clipboard(para1: longint; para2: longint): longint; cdecl; external libreadline;
{$endif}

function rl_reverse_search_history(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_forward_search_history(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_start_kbd_macro(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_end_kbd_macro(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_call_last_kbd_macro(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_print_last_kbd_macro(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_revert_line(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_undo_command(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_tilde_expand(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_restart_output(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_stop_output(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_abort(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_tty_status(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_history_search_forward(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_history_search_backward(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_history_substr_search_forward(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_history_substr_search_backward(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_noninc_forward_search(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_noninc_reverse_search(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_noninc_forward_search_again(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_noninc_reverse_search_again(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_insert_close(para1: longint; para2: longint): longint; cdecl; external libreadline;
procedure rl_callback_handler_install(para1: pchar; para2: Trl_vcpfunc_t); cdecl; external libreadline;
procedure rl_callback_read_char; cdecl; external libreadline;
procedure rl_callback_handler_remove; cdecl; external libreadline;
procedure rl_callback_sigcleanup; cdecl; external libreadline;
function rl_vi_redo(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_undo(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_yank_arg(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_fetch_history(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_search_again(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_search(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_complete(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_tilde_expand(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_prev_word(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_next_word(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_end_word(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_insert_beg(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_append_mode(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_append_eol(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_eof_maybe(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_insertion_mode(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_insert_mode(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_movement_mode(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_arg_digit(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_change_case(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_put(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_column(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_delete_to(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_change_to(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_yank_to(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_yank_pop(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_rubout(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_delete(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_back_to_indent(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_unix_word_rubout(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_first_print(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_char_search(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_match(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_change_char(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_subst(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_overstrike(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_overstrike_delete(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_replace(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_set_mark(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_goto_mark(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_check: longint; cdecl; external libreadline;
function rl_vi_domove(para1: longint; para2: Plongint): longint; cdecl; external libreadline;
function rl_vi_bracktype(para1: longint): longint; cdecl; external libreadline;
procedure rl_vi_start_inserting(para1: longint; para2: longint; para3: longint); cdecl; external libreadline;

function rl_vi_fWord(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_bWord(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_eWord(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_vi_fword_(para1: longint; para2: longint): longint; cdecl; external libreadline name 'rl_vi_fword';
function rl_vi_bword_(para1: longint; para2: longint): longint; cdecl; external libreadline name 'rl_vi_bword';
function rl_vi_eword_(para1: longint; para2: longint): longint; cdecl; external libreadline name 'rl_vi_eword';

function readline(para1: pchar): pchar; cdecl; external libreadline;
function rl_set_prompt(para1: pchar): longint; cdecl; external libreadline;
function rl_expand_prompt(para1: pchar): longint; cdecl; external libreadline;
function rl_initialize: longint; cdecl; external libreadline;
function rl_discard_argument: longint; cdecl; external libreadline;
function rl_add_defun(para1: pchar; para2: Trl_command_func_t; para3: longint): longint; cdecl; external libreadline;
function rl_bind_key(para1: longint; para2: Trl_command_func_t): longint; cdecl; external libreadline;
function rl_bind_key_in_map(para1: longint; para2: Trl_command_func_t; para3: TKeymap): longint; cdecl; external libreadline;
function rl_unbind_key(para1: longint): longint; cdecl; external libreadline;
function rl_unbind_key_in_map(para1: longint; para2: TKeymap): longint; cdecl; external libreadline;
function rl_bind_key_if_unbound(para1: longint; para2: Trl_command_func_t): longint; cdecl; external libreadline;
function rl_bind_key_if_unbound_in_map(para1: longint; para2: Trl_command_func_t; para3: TKeymap): longint; cdecl; external libreadline;
function rl_unbind_function_in_map(para1: Trl_command_func_t; para2: TKeymap): longint; cdecl; external libreadline;
function rl_unbind_command_in_map(para1: pchar; para2: TKeymap): longint; cdecl; external libreadline;
function rl_bind_keyseq(para1: pchar; para2: Trl_command_func_t): longint; cdecl; external libreadline;
function rl_bind_keyseq_in_map(para1: pchar; para2: Trl_command_func_t; para3: TKeymap): longint; cdecl; external libreadline;
function rl_bind_keyseq_if_unbound(para1: pchar; para2: Trl_command_func_t): longint; cdecl; external libreadline;
function rl_bind_keyseq_if_unbound_in_map(para1: pchar; para2: Trl_command_func_t; para3: TKeymap): longint; cdecl; external libreadline;
function rl_generic_bind(para1: longint; para2: pchar; para3: pchar; para4: TKeymap): longint; cdecl; external libreadline;
function rl_variable_value(para1: pchar): pchar; cdecl; external libreadline;
function rl_variable_bind(para1: pchar; para2: pchar): longint; cdecl; external libreadline;
function rl_set_key(para1: pchar; para2: Trl_command_func_t; para3: TKeymap): longint; cdecl; external libreadline;
function rl_macro_bind(para1: pchar; para2: pchar; para3: TKeymap): longint; cdecl; external libreadline;
function rl_translate_keyseq(para1: pchar; para2: pchar; para3: Plongint): longint; cdecl; external libreadline;
function rl_untranslate_keyseq(para1: longint): pchar; cdecl; external libreadline;
function rl_named_function(para1: pchar): Trl_command_func_t; cdecl; external libreadline;
function rl_function_of_keyseq(para1: pchar; para2: TKeymap; para3: Plongint): Trl_command_func_t; cdecl; external libreadline;
function rl_function_of_keyseq_len(para1: pchar; para2: Tsize_t; para3: TKeymap; para4: Plongint): Trl_command_func_t; cdecl; external libreadline;
function rl_trim_arg_from_keyseq(para1: pchar; para2: Tsize_t; para3: TKeymap): longint; cdecl; external libreadline;
procedure rl_list_funmap_names; cdecl; external libreadline;
function rl_invoking_keyseqs_in_map(para1: Trl_command_func_t; para2: TKeymap): PPchar; cdecl; external libreadline;
function rl_invoking_keyseqs(para1: Trl_command_func_t): PPchar; cdecl; external libreadline;
procedure rl_function_dumper(para1: longint); cdecl; external libreadline;
procedure rl_macro_dumper(para1: longint); cdecl; external libreadline;
procedure rl_variable_dumper(para1: longint); cdecl; external libreadline;
function rl_read_init_file(para1: pchar): longint; cdecl; external libreadline;
function rl_parse_and_bind(para1: pchar): longint; cdecl; external libreadline;
function rl_make_bare_keymap: TKeymap; cdecl; external libreadline;
function rl_empty_keymap(para1: TKeymap): longint; cdecl; external libreadline;
function rl_copy_keymap(para1: TKeymap): TKeymap; cdecl; external libreadline;
function rl_make_keymap: TKeymap; cdecl; external libreadline;
procedure rl_discard_keymap(para1: TKeymap); cdecl; external libreadline;
procedure rl_free_keymap(para1: TKeymap); cdecl; external libreadline;
function rl_get_keymap_by_name(para1: pchar): TKeymap; cdecl; external libreadline;
function rl_get_keymap_name(para1: TKeymap): pchar; cdecl; external libreadline;
procedure rl_set_keymap(para1: TKeymap); cdecl; external libreadline;
function rl_get_keymap: TKeymap; cdecl; external libreadline;
function rl_set_keymap_name(para1: pchar; para2: TKeymap): longint; cdecl; external libreadline;
procedure rl_set_keymap_from_edit_mode; cdecl; external libreadline;
function rl_get_keymap_name_from_edit_mode: pchar; cdecl; external libreadline;
function rl_add_funmap_entry(para1: pchar; para2: Trl_command_func_t): longint; cdecl; external libreadline;
function rl_funmap_names: PPchar; cdecl; external libreadline;
procedure rl_initialize_funmap; cdecl; external libreadline;
procedure rl_push_macro_input(para1: pchar); cdecl; external libreadline;
procedure rl_add_undo(para1: Tundo_code; para2: longint; para3: longint; para4: pchar); cdecl; external libreadline;
procedure rl_free_undo_list; cdecl; external libreadline;
function rl_do_undo: longint; cdecl; external libreadline;
function rl_begin_undo_group: longint; cdecl; external libreadline;
function rl_end_undo_group: longint; cdecl; external libreadline;
function rl_modifying(para1: longint; para2: longint): longint; cdecl; external libreadline;
procedure rl_redisplay; cdecl; external libreadline;
function rl_on_new_line: longint; cdecl; external libreadline;
function rl_on_new_line_with_prompt: longint; cdecl; external libreadline;
function rl_forced_update_display: longint; cdecl; external libreadline;
function rl_clear_visible_line: longint; cdecl; external libreadline;
function rl_clear_message: longint; cdecl; external libreadline;
function rl_reset_line_state: longint; cdecl; external libreadline;
function rl_crlf: longint; cdecl; external libreadline;
procedure rl_keep_mark_active; cdecl; external libreadline;
procedure rl_activate_mark; cdecl; external libreadline;
procedure rl_deactivate_mark; cdecl; external libreadline;
function rl_mark_active_p: longint; cdecl; external libreadline;

function rl_message(para1: pchar): longint; cdecl; varargs; external libreadline;

function rl_show_char(para1: longint): longint; cdecl; external libreadline;
function rl_character_len(para1: longint; para2: longint): longint; cdecl; external libreadline;
procedure rl_redraw_prompt_last_line; cdecl; external libreadline;
procedure rl_save_prompt; cdecl; external libreadline;
procedure rl_restore_prompt; cdecl; external libreadline;
procedure rl_replace_line(para1: pchar; para2: longint); cdecl; external libreadline;
function rl_insert_text(para1: pchar): longint; cdecl; external libreadline;
function rl_delete_text(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_kill_text(para1: longint; para2: longint): longint; cdecl; external libreadline;
function rl_copy_text(para1: longint; para2: longint): pchar; cdecl; external libreadline;
procedure rl_prep_terminal(para1: longint); cdecl; external libreadline;
procedure rl_deprep_terminal; cdecl; external libreadline;
procedure rl_tty_set_default_bindings(para1: TKeymap); cdecl; external libreadline;
procedure rl_tty_unset_default_bindings(para1: TKeymap); cdecl; external libreadline;
function rl_tty_set_echoing(para1: longint): longint; cdecl; external libreadline;
function rl_reset_terminal(para1: pchar): longint; cdecl; external libreadline;
procedure rl_resize_terminal; cdecl; external libreadline;
procedure rl_set_screen_size(para1: longint; para2: longint); cdecl; external libreadline;
procedure rl_get_screen_size(para1: Plongint; para2: Plongint); cdecl; external libreadline;
procedure rl_reset_screen_size; cdecl; external libreadline;
function rl_get_termcap(para1: pchar): pchar; cdecl; external libreadline;
function rl_stuff_char(para1: longint): longint; cdecl; external libreadline;
function rl_execute_next(para1: longint): longint; cdecl; external libreadline;
function rl_clear_pending_input: longint; cdecl; external libreadline;
function rl_read_key: longint; cdecl; external libreadline;
function rl_getc(para1: PFILE): longint; cdecl; external libreadline;
function rl_set_keyboard_input_timeout(para1: longint): longint; cdecl; external libreadline;
function rl_set_timeout(para1: dword; para2: dword): longint; cdecl; external libreadline;
function rl_timeout_remaining(para1: Pdword; para2: Pdword): longint; cdecl; external libreadline;

function rl_clear_timeout: longint;

procedure rl_extend_line_buffer(para1: longint); cdecl; external libreadline;
function rl_ding: longint; cdecl; external libreadline;
function rl_alphabetic(para1: longint): longint; cdecl; external libreadline;
procedure rl_free(para1: pointer); cdecl; external libreadline;
function rl_set_signals: longint; cdecl; external libreadline;
function rl_clear_signals: longint; cdecl; external libreadline;
procedure rl_cleanup_after_signal; cdecl; external libreadline;
procedure rl_reset_after_signal; cdecl; external libreadline;
procedure rl_free_line_state; cdecl; external libreadline;
function rl_pending_signal: longint; cdecl; external libreadline;
procedure rl_check_signals; cdecl; external libreadline;
procedure rl_echo_signal_char(para1: longint); cdecl; external libreadline;
function rl_set_paren_blink_timeout(para1: longint): longint; cdecl; external libreadline;
procedure rl_clear_history; cdecl; external libreadline;
function rl_maybe_save_line: longint; cdecl; external libreadline;
function rl_maybe_unsave_line: longint; cdecl; external libreadline;
function rl_maybe_replace_line: longint; cdecl; external libreadline;
function rl_complete_internal(para1: longint): longint; cdecl; external libreadline;
procedure rl_display_match_list(para1: PPchar; para2: longint; para3: longint); cdecl; external libreadline;
function rl_completion_matches(para1: pchar; para2: Trl_compentry_func_t): PPchar; cdecl; external libreadline;
function rl_username_completion_function(para1: pchar; para2: longint): pchar; cdecl; external libreadline;
function rl_filename_completion_function(para1: pchar; para2: longint): pchar; cdecl; external libreadline;
function rl_completion_mode(para1: Trl_command_func_t): longint; cdecl; external libreadline;

var
  rl_library_version: pchar; cvar;external libreadline;
  rl_readline_version: longint; cvar;external libreadline;
  rl_gnu_readline_p: longint; cvar;external libreadline;
  rl_readline_state: dword; cvar;external libreadline;
  rl_editing_mode: longint; cvar;external libreadline;
  rl_insert_mode: longint; cvar;external libreadline;
  rl_readline_name: pchar; cvar;external libreadline;
  rl_prompt: pchar; cvar;external libreadline;
  rl_display_prompt: pchar; cvar;external libreadline;
  rl_line_buffer: pchar; cvar;external libreadline;
  rl_point: longint; cvar;external libreadline;
  rl_end: longint; cvar;external libreadline;
  rl_mark: longint; cvar;external libreadline;
  rl_done: longint; cvar;external libreadline;
  rl_eof_found: longint; cvar;external libreadline;
  rl_pending_input: longint; cvar;external libreadline;
  rl_dispatching: longint; cvar;external libreadline;
  rl_explicit_arg: longint; cvar;external libreadline;
  rl_numeric_arg: longint; cvar;external libreadline;
  rl_last_func: Trl_command_func_t; cvar;external libreadline;
  rl_terminal_name: pchar; cvar;external libreadline;
  rl_instream: PFILE; cvar;external libreadline;
  rl_outstream: PFILE; cvar;external libreadline;
  rl_prefer_env_winsize: longint; cvar;external libreadline;
  rl_startup_hook: Trl_hook_func_t; cvar;external libreadline;
  rl_pre_input_hook: Trl_hook_func_t; cvar;external libreadline;
  rl_event_hook: Trl_hook_func_t; cvar;external libreadline;
  rl_signal_event_hook: Trl_hook_func_t; cvar;external libreadline;
  rl_timeout_event_hook: Trl_hook_func_t; cvar;external libreadline;
  rl_input_available_hook: Trl_hook_func_t; cvar;external libreadline;
  rl_getc_function: Trl_getc_func_t; cvar;external libreadline;
  rl_redisplay_function: Trl_voidfunc_t; cvar;external libreadline;
  rl_prep_term_function: Trl_vintfunc_t; cvar;external libreadline;
  rl_deprep_term_function: Trl_voidfunc_t; cvar;external libreadline;
  rl_executing_keymap: TKeymap; cvar;external libreadline;
  rl_binding_keymap: TKeymap; cvar;external libreadline;
  rl_executing_key: longint; cvar;external libreadline;
  rl_executing_keyseq: pchar; cvar;external libreadline;
  rl_key_sequence_length: longint; cvar;external libreadline;
  rl_erase_empty_line: longint; cvar;external libreadline;
  rl_already_prompted: longint; cvar;external libreadline;
  rl_num_chars_to_read: longint; cvar;external libreadline;
  rl_executing_macro: pchar; cvar;external libreadline;
  rl_catch_signals: longint; cvar;external libreadline;
  rl_catch_sigwinch: longint; cvar;external libreadline;
  rl_change_environment: longint; cvar;external libreadline;
  rl_completion_entry_function: Trl_compentry_func_t; cvar;external libreadline;
  rl_menu_completion_entry_function: Trl_compentry_func_t; cvar;external libreadline;
  rl_ignore_some_completions_function: Trl_compignore_func_t; cvar;external libreadline;
  rl_attempted_completion_function: Trl_completion_func_t; cvar;external libreadline;
  rl_basic_word_break_characters: pchar; cvar;external libreadline;
  rl_completer_word_break_characters: pchar; cvar;external libreadline;
  rl_completion_word_break_hook: Trl_cpvfunc_t; cvar;external libreadline;
  rl_completer_quote_characters: pchar; cvar;external libreadline;
  rl_basic_quote_characters: pchar; cvar;external libreadline;
  rl_filename_quote_characters: pchar; cvar;external libreadline;
  rl_special_prefixes: pchar; cvar;external libreadline;
  rl_directory_completion_hook: Trl_icppfunc_t; cvar;external libreadline;
  rl_directory_rewrite_hook: Trl_icppfunc_t; cvar;external libreadline;
  rl_filename_stat_hook: Trl_icppfunc_t; cvar;external libreadline;
  rl_filename_rewrite_hook: Trl_dequote_func_t; cvar;external libreadline;

var
  rl_symbolic_link_hook: Trl_icppfunc_t absolute rl_directory_completion_hook;

var
  rl_completion_display_matches_hook: Trl_compdisp_func_t; cvar;external libreadline;
  rl_filename_completion_desired: longint; cvar;external libreadline;
  rl_filename_quoting_desired: longint; cvar;external libreadline;
  rl_filename_quoting_function: Trl_quote_func_t; cvar;external libreadline;
  rl_filename_dequoting_function: Trl_dequote_func_t; cvar;external libreadline;
  rl_char_is_quoted_p: Trl_linebuf_func_t; cvar;external libreadline;
  rl_attempted_completion_over: longint; cvar;external libreadline;
  rl_completion_type: longint; cvar;external libreadline;
  rl_completion_invoking_key: longint; cvar;external libreadline;
  rl_completion_query_items: longint; cvar;external libreadline;
  rl_completion_append_character: longint; cvar;external libreadline;
  rl_completion_suppress_append: longint; cvar;external libreadline;
  rl_completion_quote_character: longint; cvar;external libreadline;
  rl_completion_found_quote: longint; cvar;external libreadline;
  rl_completion_suppress_quote: longint; cvar;external libreadline;
  rl_sort_completion_matches: longint; cvar;external libreadline;
  rl_completion_mark_symlink_dirs: longint; cvar;external libreadline;
  rl_ignore_completion_duplicates: longint; cvar;external libreadline;
  rl_inhibit_completion: longint; cvar;external libreadline;
  rl_persistent_signal_handlers: longint; cvar;external libreadline;

const
  READERR = -(2);
  RL_PROMPT_START_IGNORE = '\001';
  RL_PROMPT_END_IGNORE = '\002';
  NO_MATCH = 0;
  SINGLE_MATCH = 1;
  MULT_MATCH = 2;
  RL_STATE_NONE = $000000;
  RL_STATE_INITIALIZING = $0000001;
  RL_STATE_INITIALIZED = $0000002;
  RL_STATE_TERMPREPPED = $0000004;
  RL_STATE_READCMD = $0000008;
  RL_STATE_METANEXT = $0000010;
  RL_STATE_DISPATCHING = $0000020;
  RL_STATE_MOREINPUT = $0000040;
  RL_STATE_ISEARCH = $0000080;
  RL_STATE_NSEARCH = $0000100;
  RL_STATE_SEARCH = $0000200;
  RL_STATE_NUMERICARG = $0000400;
  RL_STATE_MACROINPUT = $0000800;
  RL_STATE_MACRODEF = $0001000;
  RL_STATE_OVERWRITE = $0002000;
  RL_STATE_COMPLETING = $0004000;
  RL_STATE_SIGHANDLER = $0008000;
  RL_STATE_UNDOING = $0010000;
  RL_STATE_INPUTPENDING = $0020000;
  RL_STATE_TTYCSAVED = $0040000;
  RL_STATE_CALLBACK = $0080000;
  RL_STATE_VIMOTION = $0100000;
  RL_STATE_MULTIKEY = $0200000;
  RL_STATE_VICMDONCE = $0400000;
  RL_STATE_CHARSEARCH = $0800000;
  RL_STATE_REDISPLAYING = $1000000;
  RL_STATE_DONE = $2000000;
  RL_STATE_TIMEOUT = $4000000;
  RL_STATE_EOF = $8000000;

function RL_SETSTATE(x: DWord): DWord;
function RL_UNSETSTATE(x: DWord): DWord;
function RL_ISSTATE(x: DWord): DWord;

type
  Treadline_state = record
    point: longint;
    end_: longint;
    mark: longint;
    buflen: longint;
    buffer: pchar;
    ul: PUNDO_LIST;
    prompt: pchar;
    rlstate: longint;
    done: longint;
    kmap: TKeymap;
    lastfunc: Trl_command_func_t;
    insmode: longint;
    edmode: longint;
    kseq: pchar;
    kseqlen: longint;
    pendingin: longint;
    inf: PFILE;
    outf: PFILE;
    macro: pchar;
    catchsigs: longint;
    catchsigwinch: longint;
    entryfunc: Trl_compentry_func_t;
    menuentryfunc: Trl_compentry_func_t;
    ignorefunc: Trl_compignore_func_t;
    attemptfunc: Trl_completion_func_t;
    wordbreakchars: pchar;
    reserved: array[0..63] of char;
  end;
  Preadline_state = ^Treadline_state;

function rl_save_state(para1: Preadline_state): longint; cdecl; external libreadline;
function rl_restore_state(para1: Preadline_state): longint; cdecl; external libreadline;

// === Konventiert am: 27-8-25 16:55:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function rl_clear_timeout: longint;
begin
  rl_clear_timeout := rl_set_timeout(0, 0);
end;

function RL_SETSTATE(x: DWord): DWord;
begin
  Result := rl_readline_state or x;
end;

function RL_UNSETSTATE(x: DWord): DWord;
begin
  Result := rl_readline_state and (not x);
end;

function RL_ISSTATE(x: DWord): DWord;
begin
  Result := rl_readline_state and x;
end;


{$ENDIF read_implementation}

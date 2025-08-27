
unit readline;
interface

{
  Automatically converted by H2Pas 1.0.0 from readline.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    readline.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pdword  = ^dword;
PFILE  = ^FILE;
Pfunmap  = ^funmap;
Plongint  = ^longint;
Preadline_state  = ^readline_state;
Prl_command_func_t  = ^rl_command_func_t;
Prl_compdisp_func_t  = ^rl_compdisp_func_t;
Prl_compentry_func_t  = ^rl_compentry_func_t;
Prl_compignore_func_t  = ^rl_compignore_func_t;
Prl_completion_func_t  = ^rl_completion_func_t;
Prl_cpvfunc_t  = ^rl_cpvfunc_t;
Prl_dequote_func_t  = ^rl_dequote_func_t;
Prl_getc_func_t  = ^rl_getc_func_t;
Prl_hook_func_t  = ^rl_hook_func_t;
Prl_icppfunc_t  = ^rl_icppfunc_t;
Prl_linebuf_func_t  = ^rl_linebuf_func_t;
Prl_quote_func_t  = ^rl_quote_func_t;
Prl_vcpfunc_t  = ^rl_vcpfunc_t;
Prl_vintfunc_t  = ^rl_vintfunc_t;
Prl_voidfunc_t  = ^rl_voidfunc_t;
Pundo_code  = ^undo_code;
Pundo_list  = ^undo_list;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Readline.h -- the names of functions callable from within readline.  }
{ Copyright (C) 1987-2022 Free Software Foundation, Inc.

   This file is part of the GNU Readline Library (Readline), a library
   for reading lines of text with interactive input and history editing.      

   Readline is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   Readline is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with Readline.  If not, see <http://www.gnu.org/licenses/>.
 }
{$if !defined (_READLINE_H_)}
{$define _READLINE_H_}
{ C++ extern C conditionnal removed }
{$if defined (READLINE_LIBRARY)}
{$include "rlstdc.h"}
{$include "rltypedefs.h"}
{$include "keymaps.h"}
{$include "tilde.h"}
{$else}
{$include <stdio.h>}
{$include <readline/rlstdc.h>}
{$include <readline/rltypedefs.h>}
{$include <readline/keymaps.h>}
{$include <readline/tilde.h>}
{$endif}
{ Hex-encoded Readline version number.  }
{ Readline 8.2  }

const
  RL_READLINE_VERSION = $0802;  
  RL_VERSION_MAJOR = 8;  
  RL_VERSION_MINOR = 2;  
{ Readline data structures.  }
{ Maintaining the state of undo.  We remember individual deletes and inserts
   on a chain of things to do.  }
{ The actions that undo knows how to undo.  Notice that UNDO_DELETE means
   to insert some text, and UNDO_INSERT means to delete some text.   I.e.,
   the code tells undo what to undo, not how to undo it.  }
type
  Tundo_code =  Longint;
  Const
    UNDO_DELETE = 0;
    UNDO_INSERT = 1;
    UNDO_BEGIN = 2;
    UNDO_END = 3;

{ What an element of THE_UNDO_LIST looks like.  }
{ Where the change took place.  }
{ The text to insert, if undoing a delete.  }
{ Delete, Insert, Begin, End.  }
type
  Pundo_list = ^Tundo_list;
  Tundo_list = record
      next : Pundo_list;
      start : longint;
      end : longint;
      text : Pchar;
      what : Tundo_code;
    end;
{ The current undo list for RL_LINE_BUFFER.  }
  var
    rl_undo_list : PUNDO_LIST;cvar;external;
{ The data structure for mapping textual names to code addresses.  }
(* Const before type ignored *)
type
  Pfunmap = ^Tfunmap;
  Tfunmap = record
      name : Pchar;
      _function : Prl_command_func_t;
    end;
  var
    funmap : ^PFUNMAP;cvar;external;
{ ****************************************************************  }
{								     }
{	     Functions available to bind to key sequences	     }
{								     }
{ ****************************************************************  }
{ Bindable commands for numeric arguments.  }

function rl_digit_argument(para1:longint; para2:longint):longint;cdecl;external;
function rl_universal_argument(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable commands for moving the cursor.  }
function rl_forward_byte(para1:longint; para2:longint):longint;cdecl;external;
function rl_forward_char(para1:longint; para2:longint):longint;cdecl;external;
function rl_forward(para1:longint; para2:longint):longint;cdecl;external;
function rl_backward_byte(para1:longint; para2:longint):longint;cdecl;external;
function rl_backward_char(para1:longint; para2:longint):longint;cdecl;external;
function rl_backward(para1:longint; para2:longint):longint;cdecl;external;
function rl_beg_of_line(para1:longint; para2:longint):longint;cdecl;external;
function rl_end_of_line(para1:longint; para2:longint):longint;cdecl;external;
function rl_forward_word(para1:longint; para2:longint):longint;cdecl;external;
function rl_backward_word(para1:longint; para2:longint):longint;cdecl;external;
function rl_refresh_line(para1:longint; para2:longint):longint;cdecl;external;
function rl_clear_screen(para1:longint; para2:longint):longint;cdecl;external;
function rl_clear_display(para1:longint; para2:longint):longint;cdecl;external;
function rl_skip_csi_sequence(para1:longint; para2:longint):longint;cdecl;external;
function rl_arrow_keys(para1:longint; para2:longint):longint;cdecl;external;
function rl_previous_screen_line(para1:longint; para2:longint):longint;cdecl;external;
function rl_next_screen_line(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable commands for inserting and deleting text.  }
function rl_insert(para1:longint; para2:longint):longint;cdecl;external;
function rl_quoted_insert(para1:longint; para2:longint):longint;cdecl;external;
function rl_tab_insert(para1:longint; para2:longint):longint;cdecl;external;
function rl_newline(para1:longint; para2:longint):longint;cdecl;external;
function rl_do_lowercase_version(para1:longint; para2:longint):longint;cdecl;external;
function rl_rubout(para1:longint; para2:longint):longint;cdecl;external;
function rl_delete(para1:longint; para2:longint):longint;cdecl;external;
function rl_rubout_or_delete(para1:longint; para2:longint):longint;cdecl;external;
function rl_delete_horizontal_space(para1:longint; para2:longint):longint;cdecl;external;
function rl_delete_or_show_completions(para1:longint; para2:longint):longint;cdecl;external;
function rl_insert_comment(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable commands for changing case.  }
function rl_upcase_word(para1:longint; para2:longint):longint;cdecl;external;
function rl_downcase_word(para1:longint; para2:longint):longint;cdecl;external;
function rl_capitalize_word(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable commands for transposing characters and words.  }
function rl_transpose_words(para1:longint; para2:longint):longint;cdecl;external;
function rl_transpose_chars(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable commands for searching within a line.  }
function rl_char_search(para1:longint; para2:longint):longint;cdecl;external;
function rl_backward_char_search(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable commands for readline's interface to the command history.  }
function rl_beginning_of_history(para1:longint; para2:longint):longint;cdecl;external;
function rl_end_of_history(para1:longint; para2:longint):longint;cdecl;external;
function rl_get_next_history(para1:longint; para2:longint):longint;cdecl;external;
function rl_get_previous_history(para1:longint; para2:longint):longint;cdecl;external;
function rl_operate_and_get_next(para1:longint; para2:longint):longint;cdecl;external;
function rl_fetch_history(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable commands for managing the mark and region.  }
function rl_set_mark(para1:longint; para2:longint):longint;cdecl;external;
function rl_exchange_point_and_mark(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable commands to set the editing mode (emacs or vi).  }
function rl_vi_editing_mode(para1:longint; para2:longint):longint;cdecl;external;
function rl_emacs_editing_mode(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable commands to change the insert mode (insert or overwrite)  }
function rl_overwrite_mode(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable commands for managing key bindings.  }
function rl_re_read_init_file(para1:longint; para2:longint):longint;cdecl;external;
function rl_dump_functions(para1:longint; para2:longint):longint;cdecl;external;
function rl_dump_macros(para1:longint; para2:longint):longint;cdecl;external;
function rl_dump_variables(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable commands for word completion.  }
function rl_complete(para1:longint; para2:longint):longint;cdecl;external;
function rl_possible_completions(para1:longint; para2:longint):longint;cdecl;external;
function rl_insert_completions(para1:longint; para2:longint):longint;cdecl;external;
function rl_old_menu_complete(para1:longint; para2:longint):longint;cdecl;external;
function rl_menu_complete(para1:longint; para2:longint):longint;cdecl;external;
function rl_backward_menu_complete(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable commands for killing and yanking text, and managing the kill ring.  }
function rl_kill_word(para1:longint; para2:longint):longint;cdecl;external;
function rl_backward_kill_word(para1:longint; para2:longint):longint;cdecl;external;
function rl_kill_line(para1:longint; para2:longint):longint;cdecl;external;
function rl_backward_kill_line(para1:longint; para2:longint):longint;cdecl;external;
function rl_kill_full_line(para1:longint; para2:longint):longint;cdecl;external;
function rl_unix_word_rubout(para1:longint; para2:longint):longint;cdecl;external;
function rl_unix_filename_rubout(para1:longint; para2:longint):longint;cdecl;external;
function rl_unix_line_discard(para1:longint; para2:longint):longint;cdecl;external;
function rl_copy_region_to_kill(para1:longint; para2:longint):longint;cdecl;external;
function rl_kill_region(para1:longint; para2:longint):longint;cdecl;external;
function rl_copy_forward_word(para1:longint; para2:longint):longint;cdecl;external;
function rl_copy_backward_word(para1:longint; para2:longint):longint;cdecl;external;
function rl_yank(para1:longint; para2:longint):longint;cdecl;external;
function rl_yank_pop(para1:longint; para2:longint):longint;cdecl;external;
function rl_yank_nth_arg(para1:longint; para2:longint):longint;cdecl;external;
function rl_yank_last_arg(para1:longint; para2:longint):longint;cdecl;external;
function rl_bracketed_paste_begin(para1:longint; para2:longint):longint;cdecl;external;
{ Not available unless _WIN32 is defined.  }
{$if defined (_WIN32)}

function rl_paste_from_clipboard(para1:longint; para2:longint):longint;cdecl;external;
{$endif}
{ Bindable commands for incremental searching.  }

function rl_reverse_search_history(para1:longint; para2:longint):longint;cdecl;external;
function rl_forward_search_history(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable keyboard macro commands.  }
function rl_start_kbd_macro(para1:longint; para2:longint):longint;cdecl;external;
function rl_end_kbd_macro(para1:longint; para2:longint):longint;cdecl;external;
function rl_call_last_kbd_macro(para1:longint; para2:longint):longint;cdecl;external;
function rl_print_last_kbd_macro(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable undo commands.  }
function rl_revert_line(para1:longint; para2:longint):longint;cdecl;external;
function rl_undo_command(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable tilde expansion commands.  }
function rl_tilde_expand(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable terminal control commands.  }
function rl_restart_output(para1:longint; para2:longint):longint;cdecl;external;
function rl_stop_output(para1:longint; para2:longint):longint;cdecl;external;
{ Miscellaneous bindable commands.  }
function rl_abort(para1:longint; para2:longint):longint;cdecl;external;
function rl_tty_status(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable commands for incremental and non-incremental history searching.  }
function rl_history_search_forward(para1:longint; para2:longint):longint;cdecl;external;
function rl_history_search_backward(para1:longint; para2:longint):longint;cdecl;external;
function rl_history_substr_search_forward(para1:longint; para2:longint):longint;cdecl;external;
function rl_history_substr_search_backward(para1:longint; para2:longint):longint;cdecl;external;
function rl_noninc_forward_search(para1:longint; para2:longint):longint;cdecl;external;
function rl_noninc_reverse_search(para1:longint; para2:longint):longint;cdecl;external;
function rl_noninc_forward_search_again(para1:longint; para2:longint):longint;cdecl;external;
function rl_noninc_reverse_search_again(para1:longint; para2:longint):longint;cdecl;external;
{ Bindable command used when inserting a matching close character.  }
function rl_insert_close(para1:longint; para2:longint):longint;cdecl;external;
{ Not available unless READLINE_CALLBACKS is defined.  }
(* Const before type ignored *)
procedure rl_callback_handler_install(para1:Pchar; para2:Prl_vcpfunc_t);cdecl;external;
procedure rl_callback_read_char;cdecl;external;
procedure rl_callback_handler_remove;cdecl;external;
procedure rl_callback_sigcleanup;cdecl;external;
{ Things for vi mode. Not available unless readline is compiled -DVI_MODE.  }
{ VI-mode bindable commands.  }
function rl_vi_redo(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_undo(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_yank_arg(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_fetch_history(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_search_again(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_search(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_complete(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_tilde_expand(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_prev_word(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_next_word(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_end_word(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_insert_beg(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_append_mode(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_append_eol(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_eof_maybe(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_insertion_mode(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_insert_mode(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_movement_mode(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_arg_digit(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_change_case(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_put(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_column(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_delete_to(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_change_to(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_yank_to(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_yank_pop(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_rubout(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_delete(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_back_to_indent(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_unix_word_rubout(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_first_print(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_char_search(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_match(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_change_char(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_subst(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_overstrike(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_overstrike_delete(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_replace(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_set_mark(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_goto_mark(para1:longint; para2:longint):longint;cdecl;external;
{ VI-mode utility functions.  }
function rl_vi_check:longint;cdecl;external;
function rl_vi_domove(para1:longint; para2:Plongint):longint;cdecl;external;
function rl_vi_bracktype(para1:longint):longint;cdecl;external;
procedure rl_vi_start_inserting(para1:longint; para2:longint; para3:longint);cdecl;external;
{ VI-mode pseudo-bindable commands, used as utility functions.  }
function rl_vi_fWord(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_bWord(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_eWord(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_fword(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_bword(para1:longint; para2:longint):longint;cdecl;external;
function rl_vi_eword(para1:longint; para2:longint):longint;cdecl;external;
{ ****************************************************************  }
{								     }
{			Well Published Functions		     }
{								     }
{ ****************************************************************  }
{ Readline functions.  }
{ Read a line of input.  Prompt with PROMPT.  A NULL PROMPT means none.  }
(* Const before type ignored *)
function readline(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function rl_set_prompt(para1:Pchar):longint;cdecl;external;
function rl_expand_prompt(para1:Pchar):longint;cdecl;external;
function rl_initialize:longint;cdecl;external;
{ Undocumented; unused by readline  }
function rl_discard_argument:longint;cdecl;external;
{ Utility functions to bind keys to readline commands.  }
(* Const before type ignored *)
function rl_add_defun(para1:Pchar; para2:Prl_command_func_t; para3:longint):longint;cdecl;external;
function rl_bind_key(para1:longint; para2:Prl_command_func_t):longint;cdecl;external;
function rl_bind_key_in_map(para1:longint; para2:Prl_command_func_t; para3:TKeymap):longint;cdecl;external;
function rl_unbind_key(para1:longint):longint;cdecl;external;
function rl_unbind_key_in_map(para1:longint; para2:TKeymap):longint;cdecl;external;
function rl_bind_key_if_unbound(para1:longint; para2:Prl_command_func_t):longint;cdecl;external;
function rl_bind_key_if_unbound_in_map(para1:longint; para2:Prl_command_func_t; para3:TKeymap):longint;cdecl;external;
function rl_unbind_function_in_map(para1:Prl_command_func_t; para2:TKeymap):longint;cdecl;external;
(* Const before type ignored *)
function rl_unbind_command_in_map(para1:Pchar; para2:TKeymap):longint;cdecl;external;
(* Const before type ignored *)
function rl_bind_keyseq(para1:Pchar; para2:Prl_command_func_t):longint;cdecl;external;
(* Const before type ignored *)
function rl_bind_keyseq_in_map(para1:Pchar; para2:Prl_command_func_t; para3:TKeymap):longint;cdecl;external;
(* Const before type ignored *)
function rl_bind_keyseq_if_unbound(para1:Pchar; para2:Prl_command_func_t):longint;cdecl;external;
(* Const before type ignored *)
function rl_bind_keyseq_if_unbound_in_map(para1:Pchar; para2:Prl_command_func_t; para3:TKeymap):longint;cdecl;external;
(* Const before type ignored *)
function rl_generic_bind(para1:longint; para2:Pchar; para3:Pchar; para4:TKeymap):longint;cdecl;external;
(* Const before type ignored *)
function rl_variable_value(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function rl_variable_bind(para1:Pchar; para2:Pchar):longint;cdecl;external;
{ Backwards compatibility, use rl_bind_keyseq_in_map instead.  }
(* Const before type ignored *)
function rl_set_key(para1:Pchar; para2:Prl_command_func_t; para3:TKeymap):longint;cdecl;external;
{ Backwards compatibility, use rl_generic_bind instead.  }
(* Const before type ignored *)
(* Const before type ignored *)
function rl_macro_bind(para1:Pchar; para2:Pchar; para3:TKeymap):longint;cdecl;external;
{ Undocumented in the texinfo manual; not really useful to programs.  }
(* Const before type ignored *)
function rl_translate_keyseq(para1:Pchar; para2:Pchar; para3:Plongint):longint;cdecl;external;
function rl_untranslate_keyseq(para1:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function rl_named_function(para1:Pchar):Prl_command_func_t;cdecl;external;
(* Const before type ignored *)
function rl_function_of_keyseq(para1:Pchar; para2:TKeymap; para3:Plongint):Prl_command_func_t;cdecl;external;
(* Const before type ignored *)
function rl_function_of_keyseq_len(para1:Pchar; para2:Tsize_t; para3:TKeymap; para4:Plongint):Prl_command_func_t;cdecl;external;
(* Const before type ignored *)
function rl_trim_arg_from_keyseq(para1:Pchar; para2:Tsize_t; para3:TKeymap):longint;cdecl;external;
procedure rl_list_funmap_names;cdecl;external;
function rl_invoking_keyseqs_in_map(para1:Prl_command_func_t; para2:TKeymap):^Pchar;cdecl;external;
function rl_invoking_keyseqs(para1:Prl_command_func_t):^Pchar;cdecl;external;
procedure rl_function_dumper(para1:longint);cdecl;external;
procedure rl_macro_dumper(para1:longint);cdecl;external;
procedure rl_variable_dumper(para1:longint);cdecl;external;
(* Const before type ignored *)
function rl_read_init_file(para1:Pchar):longint;cdecl;external;
function rl_parse_and_bind(para1:Pchar):longint;cdecl;external;
{ Functions for manipulating keymaps.  }
function rl_make_bare_keymap:TKeymap;cdecl;external;
function rl_empty_keymap(para1:TKeymap):longint;cdecl;external;
function rl_copy_keymap(para1:TKeymap):TKeymap;cdecl;external;
function rl_make_keymap:TKeymap;cdecl;external;
procedure rl_discard_keymap(para1:TKeymap);cdecl;external;
procedure rl_free_keymap(para1:TKeymap);cdecl;external;
(* Const before type ignored *)
function rl_get_keymap_by_name(para1:Pchar):TKeymap;cdecl;external;
function rl_get_keymap_name(para1:TKeymap):Pchar;cdecl;external;
procedure rl_set_keymap(para1:TKeymap);cdecl;external;
function rl_get_keymap:TKeymap;cdecl;external;
(* Const before type ignored *)
function rl_set_keymap_name(para1:Pchar; para2:TKeymap):longint;cdecl;external;
{ Undocumented; used internally only.  }
procedure rl_set_keymap_from_edit_mode;cdecl;external;
function rl_get_keymap_name_from_edit_mode:Pchar;cdecl;external;
{ Functions for manipulating the funmap, which maps command names to functions.  }
(* Const before type ignored *)
function rl_add_funmap_entry(para1:Pchar; para2:Prl_command_func_t):longint;cdecl;external;
(* Const before type ignored *)
function rl_funmap_names:^Pchar;cdecl;external;
{ Undocumented, only used internally -- there is only one funmap, and this
   function may be called only once.  }
procedure rl_initialize_funmap;cdecl;external;
{ Utility functions for managing keyboard macros.  }
procedure rl_push_macro_input(para1:Pchar);cdecl;external;
{ Functions for undoing, from undo.c  }
procedure rl_add_undo(para1:Tundo_code; para2:longint; para3:longint; para4:Pchar);cdecl;external;
procedure rl_free_undo_list;cdecl;external;
function rl_do_undo:longint;cdecl;external;
function rl_begin_undo_group:longint;cdecl;external;
function rl_end_undo_group:longint;cdecl;external;
function rl_modifying(para1:longint; para2:longint):longint;cdecl;external;
{ Functions for redisplay.  }
procedure rl_redisplay;cdecl;external;
function rl_on_new_line:longint;cdecl;external;
function rl_on_new_line_with_prompt:longint;cdecl;external;
function rl_forced_update_display:longint;cdecl;external;
function rl_clear_visible_line:longint;cdecl;external;
function rl_clear_message:longint;cdecl;external;
function rl_reset_line_state:longint;cdecl;external;
function rl_crlf:longint;cdecl;external;
{ Functions to manage the mark and region, especially the notion of an
   active mark and an active region.  }
procedure rl_keep_mark_active;cdecl;external;
procedure rl_activate_mark;cdecl;external;
procedure rl_deactivate_mark;cdecl;external;
function rl_mark_active_p:longint;cdecl;external;
{$if defined (USE_VARARGS) && defined (PREFER_STDARG)}
(* Const before type ignored *)

function rl_message(para1:Pchar; args:array of const):longint;cdecl;external;
function rl_message(para1:Pchar):longint;cdecl;external;
{ xxxxxxxxxxxxxxxxxxxxxxx }
{$else}

function rl_message:longint;cdecl;external;
{$endif}

function rl_show_char(para1:longint):longint;cdecl;external;
{ Undocumented in texinfo manual.  }
function rl_character_len(para1:longint; para2:longint):longint;cdecl;external;
procedure rl_redraw_prompt_last_line;cdecl;external;
{ Save and restore internal prompt redisplay information.  }
procedure rl_save_prompt;cdecl;external;
procedure rl_restore_prompt;cdecl;external;
{ Modifying text.  }
(* Const before type ignored *)
procedure rl_replace_line(para1:Pchar; para2:longint);cdecl;external;
(* Const before type ignored *)
function rl_insert_text(para1:Pchar):longint;cdecl;external;
function rl_delete_text(para1:longint; para2:longint):longint;cdecl;external;
function rl_kill_text(para1:longint; para2:longint):longint;cdecl;external;
function rl_copy_text(para1:longint; para2:longint):Pchar;cdecl;external;
{ Terminal and tty mode management.  }
procedure rl_prep_terminal(para1:longint);cdecl;external;
procedure rl_deprep_terminal;cdecl;external;
procedure rl_tty_set_default_bindings(para1:TKeymap);cdecl;external;
procedure rl_tty_unset_default_bindings(para1:TKeymap);cdecl;external;
function rl_tty_set_echoing(para1:longint):longint;cdecl;external;
(* Const before type ignored *)
function rl_reset_terminal(para1:Pchar):longint;cdecl;external;
procedure rl_resize_terminal;cdecl;external;
procedure rl_set_screen_size(para1:longint; para2:longint);cdecl;external;
procedure rl_get_screen_size(para1:Plongint; para2:Plongint);cdecl;external;
procedure rl_reset_screen_size;cdecl;external;
(* Const before type ignored *)
function rl_get_termcap(para1:Pchar):Pchar;cdecl;external;
{ Functions for character input.  }
function rl_stuff_char(para1:longint):longint;cdecl;external;
function rl_execute_next(para1:longint):longint;cdecl;external;
function rl_clear_pending_input:longint;cdecl;external;
function rl_read_key:longint;cdecl;external;
function rl_getc(para1:PFILE):longint;cdecl;external;
function rl_set_keyboard_input_timeout(para1:longint):longint;cdecl;external;
{ Functions to set and reset timeouts.  }
function rl_set_timeout(para1:dword; para2:dword):longint;cdecl;external;
function rl_timeout_remaining(para1:Pdword; para2:Pdword):longint;cdecl;external;
{$undef rl_clear_timeout}
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function rl_clear_timeout : longint;

{ `Public' utility functions .  }
procedure rl_extend_line_buffer(para1:longint);cdecl;external;
function rl_ding:longint;cdecl;external;
function rl_alphabetic(para1:longint):longint;cdecl;external;
procedure rl_free(para1:pointer);cdecl;external;
{ Readline signal handling, from signals.c  }
function rl_set_signals:longint;cdecl;external;
function rl_clear_signals:longint;cdecl;external;
procedure rl_cleanup_after_signal;cdecl;external;
procedure rl_reset_after_signal;cdecl;external;
procedure rl_free_line_state;cdecl;external;
function rl_pending_signal:longint;cdecl;external;
procedure rl_check_signals;cdecl;external;
procedure rl_echo_signal_char(para1:longint);cdecl;external;
function rl_set_paren_blink_timeout(para1:longint):longint;cdecl;external;
{ History management functions.  }
procedure rl_clear_history;cdecl;external;
{ Undocumented.  }
function rl_maybe_save_line:longint;cdecl;external;
function rl_maybe_unsave_line:longint;cdecl;external;
function rl_maybe_replace_line:longint;cdecl;external;
{ Completion functions.  }
function rl_complete_internal(para1:longint):longint;cdecl;external;
procedure rl_display_match_list(para1:PPchar; para2:longint; para3:longint);cdecl;external;
(* Const before type ignored *)
function rl_completion_matches(para1:Pchar; para2:Prl_compentry_func_t):^Pchar;cdecl;external;
(* Const before type ignored *)
function rl_username_completion_function(para1:Pchar; para2:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function rl_filename_completion_function(para1:Pchar; para2:longint):Pchar;cdecl;external;
function rl_completion_mode(para1:Prl_command_func_t):longint;cdecl;external;
{$if 0}
{ Backwards compatibility (compat.c).  These will go away sometime.  }

procedure free_undo_list;cdecl;external;
function maybe_save_line:longint;cdecl;external;
function maybe_unsave_line:longint;cdecl;external;
function maybe_replace_line:longint;cdecl;external;
function ding:longint;cdecl;external;
function alphabetic(para1:longint):longint;cdecl;external;
function crlf:longint;cdecl;external;
function completion_matches(para1:Pchar; para2:Prl_compentry_func_t):^Pchar;cdecl;external;
(* Const before type ignored *)
function username_completion_function(para1:Pchar; para2:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function filename_completion_function(para1:Pchar; para2:longint):Pchar;cdecl;external;
{$endif}
{ ****************************************************************  }
{								     }
{			Well Published Variables		     }
{								     }
{ ****************************************************************  }
{ The version of this incarnation of the readline library.  }
(* Const before type ignored *)
  var
    rl_library_version : Pchar;cvar;external;
{ e.g., "4.2"  }
    rl_readline_version : longint;cvar;external;
{ e.g., 0x0402  }
{ True if this is real GNU readline.  }
    rl_gnu_readline_p : longint;cvar;external;
{ Flags word encapsulating the current readline state.  }
    rl_readline_state : dword;cvar;external;
{ Says which editing mode readline is currently using.  1 means emacs mode;
   0 means vi mode.  }
    rl_editing_mode : longint;cvar;external;
{ Insert or overwrite mode for emacs mode.  1 means insert mode; 0 means
   overwrite mode.  Reset to insert mode on each input line.  }
    rl_insert_mode : longint;cvar;external;
{ The name of the calling program.  You should initialize this to
   whatever was in argv[0].  It is used when parsing conditionals.  }
(* Const before type ignored *)
    rl_readline_name : Pchar;cvar;external;
{ The prompt readline uses.  This is set from the argument to
   readline (), and should not be assigned to directly.  }
    rl_prompt : Pchar;cvar;external;
{ The prompt string that is actually displayed by rl_redisplay.  Public so
   applications can more easily supply their own redisplay functions.  }
    rl_display_prompt : Pchar;cvar;external;
{ The line buffer that is in use.  }
    rl_line_buffer : Pchar;cvar;external;
{ The location of point, and end.  }
    rl_point : longint;cvar;external;
    rl_end : longint;cvar;external;
{ The mark, or saved cursor position.  }
    rl_mark : longint;cvar;external;
{ Flag to indicate that readline has finished with the current input
   line and should return it.  }
    rl_done : longint;cvar;external;
{ Flag to indicate that readline has read an EOF character or read has
   returned 0 or error, and is returning a NULL line as a result.  }
    rl_eof_found : longint;cvar;external;
{ If set to a character value, that will be the next keystroke read.  }
    rl_pending_input : longint;cvar;external;
{ Non-zero if we called this function from _rl_dispatch().  It's present
   so functions can find out whether they were called from a key binding
   or directly from an application.  }
    rl_dispatching : longint;cvar;external;
{ Non-zero if the user typed a numeric argument before executing the
   current function.  }
    rl_explicit_arg : longint;cvar;external;
{ The current value of the numeric argument specified by the user.  }
    rl_numeric_arg : longint;cvar;external;
{ The address of the last command function Readline executed.  }
    rl_last_func : Prl_command_func_t;cvar;external;
{ The name of the terminal to use.  }
(* Const before type ignored *)
    rl_terminal_name : Pchar;cvar;external;
{ The input and output streams.  }
    rl_instream : PFILE;cvar;external;
    rl_outstream : PFILE;cvar;external;
{ If non-zero, Readline gives values of LINES and COLUMNS from the environment
   greater precedence than values fetched from the kernel when computing the
   screen dimensions.  }
    rl_prefer_env_winsize : longint;cvar;external;
{ If non-zero, then this is the address of a function to call just
   before readline_internal () prints the first prompt.  }
    rl_startup_hook : Prl_hook_func_t;cvar;external;
{ If non-zero, this is the address of a function to call just before
   readline_internal_setup () returns and readline_internal starts
   reading input characters.  }
    rl_pre_input_hook : Prl_hook_func_t;cvar;external;
{ The address of a function to call periodically while Readline is
   awaiting character input, or NULL, for no event handling.  }
    rl_event_hook : Prl_hook_func_t;cvar;external;
{ The address of a function to call if a read is interrupted by a signal.  }
    rl_signal_event_hook : Prl_hook_func_t;cvar;external;
    rl_timeout_event_hook : Prl_hook_func_t;cvar;external;
{ The address of a function to call if Readline needs to know whether or not
   there is data available from the current input source.  }
    rl_input_available_hook : Prl_hook_func_t;cvar;external;
{ The address of the function to call to fetch a character from the current
   Readline input stream  }
    rl_getc_function : Prl_getc_func_t;cvar;external;
    rl_redisplay_function : Prl_voidfunc_t;cvar;external;
    rl_prep_term_function : Prl_vintfunc_t;cvar;external;
    rl_deprep_term_function : Prl_voidfunc_t;cvar;external;
{ Dispatch variables.  }
    rl_executing_keymap : TKeymap;cvar;external;
    rl_binding_keymap : TKeymap;cvar;external;
    rl_executing_key : longint;cvar;external;
    rl_executing_keyseq : Pchar;cvar;external;
    rl_key_sequence_length : longint;cvar;external;
{ Display variables.  }
{ If non-zero, readline will erase the entire line, including any prompt,
   if the only thing typed on an otherwise-blank line is something bound to
   rl_newline.  }
    rl_erase_empty_line : longint;cvar;external;
{ If non-zero, the application has already printed the prompt (rl_prompt)
   before calling readline, so readline should not output it the first time
   redisplay is done.  }
    rl_already_prompted : longint;cvar;external;
{ A non-zero value means to read only this many characters rather than
   up to a character bound to accept-line.  }
    rl_num_chars_to_read : longint;cvar;external;
{ The text of a currently-executing keyboard macro.  }
    rl_executing_macro : Pchar;cvar;external;
{ Variables to control readline signal handling.  }
{ If non-zero, readline will install its own signal handlers for
   SIGINT, SIGTERM, SIGQUIT, SIGALRM, SIGTSTP, SIGTTIN, and SIGTTOU.  }
    rl_catch_signals : longint;cvar;external;
{ If non-zero, readline will install a signal handler for SIGWINCH
   that also attempts to call any calling application's SIGWINCH signal
   handler.  Note that the terminal is not cleaned up before the
   application's signal handler is called; use rl_cleanup_after_signal()
   to do that.  }
    rl_catch_sigwinch : longint;cvar;external;
{ If non-zero, the readline SIGWINCH handler will modify LINES and
   COLUMNS in the environment.  }
    rl_change_environment : longint;cvar;external;
{ Completion variables.  }
{ Pointer to the generator function for completion_matches ().
   NULL means to use rl_filename_completion_function (), the default
   filename completer.  }
    rl_completion_entry_function : Prl_compentry_func_t;cvar;external;
{ Optional generator for menu completion.  Default is
   rl_completion_entry_function (rl_filename_completion_function).  }
    rl_menu_completion_entry_function : Prl_compentry_func_t;cvar;external;
{ If rl_ignore_some_completions_function is non-NULL it is the address
   of a function to call after all of the possible matches have been
   generated, but before the actual completion is done to the input line.
   The function is called with one argument; a NULL terminated array
   of (char *).  If your function removes any of the elements, they
   must be free()'ed.  }
    rl_ignore_some_completions_function : Prl_compignore_func_t;cvar;external;
{ Pointer to alternative function to create matches.
   Function is called with TEXT, START, and END.
   START and END are indices in RL_LINE_BUFFER saying what the boundaries
   of TEXT are.
   If this function exists and returns NULL then call the value of
   rl_completion_entry_function to try to match, otherwise use the
   array of strings returned.  }
    rl_attempted_completion_function : Prl_completion_func_t;cvar;external;
{ The basic list of characters that signal a break between words for the
   completer routine.  The initial contents of this variable is what
   breaks words in the shell, i.e. "n\"\\'`@$>".  }
(* Const before type ignored *)
    rl_basic_word_break_characters : Pchar;cvar;external;
{ The list of characters that signal a break between words for
   rl_complete_internal.  The default list is the contents of
   rl_basic_word_break_characters.   }
(* Const before type ignored *)
    rl_completer_word_break_characters : Pchar;cvar;external;
{ Hook function to allow an application to set the completion word
   break characters before readline breaks up the line.  Allows
   position-dependent word break characters.  }
    rl_completion_word_break_hook : Prl_cpvfunc_t;cvar;external;
{ List of characters which can be used to quote a substring of the line.
   Completion occurs on the entire substring, and within the substring   
   rl_completer_word_break_characters are treated as any other character,
   unless they also appear within this list.  }
(* Const before type ignored *)
    rl_completer_quote_characters : Pchar;cvar;external;
{ List of quote characters which cause a word break.  }
(* Const before type ignored *)
    rl_basic_quote_characters : Pchar;cvar;external;
{ List of characters that need to be quoted in filenames by the completer.  }
(* Const before type ignored *)
    rl_filename_quote_characters : Pchar;cvar;external;
{ List of characters that are word break characters, but should be left
   in TEXT when it is passed to the completion function.  The shell uses
   this to help determine what kind of completing to do.  }
(* Const before type ignored *)
    rl_special_prefixes : Pchar;cvar;external;
{ If non-zero, then this is the address of a function to call when
   completing on a directory name.  The function is called with
   the address of a string (the current directory name) as an arg.  It
   changes what is displayed when the possible completions are printed
   or inserted.  The directory completion hook should perform
   any necessary dequoting.  This function should return 1 if it modifies
   the directory name pointer passed as an argument.  If the directory
   completion hook returns 0, it should not modify the directory name
   pointer passed as an argument.  }
    rl_directory_completion_hook : Prl_icppfunc_t;cvar;external;
{ If non-zero, this is the address of a function to call when completing
   a directory name.  This function takes the address of the directory name
   to be modified as an argument.  Unlike rl_directory_completion_hook, it
   only modifies the directory name used in opendir(2), not what is displayed
   when the possible completions are printed or inserted.  If set, it takes
   precedence over rl_directory_completion_hook.  The directory rewrite
   hook should perform any necessary dequoting.  This function has the same
   return value properties as the directory_completion_hook.

   I'm not happy with how this works yet, so it's undocumented.  I'm trying
   it in bash to see how well it goes.  }
    rl_directory_rewrite_hook : Prl_icppfunc_t;cvar;external;
{ If non-zero, this is the address of a function for the completer to call
   before deciding which character to append to a completed name.  It should
   modify the directory name passed as an argument if appropriate, and return
   non-zero if it modifies the name.  This should not worry about dequoting
   the filename; that has already happened by the time it gets here.  }
    rl_filename_stat_hook : Prl_icppfunc_t;cvar;external;
{ If non-zero, this is the address of a function to call when reading
   directory entries from the filesystem for completion and comparing
   them to the partial word to be completed.  The function should
   either return its first argument (if no conversion takes place) or
   newly-allocated memory.  This can, for instance, convert filenames
   between character sets for comparison against what's typed at the
   keyboard.  The returned value is what is added to the list of
   matches.  The second argument is the length of the filename to be
   converted.  }
    rl_filename_rewrite_hook : Prl_dequote_func_t;cvar;external;
{ Backwards compatibility with previous versions of readline.  }

const
  rl_symbolic_link_hook = rl_directory_completion_hook;  
{ If non-zero, then this is the address of a function to call when
   completing a word would normally display the list of possible matches.
   This function is called instead of actually doing the display.
   It takes three arguments: (char **matches, int num_matches, int max_length)
   where MATCHES is the array of strings that matched, NUM_MATCHES is the
   number of strings in that array, and MAX_LENGTH is the length of the
   longest string in that array.  }
  var
    rl_completion_display_matches_hook : Prl_compdisp_func_t;cvar;external;
{ Non-zero means that the results of the matches are to be treated
   as filenames.  This is ALWAYS zero on entry, and can only be changed
   within a completion entry finder function.  }
    rl_filename_completion_desired : longint;cvar;external;
{ Non-zero means that the results of the matches are to be quoted using
   double quotes (or an application-specific quoting mechanism) if the
   filename contains any characters in rl_word_break_chars.  This is
   ALWAYS non-zero on entry, and can only be changed within a completion
   entry finder function.  }
    rl_filename_quoting_desired : longint;cvar;external;
{ Set to a function to quote a filename in an application-specific fashion.
   Called with the text to quote, the type of match found (single or multiple)
   and a pointer to the quoting character to be used, which the function can
   reset if desired.  }
    rl_filename_quoting_function : Prl_quote_func_t;cvar;external;
{ Function to call to remove quoting characters from a filename.  Called
   before completion is attempted, so the embedded quotes do not interfere
   with matching names in the file system.  }
    rl_filename_dequoting_function : Prl_dequote_func_t;cvar;external;
{ Function to call to decide whether or not a word break character is
   quoted.  If a character is quoted, it does not break words for the
   completer.  }
    rl_char_is_quoted_p : Prl_linebuf_func_t;cvar;external;
{ Non-zero means to suppress normal filename completion after the
   user-specified completion function has been called.  }
    rl_attempted_completion_over : longint;cvar;external;
{ Set to a character describing the type of completion being attempted by
   rl_complete_internal; available for use by application completion
   functions.  }
    rl_completion_type : longint;cvar;external;
{ Set to the last key used to invoke one of the completion functions  }
    rl_completion_invoking_key : longint;cvar;external;
{ Up to this many items will be displayed in response to a
   possible-completions call.  After that, we ask the user if she
   is sure she wants to see them all.  The default value is 100.  }
    rl_completion_query_items : longint;cvar;external;
{ Character appended to completed words when at the end of the line.  The
   default is a space.  Nothing is added if this is '\0'.  }
    rl_completion_append_character : longint;cvar;external;
{ If set to non-zero by an application completion function,
   rl_completion_append_character will not be appended.  }
    rl_completion_suppress_append : longint;cvar;external;
{ Set to any quote character readline thinks it finds before any application
   completion function is called.  }
    rl_completion_quote_character : longint;cvar;external;
{ Set to a non-zero value if readline found quoting anywhere in the word to
   be completed; set before any application completion function is called.  }
    rl_completion_found_quote : longint;cvar;external;
{ If non-zero, the completion functions don't append any closing quote.
   This is set to 0 by rl_complete_internal and may be changed by an
   application-specific completion function.  }
    rl_completion_suppress_quote : longint;cvar;external;
{ If non-zero, readline will sort the completion matches.  On by default.  }
    rl_sort_completion_matches : longint;cvar;external;
{ If non-zero, a slash will be appended to completed filenames that are
   symbolic links to directory names, subject to the value of the
   mark-directories variable (which is user-settable).  This exists so
   that application completion functions can override the user's preference
   (set via the mark-symlinked-directories variable) if appropriate.
   It's set to the value of _rl_complete_mark_symlink_dirs in
   rl_complete_internal before any application-specific completion
   function is called, so without that function doing anything, the user's
   preferences are honored.  }
    rl_completion_mark_symlink_dirs : longint;cvar;external;
{ If non-zero, then disallow duplicates in the matches.  }
    rl_ignore_completion_duplicates : longint;cvar;external;
{ If this is non-zero, completion is (temporarily) inhibited, and the
   completion character will be inserted as any other.  }
    rl_inhibit_completion : longint;cvar;external;
{ Applications can set this to non-zero to have readline's signal handlers
   installed during the entire duration of reading a complete line, as in
   readline-6.2.  This should be used with care, because it can result in
   readline receiving signals and not handling them until it's called again
   via rl_callback_read_char, thereby stealing them from the application.
   By default, signal handlers are only active while readline is active.  }    rl_persistent_signal_handlers : longint;cvar;external;
{ Input error; can be returned by (*rl_getc_function) if readline is reading
   a top-level command (RL_ISSTATE (RL_STATE_READCMD)).  }

const
  READERR = -(2);  
{ Definitions available for use by readline clients.  }
  RL_PROMPT_START_IGNORE = '\001';  
  RL_PROMPT_END_IGNORE = '\002';  
{ Possible values for do_replace argument to rl_filename_quoting_function,
   called by rl_complete_internal.  }
  NO_MATCH = 0;  
  SINGLE_MATCH = 1;  
  MULT_MATCH = 2;  
{ Possible state values for rl_readline_state  }
{ no state; before first call  }
  RL_STATE_NONE = $000000;  
{ initializing  }
  RL_STATE_INITIALIZING = $0000001;  
{ initialization done  }
  RL_STATE_INITIALIZED = $0000002;  
{ terminal is prepped  }
  RL_STATE_TERMPREPPED = $0000004;  
{ reading a command key  }
  RL_STATE_READCMD = $0000008;  
{ reading input after ESC  }
  RL_STATE_METANEXT = $0000010;  
{ dispatching to a command  }
  RL_STATE_DISPATCHING = $0000020;  
{ reading more input in a command function  }
  RL_STATE_MOREINPUT = $0000040;  
{ doing incremental search  }
  RL_STATE_ISEARCH = $0000080;  
{ doing non-inc search  }
  RL_STATE_NSEARCH = $0000100;  
{ doing a history search  }
  RL_STATE_SEARCH = $0000200;  
{ reading numeric argument  }
  RL_STATE_NUMERICARG = $0000400;  
{ getting input from a macro  }
  RL_STATE_MACROINPUT = $0000800;  
{ defining keyboard macro  }
  RL_STATE_MACRODEF = $0001000;  
{ overwrite mode  }
  RL_STATE_OVERWRITE = $0002000;  
{ doing completion  }
  RL_STATE_COMPLETING = $0004000;  
{ in readline sighandler  }
  RL_STATE_SIGHANDLER = $0008000;  
{ doing an undo  }
  RL_STATE_UNDOING = $0010000;  
{ rl_execute_next called  }
  RL_STATE_INPUTPENDING = $0020000;  
{ tty special chars saved  }
  RL_STATE_TTYCSAVED = $0040000;  
{ using the callback interface  }
  RL_STATE_CALLBACK = $0080000;  
{ reading vi motion arg  }
  RL_STATE_VIMOTION = $0100000;  
{ reading multiple-key command  }
  RL_STATE_MULTIKEY = $0200000;  
{ entered vi command mode at least once  }
  RL_STATE_VICMDONCE = $0400000;  
{ vi mode char search  }
  RL_STATE_CHARSEARCH = $0800000;  
{ updating terminal display  }
  RL_STATE_REDISPLAYING = $1000000;  
{ done; accepted line  }
  RL_STATE_DONE = $2000000;  
{ done; timed out  }
  RL_STATE_TIMEOUT = $4000000;  
{ done; got eof on read  }
  RL_STATE_EOF = $8000000;  
{ xxxxxxxxxxxxxxxxxxxxxxx  #define RL_SETSTATE(x)		(rl_readline_state |= (x)) }
{ xxxxxxxxxxxxxxxxxxxxxxx  #define RL_UNSETSTATE(x)	(rl_readline_state &= ~(x)) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function RL_ISSTATE(x : longint) : longint;

{ line state  }
{ global state  }
{ input state  }
{ signal state  }
{ search state  }
{ completion state  }
(* Const before type ignored *)
{ options state  }
{ hook state  }
{ reserved for future expansion, so the struct size doesn't change  }
type
  Preadline_state = ^Treadline_state;
  Treadline_state = record
      point : longint;
      end : longint;
      mark : longint;
      buflen : longint;
      buffer : Pchar;
      ul : PUNDO_LIST;
      prompt : Pchar;
      rlstate : longint;
      done : longint;
      kmap : TKeymap;
      lastfunc : Prl_command_func_t;
      insmode : longint;
      edmode : longint;
      kseq : Pchar;
      kseqlen : longint;
      pendingin : longint;
      inf : PFILE;
      outf : PFILE;
      macro : Pchar;
      catchsigs : longint;
      catchsigwinch : longint;
      entryfunc : Prl_compentry_func_t;
      menuentryfunc : Prl_compentry_func_t;
      ignorefunc : Prl_compignore_func_t;
      attemptfunc : Prl_completion_func_t;
      wordbreakchars : Pchar;
      reserved : array[0..63] of char;
    end;


function rl_save_state(para1:Preadline_state):longint;cdecl;external;
function rl_restore_state(para1:Preadline_state):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ _READLINE_H_  }

implementation

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function rl_clear_timeout : longint;
begin
  rl_clear_timeout:=rl_set_timeout(0,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RL_ISSTATE(x : longint) : longint;
begin
  RL_ISSTATE:=rl_readline_state and x;
end;


end.

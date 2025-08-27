
unit history;
interface

{
  Automatically converted by H2Pas 1.0.0 from history.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    history.h
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
Phist_entry  = ^hist_entry;
Phist_state  = ^hist_state;
Phistdata_t  = ^histdata_t;
PHISTORY_STATE  = ^HISTORY_STATE;
Plongint  = ^longint;
Prl_linebuf_func_t  = ^rl_linebuf_func_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ history.h -- the names of functions that you can call in history.  }
{ Copyright (C) 1989-2022 Free Software Foundation, Inc.

   This file contains the GNU History Library (History), a set of
   routines for managing the text of previously typed lines.

   History is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   History is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with History.  If not, see <http://www.gnu.org/licenses/>.
 }
{$ifndef _HISTORY_H_}
{$define _HISTORY_H_}
{ C++ extern C conditionnal removed }
{$include <time.h>		/* XXX - for history timestamp code */}
{$if defined READLINE_LIBRARY}
{$include "rlstdc.h"}
{$include "rltypedefs.h"}
{$else}
{$include <stdio.h>}
{$include <readline/rlstdc.h>}
{$include <readline/rltypedefs.h>}
{$endif}
{$ifdef __STDC__}
type
  Phistdata_t = ^Thistdata_t;
  Thistdata_t = pointer;
{$else}
type
  Phistdata_t = ^Thistdata_t;
  Thistdata_t = Pchar;
{$endif}
{ Let's not step on anyone else's define for now, since we don't use this yet.  }
{$ifndef HS_HISTORY_VERSION}
{ History 8.2  }

const
  HS_HISTORY_VERSION = $0802;  
{$endif}
{ The structure used to store a history entry.  }
{ char * rather than time_t for read/write  }
type
  Phist_entry = ^Thist_entry;
  Thist_entry = record
      line : Pchar;
      timestamp : Pchar;
      data : Thistdata_t;
    end;
{ Size of the history-library-managed space in history entry HS.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function HISTENT_BYTES(hs : longint) : longint;

{ A structure used to pass the current state of the history stuff around.  }
{ Pointer to the entries themselves.  }
{ The location pointer within this array.  }
{ Number of elements within this array.  }
{ Number of slots allocated to this array.  }
type
  Phist_state = ^Thist_state;
  Thist_state = record
      entries : ^PHIST_ENTRY;
      offset : longint;
      length : longint;
      size : longint;
      flags : longint;
    end;
  THISTORY_STATE = Thist_state;
  PHISTORY_STATE = ^THISTORY_STATE;
{ Flag values for the `flags' member of HISTORY_STATE.  }

const
  HS_STIFLED = $01;  
{ Initialization and state management.  }
{ Begin a session in which the history functions might be used.  This
   just initializes the interactive variables.  }

procedure using_history;cdecl;external;
{ Return the current HISTORY_STATE of the history.  }
function history_get_history_state:PHISTORY_STATE;cdecl;external;
{ Set the state of the current history array to STATE.  }
procedure history_set_history_state(para1:PHISTORY_STATE);cdecl;external;
{ Manage the history list.  }
{ Place STRING at the end of the history list.
   The associated data field (if any) is set to NULL.  }
(* Const before type ignored *)
procedure add_history(para1:Pchar);cdecl;external;
{ Change the timestamp associated with the most recent history entry to
   STRING.  }
(* Const before type ignored *)
procedure add_history_time(para1:Pchar);cdecl;external;
{ Remove an entry from the history list.  WHICH is the magic number that
   tells us which element to delete.  The elements are numbered from 0.  }
function remove_history(para1:longint):PHIST_ENTRY;cdecl;external;
{ Remove a set of entries from the history list: FIRST to LAST, inclusive  }
function remove_history_range(para1:longint; para2:longint):^PHIST_ENTRY;cdecl;external;
{ Allocate a history entry consisting of STRING and TIMESTAMP and return
   a pointer to it.  }
function alloc_history_entry(para1:Pchar; para2:Pchar):PHIST_ENTRY;cdecl;external;
{ Copy the history entry H, but not the (opaque) data pointer  }
function copy_history_entry(para1:PHIST_ENTRY):PHIST_ENTRY;cdecl;external;
{ Free the history entry H and return any application-specific data
   associated with it.  }
function free_history_entry(para1:PHIST_ENTRY):Thistdata_t;cdecl;external;
{ Make the history entry at WHICH have LINE and DATA.  This returns
   the old entry so you can dispose of the data.  In the case of an
   invalid WHICH, a NULL pointer is returned.  }
(* Const before type ignored *)
function replace_history_entry(para1:longint; para2:Pchar; para3:Thistdata_t):PHIST_ENTRY;cdecl;external;
{ Clear the history list and start over.  }
procedure clear_history;cdecl;external;
{ Stifle the history list, remembering only MAX number of entries.  }
procedure stifle_history(para1:longint);cdecl;external;
{ Stop stifling the history.  This returns the previous amount the
   history was stifled by.  The value is positive if the history was
   stifled, negative if it wasn't.  }
function unstifle_history:longint;cdecl;external;
{ Return 1 if the history is stifled, 0 if it is not.  }
function history_is_stifled:longint;cdecl;external;
{ Information about the history list.  }
{ Return a NULL terminated array of HIST_ENTRY which is the current input
   history.  Element 0 of this list is the beginning of time.  If there
   is no history, return NULL.  }
function history_list:^PHIST_ENTRY;cdecl;external;
{ Returns the number which says what history element we are now
   looking at.   }
function where_history:longint;cdecl;external;
{ Return the history entry at the current position, as determined by
   history_offset.  If there is no entry there, return a NULL pointer.  }
function current_history:PHIST_ENTRY;cdecl;external;
{ Return the history entry which is logically at OFFSET in the history
   array.  OFFSET is relative to history_base.  }
function history_get(para1:longint):PHIST_ENTRY;cdecl;external;
{ Return the timestamp associated with the HIST_ENTRY * passed as an
   argument  }
function history_get_time(para1:PHIST_ENTRY):Ttime_t;cdecl;external;
{ Return the number of bytes that the primary history entries are using.
   This just adds up the lengths of the_history->lines.  }
function history_total_bytes:longint;cdecl;external;
{ Moving around the history list.  }
{ Set the position in the history list to POS.  }
function history_set_pos(para1:longint):longint;cdecl;external;
{ Back up history_offset to the previous history entry, and return
   a pointer to that entry.  If there is no previous entry, return
   a NULL pointer.  }
function previous_history:PHIST_ENTRY;cdecl;external;
{ Move history_offset forward to the next item in the input_history,
   and return the a pointer to that entry.  If there is no next entry,
   return a NULL pointer.  }
function next_history:PHIST_ENTRY;cdecl;external;
{ Searching the history list.  }
{ Search the history for STRING, starting at history_offset.
   If DIRECTION < 0, then the search is through previous entries,
   else through subsequent.  If the string is found, then
   current_history () is the history entry, and the value of this function
   is the offset in the line of that history entry that the string was
   found in.  Otherwise, nothing is changed, and a -1 is returned.  }
(* Const before type ignored *)
function history_search(para1:Pchar; para2:longint):longint;cdecl;external;
{ Search the history for STRING, starting at history_offset.
   The search is anchored: matching lines must begin with string.
   DIRECTION is as in history_search().  }
(* Const before type ignored *)
function history_search_prefix(para1:Pchar; para2:longint):longint;cdecl;external;
{ Search for STRING in the history list, starting at POS, an
   absolute index into the list.  DIR, if negative, says to search
   backwards from POS, else forwards.
   Returns the absolute index of the history element where STRING
   was found, or -1 otherwise.  }
(* Const before type ignored *)
function history_search_pos(para1:Pchar; para2:longint; para3:longint):longint;cdecl;external;
{ Managing the history file.  }
{ Add the contents of FILENAME to the history list, a line at a time.
   If FILENAME is NULL, then read from ~/.history.  Returns 0 if
   successful, or errno if not.  }
(* Const before type ignored *)
function read_history(para1:Pchar):longint;cdecl;external;
{ Read a range of lines from FILENAME, adding them to the history list.
   Start reading at the FROM'th line and end at the TO'th.  If FROM
   is zero, start at the beginning.  If TO is less than FROM, read
   until the end of the file.  If FILENAME is NULL, then read from
   ~/.history.  Returns 0 if successful, or errno if not.  }
(* Const before type ignored *)
function read_history_range(para1:Pchar; para2:longint; para3:longint):longint;cdecl;external;
{ Write the current history to FILENAME.  If FILENAME is NULL,
   then write the history list to ~/.history.  Values returned
   are as in read_history ().   }
(* Const before type ignored *)
function write_history(para1:Pchar):longint;cdecl;external;
{ Append NELEMENT entries to FILENAME.  The entries appended are from
   the end of the list minus NELEMENTs up to the end of the list.  }
(* Const before type ignored *)
function append_history(para1:longint; para2:Pchar):longint;cdecl;external;
{ Truncate the history file, leaving only the last NLINES lines.  }
(* Const before type ignored *)
function history_truncate_file(para1:Pchar; para2:longint):longint;cdecl;external;
{ History expansion.  }
{ Expand the string STRING, placing the result into OUTPUT, a pointer
   to a string.  Returns:

   0) If no expansions took place (or, if the only change in
      the text was the de-slashifying of the history expansion
      character)
   1) If expansions did take place
  -1) If there was an error in expansion.
   2) If the returned line should just be printed.

  If an error occurred in expansion, then OUTPUT contains a descriptive
  error message.  }
function history_expand(para1:Pchar; para2:PPchar):longint;cdecl;external;
{ Extract a string segment consisting of the FIRST through LAST
   arguments present in STRING.  Arguments are broken up as in
   the shell.  }
(* Const before type ignored *)
function history_arg_extract(para1:longint; para2:longint; para3:Pchar):Pchar;cdecl;external;
{ Return the text of the history event beginning at the current
   offset into STRING.  Pass STRING with *INDEX equal to the
   history_expansion_char that begins this specification.
   DELIMITING_QUOTE is a character that is allowed to end the string
   specification for what to search for in addition to the normal
   characters `:', ` ', `\t', `\n', and sometimes `?'.  }
(* Const before type ignored *)
function get_history_event(para1:Pchar; para2:Plongint; para3:longint):Pchar;cdecl;external;
{ Return an array of tokens, much as the shell might.  The tokens are
   parsed out of STRING.  }
(* Const before type ignored *)
function history_tokenize(para1:Pchar):^Pchar;cdecl;external;
{ Exported history variables.  }
  var
    history_base : longint;cvar;external;
    history_length : longint;cvar;external;
    history_max_entries : longint;cvar;external;
    history_offset : longint;cvar;external;
    history_lines_read_from_file : longint;cvar;external;
    history_lines_written_to_file : longint;cvar;external;
    history_expansion_char : char;cvar;external;
    history_subst_char : char;cvar;external;
    history_word_delimiters : Pchar;cvar;external;
    history_comment_char : char;cvar;external;
    history_no_expand_chars : Pchar;cvar;external;
    history_search_delimiter_chars : Pchar;cvar;external;
    history_quotes_inhibit_expansion : longint;cvar;external;
    history_quoting_state : longint;cvar;external;
    history_write_timestamps : longint;cvar;external;
{ These two are undocumented; the second is reserved for future use  }
    history_multiline_entries : longint;cvar;external;
    history_file_version : longint;cvar;external;
{ Backwards compatibility  }
    max_input_history : longint;cvar;external;
{ If set, this function is called to decide whether or not a particular
   history expansion should be treated as a special case for the calling
   application and not expanded.  }
    history_inhibit_expansion_function : Prl_linebuf_func_t;cvar;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ !_HISTORY_H_  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HISTENT_BYTES(hs : longint) : longint;
begin
  HISTENT_BYTES:=(strlen(hs^.line))+(strlen(hs^.timestamp));
end;


end.

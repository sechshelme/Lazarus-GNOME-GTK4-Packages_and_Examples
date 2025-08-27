
unit keymaps;
interface

{
  Automatically converted by H2Pas 1.0.0 from keymaps.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    keymaps.h
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
PKeymap  = ^Keymap;
Pkeymap_entry  = ^keymap_entry;
PKEYMAP_ENTRY_ARRAY  = ^KEYMAP_ENTRY_ARRAY;
Prl_command_func_t  = ^rl_command_func_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ keymaps.h -- Manipulation of readline keymaps.  }
{ Copyright (C) 1987, 1989, 1992-2021 Free Software Foundation, Inc.

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
{$ifndef _KEYMAPS_H_}
{$define _KEYMAPS_H_}
{ C++ extern C conditionnal removed }
{$if defined (READLINE_LIBRARY)}
{$include "rlstdc.h"}
{$include "chardefs.h"}
{$include "rltypedefs.h"}
{$else}
{$include <readline/rlstdc.h>}
{$include <readline/chardefs.h>}
{$include <readline/rltypedefs.h>}
{$endif}
{ A keymap contains one entry for each key in the ASCII set.
   Each entry consists of a type and a pointer.
   FUNCTION is the address of a function to run, or the
   address of a keymap to indirect through.
   TYPE says which kind of thing FUNCTION is.  }
type
  Pkeymap_entry = ^Tkeymap_entry;
  Tkeymap_entry = record
      _type : char;
      _function : Prl_command_func_t;
    end;
{ This must be large enough to hold bindings for all of the characters
   in a desired character set (e.g, 128 for ASCII, 256 for ISO Latin-x,
   and so on) plus one for subsequence matching.  }

const
  KEYMAP_SIZE = 257;  
  ANYOTHERKEY = KEYMAP_SIZE-1;  
type
  PKEYMAP_ENTRY_ARRAY = ^TKEYMAP_ENTRY_ARRAY;
  TKEYMAP_ENTRY_ARRAY = array[0..(KEYMAP_SIZE)-1] of TKEYMAP_ENTRY;

  PKeymap = ^TKeymap;
  TKeymap = PKEYMAP_ENTRY;
{ The values that TYPE can have in a keymap entry.  }

const
  ISFUNC = 0;  
  ISKMAP = 1;  
  ISMACR = 2;  
  var
    emacs_standard_keymap : TKEYMAP_ENTRY_ARRAY;cvar;external;
    vi_insertion_keymap : TKEYMAP_ENTRY_ARRAY;cvar;external;
{ Return a new, empty keymap.
   Free it with free() when you are done.  }

function rl_make_bare_keymap:TKeymap;cdecl;external;
{ Return a new keymap which is a copy of MAP.  }
function rl_copy_keymap(para1:TKeymap):TKeymap;cdecl;external;
{ Return a new keymap with the printing characters bound to rl_insert,
   the lowercase Meta characters bound to run their equivalents, and
   the Meta digits bound to produce numeric arguments.  }
function rl_make_keymap:TKeymap;cdecl;external;
{ Free the storage associated with a keymap.  }
procedure rl_discard_keymap(para1:TKeymap);cdecl;external;
{ These functions actually appear in bind.c  }
{ Return the keymap corresponding to a given name.  Names look like
   `emacs' or `emacs-meta' or `vi-insert'.   }
(* Const before type ignored *)
function rl_get_keymap_by_name(para1:Pchar):TKeymap;cdecl;external;
{ Return the current keymap.  }
function rl_get_keymap:TKeymap;cdecl;external;
{ Set the current keymap to MAP.  }
procedure rl_set_keymap(para1:TKeymap);cdecl;external;
{ Set the name of MAP to NAME  }
(* Const before type ignored *)
function rl_set_keymap_name(para1:Pchar; para2:TKeymap):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ _KEYMAPS_H_  }

implementation


end.

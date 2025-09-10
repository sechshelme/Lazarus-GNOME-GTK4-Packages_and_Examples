
unit list;
interface

{
  Automatically converted by H2Pas 1.0.0 from list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    list.h
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
PTCOD_List  = ^TCOD_List;
PTCOD_list_t  = ^TCOD_list_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ BSD 3-Clause License
 *
 * Copyright © 2008-2021, Jice and the libtcod contributors.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
  }
{$ifndef _TCOD_LIST_H}
{$define _TCOD_LIST_H}
{$include "portability.h"}
{ C++ extern C conditionnal removed }
type
  PTCOD_List = ^TTCOD_List;
  TTCOD_List = record
      {undefined structure}
    end;


  PTCOD_list_t = ^TTCOD_list_t;
  TTCOD_list_t = PTCOD_List;
{TCOD_DEPRECATED("TCOD_List is not a suitable container.  Use a custom array or a C++ container instead.") }

function TCOD_list_new:TTCOD_list_t;cdecl;external;
function TCOD_list_allocate(nb_elements:longint):TTCOD_list_t;cdecl;external;
function TCOD_list_duplicate(l:TTCOD_list_t):TTCOD_list_t;cdecl;external;
procedure TCOD_list_delete(l:TTCOD_list_t);cdecl;external;
(* Const before type ignored *)
procedure TCOD_list_push(l:TTCOD_list_t; elt:pointer);cdecl;external;
function TCOD_list_pop(l:TTCOD_list_t):pointer;cdecl;external;
function TCOD_list_peek(l:TTCOD_list_t):pointer;cdecl;external;
procedure TCOD_list_add_all(l:TTCOD_list_t; l2:TTCOD_list_t);cdecl;external;
function TCOD_list_get(l:TTCOD_list_t; idx:longint):pointer;cdecl;external;
(* Const before type ignored *)
procedure TCOD_list_set(l:TTCOD_list_t; elt:pointer; idx:longint);cdecl;external;
function TCOD_list_begin(l:TTCOD_list_t):^pointer;cdecl;external;
function TCOD_list_end(l:TTCOD_list_t):^pointer;cdecl;external;
procedure TCOD_list_reverse(l:TTCOD_list_t);cdecl;external;
function TCOD_list_remove_iterator(l:TTCOD_list_t; elt:Ppointer):^pointer;cdecl;external;
(* Const before type ignored *)
procedure TCOD_list_remove(l:TTCOD_list_t; elt:pointer);cdecl;external;
function TCOD_list_remove_iterator_fast(l:TTCOD_list_t; elt:Ppointer):^pointer;cdecl;external;
(* Const before type ignored *)
procedure TCOD_list_remove_fast(l:TTCOD_list_t; elt:pointer);cdecl;external;
(* Const before type ignored *)
function TCOD_list_contains(l:TTCOD_list_t; elt:pointer):Tbool;cdecl;external;
procedure TCOD_list_clear(l:TTCOD_list_t);cdecl;external;
procedure TCOD_list_clear_and_delete(l:TTCOD_list_t);cdecl;external;
function TCOD_list_size(l:TTCOD_list_t):longint;cdecl;external;
(* Const before type ignored *)
function TCOD_list_insert_before(l:TTCOD_list_t; elt:pointer; before:longint):^pointer;cdecl;external;
function TCOD_list_is_empty(l:TTCOD_list_t):Tbool;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.

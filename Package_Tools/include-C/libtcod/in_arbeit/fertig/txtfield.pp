
unit txtfield;
interface

{
  Automatically converted by H2Pas 1.0.0 from txtfield.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    txtfield.h
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
PTCOD_Text  = ^TCOD_Text;
PTCOD_text_t  = ^TCOD_text_t;
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
{$ifndef _TCOD_TEXT_H_}
{$define _TCOD_TEXT_H_}
{$include "color.h"}
{$include "console_types.h"}
{$include "portability.h"}
{ C++ extern C conditionnal removed }
type
  PTCOD_Text = ^TTCOD_Text;
  TTCOD_Text = record
      {undefined structure}
    end;


  PTCOD_text_t = ^TTCOD_text_t;
  TTCOD_text_t = PTCOD_Text;

function TCOD_text_init(x:longint; y:longint; w:longint; h:longint; max_chars:longint):TTCOD_text_t;cdecl;external;
function TCOD_text_init2(w:longint; h:longint; max_chars:longint):TTCOD_text_t;cdecl;external;
procedure TCOD_text_set_pos(txt:TTCOD_text_t; x:longint; y:longint);cdecl;external;
(* Const before type ignored *)
procedure TCOD_text_set_properties(txt:TTCOD_text_t; cursor_char:longint; blink_interval:longint; prompt:Pchar; tab_size:longint);cdecl;external;
procedure TCOD_text_set_colors(txt:TTCOD_text_t; fore:TTCOD_color_t; back:TTCOD_color_t; back_transparency:single);cdecl;external;
function TCOD_text_update(txt:TTCOD_text_t; key:TTCOD_key_t):Tbool;cdecl;external;
procedure TCOD_text_render(txt:TTCOD_text_t; con:TTCOD_console_t);cdecl;external;
(* Const before type ignored *)
function TCOD_text_get(txt:TTCOD_text_t):Pchar;cdecl;external;
procedure TCOD_text_reset(txt:TTCOD_text_t);cdecl;external;
procedure TCOD_text_delete(txt:TTCOD_text_t);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ _TCOD_TEXT_H_  }

implementation


end.

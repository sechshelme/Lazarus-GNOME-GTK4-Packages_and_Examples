
unit bsp;
interface

{
  Automatically converted by H2Pas 1.0.0 from bsp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bsp.h
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
PTCOD_bsp_t  = ^TCOD_bsp_t;
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
{$ifndef _TCOD_BSP_H}
{$define _TCOD_BSP_H}
{$include "mersenne_types.h"}
{$include "portability.h"}
{$include "tree.h"}
{ C++ extern C conditionnal removed }
{ pseudo oop : bsp inherit tree  }
{ node position & size  }
{ position of splitting  }
{ level in the tree  }
{ horizontal splitting ?  }
type
  PTCOD_bsp_t = ^TTCOD_bsp_t;
  TTCOD_bsp_t = record
      tree : TTCOD_tree_t;
      x : longint;
      y : longint;
      w : longint;
      h : longint;
      position : longint;
      level : Tuint8_t;
      horizontal : Tbool;
    end;

  TTCOD_bsp_callback_t = function (node:PTCOD_bsp_t; userData:pointer):Tbool;cdecl;

function TCOD_bsp_new:PTCOD_bsp_t;cdecl;external;
function TCOD_bsp_new_with_size(x:longint; y:longint; w:longint; h:longint):PTCOD_bsp_t;cdecl;external;
procedure TCOD_bsp_delete(node:PTCOD_bsp_t);cdecl;external;
function TCOD_bsp_left(node:PTCOD_bsp_t):PTCOD_bsp_t;cdecl;external;
function TCOD_bsp_right(node:PTCOD_bsp_t):PTCOD_bsp_t;cdecl;external;
function TCOD_bsp_father(node:PTCOD_bsp_t):PTCOD_bsp_t;cdecl;external;
function TCOD_bsp_is_leaf(node:PTCOD_bsp_t):Tbool;cdecl;external;
function TCOD_bsp_traverse_pre_order(node:PTCOD_bsp_t; listener:TTCOD_bsp_callback_t; userData:pointer):Tbool;cdecl;external;
function TCOD_bsp_traverse_in_order(node:PTCOD_bsp_t; listener:TTCOD_bsp_callback_t; userData:pointer):Tbool;cdecl;external;
function TCOD_bsp_traverse_post_order(node:PTCOD_bsp_t; listener:TTCOD_bsp_callback_t; userData:pointer):Tbool;cdecl;external;
function TCOD_bsp_traverse_level_order(node:PTCOD_bsp_t; listener:TTCOD_bsp_callback_t; userData:pointer):Tbool;cdecl;external;
function TCOD_bsp_traverse_inverted_level_order(node:PTCOD_bsp_t; listener:TTCOD_bsp_callback_t; userData:pointer):Tbool;cdecl;external;
function TCOD_bsp_contains(node:PTCOD_bsp_t; x:longint; y:longint):Tbool;cdecl;external;
function TCOD_bsp_find_node(node:PTCOD_bsp_t; x:longint; y:longint):PTCOD_bsp_t;cdecl;external;
procedure TCOD_bsp_resize(node:PTCOD_bsp_t; x:longint; y:longint; w:longint; h:longint);cdecl;external;
procedure TCOD_bsp_split_once(node:PTCOD_bsp_t; horizontal:Tbool; position:longint);cdecl;external;
procedure TCOD_bsp_split_recursive(node:PTCOD_bsp_t; randomizer:TTCOD_random_t; nb:longint; minHSize:longint; minVSize:longint; 
            maxHRatio:single; maxVRatio:single);cdecl;external;
procedure TCOD_bsp_remove_sons(node:PTCOD_bsp_t);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.

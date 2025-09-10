
unit heapq;
interface

{
  Automatically converted by H2Pas 1.0.0 from heapq.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    heapq.h
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
Pbyte  = ^byte;
PTCOD_Heap  = ^TCOD_Heap;
PTCOD_HeapNode  = ^TCOD_HeapNode;
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
{$ifndef TCOD_HEAPQ_H}
{$define TCOD_HEAPQ_H}
{$include <stdbool.h>}
{$include <stddef.h>}
{$include "config.h"}

const
  TCOD_HEAP_DEFAULT_CAPACITY = 256;  
  TCOD_HEAP_MAX_NODE_SIZE = 256;  
{$ifdef _MSC_VER}
(** unsupported pragma#pragma warning(push)*)
(** unsupported pragma#pragma warning(disable : 4200)  // MSVC complains about standard C99.*)
{$endif}
{ _MSC_VER }
{$if !defined(__cplusplus)}
{$endif}
{ !defined(__cplusplus) }
type
  PTCOD_HeapNode = ^TTCOD_HeapNode;
  TTCOD_HeapNode = record
      priority : longint;
      data : Pbyte;
    end;

{$ifdef _MSC_VER}
(** unsupported pragma#pragma warning(pop)*)
{$endif}
{ _MSC_VER }
type
  PTCOD_Heap = ^TTCOD_Heap;
  TTCOD_Heap = record
      heap : PTCOD_HeapNode;
      size : longint;
      capacity : longint;
      node_size : Tsize_t;
      data_size : Tsize_t;
    end;

{ C++ extern C conditionnal removed }
{ __cplusplus }

function TCOD_heap_init(heap:PTCOD_Heap; data_size:Tsize_t):longint;cdecl;external;
procedure TCOD_heap_uninit(heap:PTCOD_Heap);cdecl;external;
procedure TCOD_heap_clear(heap:PTCOD_Heap);cdecl;external;
(* Const before type ignored *)
function TCOD_minheap_push(minheap:PTCOD_Heap; priority:longint; data:pointer):longint;cdecl;external;
procedure TCOD_minheap_pop(minheap:PTCOD_Heap; out:pointer);cdecl;external;
procedure TCOD_minheap_heapify(minheap:PTCOD_Heap);cdecl;external;
{ __cplusplus }
{$endif}
{ TCOD_HEAPQ_H }

implementation


end.

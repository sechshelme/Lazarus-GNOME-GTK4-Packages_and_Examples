
unit zmaxheap;
interface

{
  Automatically converted by H2Pas 1.0.0 from zmaxheap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    zmaxheap.h
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
Psingle  = ^single;
Pzmaxheap_iterator  = ^zmaxheap_iterator;
Pzmaxheap_iterator_t  = ^zmaxheap_iterator_t;
Pzmaxheap_t  = ^zmaxheap_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2013-2016, The Regents of The University of Michigan.
All rights reserved.
This software was developed in the APRIL Robotics Lab under the
direction of Edwin Olson, ebolson@umich.edu. This software may be
available under alternative licensing terms; contact the address above.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the Regents of The University of Michigan.
 }
(** unsupported pragma#pragma once*)
{$include <stdio.h>}
type
  Tzmaxheap = Tzmaxheap_t;
  Tzmaxheap_iterator = Tzmaxheap_iterator_t;
  Pzmaxheap_iterator = ^Tzmaxheap_iterator;
  Tzmaxheap_iterator = record
      heap : Pzmaxheap_t;
      in : longint;
      out : longint;
    end;


function zmaxheap_create(el_sz:Tsize_t):Pzmaxheap_t;cdecl;external;
procedure zmaxheap_vmap(heap:Pzmaxheap_t; f:procedure );cdecl;external;
procedure zmaxheap_destroy(heap:Pzmaxheap_t);cdecl;external;
procedure zmaxheap_add(heap:Pzmaxheap_t; p:pointer; v:single);cdecl;external;
function zmaxheap_size(heap:Pzmaxheap_t):longint;cdecl;external;
{ returns 0 if the heap is empty, so you can do }
{ while (zmaxheap_remove_max(...))   }
function zmaxheap_remove_max(heap:Pzmaxheap_t; p:pointer; v:Psingle):longint;cdecl;external;
{////////////////////////////////////////// }
{ This is a peculiar iterator intended to support very specific (and }
{ unusual) applications, and the heap is not necessarily in a valid }
{ state until zmaxheap_iterator_finish is called.  Consequently, do }
{ not call any other methods on the heap while iterating through. }
{ you must provide your own storage for the iterator, and pass in a }
{ pointer. }
procedure zmaxheap_iterator_init(heap:Pzmaxheap_t; it:Pzmaxheap_iterator_t);cdecl;external;
{ Traverses the heap in top-down/left-right order. makes a copy of }
{ the content into memory (p) that you provide. }
function zmaxheap_iterator_next(it:Pzmaxheap_iterator_t; p:pointer; v:Psingle):longint;cdecl;external;
{ will set p to be a pointer to the heap's internal copy of the dfata. }
function zmaxheap_iterator_next_volatile(it:Pzmaxheap_iterator_t; p:pointer; v:Psingle):longint;cdecl;external;
{ remove the current element. }
procedure zmaxheap_iterator_remove(it:Pzmaxheap_iterator_t);cdecl;external;
{ call after all iterator operations are done. After calling this, }
{ the iterator should no longer be used, but the heap methods can be. }
procedure zmaxheap_iterator_finish(it:Pzmaxheap_iterator_t);cdecl;external;

implementation


end.


unit workerpool;
interface

{
  Automatically converted by H2Pas 1.0.0 from workerpool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    workerpool.h
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
Pworkerpool_t  = ^workerpool_t;
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
{$include "zarray.h"}
type
  Tworkerpool = Tworkerpool_t;
{ as a special case, if nthreads==1, no additional threads are }
{ created, and workerpool_run will run synchronously. }

function workerpool_create(nthreads:longint):Pworkerpool_t;cdecl;external;
procedure workerpool_destroy(wp:Pworkerpool_t);cdecl;external;
procedure workerpool_add_task(wp:Pworkerpool_t; f:procedure (p:pointer); p:pointer);cdecl;external;
{ runs all added tasks, waits for them to complete. }
procedure workerpool_run(wp:Pworkerpool_t);cdecl;external;
{ same as workerpool_run, except always single threaded. (mostly for debugging). }
procedure workerpool_run_single(wp:Pworkerpool_t);cdecl;external;
function workerpool_get_nthreads(wp:Pworkerpool_t):longint;cdecl;external;
function workerpool_get_nprocs:longint;cdecl;external;

implementation


end.

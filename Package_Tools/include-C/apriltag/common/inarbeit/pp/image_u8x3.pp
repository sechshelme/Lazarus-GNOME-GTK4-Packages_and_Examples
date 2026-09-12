
unit image_u8x3;
interface

{
  Automatically converted by H2Pas 1.0.0 from image_u8x3.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    image_u8x3.h
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
Pimage_u8x3_t  = ^image_u8x3_t;
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
{$include <stdint.h>}
{$include "image_types.h"}
{ C++ extern C conditionnal removed }
{/////////////////////////////////// }
{ IMPORTANT NOTE ON BYTE ORDER }
{ }
{ Format conversion routines will (unless otherwise specified) assume }
{ R, G, B, ordering of bytes. This is consistent with GTK, PNM, etc. }
{ }
{/////////////////////////////////// }
{ Create or load an image. returns NULL on failure }

function image_u8x3_create(width:dword; height:dword):Pimage_u8x3_t;cdecl;external;
function image_u8x3_create_alignment(width:dword; height:dword; alignment:dword):Pimage_u8x3_t;cdecl;external;
(* Const before type ignored *)
function image_u8x3_create_from_pnm(path:Pchar):Pimage_u8x3_t;cdecl;external;
(* Const before type ignored *)
function image_u8x3_copy(in:Pimage_u8x3_t):Pimage_u8x3_t;cdecl;external;
procedure image_u8x3_gaussian_blur(im:Pimage_u8x3_t; sigma:Tdouble; ksz:longint);cdecl;external;
procedure image_u8x3_destroy(im:Pimage_u8x3_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function image_u8x3_write_pnm(im:Pimage_u8x3_t; path:Pchar):longint;cdecl;external;
{ only width 1 supported }
procedure image_u8x3_draw_line(im:Pimage_u8x3_t; x0:single; y0:single; x1:single; y1:single; 
            rgb:array[0..2] of Tuint8_t; width:longint);cdecl;external;
{ C++ end of extern C conditionnal removed }

implementation


end.

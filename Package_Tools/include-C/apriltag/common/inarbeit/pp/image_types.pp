
unit image_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from image_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    image_types.h
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
Pimage_f32  = ^image_f32;
Pimage_u32  = ^image_u32;
Pimage_u8  = ^image_u8;
Pimage_u8x3  = ^image_u8x3;
Pimage_u8x4  = ^image_u8x4;
Psingle  = ^single;
Puint32_t  = ^uint32_t;
Puint8_t  = ^uint8_t;
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
{ to support conversions between different types, we define all image }
{ types at once. Type-specific implementations can then #include this }
{ file, assured that the basic types of each image are known. }
type
  Timage_u8 = Timage_u8_t;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  Pimage_u8 = ^Timage_u8;
  Timage_u8 = record
      width : Tint32_t;
      height : Tint32_t;
      stride : Tint32_t;
      buf : Puint8_t;
    end;

  Timage_u8x3 = Timage_u8x3_t;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ bytes per line }
  Pimage_u8x3 = ^Timage_u8x3;
  Timage_u8x3 = record
      width : Tint32_t;
      height : Tint32_t;
      stride : Tint32_t;
      buf : Puint8_t;
    end;

  Timage_u8x4 = Timage_u8x4_t;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ bytes per line }
  Pimage_u8x4 = ^Timage_u8x4;
  Timage_u8x4 = record
      width : Tint32_t;
      height : Tint32_t;
      stride : Tint32_t;
      buf : Puint8_t;
    end;

  Timage_f32 = Timage_f32_t;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ floats per line }
{ indexed as buf[y*stride + x] }
  Pimage_f32 = ^Timage_f32;
  Timage_f32 = record
      width : Tint32_t;
      height : Tint32_t;
      stride : Tint32_t;
      buf : Psingle;
    end;

  Timage_u32 = Timage_u32_t;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ int32_ts per line }
{ indexed as buf[y*stride + x] }
  Pimage_u32 = ^Timage_u32;
  Timage_u32 = record
      width : Tint32_t;
      height : Tint32_t;
      stride : Tint32_t;
      buf : Puint32_t;
    end;


implementation


end.

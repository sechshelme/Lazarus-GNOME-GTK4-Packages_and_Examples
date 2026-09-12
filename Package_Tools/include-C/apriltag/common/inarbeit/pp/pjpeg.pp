
unit pjpeg;
interface

{
  Automatically converted by H2Pas 1.0.0 from pjpeg.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pjpeg.h
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
Pimage_u8_t  = ^image_u8_t;
Pimage_u8x3_t  = ^image_u8x3_t;
Plongint  = ^longint;
Ppjpeg  = ^pjpeg;
Ppjpeg_component  = ^pjpeg_component;
Ppjpeg_component_t  = ^pjpeg_component_t;
PPJPEG_ERROR  = ^PJPEG_ERROR;
PPJPEG_FLAGS  = ^PJPEG_FLAGS;
Ppjpeg_t  = ^pjpeg_t;
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
{$include "image_u8.h"}
{$include "image_u8x3.h"}
{ C++ extern C conditionnal removed }
type
  Tpjpeg_component = Tpjpeg_component_t;
{ resolution of this component (which is smaller than the }
{ dimensions of the image if the channel has been sub-sampled.) }
{ number of bytes per row. May be larger than width for alignment }
{ reasons. }
{ data[y*stride + x] }
{////////////////////////////////////////////////////////////// }
{ These items probably not of great interest to most }
{ applications. }
{ the identifier associated with this component }
{ horiz scale (high 4 bits) / vert scale (low 4 bits) }
{ derived from hv above }
{ quantization table index }
{ this filled in at the last moment by SOS }
{ which huff tables will we use for DC (high 4 bits) and AC (low 4 bits) }
  Ppjpeg_component = ^Tpjpeg_component;
  Tpjpeg_component = record
      width : Tuint32_t;
      height : Tuint32_t;
      stride : Tuint32_t;
      data : Puint8_t;
      id : Tuint8_t;
      hv : Tuint8_t;
      scalex : Tuint8_t;
      scaley : Tuint8_t;
      tq : Tuint8_t;
      tda : Tuint8_t;
    end;

  Tpjpeg = Tpjpeg_t;
{ status of the decode is put here. Non-zero means error. }
{ pixel dimensions }
  Ppjpeg = ^Tpjpeg;
  Tpjpeg = record
      error : longint;
      width : Tuint32_t;
      height : Tuint32_t;
      ncomponents : longint;
      components : Ppjpeg_component_t;
    end;

{ Don't try to recover from errors. }
{ Support JPGs with missing DHT segments. }
  TPJPEG_FLAGS =  Longint;
  Const
    PJPEG_STRICT = 1;
    PJPEG_MJPEG = 2;

{ something wrong reading file }
{ something wrong with DQT marker }
{ something wrong with SOF marker }
{ something wrong with DHT marker }
{ something wrong with SOS marker }
{ missing a necessary huffman table }
{ something wrong with DRI marker }
{ didn't get a reset marker where we expected. Corruption? }
{ ran out of bytes while decoding }
{ an unsupported format }
type
  TPJPEG_ERROR =  Longint;
  Const
    PJPEG_OKAY = 0;
    PJPEG_ERR_FILE = 1;
    PJPEG_ERR_DQT = 2;
    PJPEG_ERR_SOF = 3;
    PJPEG_ERR_DHT = 4;
    PJPEG_ERR_SOS = 5;
    PJPEG_ERR_MISSING_DHT = 6;
    PJPEG_ERR_DRI = 7;
    PJPEG_ERR_RESET = 8;
    PJPEG_ERR_EOF = 9;
    PJEPG_ERR_UNSUPPORTED = 10;

(* Const before type ignored *)

function pjpeg_create_from_file(path:Pchar; flags:Tuint32_t; error:Plongint):Ppjpeg_t;cdecl;external;
function pjpeg_create_from_buffer(buf:Puint8_t; buflen:longint; flags:Tuint32_t; error:Plongint):Ppjpeg_t;cdecl;external;
procedure pjpeg_destroy(pj:Ppjpeg_t);cdecl;external;
function pjpeg_to_u8_baseline(pj:Ppjpeg_t):Pimage_u8_t;cdecl;external;
function pjpeg_to_u8x3_baseline(pj:Ppjpeg_t):Pimage_u8x3_t;cdecl;external;
{ C++ end of extern C conditionnal removed }

implementation


end.

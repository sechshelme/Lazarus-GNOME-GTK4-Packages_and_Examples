
unit pnm;
interface

{
  Automatically converted by H2Pas 1.0.0 from pnm.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pnm.h
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
Ppnm  = ^pnm;
Ppnm_t  = ^pnm_t;
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
{ C++ extern C conditionnal removed }

const
  PNM_FORMAT_BINARY = 4;  
  PNM_FORMAT_GRAY = 5;  
  PNM_FORMAT_RGB = 6;  
{ supports ppm, pnm, pgm }
type
  Tpnm = Tpnm_t;
{ 1 = binary, 255 = one byte, 65535 = two bytes }
{ if max=65535, in big endian }
  Ppnm = ^Tpnm;
  Tpnm = record
      width : longint;
      height : longint;
      format : longint;
      max : longint;
      buflen : Tuint32_t;
      buf : Puint8_t;
    end;

(* Const before type ignored *)

function pnm_create_from_file(path:Pchar):Ppnm_t;cdecl;external;
procedure pnm_destroy(pnm:Ppnm_t);cdecl;external;
{ C++ end of extern C conditionnal removed }

implementation


end.

unit image_u8;

interface

uses
  fp_apriltag;

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
type
  Timage_u8_lut = Timage_u8_lut_t;
{ When drawing, we compute the squared distance between a given pixel and a filled region. }
{ int idx = squared_distance * scale; }
{ We then index into values[idx] to obtain the color. (If we must index beyond nvalues, }
{ no drawing is performed.) }
  Pimage_u8_lut = ^Timage_u8_lut;
  Timage_u8_lut = record
      scale : single;
      nvalues : longint;
      values : Puint8_t;
    end;

{ Create or load an image. returns NULL on failure. Uses default }
{ stride alignment. }

function image_u8_create_stride(width:dword; height:dword; stride:dword):Pimage_u8_t;cdecl;external libapriltag;
function image_u8_create(width:dword; height:dword):Pimage_u8_t;cdecl;external libapriltag;
function image_u8_create_alignment(width:dword; height:dword; alignment:dword):Pimage_u8_t;cdecl;external libapriltag;
function image_u8_create_from_f32(fim:Pimage_f32_t):Pimage_u8_t;cdecl;external libapriltag;
function image_u8_create_from_pnm(path:Pchar):Pimage_u8_t;cdecl;external libapriltag;
function image_u8_create_from_pnm_alignment(path:Pchar; alignment:longint):Pimage_u8_t;cdecl;external libapriltag;
function image_u8_copy(in:Pimage_u8_t):Pimage_u8_t;cdecl;external libapriltag;
procedure image_u8_draw_line(im:Pimage_u8_t; x0:single; y0:single; x1:single; y1:single; 
            v:longint; width:longint);cdecl;external libapriltag;
procedure image_u8_draw_circle(im:Pimage_u8_t; x0:single; y0:single; r:single; v:longint);cdecl;external libapriltag;
procedure image_u8_draw_annulus(im:Pimage_u8_t; x0:single; y0:single; r0:single; r1:single; 
            v:longint);cdecl;external libapriltag;
procedure image_u8_fill_line_max(im:Pimage_u8_t; lut:Pimage_u8_lut_t; xy0:Psingle; xy1:Psingle);cdecl;external libapriltag;
procedure image_u8_clear(im:Pimage_u8_t);cdecl;external libapriltag;
procedure image_u8_darken(im:Pimage_u8_t);cdecl;external libapriltag;
procedure image_u8_convolve_2D(im:Pimage_u8_t; k:Puint8_t; ksz:longint);cdecl;external libapriltag;
procedure image_u8_gaussian_blur(im:Pimage_u8_t; sigma:Tdouble; k:longint);cdecl;external libapriltag;
{ 1.5, 2, 3, 4, ... supported }
function image_u8_decimate(im:Pimage_u8_t; factor:single):Pimage_u8_t;cdecl;external libapriltag;
procedure image_u8_destroy(im:Pimage_u8_t);cdecl;external libapriltag;
{ Write a pnm. Returns 0 on success }
{ Currently only supports GRAY and RGBA. Does not write out alpha for RGBA }
function image_u8_write_pnm(im:Pimage_u8_t; path:Pchar):longint;cdecl;external libapriltag;
{ rotate the image by 'rad' radians. (Rotated in the "intuitive }
{ sense", i.e., if Y were up. When input values are unavailable, the }
{ value 'pad' is inserted instead. The geometric center of the output }
{ image corresponds to the geometric center of the input image. }
function image_u8_rotate(in:Pimage_u8_t; rad:Tdouble; pad:Tuint8_t):Pimage_u8_t;cdecl;external libapriltag;
{ C++ end of extern C conditionnal removed }

// === Konventiert am: 12-9-26 17:14:16 ===


implementation



end.

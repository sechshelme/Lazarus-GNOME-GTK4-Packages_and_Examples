unit pam;

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
type
  Txxxxxxxx =  Longint;
  Const
    PAM_GRAYSCALE_ALPHA = 5000;
    PAM_RGB_ALPHA = 5001;
    PAM_RGB = 5002;
    PAM_GRAYSCALE = 5003;

type
  Tpam = Tpam_t;
{ one of PAM_* }
{ note, stride always width. }
{ bytes per pixel }
{ maximum value per channel, e.g. 255 for 8bpp }
{ in bytes }
  Ppam = ^Tpam;
  Tpam = record
      _type : longint;
      width : longint;
      height : longint;
      depth : longint;
      maxval : longint;
      datalen : longint;
      data : Puint8_t;
    end;


function pam_create_from_file(inpath:Pchar):Ppam_t;cdecl;external libapriltag;
function pam_write_file(pam:Ppam_t; outpath:Pchar):longint;cdecl;external libapriltag;
procedure pam_destroy(pam:Ppam_t);cdecl;external libapriltag;
function pam_copy(pam:Ppam_t):Ppam_t;cdecl;external libapriltag;
{ NB doesn't handle many conversions yet. }
function pam_convert(in:Ppam_t; _type:longint):Ppam_t;cdecl;external libapriltag;

// === Konventiert am: 12-9-26 17:22:32 ===


implementation



end.

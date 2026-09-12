
unit postscript_utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from postscript_utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    postscript_utils.h
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
Pxxxxxxx  = ^xxxxxxx;
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
{Xxxxxxxxxx

static void postscript_image(FILE *f, image_u8_t *im)

//    fprintf(f, "/readstring \n  currentfile exch readhexstring pop\n bind def\n");
    fprintf(f, "/picstr %d string def\n", im->width);

    fprintf(f, "%d %d 8 [1 0 0 1 0 0]\n",
            im->width, im->height);

    fprintf(f, "currentfile picstr readhexstring pop\nimage\n");

    for (int y = 0; y < im->height; y++) 
        for (int x = 0; x < im->width; x++) 
            uint8_t v = im->buf[y*im->stride + x];
            fprintf(f, "%02x", v);
            if ((x % 32)==31)
                fprintf(f, "\n");
        
    

    fprintf(f, "\n");

 }
type
  Pxxxxxxx = ^Txxxxxxx;
  Txxxxxxx = Txxxxxx;

implementation


end.

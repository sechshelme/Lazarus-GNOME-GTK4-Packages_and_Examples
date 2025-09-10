
unit image;
interface

{
  Automatically converted by H2Pas 1.0.0 from image.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    image.h
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
Plongint  = ^longint;
PTCOD_ColorRGB  = ^TCOD_ColorRGB;
PTCOD_Console  = ^TCOD_Console;
PTCOD_Image  = ^TCOD_Image;
PTCOD_image_t  = ^TCOD_image_t;
PTCOD_mipmap_  = ^TCOD_mipmap_;
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
{$ifndef _TCOD_IMAGE_H}
{$define _TCOD_IMAGE_H}
{$include "color.h"}
{$include "console_types.h"}
{$include "error.h"}
{$include "portability.h"}
{ C++ extern C conditionnal removed }
type
  PTCOD_mipmap_ = ^TTCOD_mipmap_;
  TTCOD_mipmap_ = record
      width : longint;
      height : longint;
      fwidth : single;
      fheight : single;
      buf : PTCOD_ColorRGB;
      dirty : Tbool;
    end;


  PTCOD_Image = ^TTCOD_Image;
  TTCOD_Image = record
      nb_mipmaps : longint;
      mipmaps : PTCOD_mipmap_;
      key_color : TTCOD_ColorRGB;
      has_key_color : Tbool;
    end;

  PTCOD_image_t = ^TTCOD_image_t;
  TTCOD_image_t = PTCOD_Image;

function TCOD_image_new(width:longint; height:longint):PTCOD_Image;cdecl;external;
{*
 *  Return a new image rendered from a console.
 *
 *  This effectively returns a screenshot of the console.
  }
(* Const before type ignored *)
function TCOD_image_from_console(console:PTCOD_Console):PTCOD_Image;cdecl;external;
{*
 *  Same as TCOD_image_from_console, but with an existing image.
  }
(* Const before type ignored *)
procedure TCOD_image_refresh_console(image:PTCOD_Image; console:PTCOD_Console);cdecl;external;
procedure TCOD_image_clear(image:PTCOD_Image; color:TTCOD_color_t);cdecl;external;
procedure TCOD_image_invert(image:PTCOD_Image);cdecl;external;
procedure TCOD_image_hflip(image:PTCOD_Image);cdecl;external;
procedure TCOD_image_rotate90(image:PTCOD_Image; numRotations:longint);cdecl;external;
procedure TCOD_image_vflip(image:PTCOD_Image);cdecl;external;
procedure TCOD_image_scale(image:PTCOD_Image; new_w:longint; new_h:longint);cdecl;external;
{$ifndef NO_SDL}
(* Const before type ignored *)

function TCOD_image_load(filename:Pchar):PTCOD_Image;cdecl;external;
{*
    Save an image to a PNG or BMP file.

    Returns a negative error code on failure.  Check TCOD_get_error for details.
    \rst
    .. versionchanged:: 1.16
        Now returns TCOD_Error.
    \endrst
  }
(* Const before type ignored *)
(* Const before type ignored *)
function TCOD_image_save(image:PTCOD_Image; filename:Pchar):TTCOD_Error;cdecl;external;
{$endif}
{ NO_SDL }
(* Const before type ignored *)

procedure TCOD_image_get_size(image:PTCOD_Image; w:Plongint; h:Plongint);cdecl;external;
(* Const before type ignored *)
function TCOD_image_get_pixel(image:PTCOD_Image; x:longint; y:longint):TTCOD_color_t;cdecl;external;
(* Const before type ignored *)
function TCOD_image_get_alpha(image:PTCOD_Image; x:longint; y:longint):longint;cdecl;external;
{*
 *  Return a mipmapped pixel of image.
 *
 *  Mipmaps are updated when you call this, so it can't be called from multiple
 *  threads.
  }
function TCOD_image_get_mipmap_pixel(image:PTCOD_Image; x0:single; y0:single; x1:single; y1:single):TTCOD_color_t;cdecl;external;
procedure TCOD_image_put_pixel(image:PTCOD_Image; x:longint; y:longint; col:TTCOD_color_t);cdecl;external;
procedure TCOD_image_blit(image:PTCOD_Image; console:TTCOD_console_t; x:single; y:single; bkgnd_flag:TTCOD_bkgnd_flag_t; 
            scale_x:single; scale_y:single; angle:single);cdecl;external;
procedure TCOD_image_blit_rect(image:PTCOD_Image; console:TTCOD_console_t; x:longint; y:longint; w:longint; 
            h:longint; bkgnd_flag:TTCOD_bkgnd_flag_t);cdecl;external;
(* Const before type ignored *)
procedure TCOD_image_blit_2x(image:PTCOD_Image; dest:PTCOD_Console; dx:longint; dy:longint; sx:longint; 
            sy:longint; w:longint; h:longint);cdecl;external;
procedure TCOD_image_delete(image:PTCOD_Image);cdecl;external;
procedure TCOD_image_set_key_color(image:PTCOD_Image; key_color:TTCOD_color_t);cdecl;external;
(* Const before type ignored *)
function TCOD_image_is_pixel_transparent(image:PTCOD_Image; x:longint; y:longint):Tbool;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ _TCOD_IMAGE_H  }

implementation


end.

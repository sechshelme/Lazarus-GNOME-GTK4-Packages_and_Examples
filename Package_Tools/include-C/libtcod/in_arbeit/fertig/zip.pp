
unit zip;
interface

{
  Automatically converted by H2Pas 1.0.0 from zip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    zip.h
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
PTCOD_Console  = ^TCOD_Console;
PTCOD_Random  = ^TCOD_Random;
PTCOD_Zip  = ^TCOD_Zip;
PTCOD_zip_t  = ^TCOD_zip_t;
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
{$ifndef _TCOD_ZIP_H}
{$define _TCOD_ZIP_H}
{$include "color.h"}
{$include "console_types.h"}
{$include "image.h"}
{$include "mersenne.h"}
{$include "portability.h"}
{ C++ extern C conditionnal removed }
type
  PTCOD_Zip = ^TTCOD_Zip;
  TTCOD_Zip = record
      {undefined structure}
    end;


  PTCOD_zip_t = ^TTCOD_zip_t;
  TTCOD_zip_t = PTCOD_Zip;

function TCOD_zip_new:TTCOD_zip_t;cdecl;external;
{TCOD_DEPRECATED("This method of serialization is not cross-platform.  It's recommended to find a standard alternative.") }
procedure TCOD_zip_delete(zip:TTCOD_zip_t);cdecl;external;
{ output interface  }
procedure TCOD_zip_put_char(zip:TTCOD_zip_t; val:char);cdecl;external;
procedure TCOD_zip_put_int(zip:TTCOD_zip_t; val:longint);cdecl;external;
procedure TCOD_zip_put_float(zip:TTCOD_zip_t; val:single);cdecl;external;
(* Const before type ignored *)
procedure TCOD_zip_put_string(zip:TTCOD_zip_t; val:Pchar);cdecl;external;
(* Const before type ignored *)
procedure TCOD_zip_put_color(zip:TTCOD_zip_t; val:TTCOD_color_t);cdecl;external;
(* Const before type ignored *)
procedure TCOD_zip_put_image(zip:TTCOD_zip_t; val:TTCOD_image_t);cdecl;external;
(* Const before type ignored *)
procedure TCOD_zip_put_console(zip:TTCOD_zip_t; val:PTCOD_Console);cdecl;external;
{ TCOD_DEPRECATED("This function will fail with console characters greater than 255.") }
{*
    Write a TCOD_Random* object.
    \rst
    .. versionadded:: 1.16
    \endrst
  }
(* Const before type ignored *)
procedure TCOD_zip_put_random(zip:TTCOD_zip_t; val:PTCOD_Random);cdecl;external;
(* Const before type ignored *)
procedure TCOD_zip_put_data(zip:TTCOD_zip_t; nbBytes:longint; data:pointer);cdecl;external;
function TCOD_zip_get_current_bytes(zip:TTCOD_zip_t):Tuint32_t;cdecl;external;
(* Const before type ignored *)
function TCOD_zip_save_to_file(zip:TTCOD_zip_t; filename:Pchar):longint;cdecl;external;
{ input interface  }
(* Const before type ignored *)
function TCOD_zip_load_from_file(zip:TTCOD_zip_t; filename:Pchar):longint;cdecl;external;
function TCOD_zip_get_char(zip:TTCOD_zip_t):char;cdecl;external;
function TCOD_zip_get_int(zip:TTCOD_zip_t):longint;cdecl;external;
function TCOD_zip_get_float(zip:TTCOD_zip_t):single;cdecl;external;
(* Const before type ignored *)
function TCOD_zip_get_string(zip:TTCOD_zip_t):Pchar;cdecl;external;
function TCOD_zip_get_color(zip:TTCOD_zip_t):TTCOD_color_t;cdecl;external;
function TCOD_zip_get_image(zip:TTCOD_zip_t):TTCOD_image_t;cdecl;external;
function TCOD_zip_get_console(zip:TTCOD_zip_t):TTCOD_console_t;cdecl;external;
{*
    Read a TCOD_Random* object.
    \rst
    .. versionadded:: 1.16
    \endrst
  }
function TCOD_zip_get_random(zip:TTCOD_zip_t):TTCOD_random_t;cdecl;external;
function TCOD_zip_get_data(zip:TTCOD_zip_t; nbBytes:longint; data:pointer):longint;cdecl;external;
function TCOD_zip_get_remaining_bytes(zip:TTCOD_zip_t):Tuint32_t;cdecl;external;
procedure TCOD_zip_skip_bytes(zip:TTCOD_zip_t; nbBytes:Tuint32_t);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.

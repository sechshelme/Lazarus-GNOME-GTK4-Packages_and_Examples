
unit console_printing;
interface

{
  Automatically converted by H2Pas 1.0.0 from console_printing.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    console_printing.h
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
PTCOD_colctrl_t  = ^TCOD_colctrl_t;
PTCOD_color_t  = ^TCOD_color_t;
PTCOD_Console  = ^TCOD_Console;
Pwchar_t  = ^wchar_t;
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
{$ifndef TCOD_CONSOLE_PRINTING_H_}
{$define TCOD_CONSOLE_PRINTING_H_}
{$include <stdbool.h>}
{$ifndef NO_UNICODE}
{$include <wchar.h>}
{$endif}
{$include "config.h"}
{$include "console_types.h"}
{$include "error.h"}
{ C++ extern C conditionnal removed }
{TCOD_DEPRECATED("Use TCOD_console_printf instead.") }
(* Const before type ignored *)

procedure TCOD_console_print(con:PTCOD_Console; x:longint; y:longint; fmt:Pchar; args:array of const);cdecl;external;
procedure TCOD_console_print(con:PTCOD_Console; x:longint; y:longint; fmt:Pchar);cdecl;external;
{TCOD_DEPRECATED("Use TCOD_console_printf_ex instead.") }
(* Const before type ignored *)
procedure TCOD_console_print_ex(con:PTCOD_Console; x:longint; y:longint; flag:TTCOD_bkgnd_flag_t; alignment:TTCOD_alignment_t; 
            fmt:Pchar; args:array of const);cdecl;external;
procedure TCOD_console_print_ex(con:PTCOD_Console; x:longint; y:longint; flag:TTCOD_bkgnd_flag_t; alignment:TTCOD_alignment_t; 
            fmt:Pchar);cdecl;external;
{TCOD_DEPRECATED("Use TCOD_console_printf_rect instead.") }
(* Const before type ignored *)
function TCOD_console_print_rect(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           fmt:Pchar; args:array of const):longint;cdecl;external;
function TCOD_console_print_rect(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           fmt:Pchar):longint;cdecl;external;
{TCOD_DEPRECATED("Use TCOD_console_printf_rect_ex instead.") }
(* Const before type ignored *)
function TCOD_console_print_rect_ex(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           flag:TTCOD_bkgnd_flag_t; alignment:TTCOD_alignment_t; fmt:Pchar; args:array of const):longint;cdecl;external;
function TCOD_console_print_rect_ex(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           flag:TTCOD_bkgnd_flag_t; alignment:TTCOD_alignment_t; fmt:Pchar):longint;cdecl;external;
{TCOD_DEPRECATED("Use TCOD_console_printf_frame instead.") }
(* Const before type ignored *)
procedure TCOD_console_print_frame(con:TTCOD_console_t; x:longint; y:longint; w:longint; h:longint; 
            empty:Tbool; flag:TTCOD_bkgnd_flag_t; fmt:Pchar; args:array of const);cdecl;external;
procedure TCOD_console_print_frame(con:TTCOD_console_t; x:longint; y:longint; w:longint; h:longint; 
            empty:Tbool; flag:TTCOD_bkgnd_flag_t; fmt:Pchar);cdecl;external;
{TCOD_DEPRECATED("Use TCOD_console_get_height_rect_fmt instead.") }
(* Const before type ignored *)
function TCOD_console_get_height_rect(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           fmt:Pchar; args:array of const):longint;cdecl;external;
function TCOD_console_get_height_rect(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           fmt:Pchar):longint;cdecl;external;
{$ifndef NO_UNICODE}
{TCOD_DEPRECATED("Use TCOD_console_printf instead.") }
(* Const before type ignored *)

procedure TCOD_console_print_utf(con:PTCOD_Console; x:longint; y:longint; fmt:Pwchar_t; args:array of const);cdecl;external;
procedure TCOD_console_print_utf(con:PTCOD_Console; x:longint; y:longint; fmt:Pwchar_t);cdecl;external;
{TCOD_DEPRECATED("Use TCOD_console_printf_ex instead.") }
(* Const before type ignored *)
procedure TCOD_console_print_ex_utf(con:PTCOD_Console; x:longint; y:longint; flag:TTCOD_bkgnd_flag_t; alignment:TTCOD_alignment_t; 
            fmt:Pwchar_t; args:array of const);cdecl;external;
procedure TCOD_console_print_ex_utf(con:PTCOD_Console; x:longint; y:longint; flag:TTCOD_bkgnd_flag_t; alignment:TTCOD_alignment_t; 
            fmt:Pwchar_t);cdecl;external;
{TCOD_DEPRECATED("Use TCOD_console_printf_rect instead.") }
(* Const before type ignored *)
function TCOD_console_print_rect_utf(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           fmt:Pwchar_t; args:array of const):longint;cdecl;external;
function TCOD_console_print_rect_utf(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           fmt:Pwchar_t):longint;cdecl;external;
{TCOD_DEPRECATED("Use TCOD_console_printf_rect_ex instead.") }
(* Const before type ignored *)
function TCOD_console_print_rect_ex_utf(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           flag:TTCOD_bkgnd_flag_t; alignment:TTCOD_alignment_t; fmt:Pwchar_t; args:array of const):longint;cdecl;external;
function TCOD_console_print_rect_ex_utf(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           flag:TTCOD_bkgnd_flag_t; alignment:TTCOD_alignment_t; fmt:Pwchar_t):longint;cdecl;external;
{TCOD_DEPRECATED("Use TCOD_console_get_height_rect_fmt instead.") }
(* Const before type ignored *)
function TCOD_console_get_height_rect_utf(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           fmt:Pwchar_t; args:array of const):longint;cdecl;external;
function TCOD_console_get_height_rect_utf(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           fmt:Pwchar_t):longint;cdecl;external;
{$endif}
type
  PTCOD_colctrl_t = ^TTCOD_colctrl_t;
  TTCOD_colctrl_t =  Longint;
  Const
    TCOD_COLCTRL_1 = 1;
    TCOD_COLCTRL_2 = 2;
    TCOD_COLCTRL_3 = 3;
    TCOD_COLCTRL_4 = 4;
    TCOD_COLCTRL_5 = 5;
    TCOD_COLCTRL_NUMBER = 5;
    TCOD_COLCTRL_FORE_RGB = 6;
    TCOD_COLCTRL_BACK_RGB = 7;
    TCOD_COLCTRL_STOP = 8;
;

procedure TCOD_console_set_color_control(con:TTCOD_colctrl_t; fore:TTCOD_color_t; back:TTCOD_color_t);cdecl;external;
{ UTF-8 functions  }
{*
    Format and print a UTF-8 string to a console.
    \rst
    .. versionadded:: 1.8

    .. versionchanged:: 1.16
        Now returns a negative error code on failure.
    \endrst
  }
(* Const before type ignored *)
function TCOD_console_printf(con:PTCOD_Console; x:longint; y:longint; fmt:Pchar; args:array of const):TTCOD_Error;cdecl;external;
function TCOD_console_printf(con:PTCOD_Console; x:longint; y:longint; fmt:Pchar):TTCOD_Error;cdecl;external;
{*
    Format and print a UTF-8 string to a console.
    \rst
    .. versionadded:: 1.8

    .. versionchanged:: 1.16
        Now returns a negative error code on failure.
    \endrst
  }
(* Const before type ignored *)
function TCOD_console_printf_ex(con:PTCOD_Console; x:longint; y:longint; flag:TTCOD_bkgnd_flag_t; alignment:TTCOD_alignment_t; 
           fmt:Pchar; args:array of const):TTCOD_Error;cdecl;external;
function TCOD_console_printf_ex(con:PTCOD_Console; x:longint; y:longint; flag:TTCOD_bkgnd_flag_t; alignment:TTCOD_alignment_t; 
           fmt:Pchar):TTCOD_Error;cdecl;external;
{*
    Format and print a UTF-8 string to a console.
    \rst
    .. versionadded:: 1.8

    .. versionchanged:: 1.16
        Now returns a negative error code on failure.
    \endrst
  }
(* Const before type ignored *)
function TCOD_console_printf_rect(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           fmt:Pchar; args:array of const):longint;cdecl;external;
function TCOD_console_printf_rect(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           fmt:Pchar):longint;cdecl;external;
{*
    Format and print a UTF-8 string to a console.
    \rst
    .. versionadded:: 1.8

    .. versionchanged:: 1.16
        Now returns a negative error code on failure.
    \endrst
  }
(* Const before type ignored *)
function TCOD_console_printf_rect_ex(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           flag:TTCOD_bkgnd_flag_t; alignment:TTCOD_alignment_t; fmt:Pchar; args:array of const):longint;cdecl;external;
function TCOD_console_printf_rect_ex(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           flag:TTCOD_bkgnd_flag_t; alignment:TTCOD_alignment_t; fmt:Pchar):longint;cdecl;external;
{*
    Print a framed and optionally titled region to a console, using default
    colors and alignment.

    This function uses Unicode box-drawing characters and a UTF-8 formatted
    string.
    \rst
    .. versionadded:: 1.8

    .. versionchanged:: 1.16
        Now returns a negative error code on failure.
    \endrst
  }
(* Const before type ignored *)
function TCOD_console_printf_frame(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           empty:longint; flag:TTCOD_bkgnd_flag_t; fmt:Pchar; args:array of const):TTCOD_Error;cdecl;external;
function TCOD_console_printf_frame(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           empty:longint; flag:TTCOD_bkgnd_flag_t; fmt:Pchar):TTCOD_Error;cdecl;external;
{*
    Return the number of lines that would be printed by this formatted string.
    \rst
    .. versionadded:: 1.8

    .. versionchanged:: 1.16
        Now returns a negative error code on failure.
    \endrst
  }
(* Const before type ignored *)
function TCOD_console_get_height_rect_fmt(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           fmt:Pchar; args:array of const):longint;cdecl;external;
function TCOD_console_get_height_rect_fmt(con:PTCOD_Console; x:longint; y:longint; w:longint; h:longint; 
           fmt:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TCOD_console_printn(con:PTCOD_Console; x:longint; y:longint; n:Tsize_t; str:Pchar; 
           fg:PTCOD_color_t; bg:PTCOD_color_t; flag:TTCOD_bkgnd_flag_t; alignment:TTCOD_alignment_t):TTCOD_Error;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TCOD_console_printn_rect(con:PTCOD_Console; x:longint; y:longint; width:longint; height:longint; 
           n:Tsize_t; str:Pchar; fg:PTCOD_color_t; bg:PTCOD_color_t; flag:TTCOD_bkgnd_flag_t; 
           alignment:TTCOD_alignment_t):longint;cdecl;external;
(* Const before type ignored *)
function TCOD_console_get_height_rect_n(console:PTCOD_Console; x:longint; y:longint; width:longint; height:longint; 
           n:Tsize_t; str:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function TCOD_console_get_height_rect_wn(width:longint; n:Tsize_t; str:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TCOD_console_printn_frame(con:PTCOD_Console; x:longint; y:longint; width:longint; height:longint; 
           n:Tsize_t; title:Pchar; fg:PTCOD_color_t; bg:PTCOD_color_t; flag:TTCOD_bkgnd_flag_t; 
           empty:Tbool):TTCOD_Error;cdecl;external;
{ __cplusplus }
{$endif}
{ TCOD_CONSOLE_PRINTING_H_  }

implementation


end.

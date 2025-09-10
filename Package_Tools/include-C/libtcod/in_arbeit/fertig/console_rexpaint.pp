
unit console_rexpaint;
interface

{
  Automatically converted by H2Pas 1.0.0 from console_rexpaint.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    console_rexpaint.h
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
Pbyte  = ^byte;
Pchar  = ^char;
PTCOD_Console  = ^TCOD_Console;
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
{$ifndef TCOD_CONSOLE_REXPAINT_H_}
{$define TCOD_CONSOLE_REXPAINT_H_}
{ __cplusplus }
{$include "config.h"}
{$include "console_types.h"}
{$include "list.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus }
{*
    \brief Return a new console loaded from a REXPaint ``.xp`` file.

    \param [in] filename A path to the REXPaint file.
    \return A new TCOD_console_t object.  New consoles will need
    to be deleted with a call to :any:`TCOD_console_delete`.
    Returns NULL on an error.

  }
(* Const before type ignored *)

function TCOD_console_from_xp(filename:Pchar):TTCOD_console_t;cdecl;external;
{*
    \brief Update a console from a REXPaint ``.xp`` file.

    \param [out] con A console instance to update from the REXPaint file.
    \param [in] filename A path to the REXPaint file.

    In C++, you can pass the filepath directly to the :any:`TCODConsole`
    constructor to load a REXPaint file.
  }
(* Const before type ignored *)
function TCOD_console_load_xp(con:PTCOD_Console; filename:Pchar):Tbool;cdecl;external;
{*
    \brief Save a console as a REXPaint ``.xp`` file.

    \param [in] con The console instance to save.
    \param [in] filename The filepath to save to.
    \param [in] compress_level A zlib compression level, from 0 to 9.
    1=fast, 6=balanced, 9=slowest, 0=uncompressed.
    \return ``true`` when the file is saved successfully, or ``false`` when an
    issue is detected.

    The REXPaint format can support a 1:1 copy of a libtcod console.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function TCOD_console_save_xp(con:PTCOD_Console; filename:Pchar; compress_level:longint):Tbool;cdecl;external;
{*
    \brief Return a list of consoles from a REXPaint file.

    \param [in] filename A path to the REXPaint file.
    \return Returns a TCOD_list_t of TCOD_console_t objects.  Or NULL on an
    error.  You will need to delete this list and each console individually.

    This function can load a REXPaint file with variable layer shapes,
    which would cause issues for a function like TCOD_console_list_from_xp.
  }
(* Const before type ignored *)
function TCOD_console_list_from_xp(filename:Pchar):TTCOD_list_t;cdecl;external;
{*
    \brief Save a list of consoles to a REXPaint file.

    \param [in] console_list A TCOD_list_t of TCOD_console_t objects.
    \param [in] filename Path to save to.
    \param [in] compress_level zlib compression level.
    \return true on success, false on a failure such as not being able to write
    to the path provided.

    This function can save any number of layers with multiple
    different sizes.

    The REXPaint tool only supports files with up to 9 layers where
    all layers are the same size.
  }
(* Const before type ignored *)
function TCOD_console_list_save_xp(console_list:TTCOD_list_t; filename:Pchar; compress_level:longint):Tbool;cdecl;external;
{*
    @brief Load an array of consoles from a REXPaint file in memory.

    You can call this function with `n_out=0` and `out=NULL` to get the number of consoles in the file.

    @param n_data The length of the input `data` buffer.
    @param data The buffer where the REXPaint file is held.
    @param n_out The length of the output console `out` array.  Can be zero.
    @param out The array to fill with loaded consoles.
    @return Returns the number of consoles held by the file.  Returns a negative error code on error.

    \rst
    .. versionadded:: 1.18
    \endrst
  }
(* Const before type ignored *)
function TCOD_load_xp_from_memory(n_data:longint; data:Pbyte; n_out:longint; out:PPTCOD_Console):longint;cdecl;external;
{*
    @brief Save an array of consoles to a REXPaint file in memory.

    Partially initialized consoles are released on failures.

    @param n_consoles The length of the input `consoles` array.
    @param consoles An array of tcod consoles, can not be NULL.
    @param n_out The size of the `out` buffer, if this is zero then upper bound to be returned.
    @param out A pointer to an output buffer, can be NULL.
    @param compression_level A compression level for the zlib library.
    @return If `out=NULL` then returns the upper bound of the buffer size needed.
            Otherwise this returns the number of bytes actually filled.
            On an error a negative error code is returned.

    \rst
    .. versionadded:: 1.18
    \endrst
  }
(* Const before type ignored *)
(* Const before declarator ignored *)
function TCOD_save_xp_to_memory(n_consoles:longint; consoles:PPTCOD_Console; n_out:longint; out:Pbyte; compression_level:longint):longint;cdecl;external;
{*
    @brief Load an array of consoles from a REXPaint file.

    @param path The path to the REXPaint file, can not be NULL.
    @param n The size of the `out` array.  Can be zero.
    @param out The array to fill with loaded consoles.
    @return Returns the number of consoles held by the file.  Returns a negative error code on error.

    \rst
    .. versionadded:: 1.18
    \endrst
  }
(* Const before type ignored *)
function TCOD_load_xp(path:Pchar; n:longint; out:PPTCOD_Console):longint;cdecl;external;
{*
    @brief Save an array of consoles to a REXPaint file.

    Partially initialized consoles are released on failures.

    @param n The number of consoles in the `consoles` array.
    @param consoles An array of consoles.
    @param path The path write the REXPaint file, can not be NULL.
    @param compress_level A compression level for the zlib library.
    @return Returns an error code on failure.

    \rst
    .. versionadded:: 1.18
    \endrst
  }
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
function TCOD_save_xp(n:longint; consoles:PPTCOD_Console; path:Pchar; compress_level:longint):TTCOD_Error;cdecl;external;
{ __cplusplus }
{$endif}
{ TCOD_CONSOLE_REXPAINT_H_  }

implementation


end.

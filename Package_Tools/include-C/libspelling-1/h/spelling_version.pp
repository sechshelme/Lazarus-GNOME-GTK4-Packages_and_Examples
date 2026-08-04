
unit spelling_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from spelling_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    spelling_version
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ libspelling-version.h.in
 *
 * Copyright 2023 Christian Hergert
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{*
 * SECTION:libspellingversion
 * @short_description: libspelling version checking
 *
 * libspelling provides macros to check the version of the library
 * at compile-time
  }
{*
 * SPELLING_MAJOR_VERSION:
 *
 * libspelling major version component (e.g. 1 if %SPELLING_VERSION is 1.2.3)
  }

const
  SPELLING_MAJOR_VERSION = 0;  
{*
 * SPELLING_MINOR_VERSION:
 *
 * libspelling minor version component (e.g. 2 if %SPELLING_VERSION is 1.2.3)
  }
  SPELLING_MINOR_VERSION = 2;  
{*
 * SPELLING_MICRO_VERSION:
 *
 * libspelling micro version component (e.g. 3 if %SPELLING_VERSION is 1.2.3)
  }
  SPELLING_MICRO_VERSION = 0;  
{*
 * SPELLING_VERSION
 *
 * libspelling version.
  }
  SPELLING_VERSION = 0.2.0;  
{*
 * SPELLING_VERSION_S:
 *
 * libspelling version, encoded as a string, useful for printing and
 * concatenation.
  }
  SPELLING_VERSION_S = '0.2.0';  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function SPELLING_ENCODE_VERSION(major,minor,micro : longint) : longint;

{*
 * SPELLING_VERSION_HEX:
 *
 * libspelling version, encoded as an hexadecimal number, useful for
 * integer comparisons.
  }
{ was #define dname def_expr }
function SPELLING_VERSION_HEX : longint; { return type might be wrong }

{*
 * SPELLING_CHECK_VERSION:
 * @major: required major version
 * @minor: required minor version
 * @micro: required micro version
 *
 * Compile-time version checking. Evaluates to %TRUE if the version
 * of libspelling is greater than the required one.
#define SPELLING_CHECK_VERSION(major,minor,micro)   \
        (SPELLING_MAJOR_VERSION > (major) || \
         (SPELLING_MAJOR_VERSION == (major) && SPELLING_MINOR_VERSION > (minor)) || \
         (SPELLING_MAJOR_VERSION == (major) && SPELLING_MINOR_VERSION == (minor) && \
          SPELLING_MICRO_VERSION >= (micro)))
  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPELLING_ENCODE_VERSION(major,minor,micro : longint) : longint;
begin
  SPELLING_ENCODE_VERSION:=((major shl 24) or (minor shl 16)) or (micro shl 8);
end;

{ was #define dname def_expr }
function SPELLING_VERSION_HEX : longint; { return type might be wrong }
  begin
    SPELLING_VERSION_HEX:=SPELLING_ENCODE_VERSION(SPELLING_MAJOR_VERSION,SPELLING_MINOR_VERSION,SPELLING_MICRO_VERSION);
  end;


end.

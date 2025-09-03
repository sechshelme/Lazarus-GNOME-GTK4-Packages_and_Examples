
unit peas_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from peas_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    peas_version.h
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


{
 * peas-version.h
 * This file is part of libpeas
 *
 * libpeas is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * libpeas is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA.
  }
{$ifndef __PEAS_VERSION_H__}
{$define __PEAS_VERSION_H__}
{*
 * PEAS_MAJOR_VERSION:
 *
 * Peas major version component (e.g. 1 if %PEAS_VERSION is 1.2.3)
  }

const
  PEAS_MAJOR_VERSION = 2;  
{*
 * PEAS_MINOR_VERSION:
 *
 * Peas minor version component (e.g. 2 if %PEAS_VERSION is 1.2.3)
  }
  PEAS_MINOR_VERSION = 0;  
{*
 * PEAS_MICRO_VERSION:
 *
 * Peas micro version component (e.g. 3 if %PEAS_VERSION is 1.2.3)
  }
  PEAS_MICRO_VERSION = 1;  
{*
 * PEAS_VERSION:
 *
 * Peas version.
  }
  PEAS_VERSION = 2.0.1;  
{*
 * PEAS_VERSION_S:
 *
 * Peas version, encoded as a string, useful for printing and
 * concatenation.
  }
  PEAS_VERSION_S = '2.0.1';  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PEAS_ENCODE_VERSION(major,minor,micro : longint) : longint;

{*
 * PEAS_VERSION_HEX:
 *
 * Peas version, encoded as an hexadecimal number, useful for
 * integer comparisons.
  }
{ was #define dname def_expr }
function PEAS_VERSION_HEX : longint; { return type might be wrong }

{*
 * PEAS_CHECK_VERSION:
 * @major: required major version
 * @minor: required minor version
 * @micro: required micro version
 *
 * Compile-time version checking. Evaluates to %TRUE if the version
 * of peas is greater than the required one.
  }
{ xxxxxxxxxxxxxxxxxxxxxxxxxxxx
#define PEAS_CHECK_VERSION(major,minor,micro)   \
        (PEAS_MAJOR_VERSION > (major) || \
         (PEAS_MAJOR_VERSION == (major) && PEAS_MINOR_VERSION > (minor)) || \
         (PEAS_MAJOR_VERSION == (major) && PEAS_MINOR_VERSION == (minor) && \
          PEAS_MICRO_VERSION >= (micro)))
 }
{$endif}
{ __PEAS_VERSION_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PEAS_ENCODE_VERSION(major,minor,micro : longint) : longint;
begin
  PEAS_ENCODE_VERSION:=((major shl 24) or (minor shl 16)) or (micro shl 8);
end;

{ was #define dname def_expr }
function PEAS_VERSION_HEX : longint; { return type might be wrong }
  begin
    PEAS_VERSION_HEX:=PEAS_ENCODE_VERSION(PEAS_MAJOR_VERSION,PEAS_MINOR_VERSION,PEAS_MICRO_VERSION);
  end;


end.


unit json_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from json_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    json_version
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


{ json-version.h - JSON-GLib versioning information
 * 
 * This file is part of JSON-GLib
 * Copyright (C) 2007  OpenedHand Ltd.
 * Copyright (C) 2009  Intel Corp.
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Author:
 *   Emmanuele Bassi  <ebassi@linux.intel.com>
  }
{$ifndef __JSON_VERSION_H__}
{$define __JSON_VERSION_H__}
{$if !defined(__JSON_GLIB_INSIDE__) && !defined(JSON_COMPILATION)}
{$error "Only <json-glib/json-glib.h> can be included directly."}
{$endif}
{*
 * JSON_MAJOR_VERSION:
 *
 * Json major version component (e.g. 1 if `JSON_VERSION` is "1.2.3")
  }

const
  JSON_MAJOR_VERSION = 1;  
{*
 * JSON_MINOR_VERSION:
 *
 * Json minor version component (e.g. 2 if `JSON_VERSION` is "1.2.3")
  }
  JSON_MINOR_VERSION = 8;  
{*
 * JSON_MICRO_VERSION:
 *
 * Json micro version component (e.g. 3 if `JSON_VERSION` is "1.2.3")
  }
  JSON_MICRO_VERSION = 0;  
{*
 * JSON_VERSION
 *
 * The version of JSON-GLib.
  }
  JSON_VERSION = 1.8.0;  
{*
 * JSON_VERSION_S:
 *
 * The version of JSON-GLib, encoded as a string, useful for printing and
 * concatenation.
  }
  JSON_VERSION_S = '1.8.0';  
{*
 * JSON_ENCODE_VERSION:
 * @major: (type int): the major version to encode
 * @minor: (type int): the minor version to encode
 * @micro: (type int): the micro version to encode
 *
 * Encodes a JSON-GLib version in an hexadecimal number, useful for
 * integer comparisons.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function JSON_ENCODE_VERSION(major,minor,micro : longint) : longint;

{*
 * JSON_VERSION_HEX:
 *
 * The version of JSON-GLib, encoded as an hexadecimal number, useful for
 * integer comparisons.
  }
{ was #define dname def_expr }
function JSON_VERSION_HEX : longint; { return type might be wrong }

{*
 * JSON_CHECK_VERSION:
 * @major: required major version
 * @minor: required minor version
 * @micro: required micro version
 *
 * Compile-time version checking. Evaluates to `TRUE` if the version
 * of JSON-GLib is greater than the required one.
  }
{ xxxxxxxxxxxxx
#define JSON_CHECK_VERSION(major,minor,micro)   \
        (JSON_MAJOR_VERSION > (major) || \
         (JSON_MAJOR_VERSION == (major) && JSON_MINOR_VERSION > (minor)) || \
         (JSON_MAJOR_VERSION == (major) && JSON_MINOR_VERSION == (minor) && \
          JSON_MICRO_VERSION >= (micro)))
 }
{$endif}
{ __JSON_VERSION_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JSON_ENCODE_VERSION(major,minor,micro : longint) : longint;
begin
  JSON_ENCODE_VERSION:=((major shl 24) or (minor shl 16)) or (micro shl 8);
end;

{ was #define dname def_expr }
function JSON_VERSION_HEX : longint; { return type might be wrong }
  begin
    JSON_VERSION_HEX:=JSON_ENCODE_VERSION(JSON_MAJOR_VERSION,JSON_MINOR_VERSION,JSON_MICRO_VERSION);
  end;


end.

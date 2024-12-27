
unit hb_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_version.h
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
Pdword  = ^dword;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2011  Google, Inc.
 *
 *  This is part of HarfBuzz, a text shaping library.
 *
 * Permission is hereby granted, without written agreement and without
 * license or royalty fees, to use, copy, modify, and distribute this
 * software and its documentation for any purpose, provided that the
 * above copyright notice and the following two paragraphs appear in
 * all copies of this software.
 *
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
 * ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN
 * IF THE COPYRIGHT HOLDER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 *
 * THE COPYRIGHT HOLDER SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING,
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
 * ON AN "AS IS" BASIS, AND THE COPYRIGHT HOLDER HAS NO OBLIGATION TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
 *
 * Google Author(s): Behdad Esfahbod
  }
{$if !defined(HB_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)}
{$error "Include <hb.h> instead."}
{$endif}
{$ifndef HB_VERSION_H}
{$define HB_VERSION_H}
{$include "hb-common.h"}
{*
 * HB_VERSION_MAJOR:
 *
 * The major component of the library version available at compile-time.
  }

const
  HB_VERSION_MAJOR = 8;  
{*
 * HB_VERSION_MINOR:
 *
 * The minor component of the library version available at compile-time.
  }
  HB_VERSION_MINOR = 3;  
{*
 * HB_VERSION_MICRO:
 *
 * The micro component of the library version available at compile-time.
  }
  HB_VERSION_MICRO = 0;  
{*
 * HB_VERSION_STRING:
 *
 * A string literal containing the library version available at compile-time.
  }
  HB_VERSION_STRING = '8.3.0';  
{*
 * HB_VERSION_ATLEAST:
 * @major: the major component of the version number
 * @minor: the minor component of the version number
 * @micro: the micro component of the version number
 *
 * Tests the library version at compile-time against a minimum value,
 * as three integer components.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function HB_VERSION_ATLEAST(major,minor,micro : longint) : longint;

procedure hb_version(major:Pdword; minor:Pdword; micro:Pdword);cdecl;external;
(* Const before type ignored *)
function hb_version_string:Pchar;cdecl;external;
function hb_version_atleast(major:dword; minor:dword; micro:dword):Thb_bool_t;cdecl;external;
{$endif}
{ HB_VERSION_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HB_VERSION_ATLEAST(major,minor,micro : longint) : longint;
begin
  HB_VERSION_ATLEAST:=(((major*10000)+(minor*100))+micro)<=(((HB_VERSION_MAJOR*10000)+(HB_VERSION_MINOR*100))+HB_VERSION_MICRO);
end;


end.

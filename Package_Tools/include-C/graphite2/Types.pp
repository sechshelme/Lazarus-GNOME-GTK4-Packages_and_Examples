
unit Types;
interface

{
  Automatically converted by H2Pas 1.0.0 from Types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Types.h
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
Pgr_byte  = ^gr_byte;
Pgr_encform  = ^gr_encform;
Pgr_int16  = ^gr_int16;
Pgr_int32  = ^gr_int32;
Pgr_int8  = ^gr_int8;
Pgr_uint16  = ^gr_uint16;
Pgr_uint32  = ^gr_uint32;
Pgr_uint8  = ^gr_uint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{  GRAPHITE2 LICENSING

    Copyright 2010, SIL International
    All rights reserved.

    This library is free software; you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published
    by the Free Software Foundation; either version 2.1 of License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should also have received a copy of the GNU Lesser General Public
    License along with this library in the file named "LICENSE".
    If not, write to the Free Software Foundation, 51 Franklin Street,
    Suite 500, Boston, MA 02110-1335, USA or visit their web page on the
    internet at http://www.fsf.org/licenses/lgpl.html.

    Alternatively, the contents of this file may be used under the terms
    of the Mozilla Public License (http://mozilla.org/MPL) or the GNU
    General Public License, as published by the Free Software Foundation,
    either version 2 of the License or (at your option) any later version.
 }
(** unsupported pragma#pragma once*)
{$include <stddef.h>}
type
  Pgr_uint8 = ^Tgr_uint8;
  Tgr_uint8 = byte;

  Pgr_byte = ^Tgr_byte;
  Tgr_byte = Tgr_uint8;

  Pgr_int8 = ^Tgr_int8;
  Tgr_int8 = char;

  Pgr_uint16 = ^Tgr_uint16;
  Tgr_uint16 = word;

  Pgr_int16 = ^Tgr_int16;
  Tgr_int16 = smallint;

  Pgr_uint32 = ^Tgr_uint32;
  Tgr_uint32 = dword;

  Pgr_int32 = ^Tgr_int32;
  Tgr_int32 = longint;
{sizeof(uint8) }{sizeof(uint16) }{sizeof(uint32) }
  Tgr_encform =  Longint;
  Const
    gr_utf8 = 1;
    gr_utf16 = 2;
    gr_utf32 = 4;

{ Define API function declspec/attributes and how each supported compiler or OS }
{ allows us to specify them. }
{$if defined __GNUC__}
{  #define _gr2_and , }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function _gr2_tag_fn(a : longint) : longint;

const
  _gr2_deprecated_flag = deprecated;  

{ was #define dname def_expr }
function _gr2_export_flag : longint; { return type might be wrong }

{ was #define dname def_expr }
function _gr2_import_flag : longint; { return type might be wrong }

{ was #define dname def_expr }
function _gr2_static_flag : longint; { return type might be wrong }

{$endif}
{$if defined _WIN32 || defined __CYGWIN__}
{$if defined __GNUC__  // These three will be redefined for Windows}
{$undef _gr2_export_flag}
{$undef _gr2_import_flag}
{$undef _gr2_static_flag}
{$else}
{ How MSVC sepcifies function level attributes adn deprecation }
{$define _gr2_and}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function _gr2_tag_fn(a : longint) : longint;

const
  _gr2_deprecated_flag = deprecated;  
{$endif}

const
  _gr2_export_flag = dllexport;  
  _gr2_import_flag = dllimport;  
{$define _gr2_static_flag}
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _gr2_tag_fn(a : longint) : longint;
begin
  _gr2_tag_fn:=__attribute__(a);
end;

{ was #define dname def_expr }
function _gr2_export_flag : longint; { return type might be wrong }
  begin
    _gr2_export_flag:=visibility('default');
  end;

{ was #define dname def_expr }
function _gr2_import_flag : longint; { return type might be wrong }
  begin
    _gr2_import_flag:=visibility('default');
  end;

{ was #define dname def_expr }
function _gr2_static_flag : longint; { return type might be wrong }
  begin
    _gr2_static_flag:=visibility('hidden');
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _gr2_tag_fn(a : longint) : longint;
begin
  _gr2_tag_fn:=__declspec(a);
end;


end.

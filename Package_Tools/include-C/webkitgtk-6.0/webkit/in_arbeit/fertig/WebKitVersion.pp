
unit WebKitVersion;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitVersion.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitVersion.h
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
 * Copyright (C) 2012 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitVersion_h}
{$define WebKitVersion_h}
{$include <webkit/WebKitDefines.h>}

const
  WEBKIT_MAJOR_VERSION = 2;  
  WEBKIT_MINOR_VERSION = 46;  
  WEBKIT_MICRO_VERSION = 4;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function WEBKIT_CHECK_VERSION(major,minor,micro : longint) : longint;

function webkit_get_major_version:Tguint;cdecl;external;
function webkit_get_minor_version:Tguint;cdecl;external;
function webkit_get_micro_version:Tguint;cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WEBKIT_CHECK_VERSION(major,minor,micro : longint) : longint;
begin
  WEBKIT_CHECK_VERSION:=WEBKIT_MAJOR_VERSION>((major or ((WEBKIT_MAJOR_VERSION=(Tmajor(@(@(WEBKIT_MINOR_VERSION)))))>minor)) or (((WEBKIT_MAJOR_VERSION=(Tmajor(@(@(WEBKIT_MINOR_VERSION)))))=(Tminor(@(@(WEBKIT_MICRO_VERSION)))))>=micro));
end;


end.


unit gmime_filter_windows;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_filter_windows.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_filter_windows.h
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
PGMimeFilter  = ^GMimeFilter;
PGMimeFilterWindows  = ^GMimeFilterWindows;
PGMimeFilterWindowsClass  = ^GMimeFilterWindowsClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_FILTER_WINDOWS_H__}
{$define __GMIME_FILTER_WINDOWS_H__}
{$include <gmime/gmime-filter.h>}

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_WINDOWS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_WINDOWS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_WINDOWS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_WINDOWS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_WINDOWS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_WINDOWS_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeFilterWindows:
 * @parent_object: parent #GMimeFilter
 * @is_windows: %TRUE if the stream is detected to be a windows-cp125x charset
 * @claimed_charset: charset the text stream is claimed to be
 *
 * A filter for detecting whether or not a text stream claimed to be
 * iso-8859-X is really that charset or if it is really a
 * Windows-CP125x charset.
 * }
  PGMimeFilterWindows = ^TGMimeFilterWindows;
  TGMimeFilterWindows = record
      parent_object : TGMimeFilter;
      is_windows : Tgboolean;
      claimed_charset : Pchar;
    end;

  PGMimeFilterWindowsClass = ^TGMimeFilterWindowsClass;
  TGMimeFilterWindowsClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_windows_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_mime_filter_windows_new(claimed_charset:Pchar):PGMimeFilter;cdecl;external;
function g_mime_filter_windows_is_windows_charset(filter:PGMimeFilterWindows):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_mime_filter_windows_real_charset(filter:PGMimeFilterWindows):Pchar;cdecl;external;
{$endif}
{ __GMIME_FILTER_WINDOWS_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_WINDOWS : longint; { return type might be wrong }
  begin
    GMIME_TYPE_FILTER_WINDOWS:=g_mime_filter_windows_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_WINDOWS(obj : longint) : longint;
begin
  GMIME_FILTER_WINDOWS:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_FILTER_WINDOWS,GMimeFilterWindows);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_WINDOWS_CLASS(klass : longint) : longint;
begin
  GMIME_FILTER_WINDOWS_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_FILTER_WINDOWS,GMimeFilterWindowsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_WINDOWS(obj : longint) : longint;
begin
  GMIME_IS_FILTER_WINDOWS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_FILTER_WINDOWS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_WINDOWS_CLASS(klass : longint) : longint;
begin
  GMIME_IS_FILTER_WINDOWS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_FILTER_WINDOWS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_WINDOWS_GET_CLASS(obj : longint) : longint;
begin
  GMIME_FILTER_WINDOWS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_FILTER_WINDOWS,GMimeFilterWindowsClass);
end;


end.

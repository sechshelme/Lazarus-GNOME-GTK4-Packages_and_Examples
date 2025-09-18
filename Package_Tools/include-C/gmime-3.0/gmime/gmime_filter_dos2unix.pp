
unit gmime_filter_dos2unix;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_filter_dos2unix.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_filter_dos2unix.h
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
PGMimeFilter  = ^GMimeFilter;
PGMimeFilterDos2Unix  = ^GMimeFilterDos2Unix;
PGMimeFilterDos2UnixClass  = ^GMimeFilterDos2UnixClass;
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
{$ifndef __GMIME_FILTER_DOS2UNIX_H__}
{$define __GMIME_FILTER_DOS2UNIX_H__}
{$include <gmime/gmime-filter.h>}

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_DOS2UNIX : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_DOS2UNIX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_DOS2UNIX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_DOS2UNIX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_DOS2UNIX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_DOS2UNIX_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeFilterDos2Unix:
 * @parent_object: parent #GMimeFilter
 * @ensure_newline: %TRUE if the filter should ensure that the stream ends with a new line
 * @pc: the previous character encountered
 *
 * A filter to convert a stream from Windows/DOS line endings to Unix line endings.
 * }
  PGMimeFilterDos2Unix = ^TGMimeFilterDos2Unix;
  TGMimeFilterDos2Unix = record
      parent_object : TGMimeFilter;
      ensure_newline : Tgboolean;
      pc : char;
    end;

  PGMimeFilterDos2UnixClass = ^TGMimeFilterDos2UnixClass;
  TGMimeFilterDos2UnixClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_dos2unix_get_type:TGType;cdecl;external;
function g_mime_filter_dos2unix_new(ensure_newline:Tgboolean):PGMimeFilter;cdecl;external;
{$endif}
{ __GMIME_FILTER_DOS2UNIX_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_DOS2UNIX : longint; { return type might be wrong }
  begin
    GMIME_TYPE_FILTER_DOS2UNIX:=g_mime_filter_dos2unix_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_DOS2UNIX(obj : longint) : longint;
begin
  GMIME_FILTER_DOS2UNIX:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_FILTER_DOS2UNIX,GMimeFilterDos2Unix);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_DOS2UNIX_CLASS(klass : longint) : longint;
begin
  GMIME_FILTER_DOS2UNIX_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_FILTER_DOS2UNIX,GMimeFilterDos2UnixClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_DOS2UNIX(obj : longint) : longint;
begin
  GMIME_IS_FILTER_DOS2UNIX:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_FILTER_DOS2UNIX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_DOS2UNIX_CLASS(klass : longint) : longint;
begin
  GMIME_IS_FILTER_DOS2UNIX_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_FILTER_DOS2UNIX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_DOS2UNIX_GET_CLASS(obj : longint) : longint;
begin
  GMIME_FILTER_DOS2UNIX_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_FILTER_DOS2UNIX,GMimeFilterDos2UnixClass);
end;


end.

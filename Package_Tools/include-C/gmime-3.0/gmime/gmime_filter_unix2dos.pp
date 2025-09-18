
unit gmime_filter_unix2dos;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_filter_unix2dos.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_filter_unix2dos.h
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
PGMimeFilterUnix2Dos  = ^GMimeFilterUnix2Dos;
PGMimeFilterUnix2DosClass  = ^GMimeFilterUnix2DosClass;
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
{$ifndef __GMIME_FILTER_UNIX2DOS_H__}
{$define __GMIME_FILTER_UNIX2DOS_H__}
{$include <gmime/gmime-filter.h>}

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_UNIX2DOS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_UNIX2DOS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_UNIX2DOS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_UNIX2DOS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_UNIX2DOS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_UNIX2DOS_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeFilterUnix2Dos:
 * @parent_object: parent #GMimeFilter
 * @ensure_newline: %TRUE if the filter should ensure that the stream ends with a new line
 * @pc: the previous character encountered
 *
 * A filter to convert a stream from Windows/DOS line endings to Unix line endings.
 * }
  PGMimeFilterUnix2Dos = ^TGMimeFilterUnix2Dos;
  TGMimeFilterUnix2Dos = record
      parent_object : TGMimeFilter;
      ensure_newline : Tgboolean;
      pc : char;
    end;

  PGMimeFilterUnix2DosClass = ^TGMimeFilterUnix2DosClass;
  TGMimeFilterUnix2DosClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_unix2dos_get_type:TGType;cdecl;external;
function g_mime_filter_unix2dos_new(ensure_newline:Tgboolean):PGMimeFilter;cdecl;external;
{$endif}
{ __GMIME_FILTER_UNIX2DOS_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_UNIX2DOS : longint; { return type might be wrong }
  begin
    GMIME_TYPE_FILTER_UNIX2DOS:=g_mime_filter_unix2dos_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_UNIX2DOS(obj : longint) : longint;
begin
  GMIME_FILTER_UNIX2DOS:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_FILTER_UNIX2DOS,GMimeFilterUnix2Dos);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_UNIX2DOS_CLASS(klass : longint) : longint;
begin
  GMIME_FILTER_UNIX2DOS_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_FILTER_UNIX2DOS,GMimeFilterUnix2DosClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_UNIX2DOS(obj : longint) : longint;
begin
  GMIME_IS_FILTER_UNIX2DOS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_FILTER_UNIX2DOS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_UNIX2DOS_CLASS(klass : longint) : longint;
begin
  GMIME_IS_FILTER_UNIX2DOS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_FILTER_UNIX2DOS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_UNIX2DOS_GET_CLASS(obj : longint) : longint;
begin
  GMIME_FILTER_UNIX2DOS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_FILTER_UNIX2DOS,GMimeFilterUnix2DosClass);
end;


end.

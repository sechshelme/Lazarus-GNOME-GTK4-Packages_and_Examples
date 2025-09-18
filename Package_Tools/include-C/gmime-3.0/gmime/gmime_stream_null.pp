
unit gmime_stream_null;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_stream_null.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_stream_null.h
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
PGMimeStream  = ^GMimeStream;
PGMimeStreamNull  = ^GMimeStreamNull;
PGMimeStreamNullClass  = ^GMimeStreamNullClass;
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
{$ifndef __GMIME_STREAM_NULL_H__}
{$define __GMIME_STREAM_NULL_H__}
{$include <glib.h>}
{$include <gmime/gmime-stream.h>}

{ was #define dname def_expr }
function GMIME_TYPE_STREAM_NULL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_NULL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_NULL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_NULL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_NULL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_NULL_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeStreamNull:
 * @parent_object: parent #GMimeStream
 * @written: number of bytes written to this stream
 * @newlines: the number of newlines written to this stream
 * @count_newlines: whether or not the stream should count newlines
 *
 * A #GMimeStream which has no backing store.
 * }
  PGMimeStreamNull = ^TGMimeStreamNull;
  TGMimeStreamNull = record
      parent_object : TGMimeStream;
      written : Tsize_t;
      newlines : Tsize_t;
      count_newlines : Tgboolean;
    end;

  PGMimeStreamNullClass = ^TGMimeStreamNullClass;
  TGMimeStreamNullClass = record
      parent_class : TGMimeStreamClass;
    end;


function g_mime_stream_null_get_type:TGType;cdecl;external;
function g_mime_stream_null_new:PGMimeStream;cdecl;external;
procedure g_mime_stream_null_set_count_newlines(stream:PGMimeStreamNull; count:Tgboolean);cdecl;external;
function g_mime_stream_null_get_count_newlines(stream:PGMimeStreamNull):Tgboolean;cdecl;external;
{$endif}
{ __GMIME_STREAM_NULL_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_STREAM_NULL : longint; { return type might be wrong }
  begin
    GMIME_TYPE_STREAM_NULL:=g_mime_stream_null_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_NULL(obj : longint) : longint;
begin
  GMIME_STREAM_NULL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_STREAM_NULL,GMimeStreamNull);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_NULL_CLASS(klass : longint) : longint;
begin
  GMIME_STREAM_NULL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_STREAM_NULL,GMimeStreamNullClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_NULL(obj : longint) : longint;
begin
  GMIME_IS_STREAM_NULL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_STREAM_NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_NULL_CLASS(klass : longint) : longint;
begin
  GMIME_IS_STREAM_NULL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_STREAM_NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_NULL_GET_CLASS(obj : longint) : longint;
begin
  GMIME_STREAM_NULL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_STREAM_NULL,GMimeStreamNullClass);
end;


end.

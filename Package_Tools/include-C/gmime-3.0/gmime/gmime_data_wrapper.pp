
unit gmime_data_wrapper;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_data_wrapper.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_data_wrapper.h
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
PGMimeDataWrapper  = ^GMimeDataWrapper;
PGMimeDataWrapperClass  = ^GMimeDataWrapperClass;
PGMimeStream  = ^GMimeStream;
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
{$ifndef __GMIME_DATA_WRAPPER_H__}
{$define __GMIME_DATA_WRAPPER_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gmime/gmime-content-type.h>}
{$include <gmime/gmime-encodings.h>}
{$include <gmime/gmime-stream.h>}
{$include <gmime/gmime-utils.h>}

{ was #define dname def_expr }
function GMIME_TYPE_DATA_WRAPPER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_DATA_WRAPPER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_DATA_WRAPPER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_DATA_WRAPPER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_DATA_WRAPPER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_DATA_WRAPPER_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeDataWrapper:
 * @parent_object: parent #GObject
 * @encoding: the encoding of the content
 * @stream: content stream
 *
 * A wrapper for a stream which may be encoded.
 * }
  PGMimeDataWrapper = ^TGMimeDataWrapper;
  TGMimeDataWrapper = record
      parent_object : TGObject;
      encoding : TGMimeContentEncoding;
      stream : PGMimeStream;
    end;

  PGMimeDataWrapperClass = ^TGMimeDataWrapperClass;
  TGMimeDataWrapperClass = record
      parent_class : TGObjectClass;
      write_to_stream : function (wrapper:PGMimeDataWrapper; stream:PGMimeStream):Tssize_t;cdecl;
    end;


function g_mime_data_wrapper_get_type:TGType;cdecl;external;
function g_mime_data_wrapper_new:PGMimeDataWrapper;cdecl;external;
function g_mime_data_wrapper_new_with_stream(stream:PGMimeStream; encoding:TGMimeContentEncoding):PGMimeDataWrapper;cdecl;external;
procedure g_mime_data_wrapper_set_stream(wrapper:PGMimeDataWrapper; stream:PGMimeStream);cdecl;external;
function g_mime_data_wrapper_get_stream(wrapper:PGMimeDataWrapper):PGMimeStream;cdecl;external;
procedure g_mime_data_wrapper_set_encoding(wrapper:PGMimeDataWrapper; encoding:TGMimeContentEncoding);cdecl;external;
function g_mime_data_wrapper_get_encoding(wrapper:PGMimeDataWrapper):TGMimeContentEncoding;cdecl;external;
function g_mime_data_wrapper_write_to_stream(wrapper:PGMimeDataWrapper; stream:PGMimeStream):Tssize_t;cdecl;external;
{$endif}
{ __GMIME_DATA_WRAPPER_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_DATA_WRAPPER : longint; { return type might be wrong }
  begin
    GMIME_TYPE_DATA_WRAPPER:=g_mime_data_wrapper_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_DATA_WRAPPER(obj : longint) : longint;
begin
  GMIME_DATA_WRAPPER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_DATA_WRAPPER,GMimeDataWrapper);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_DATA_WRAPPER_CLASS(klass : longint) : longint;
begin
  GMIME_DATA_WRAPPER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_DATA_WRAPPER,GMimeDataWrapperClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_DATA_WRAPPER(obj : longint) : longint;
begin
  GMIME_IS_DATA_WRAPPER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_DATA_WRAPPER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_DATA_WRAPPER_CLASS(klass : longint) : longint;
begin
  GMIME_IS_DATA_WRAPPER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_DATA_WRAPPER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_DATA_WRAPPER_GET_CLASS(obj : longint) : longint;
begin
  GMIME_DATA_WRAPPER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_DATA_WRAPPER,GMimeDataWrapperClass);
end;


end.

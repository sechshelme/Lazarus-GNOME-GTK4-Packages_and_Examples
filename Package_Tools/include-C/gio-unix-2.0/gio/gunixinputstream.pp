
unit gunixinputstream;
interface

{
  Automatically converted by H2Pas 1.0.0 from gunixinputstream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gunixinputstream.h
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
PGInputStream  = ^GInputStream;
PGUnixInputStream  = ^GUnixInputStream;
PGUnixInputStreamClass  = ^GUnixInputStreamClass;
PGUnixInputStreamPrivate  = ^GUnixInputStreamPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_UNIX_INPUT_STREAM_H__}
{$define __G_UNIX_INPUT_STREAM_H__}
{$include <gio/gio.h>}

{ was #define dname def_expr }
function G_TYPE_UNIX_INPUT_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_INPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_INPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_INPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_INPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_INPUT_STREAM_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGUnixInputStream = ^TGUnixInputStream;
  TGUnixInputStream = record
      parent_instance : TGInputStream;
      priv : PGUnixInputStreamPrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGUnixInputStreamClass = ^TGUnixInputStreamClass;
  TGUnixInputStreamClass = record
      parent_class : TGInputStreamClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_unix_input_stream_get_type:TGType;cdecl;external;
function g_unix_input_stream_new(fd:Tgint; close_fd:Tgboolean):PGInputStream;cdecl;external;
procedure g_unix_input_stream_set_close_fd(stream:PGUnixInputStream; close_fd:Tgboolean);cdecl;external;
function g_unix_input_stream_get_close_fd(stream:PGUnixInputStream):Tgboolean;cdecl;external;
function g_unix_input_stream_get_fd(stream:PGUnixInputStream):Tgint;cdecl;external;
{$endif}
{ __G_UNIX_INPUT_STREAM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_UNIX_INPUT_STREAM : longint; { return type might be wrong }
  begin
    G_TYPE_UNIX_INPUT_STREAM:=g_unix_input_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_INPUT_STREAM(o : longint) : longint;
begin
  G_UNIX_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_UNIX_INPUT_STREAM,GUnixInputStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_INPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_UNIX_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_UNIX_INPUT_STREAM,GUnixInputStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_INPUT_STREAM(o : longint) : longint;
begin
  G_IS_UNIX_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_UNIX_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_INPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_IS_UNIX_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_UNIX_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_INPUT_STREAM_GET_CLASS(o : longint) : longint;
begin
  G_UNIX_INPUT_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_UNIX_INPUT_STREAM,GUnixInputStreamClass);
end;


end.

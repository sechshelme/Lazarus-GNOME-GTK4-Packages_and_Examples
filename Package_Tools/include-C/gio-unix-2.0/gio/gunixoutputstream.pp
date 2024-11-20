
unit gunixoutputstream;
interface

{
  Automatically converted by H2Pas 1.0.0 from gunixoutputstream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gunixoutputstream.h
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
PGOutputStream  = ^GOutputStream;
PGUnixOutputStream  = ^GUnixOutputStream;
PGUnixOutputStreamClass  = ^GUnixOutputStreamClass;
PGUnixOutputStreamPrivate  = ^GUnixOutputStreamPrivate;
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
{$ifndef __G_UNIX_OUTPUT_STREAM_H__}
{$define __G_UNIX_OUTPUT_STREAM_H__}
{$include <gio/gio.h>}

{ was #define dname def_expr }
function G_TYPE_UNIX_OUTPUT_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_OUTPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_OUTPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_OUTPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_OUTPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_OUTPUT_STREAM_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGUnixOutputStream = ^TGUnixOutputStream;
  TGUnixOutputStream = record
      parent_instance : TGOutputStream;
      priv : PGUnixOutputStreamPrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGUnixOutputStreamClass = ^TGUnixOutputStreamClass;
  TGUnixOutputStreamClass = record
      parent_class : TGOutputStreamClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_unix_output_stream_get_type:TGType;cdecl;external;
function g_unix_output_stream_new(fd:Tgint; close_fd:Tgboolean):PGOutputStream;cdecl;external;
procedure g_unix_output_stream_set_close_fd(stream:PGUnixOutputStream; close_fd:Tgboolean);cdecl;external;
function g_unix_output_stream_get_close_fd(stream:PGUnixOutputStream):Tgboolean;cdecl;external;
function g_unix_output_stream_get_fd(stream:PGUnixOutputStream):Tgint;cdecl;external;
{$endif}
{ __G_UNIX_OUTPUT_STREAM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_UNIX_OUTPUT_STREAM : longint; { return type might be wrong }
  begin
    G_TYPE_UNIX_OUTPUT_STREAM:=g_unix_output_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_OUTPUT_STREAM(o : longint) : longint;
begin
  G_UNIX_OUTPUT_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_UNIX_OUTPUT_STREAM,GUnixOutputStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_OUTPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_UNIX_OUTPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_UNIX_OUTPUT_STREAM,GUnixOutputStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_OUTPUT_STREAM(o : longint) : longint;
begin
  G_IS_UNIX_OUTPUT_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_UNIX_OUTPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_OUTPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_IS_UNIX_OUTPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_UNIX_OUTPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_OUTPUT_STREAM_GET_CLASS(o : longint) : longint;
begin
  G_UNIX_OUTPUT_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_UNIX_OUTPUT_STREAM,GUnixOutputStreamClass);
end;


end.

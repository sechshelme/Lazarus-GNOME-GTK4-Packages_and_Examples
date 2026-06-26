
unit gmemoryinputstream;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmemoryinputstream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmemoryinputstream.h
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
PGBytes  = ^GBytes;
PGInputStream  = ^GInputStream;
PGMemoryInputStream  = ^GMemoryInputStream;
PGMemoryInputStreamClass  = ^GMemoryInputStreamClass;
PGMemoryInputStreamPrivate  = ^GMemoryInputStreamPrivate;
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
 * Author: Christian Kellner <gicmo@gnome.org>
  }
{$ifndef __G_MEMORY_INPUT_STREAM_H__}
{$define __G_MEMORY_INPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/ginputstream.h>}

{ was #define dname def_expr }
function G_TYPE_MEMORY_INPUT_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MEMORY_INPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MEMORY_INPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MEMORY_INPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MEMORY_INPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MEMORY_INPUT_STREAM_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGMemoryInputStream = ^TGMemoryInputStream;
  TGMemoryInputStream = record
      parent_instance : TGInputStream;
      priv : PGMemoryInputStreamPrivate;
    end;

{ Padding for future expansion  }
  PGMemoryInputStreamClass = ^TGMemoryInputStreamClass;
  TGMemoryInputStreamClass = record
      parent_class : TGInputStreamClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_memory_input_stream_get_type:TGType;cdecl;external;
function g_memory_input_stream_new:PGInputStream;cdecl;external;
(* Const before type ignored *)
function g_memory_input_stream_new_from_data(data:pointer; len:Tgssize; destroy:TGDestroyNotify):PGInputStream;cdecl;external;
function g_memory_input_stream_new_from_bytes(bytes:PGBytes):PGInputStream;cdecl;external;
(* Const before type ignored *)
procedure g_memory_input_stream_add_data(stream:PGMemoryInputStream; data:pointer; len:Tgssize; destroy:TGDestroyNotify);cdecl;external;
procedure g_memory_input_stream_add_bytes(stream:PGMemoryInputStream; bytes:PGBytes);cdecl;external;
{$endif}
{ __G_MEMORY_INPUT_STREAM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_MEMORY_INPUT_STREAM : longint; { return type might be wrong }
  begin
    G_TYPE_MEMORY_INPUT_STREAM:=g_memory_input_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MEMORY_INPUT_STREAM(o : longint) : longint;
begin
  G_MEMORY_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_MEMORY_INPUT_STREAM,GMemoryInputStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MEMORY_INPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_MEMORY_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_MEMORY_INPUT_STREAM,GMemoryInputStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MEMORY_INPUT_STREAM(o : longint) : longint;
begin
  G_IS_MEMORY_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_MEMORY_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MEMORY_INPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_IS_MEMORY_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_MEMORY_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MEMORY_INPUT_STREAM_GET_CLASS(o : longint) : longint;
begin
  G_MEMORY_INPUT_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_MEMORY_INPUT_STREAM,GMemoryInputStreamClass);
end;


end.

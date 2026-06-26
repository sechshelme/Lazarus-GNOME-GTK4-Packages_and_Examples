unit gfilteroutputstream;

interface

uses
  fp_glib2;

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
{$ifndef __G_FILTER_OUTPUT_STREAM_H__}
{$define __G_FILTER_OUTPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/goutputstream.h>}

type
{< protected > }
  PGFilterOutputStream = ^TGFilterOutputStream;
  TGFilterOutputStream = record
      parent_instance : TGOutputStream;
      base_stream : PGOutputStream;
    end;

{< private > }
{ Padding for future expansion  }
  PGFilterOutputStreamClass = ^TGFilterOutputStreamClass;
  TGFilterOutputStreamClass = record
      parent_class : TGOutputStreamClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
    end;


function g_filter_output_stream_get_type:TGType;cdecl;external libgio2;
function g_filter_output_stream_get_base_stream(stream:PGFilterOutputStream):PGOutputStream;cdecl;external libgio2;
function g_filter_output_stream_get_close_base_stream(stream:PGFilterOutputStream):Tgboolean;cdecl;external libgio2;
procedure g_filter_output_stream_set_close_base_stream(stream:PGFilterOutputStream; close_base:Tgboolean);cdecl;external libgio2;
{$endif}
{ __G_FILTER_OUTPUT_STREAM_H__  }

// === Konventiert am: 26-6-26 19:26:30 ===

function G_TYPE_FILTER_OUTPUT_STREAM : TGType;
function G_FILTER_OUTPUT_STREAM(obj : Pointer) : PGFilterOutputStream;
function G_FILTER_OUTPUT_STREAM_CLASS(klass : Pointer) : PGFilterOutputStreamClass;
function G_IS_FILTER_OUTPUT_STREAM(obj : Pointer) : Tgboolean;
function G_IS_FILTER_OUTPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
function G_FILTER_OUTPUT_STREAM_GET_CLASS(obj : Pointer) : PGFilterOutputStreamClass;

implementation

function G_TYPE_FILTER_OUTPUT_STREAM : TGType;
  begin
    G_TYPE_FILTER_OUTPUT_STREAM:=g_filter_output_stream_get_type;
  end;

function G_FILTER_OUTPUT_STREAM(obj : Pointer) : PGFilterOutputStream;
begin
  Result := PGFilterOutputStream(g_type_check_instance_cast(obj, G_TYPE_FILTER_OUTPUT_STREAM));
end;

function G_FILTER_OUTPUT_STREAM_CLASS(klass : Pointer) : PGFilterOutputStreamClass;
begin
  Result := PGFilterOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_FILTER_OUTPUT_STREAM));
end;

function G_IS_FILTER_OUTPUT_STREAM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_FILTER_OUTPUT_STREAM);
end;

function G_IS_FILTER_OUTPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_FILTER_OUTPUT_STREAM);
end;

function G_FILTER_OUTPUT_STREAM_GET_CLASS(obj : Pointer) : PGFilterOutputStreamClass;
begin
  Result := PGFilterOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.

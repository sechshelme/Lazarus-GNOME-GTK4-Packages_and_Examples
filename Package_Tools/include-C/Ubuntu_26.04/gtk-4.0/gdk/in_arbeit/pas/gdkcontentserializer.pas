unit gdkcontentserializer;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2017 Benjamin Otte
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

type
{*
 * GdkContentSerializeFunc:
 * @serializer: a `GdkContentSerializer`
 *
 * The type of a function that can be registered with gdk_content_register_serializer().
 *
 * When the function gets called to operate on content, it can call functions on the
 * @serializer object to obtain the mime type, output stream, user data, etc. for its
 * operation.
  }

  TGdkContentSerializeFunc = procedure (serializer:PGdkContentSerializer);cdecl;

function gdk_content_serializer_get_type:TGType;cdecl;external libgtk4;
function gdk_content_serializer_get_mime_type(serializer:PGdkContentSerializer):Pchar;cdecl;external libgtk4;
function gdk_content_serializer_get_gtype(serializer:PGdkContentSerializer):TGType;cdecl;external libgtk4;
function gdk_content_serializer_get_value(serializer:PGdkContentSerializer):PGValue;cdecl;external libgtk4;
function gdk_content_serializer_get_output_stream(serializer:PGdkContentSerializer):PGOutputStream;cdecl;external libgtk4;
function gdk_content_serializer_get_priority(serializer:PGdkContentSerializer):longint;cdecl;external libgtk4;
function gdk_content_serializer_get_cancellable(serializer:PGdkContentSerializer):PGCancellable;cdecl;external libgtk4;
function gdk_content_serializer_get_user_data(serializer:PGdkContentSerializer):Tgpointer;cdecl;external libgtk4;
procedure gdk_content_serializer_set_task_data(serializer:PGdkContentSerializer; data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgtk4;
function gdk_content_serializer_get_task_data(serializer:PGdkContentSerializer):Tgpointer;cdecl;external libgtk4;
procedure gdk_content_serializer_return_success(serializer:PGdkContentSerializer);cdecl;external libgtk4;
procedure gdk_content_serializer_return_error(serializer:PGdkContentSerializer; error:PGError);cdecl;external libgtk4;
function gdk_content_formats_union_serialize_gtypes(formats:PGdkContentFormats):PGdkContentFormats;cdecl;external libgtk4;
function gdk_content_formats_union_serialize_mime_types(formats:PGdkContentFormats):PGdkContentFormats;cdecl;external libgtk4;
procedure gdk_content_register_serializer(_type:TGType; mime_type:Pchar; serialize:TGdkContentSerializeFunc; data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgtk4;
procedure gdk_content_serialize_async(stream:PGOutputStream; mime_type:Pchar; value:PGValue; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gdk_content_serialize_finish(result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 2-7-26 17:29:24 ===

function GDK_TYPE_CONTENT_SERIALIZER : TGType;
function GDK_CONTENT_SERIALIZER(obj : Pointer) : PGdkContentSerializer;
function GDK_IS_CONTENT_SERIALIZER(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_CONTENT_SERIALIZER : TGType;
  begin
    GDK_TYPE_CONTENT_SERIALIZER:=gdk_content_serializer_get_type;
  end;

function GDK_CONTENT_SERIALIZER(obj : Pointer) : PGdkContentSerializer;
begin
  Result := PGdkContentSerializer(g_type_check_instance_cast(obj, GDK_TYPE_CONTENT_SERIALIZER));
end;

function GDK_IS_CONTENT_SERIALIZER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_CONTENT_SERIALIZER);
end;



end.

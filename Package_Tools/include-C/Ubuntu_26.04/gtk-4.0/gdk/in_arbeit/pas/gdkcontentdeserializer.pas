unit gdkcontentdeserializer;

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
 * GdkContentDeserializeFunc:
 * @deserializer: a `GdkContentDeserializer`
 *
 * The type of a function that can be registered with gdk_content_register_deserializer().
 *
 * When the function gets called to operate on content, it can call functions on the
 * @deserializer object to obtain the mime type, input stream, user data, etc. for its
 * operation.
  }

  TGdkContentDeserializeFunc = procedure (deserializer:PGdkContentDeserializer);cdecl;

function gdk_content_deserializer_get_type:TGType;cdecl;external libgtk4;
function gdk_content_deserializer_get_mime_type(deserializer:PGdkContentDeserializer):Pchar;cdecl;external libgtk4;
function gdk_content_deserializer_get_gtype(deserializer:PGdkContentDeserializer):TGType;cdecl;external libgtk4;
function gdk_content_deserializer_get_value(deserializer:PGdkContentDeserializer):PGValue;cdecl;external libgtk4;
function gdk_content_deserializer_get_input_stream(deserializer:PGdkContentDeserializer):PGInputStream;cdecl;external libgtk4;
function gdk_content_deserializer_get_priority(deserializer:PGdkContentDeserializer):longint;cdecl;external libgtk4;
function gdk_content_deserializer_get_cancellable(deserializer:PGdkContentDeserializer):PGCancellable;cdecl;external libgtk4;
function gdk_content_deserializer_get_user_data(deserializer:PGdkContentDeserializer):Tgpointer;cdecl;external libgtk4;
procedure gdk_content_deserializer_set_task_data(deserializer:PGdkContentDeserializer; data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgtk4;
function gdk_content_deserializer_get_task_data(deserializer:PGdkContentDeserializer):Tgpointer;cdecl;external libgtk4;
procedure gdk_content_deserializer_return_success(deserializer:PGdkContentDeserializer);cdecl;external libgtk4;
procedure gdk_content_deserializer_return_error(deserializer:PGdkContentDeserializer; error:PGError);cdecl;external libgtk4;
function gdk_content_formats_union_deserialize_gtypes(formats:PGdkContentFormats):PGdkContentFormats;cdecl;external libgtk4;
function gdk_content_formats_union_deserialize_mime_types(formats:PGdkContentFormats):PGdkContentFormats;cdecl;external libgtk4;
procedure gdk_content_register_deserializer(mime_type:Pchar; _type:TGType; deserialize:TGdkContentDeserializeFunc; data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgtk4;
procedure gdk_content_deserialize_async(stream:PGInputStream; mime_type:Pchar; _type:TGType; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gdk_content_deserialize_finish(result:PGAsyncResult; value:PGValue; error:PPGError):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 2-7-26 17:34:24 ===

function GDK_TYPE_CONTENT_DESERIALIZER : TGType;
function GDK_CONTENT_DESERIALIZER(obj : Pointer) : PGdkContentDeserializer;
function GDK_IS_CONTENT_DESERIALIZER(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_CONTENT_DESERIALIZER : TGType;
  begin
    GDK_TYPE_CONTENT_DESERIALIZER:=gdk_content_deserializer_get_type;
  end;

function GDK_CONTENT_DESERIALIZER(obj : Pointer) : PGdkContentDeserializer;
begin
  Result := PGdkContentDeserializer(g_type_check_instance_cast(obj, GDK_TYPE_CONTENT_DESERIALIZER));
end;

function GDK_IS_CONTENT_DESERIALIZER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_CONTENT_DESERIALIZER);
end;



end.

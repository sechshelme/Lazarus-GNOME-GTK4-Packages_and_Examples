
unit gdkcontentdeserializer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkcontentdeserializer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkcontentdeserializer.h
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
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGdkContentDeserializer  = ^GdkContentDeserializer;
PGdkContentFormats  = ^GdkContentFormats;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
PGValue  = ^GValue;
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

{ was #define dname def_expr }
function GDK_TYPE_CONTENT_DESERIALIZER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_CONTENT_DESERIALIZER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_CONTENT_DESERIALIZER(o : longint) : longint;

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

function gdk_content_deserializer_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gdk_content_deserializer_get_mime_type(deserializer:PGdkContentDeserializer):Pchar;cdecl;external;
function gdk_content_deserializer_get_gtype(deserializer:PGdkContentDeserializer):TGType;cdecl;external;
function gdk_content_deserializer_get_value(deserializer:PGdkContentDeserializer):PGValue;cdecl;external;
function gdk_content_deserializer_get_input_stream(deserializer:PGdkContentDeserializer):PGInputStream;cdecl;external;
function gdk_content_deserializer_get_priority(deserializer:PGdkContentDeserializer):longint;cdecl;external;
function gdk_content_deserializer_get_cancellable(deserializer:PGdkContentDeserializer):PGCancellable;cdecl;external;
function gdk_content_deserializer_get_user_data(deserializer:PGdkContentDeserializer):Tgpointer;cdecl;external;
procedure gdk_content_deserializer_set_task_data(deserializer:PGdkContentDeserializer; data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
function gdk_content_deserializer_get_task_data(deserializer:PGdkContentDeserializer):Tgpointer;cdecl;external;
procedure gdk_content_deserializer_return_success(deserializer:PGdkContentDeserializer);cdecl;external;
procedure gdk_content_deserializer_return_error(deserializer:PGdkContentDeserializer; error:PGError);cdecl;external;
function gdk_content_formats_union_deserialize_gtypes(formats:PGdkContentFormats):PGdkContentFormats;cdecl;external;
function gdk_content_formats_union_deserialize_mime_types(formats:PGdkContentFormats):PGdkContentFormats;cdecl;external;
(* Const before type ignored *)
procedure gdk_content_register_deserializer(mime_type:Pchar; _type:TGType; deserialize:TGdkContentDeserializeFunc; data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
procedure gdk_content_deserialize_async(stream:PGInputStream; mime_type:Pchar; _type:TGType; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gdk_content_deserialize_finish(result:PGAsyncResult; value:PGValue; error:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GDK_TYPE_CONTENT_DESERIALIZER : longint; { return type might be wrong }
  begin
    GDK_TYPE_CONTENT_DESERIALIZER:=gdk_content_deserializer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_CONTENT_DESERIALIZER(o : longint) : longint;
begin
  GDK_CONTENT_DESERIALIZER:=G_TYPE_CHECK_INSTANCE_CAST(o,GDK_TYPE_CONTENT_DESERIALIZER,GdkContentDeserializer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_CONTENT_DESERIALIZER(o : longint) : longint;
begin
  GDK_IS_CONTENT_DESERIALIZER:=G_TYPE_CHECK_INSTANCE_TYPE(o,GDK_TYPE_CONTENT_DESERIALIZER);
end;


end.

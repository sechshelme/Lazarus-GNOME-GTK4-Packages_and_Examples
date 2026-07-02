
unit gdkclipboard;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkclipboard.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkclipboard.h
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
PGdkClipboard  = ^GdkClipboard;
PGdkContentFormats  = ^GdkContentFormats;
PGdkContentProvider  = ^GdkContentProvider;
PGdkDisplay  = ^GdkDisplay;
PGdkTexture  = ^GdkTexture;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 *
 * Copyright (C) 2017 Benjamin Otte <otte@gnome.org>
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
function GDK_TYPE_CLIPBOARD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_CLIPBOARD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_CLIPBOARD(obj : longint) : longint;

function gdk_clipboard_get_type:TGType;cdecl;external;
function gdk_clipboard_get_display(clipboard:PGdkClipboard):PGdkDisplay;cdecl;external;
function gdk_clipboard_get_formats(clipboard:PGdkClipboard):PGdkContentFormats;cdecl;external;
function gdk_clipboard_is_local(clipboard:PGdkClipboard):Tgboolean;cdecl;external;
function gdk_clipboard_get_content(clipboard:PGdkClipboard):PGdkContentProvider;cdecl;external;
procedure gdk_clipboard_store_async(clipboard:PGdkClipboard; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gdk_clipboard_store_finish(clipboard:PGdkClipboard; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gdk_clipboard_read_async(clipboard:PGdkClipboard; mime_types:PPchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function gdk_clipboard_read_finish(clipboard:PGdkClipboard; result:PGAsyncResult; out_mime_type:PPchar; error:PPGError):PGInputStream;cdecl;external;
procedure gdk_clipboard_read_value_async(clipboard:PGdkClipboard; _type:TGType; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function gdk_clipboard_read_value_finish(clipboard:PGdkClipboard; result:PGAsyncResult; error:PPGError):PGValue;cdecl;external;
procedure gdk_clipboard_read_texture_async(clipboard:PGdkClipboard; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gdk_clipboard_read_texture_finish(clipboard:PGdkClipboard; result:PGAsyncResult; error:PPGError):PGdkTexture;cdecl;external;
procedure gdk_clipboard_read_text_async(clipboard:PGdkClipboard; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gdk_clipboard_read_text_finish(clipboard:PGdkClipboard; result:PGAsyncResult; error:PPGError):Pchar;cdecl;external;
function gdk_clipboard_set_content(clipboard:PGdkClipboard; provider:PGdkContentProvider):Tgboolean;cdecl;external;
procedure gdk_clipboard_set(clipboard:PGdkClipboard; _type:TGType; args:array of const);cdecl;external;
procedure gdk_clipboard_set(clipboard:PGdkClipboard; _type:TGType);cdecl;external;
procedure gdk_clipboard_set_valist(clipboard:PGdkClipboard; _type:TGType; args:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure gdk_clipboard_set_value(clipboard:PGdkClipboard; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure gdk_clipboard_set_text(clipboard:PGdkClipboard; text:Pchar);cdecl;external;
procedure gdk_clipboard_set_texture(clipboard:PGdkClipboard; texture:PGdkTexture);cdecl;external;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkClipboard, g_object_unref) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_CLIPBOARD : longint; { return type might be wrong }
  begin
    GDK_TYPE_CLIPBOARD:=gdk_clipboard_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_CLIPBOARD(obj : longint) : longint;
begin
  GDK_CLIPBOARD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GDK_TYPE_CLIPBOARD,GdkClipboard);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_CLIPBOARD(obj : longint) : longint;
begin
  GDK_IS_CLIPBOARD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GDK_TYPE_CLIPBOARD);
end;


end.

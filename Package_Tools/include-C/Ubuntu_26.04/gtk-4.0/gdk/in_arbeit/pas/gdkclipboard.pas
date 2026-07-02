unit gdkclipboard;

interface

uses
  fp_glib2, fp_gtk4;

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

function gdk_clipboard_get_type:TGType;cdecl;external libgtk4;
function gdk_clipboard_get_display(clipboard:PGdkClipboard):PGdkDisplay;cdecl;external libgtk4;
function gdk_clipboard_get_formats(clipboard:PGdkClipboard):PGdkContentFormats;cdecl;external libgtk4;
function gdk_clipboard_is_local(clipboard:PGdkClipboard):Tgboolean;cdecl;external libgtk4;
function gdk_clipboard_get_content(clipboard:PGdkClipboard):PGdkContentProvider;cdecl;external libgtk4;
procedure gdk_clipboard_store_async(clipboard:PGdkClipboard; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gdk_clipboard_store_finish(clipboard:PGdkClipboard; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libgtk4;
procedure gdk_clipboard_read_async(clipboard:PGdkClipboard; mime_types:PPchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgtk4;
function gdk_clipboard_read_finish(clipboard:PGdkClipboard; result:PGAsyncResult; out_mime_type:PPchar; error:PPGError):PGInputStream;cdecl;external libgtk4;
procedure gdk_clipboard_read_value_async(clipboard:PGdkClipboard; _type:TGType; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgtk4;
function gdk_clipboard_read_value_finish(clipboard:PGdkClipboard; result:PGAsyncResult; error:PPGError):PGValue;cdecl;external libgtk4;
procedure gdk_clipboard_read_texture_async(clipboard:PGdkClipboard; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gdk_clipboard_read_texture_finish(clipboard:PGdkClipboard; result:PGAsyncResult; error:PPGError):PGdkTexture;cdecl;external libgtk4;
procedure gdk_clipboard_read_text_async(clipboard:PGdkClipboard; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gdk_clipboard_read_text_finish(clipboard:PGdkClipboard; result:PGAsyncResult; error:PPGError):Pchar;cdecl;external libgtk4;
function gdk_clipboard_set_content(clipboard:PGdkClipboard; provider:PGdkContentProvider):Tgboolean;cdecl;external libgtk4;
procedure gdk_clipboard_set(clipboard:PGdkClipboard; _type:TGType; args:array of const);cdecl;external libgtk4;
procedure gdk_clipboard_set(clipboard:PGdkClipboard; _type:TGType);cdecl;external libgtk4;
procedure gdk_clipboard_set_valist(clipboard:PGdkClipboard; _type:TGType; args:Tva_list);cdecl;external libgtk4;
procedure gdk_clipboard_set_value(clipboard:PGdkClipboard; value:PGValue);cdecl;external libgtk4;
procedure gdk_clipboard_set_text(clipboard:PGdkClipboard; text:Pchar);cdecl;external libgtk4;
procedure gdk_clipboard_set_texture(clipboard:PGdkClipboard; texture:PGdkTexture);cdecl;external libgtk4;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkClipboard, g_object_unref) }

// === Konventiert am: 2-7-26 17:35:14 ===

function GDK_TYPE_CLIPBOARD : TGType;
function GDK_CLIPBOARD(obj : Pointer) : PGdkClipboard;
function GDK_IS_CLIPBOARD(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_CLIPBOARD : TGType;
  begin
    GDK_TYPE_CLIPBOARD:=gdk_clipboard_get_type;
  end;

function GDK_CLIPBOARD(obj : Pointer) : PGdkClipboard;
begin
  Result := PGdkClipboard(g_type_check_instance_cast(obj, GDK_TYPE_CLIPBOARD));
end;

function GDK_IS_CLIPBOARD(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_CLIPBOARD);
end;



end.

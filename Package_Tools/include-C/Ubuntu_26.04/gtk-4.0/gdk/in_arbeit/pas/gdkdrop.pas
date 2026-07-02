unit gdkdrop;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018 Benjamin Otte
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

function gdk_drop_get_type:TGType;cdecl;external libgtk4;
function gdk_drop_get_display(self:PGdkDrop):PGdkDisplay;cdecl;external libgtk4;
function gdk_drop_get_device(self:PGdkDrop):PGdkDevice;cdecl;external libgtk4;
function gdk_drop_get_surface(self:PGdkDrop):PGdkSurface;cdecl;external libgtk4;
function gdk_drop_get_formats(self:PGdkDrop):PGdkContentFormats;cdecl;external libgtk4;
function gdk_drop_get_actions(self:PGdkDrop):TGdkDragAction;cdecl;external libgtk4;
function gdk_drop_get_drag(self:PGdkDrop):PGdkDrag;cdecl;external libgtk4;
procedure gdk_drop_status(self:PGdkDrop; actions:TGdkDragAction; preferred:TGdkDragAction);cdecl;external libgtk4;
procedure gdk_drop_finish(self:PGdkDrop; action:TGdkDragAction);cdecl;external libgtk4;
procedure gdk_drop_read_async(self:PGdkDrop; mime_types:PPchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgtk4;
function gdk_drop_read_finish(self:PGdkDrop; result:PGAsyncResult; out_mime_type:PPchar; error:PPGError):PGInputStream;cdecl;external libgtk4;
procedure gdk_drop_read_value_async(self:PGdkDrop; _type:TGType; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgtk4;
function gdk_drop_read_value_finish(self:PGdkDrop; result:PGAsyncResult; error:PPGError):PGValue;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkDrop, g_object_unref) }

// === Konventiert am: 2-7-26 19:17:55 ===

function GDK_TYPE_DROP : TGType;
function GDK_DROP(obj : Pointer) : PGdkDrop;
function GDK_IS_DROP(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_DROP : TGType;
  begin
    GDK_TYPE_DROP:=gdk_drop_get_type;
  end;

function GDK_DROP(obj : Pointer) : PGdkDrop;
begin
  Result := PGdkDrop(g_type_check_instance_cast(obj, GDK_TYPE_DROP));
end;

function GDK_IS_DROP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_DROP);
end;



end.

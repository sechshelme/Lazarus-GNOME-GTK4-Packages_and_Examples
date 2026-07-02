unit gdksnapshot;

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
type

function gdk_snapshot_get_type:TGType;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkSnapshot, g_object_unref) }

// === Konventiert am: 2-7-26 19:26:20 ===

function GDK_TYPE_SNAPSHOT : TGType;
function GDK_SNAPSHOT(obj : Pointer) : PGdkSnapshot;
function GDK_IS_SNAPSHOT(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_SNAPSHOT : TGType;
  begin
    GDK_TYPE_SNAPSHOT:=gdk_snapshot_get_type;
  end;

function GDK_SNAPSHOT(obj : Pointer) : PGdkSnapshot;
begin
  Result := PGdkSnapshot(g_type_check_instance_cast(obj, GDK_TYPE_SNAPSHOT));
end;

function GDK_IS_SNAPSHOT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_SNAPSHOT);
end;



end.

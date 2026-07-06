unit gtkpasswordentrybuffer;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkpasswordentrybufferprivate.h: Entry buffer using secure allocation
 *
 * Copyright 2020  GNOME Foundation
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtkentrybuffer.h>}

{G_DECLARE_FINAL_TYPE (GtkPasswordEntryBuffer, gtk_password_entry_buffer, GTK, PASSWORD_ENTRY_BUFFER, GtkEntryBuffer) }
function gtk_password_entry_buffer_new:PGtkEntryBuffer;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:18:15 ===

function GTK_TYPE_PASSWORD_ENTRY_BUFFER: TGType;
function GTK_PASSWORD_ENTRY_BUFFER(obj: Pointer): PGtkPasswordEntryBuffer;
function GTK_IS_PASSWORD_ENTRY_BUFFER(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_PASSWORD_ENTRY_BUFFER: TGType;
begin
  Result := gtk_password_entry_buffer_get_type;
end;

function GTK_PASSWORD_ENTRY_BUFFER(obj: Pointer): PGtkPasswordEntryBuffer;
begin
  Result := PGtkPasswordEntryBuffer(g_type_check_instance_cast(obj, GTK_TYPE_PASSWORD_ENTRY_BUFFER));
end;

function GTK_IS_PASSWORD_ENTRY_BUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_PASSWORD_ENTRY_BUFFER);
end;

type 
  PGtkPasswordEntryBuffer = type Pointer;

  TGtkPasswordEntryBufferClass = record
    parent_class: TGtkEntryBufferClass;
  end;
  PGtkPasswordEntryBufferClass = ^TGtkPasswordEntryBufferClass;

function gtk_password_entry_buffer_get_type: TGType; cdecl; external libgxxxxxxx;



end.

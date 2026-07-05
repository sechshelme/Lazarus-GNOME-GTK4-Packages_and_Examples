unit gtkbinlayout;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkbinlayout.h: Layout manager for bin-like widgets
 * Copyright 2019  GNOME Foundation
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
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtklayoutmanager.h>}

{G_DECLARE_FINAL_TYPE (GtkBinLayout, gtk_bin_layout, GTK, BIN_LAYOUT, GtkLayoutManager) }
function gtk_bin_layout_new:PGtkLayoutManager;cdecl;external libgtk4;

// === Konventiert am: 5-7-26 19:15:53 ===

function GTK_TYPE_BIN_LAYOUT: TGType;
function GTK_BIN_LAYOUT(obj: Pointer): PGtkBinLayout;
function GTK_IS_BIN_LAYOUT(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_BIN_LAYOUT: TGType;
begin
  Result := gtk_bin_layout_get_type;
end;

function GTK_BIN_LAYOUT(obj: Pointer): PGtkBinLayout;
begin
  Result := PGtkBinLayout(g_type_check_instance_cast(obj, GTK_TYPE_BIN_LAYOUT));
end;

function GTK_IS_BIN_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_BIN_LAYOUT);
end;

type 
  PGtkBinLayout = type Pointer;

  TGtkBinLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PGtkBinLayoutClass = ^TGtkBinLayoutClass;

function gtk_bin_layout_get_type: TGType; cdecl; external libgxxxxxxx;



end.

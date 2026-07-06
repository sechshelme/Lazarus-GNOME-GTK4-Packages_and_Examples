unit gtkorientable;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * gtkorientable.h
 * Copyright (C) 2008 Imendio AB
 * Contact: Michael Natterer <mitch@imendio.com>
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
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

type
{ Dummy typedef  }
  PGtkOrientableIface = ^TGtkOrientableIface;
  TGtkOrientableIface = record
      base_iface : TGTypeInterface;
    end;


function gtk_orientable_get_type:TGType;cdecl;external libgtk4;
procedure gtk_orientable_set_orientation(orientable:PGtkOrientable; orientation:TGtkOrientation);cdecl;external libgtk4;
function gtk_orientable_get_orientation(orientable:PGtkOrientable):TGtkOrientation;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkOrientable, g_object_unref) }

// === Konventiert am: 6-7-26 17:07:18 ===

function GTK_TYPE_ORIENTABLE : TGType;
function GTK_ORIENTABLE(obj : Pointer) : PGtkOrientable;
function GTK_IS_ORIENTABLE(obj : Pointer) : Tgboolean;
function GTK_ORIENTABLE_GET_IFACE(obj : Pointer) : PGtkOrientableIface;

implementation

function GTK_TYPE_ORIENTABLE : TGType;
  begin
    GTK_TYPE_ORIENTABLE:=gtk_orientable_get_type;
  end;

function GTK_ORIENTABLE(obj : Pointer) : PGtkOrientable;
begin
  Result := PGtkOrientable(g_type_check_instance_cast(obj, GTK_TYPE_ORIENTABLE));
end;

function GTK_IS_ORIENTABLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_ORIENTABLE);
end;

function GTK_ORIENTABLE_GET_IFACE(obj : Pointer) : PGtkOrientableIface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_ORIENTABLE);
end;



end.

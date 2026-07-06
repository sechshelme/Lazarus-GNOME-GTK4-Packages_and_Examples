
unit gtkorientable;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkorientable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkorientable.h
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
PGtkOrientable  = ^GtkOrientable;
PGtkOrientableIface  = ^GtkOrientableIface;
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

{ was #define dname def_expr }
function GTK_TYPE_ORIENTABLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ORIENTABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ORIENTABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ORIENTABLE_GET_IFACE(inst : longint) : longint;

type
{ Dummy typedef  }
  PGtkOrientableIface = ^TGtkOrientableIface;
  TGtkOrientableIface = record
      base_iface : TGTypeInterface;
    end;


function gtk_orientable_get_type:TGType;cdecl;external;
procedure gtk_orientable_set_orientation(orientable:PGtkOrientable; orientation:TGtkOrientation);cdecl;external;
function gtk_orientable_get_orientation(orientable:PGtkOrientable):TGtkOrientation;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkOrientable, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_ORIENTABLE : longint; { return type might be wrong }
  begin
    GTK_TYPE_ORIENTABLE:=gtk_orientable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ORIENTABLE(obj : longint) : longint;
begin
  GTK_ORIENTABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_ORIENTABLE,GtkOrientable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ORIENTABLE(obj : longint) : longint;
begin
  GTK_IS_ORIENTABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_ORIENTABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ORIENTABLE_GET_IFACE(inst : longint) : longint;
begin
  GTK_ORIENTABLE_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,GTK_TYPE_ORIENTABLE,GtkOrientableIface);
end;


end.

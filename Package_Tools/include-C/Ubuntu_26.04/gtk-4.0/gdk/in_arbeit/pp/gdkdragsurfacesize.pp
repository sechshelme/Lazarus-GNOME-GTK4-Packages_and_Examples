
unit gdkdragsurfacesize;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkdragsurfacesize.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkdragsurfacesize.h
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
PGdkDragSurfaceSize  = ^GdkDragSurfaceSize;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 * Copyright (C) 2023 Red Hat
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
 *
  }
(** unsupported pragma#pragma once*)
{$if !defined(__GDK_H_INSIDE__) && !defined(GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}
type

{ was #define dname def_expr }
function GDK_TYPE_DRAG_SURFACE_SIZE : longint; { return type might be wrong }

function gdk_drag_surface_size_get_type:TGType;cdecl;external;
procedure gdk_drag_surface_size_set_size(size:PGdkDragSurfaceSize; width:longint; height:longint);cdecl;external;

implementation

{ was #define dname def_expr }
function GDK_TYPE_DRAG_SURFACE_SIZE : longint; { return type might be wrong }
  begin
    GDK_TYPE_DRAG_SURFACE_SIZE:=gdk_drag_surface_size_get_type;
  end;


end.

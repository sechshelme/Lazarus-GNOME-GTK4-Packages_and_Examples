unit gtkborder;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gdk/gdk.h>}
type

{*
 * GtkBorder:
 * @left: The width of the left border
 * @right: The width of the right border
 * @top: The width of the top border
 * @bottom: The width of the bottom border
 *
 * Specifies a border around a rectangular area.
 *
 * Each side can have a different width.
  }
type
  PGtkBorder = ^TGtkBorder;
  TGtkBorder = record
      left : Tgint16;
      right : Tgint16;
      top : Tgint16;
      bottom : Tgint16;
    end;


function gtk_border_get_type:TGType;cdecl;external libgtk4;
function gtk_border_new:PGtkBorder;cdecl;external libgtk4;
function gtk_border_copy(border_:PGtkBorder):PGtkBorder;cdecl;external libgtk4;
procedure gtk_border_free(border_:PGtkBorder);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkBorder, gtk_border_free) }

// === Konventiert am: 5-7-26 19:15:26 ===

function GTK_TYPE_BORDER : TGType;

implementation

function GTK_TYPE_BORDER : TGType;
  begin
    GTK_TYPE_BORDER:=gtk_border_get_type;
  end;



end.

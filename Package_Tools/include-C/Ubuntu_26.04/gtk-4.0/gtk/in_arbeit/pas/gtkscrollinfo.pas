unit gtkscrollinfo;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2023 Benjamin Otte
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
{$include <gdk/gdk.h>}
{$include <gtk/gtkenums.h>}
{$include <gtk/gtktypes.h>}
{$include <graphene.h>}

function gtk_scroll_info_get_type:TGType;cdecl;external libgtk4;
function gtk_scroll_info_new:PGtkScrollInfo;cdecl;external libgtk4;
function gtk_scroll_info_ref(self:PGtkScrollInfo):PGtkScrollInfo;cdecl;external libgtk4;
procedure gtk_scroll_info_unref(self:PGtkScrollInfo);cdecl;external libgtk4;
procedure gtk_scroll_info_set_enable_horizontal(self:PGtkScrollInfo; horizontal:Tgboolean);cdecl;external libgtk4;
function gtk_scroll_info_get_enable_horizontal(self:PGtkScrollInfo):Tgboolean;cdecl;external libgtk4;
procedure gtk_scroll_info_set_enable_vertical(self:PGtkScrollInfo; vertical:Tgboolean);cdecl;external libgtk4;
function gtk_scroll_info_get_enable_vertical(self:PGtkScrollInfo):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkScrollInfo, gtk_scroll_info_unref) }

// === Konventiert am: 6-7-26 17:03:07 ===

function GTK_TYPE_SCROLL_INFO : TGType;

implementation

function GTK_TYPE_SCROLL_INFO : TGType;
  begin
    GTK_TYPE_SCROLL_INFO:=gtk_scroll_info_get_type;
  end;



end.

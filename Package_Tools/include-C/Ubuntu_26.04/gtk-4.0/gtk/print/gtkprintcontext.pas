unit gtkprintcontext;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtkprintcontext.h: Print Context
 * Copyright (C) 2006, Red Hat, Inc.
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
{$include <pango/pango.h>}
{$include <gtk/print/gtkpagesetup.h>}
type

function gtk_print_context_get_type:TGType;cdecl;external libgtk4;
{ Rendering  }
function gtk_print_context_get_cairo_context(context:PGtkPrintContext):Pcairo_t;cdecl;external libgtk4;
function gtk_print_context_get_page_setup(context:PGtkPrintContext):PGtkPageSetup;cdecl;external libgtk4;
function gtk_print_context_get_width(context:PGtkPrintContext):Tdouble;cdecl;external libgtk4;
function gtk_print_context_get_height(context:PGtkPrintContext):Tdouble;cdecl;external libgtk4;
function gtk_print_context_get_dpi_x(context:PGtkPrintContext):Tdouble;cdecl;external libgtk4;
function gtk_print_context_get_dpi_y(context:PGtkPrintContext):Tdouble;cdecl;external libgtk4;
function gtk_print_context_get_hard_margins(context:PGtkPrintContext; top:Pdouble; bottom:Pdouble; left:Pdouble; right:Pdouble):Tgboolean;cdecl;external libgtk4;
{ Fonts  }
function gtk_print_context_get_pango_fontmap(context:PGtkPrintContext):PPangoFontMap;cdecl;external libgtk4;
function gtk_print_context_create_pango_context(context:PGtkPrintContext):PPangoContext;cdecl;external libgtk4;
function gtk_print_context_create_pango_layout(context:PGtkPrintContext):PPangoLayout;cdecl;external libgtk4;
{ Needed for preview implementations  }
procedure gtk_print_context_set_cairo_context(context:PGtkPrintContext; cr:Pcairo_t; dpi_x:Tdouble; dpi_y:Tdouble);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkPrintContext, g_object_unref) }

// === Konventiert am: 9-7-26 17:19:03 ===

function GTK_TYPE_PRINT_CONTEXT : TGType;
function GTK_PRINT_CONTEXT(obj : Pointer) : PGtkPrintContext;
function GTK_IS_PRINT_CONTEXT(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_PRINT_CONTEXT : TGType;
  begin
    GTK_TYPE_PRINT_CONTEXT:=gtk_print_context_get_type;
  end;

function GTK_PRINT_CONTEXT(obj : Pointer) : PGtkPrintContext;
begin
  Result := PGtkPrintContext(g_type_check_instance_cast(obj, GTK_TYPE_PRINT_CONTEXT));
end;

function GTK_IS_PRINT_CONTEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_PRINT_CONTEXT);
end;



end.

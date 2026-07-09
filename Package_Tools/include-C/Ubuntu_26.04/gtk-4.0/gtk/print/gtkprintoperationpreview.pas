unit gtkprintoperationpreview;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtkprintoperationpreview.h: Abstract print preview interface
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
{$include <cairo.h>}
{$include <gtk/print/gtkprintcontext.h>}

type
{dummy typedef  }
{ signals  }
{ methods  }
{ Padding for future expansion  }
  PGtkPrintOperationPreviewIface = ^TGtkPrintOperationPreviewIface;
  TGtkPrintOperationPreviewIface = record
      g_iface : TGTypeInterface;
      ready : procedure (preview:PGtkPrintOperationPreview; context:PGtkPrintContext);cdecl;
      got_page_size : procedure (preview:PGtkPrintOperationPreview; context:PGtkPrintContext; page_setup:PGtkPageSetup);cdecl;
      render_page : procedure (preview:PGtkPrintOperationPreview; page_nr:longint);cdecl;
      is_selected : function (preview:PGtkPrintOperationPreview; page_nr:longint):Tgboolean;cdecl;
      end_preview : procedure (preview:PGtkPrintOperationPreview);cdecl;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
      _gtk_reserved5 : procedure ;cdecl;
      _gtk_reserved6 : procedure ;cdecl;
      _gtk_reserved7 : procedure ;cdecl;
      _gtk_reserved8 : procedure ;cdecl;
    end;


function gtk_print_operation_preview_get_type:TGType;cdecl;external libgtk4;
procedure gtk_print_operation_preview_render_page(preview:PGtkPrintOperationPreview; page_nr:longint);cdecl;external libgtk4;
procedure gtk_print_operation_preview_end_preview(preview:PGtkPrintOperationPreview);cdecl;external libgtk4;
function gtk_print_operation_preview_is_selected(preview:PGtkPrintOperationPreview; page_nr:longint):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkPrintOperationPreview, g_object_unref) }

// === Konventiert am: 9-7-26 17:19:28 ===

function GTK_TYPE_PRINT_OPERATION_PREVIEW : TGType;
function GTK_PRINT_OPERATION_PREVIEW(obj : Pointer) : PGtkPrintOperationPreview;
function GTK_IS_PRINT_OPERATION_PREVIEW(obj : Pointer) : Tgboolean;
function GTK_PRINT_OPERATION_PREVIEW_GET_IFACE(obj : Pointer) : PGtkPrintOperationPreviewIface;

implementation

function GTK_TYPE_PRINT_OPERATION_PREVIEW : TGType;
  begin
    GTK_TYPE_PRINT_OPERATION_PREVIEW:=gtk_print_operation_preview_get_type;
  end;

function GTK_PRINT_OPERATION_PREVIEW(obj : Pointer) : PGtkPrintOperationPreview;
begin
  Result := PGtkPrintOperationPreview(g_type_check_instance_cast(obj, GTK_TYPE_PRINT_OPERATION_PREVIEW));
end;

function GTK_IS_PRINT_OPERATION_PREVIEW(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_PRINT_OPERATION_PREVIEW);
end;

function GTK_PRINT_OPERATION_PREVIEW_GET_IFACE(obj : Pointer) : PGtkPrintOperationPreviewIface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_PRINT_OPERATION_PREVIEW);
end;



end.

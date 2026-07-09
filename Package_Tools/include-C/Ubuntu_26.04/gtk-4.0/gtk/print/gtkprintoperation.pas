unit gtkprintoperation;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtkprintoperation.h: Print Operation
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
{$include <gtk/gtk.h>}
{$include <gtk/print/gtkpagesetup.h>}
{$include <gtk/print/gtkprintsettings.h>}
{$include <gtk/print/gtkprintcontext.h>}
{$include <gtk/print/gtkprintoperationpreview.h>}

type
{*
 * GtkPrintStatus:
 * @GTK_PRINT_STATUS_INITIAL: The printing has not started yet; this
 *   status is set initially, and while the print dialog is shown.
 * @GTK_PRINT_STATUS_PREPARING: This status is set while the begin-print
 *   signal is emitted and during pagination.
 * @GTK_PRINT_STATUS_GENERATING_DATA: This status is set while the
 *   pages are being rendered.
 * @GTK_PRINT_STATUS_SENDING_DATA: The print job is being sent off to the
 *   printer.
 * @GTK_PRINT_STATUS_PENDING: The print job has been sent to the printer,
 *   but is not printed for some reason, e.g. the printer may be stopped.
 * @GTK_PRINT_STATUS_PENDING_ISSUE: Some problem has occurred during
 *   printing, e.g. a paper jam.
 * @GTK_PRINT_STATUS_PRINTING: The printer is processing the print job.
 * @GTK_PRINT_STATUS_FINISHED: The printing has been completed successfully.
 * @GTK_PRINT_STATUS_FINISHED_ABORTED: The printing has been aborted.
 *
 * The status gives a rough indication of the completion of a running
 * print operation.
  }

  PGtkPrintStatus = ^TGtkPrintStatus;
  TGtkPrintStatus =  Longint;
  Const
    GTK_PRINT_STATUS_INITIAL = 0;
    GTK_PRINT_STATUS_PREPARING = 1;
    GTK_PRINT_STATUS_GENERATING_DATA = 2;
    GTK_PRINT_STATUS_SENDING_DATA = 3;
    GTK_PRINT_STATUS_PENDING = 4;
    GTK_PRINT_STATUS_PENDING_ISSUE = 5;
    GTK_PRINT_STATUS_PRINTING = 6;
    GTK_PRINT_STATUS_FINISHED = 7;
    GTK_PRINT_STATUS_FINISHED_ABORTED = 8;
;
{*
 * GtkPrintOperationResult:
 * @GTK_PRINT_OPERATION_RESULT_ERROR: An error has occurred.
 * @GTK_PRINT_OPERATION_RESULT_APPLY: The print settings should be stored.
 * @GTK_PRINT_OPERATION_RESULT_CANCEL: The print operation has been canceled,
 *   the print settings should not be stored.
 * @GTK_PRINT_OPERATION_RESULT_IN_PROGRESS: The print operation is not complete
 *   yet. This value will only be returned when running asynchronously.
 *
 * The result of a print operation.
 *
 * A value of this type is returned by [method@Gtk.PrintOperation.run].
  }
type
  PGtkPrintOperationResult = ^TGtkPrintOperationResult;
  TGtkPrintOperationResult =  Longint;
  Const
    GTK_PRINT_OPERATION_RESULT_ERROR = 0;
    GTK_PRINT_OPERATION_RESULT_APPLY = 1;
    GTK_PRINT_OPERATION_RESULT_CANCEL = 2;
    GTK_PRINT_OPERATION_RESULT_IN_PROGRESS = 3;
;
{*
 * GtkPrintOperationAction:
 * @GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG: Show the print dialog.
 * @GTK_PRINT_OPERATION_ACTION_PRINT: Start to print without showing
 *   the print dialog, based on the current print settings, if possible.
 *   Depending on the platform, a print dialog might appear anyway.
 * @GTK_PRINT_OPERATION_ACTION_PREVIEW: Show the print preview.
 * @GTK_PRINT_OPERATION_ACTION_EXPORT: Export to a file. This requires
 *   the export-filename property to be set.
 *
 * Determines what action the print operation should perform.
 *
 * A parameter of this typs is passed to [method@Gtk.PrintOperation.run].
  }
type
  PGtkPrintOperationAction = ^TGtkPrintOperationAction;
  TGtkPrintOperationAction =  Longint;
  Const
    GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG = 0;
    GTK_PRINT_OPERATION_ACTION_PRINT = 1;
    GTK_PRINT_OPERATION_ACTION_PREVIEW = 2;
    GTK_PRINT_OPERATION_ACTION_EXPORT = 3;
;
{< private > }
type
  PGtkPrintOperation = ^TGtkPrintOperation;
  TGtkPrintOperation = record
      parent_instance : TGObject;
      priv : PGtkPrintOperationPrivate;
    end;

{*
 * GtkPrintOperationClass:
 * @parent_class: The parent class.
 * @done: Signal emitted when the print operation run has finished
 *    doing everything required for printing.
 * @begin_print: Signal emitted after the user has finished changing
 *    print settings in the dialog, before the actual rendering starts.
 * @paginate: Signal emitted after the “begin-print” signal, but
 *    before the actual rendering starts.
 * @request_page_setup: Emitted once for every page that is printed,
 *    to give the application a chance to modify the page setup.
 * @draw_page: Signal emitted for every page that is printed.
 * @end_print: Signal emitted after all pages have been rendered.
 * @status_changed: Emitted at between the various phases of the print
 *    operation.
 * @create_custom_widget: Signal emitted when displaying the print dialog.
 * @custom_widget_apply: Signal emitted right before “begin-print” if
 *    you added a custom widget in the “create-custom-widget” handler.
 * @preview: Signal emitted when a preview is requested from the
 *    native dialog.
 * @update_custom_widget: Emitted after change of selected printer.
  }
{< public > }
{< private > }
  PGtkPrintOperationClass = ^TGtkPrintOperationClass;
  TGtkPrintOperationClass = record
      parent_class : TGObjectClass;
      done : procedure (operation:PGtkPrintOperation; result:TGtkPrintOperationResult);cdecl;
      begin_print : procedure (operation:PGtkPrintOperation; context:PGtkPrintContext);cdecl;
      paginate : function (operation:PGtkPrintOperation; context:PGtkPrintContext):Tgboolean;cdecl;
      request_page_setup : procedure (operation:PGtkPrintOperation; context:PGtkPrintContext; page_nr:longint; setup:PGtkPageSetup);cdecl;
      draw_page : procedure (operation:PGtkPrintOperation; context:PGtkPrintContext; page_nr:longint);cdecl;
      end_print : procedure (operation:PGtkPrintOperation; context:PGtkPrintContext);cdecl;
      status_changed : procedure (operation:PGtkPrintOperation);cdecl;
      create_custom_widget : function (operation:PGtkPrintOperation):PGtkWidget;cdecl;
      custom_widget_apply : procedure (operation:PGtkPrintOperation; widget:PGtkWidget);cdecl;
      preview : function (operation:PGtkPrintOperation; preview:PGtkPrintOperationPreview; context:PGtkPrintContext; parent:PGtkWindow):Tgboolean;cdecl;
      update_custom_widget : procedure (operation:PGtkPrintOperation; widget:PGtkWidget; setup:PGtkPageSetup; settings:PGtkPrintSettings);cdecl;
      padding : array[0..7] of Tgpointer;
    end;

{*
 * GTK_PRINT_ERROR:
 *
 * The error domain for `GtkPrintError` errors.
  }

{ was #define dname def_expr }
function GTK_PRINT_ERROR : longint; { return type might be wrong }

{*
 * GtkPrintError:
 * @GTK_PRINT_ERROR_GENERAL: An unspecified error occurred.
 * @GTK_PRINT_ERROR_INTERNAL_ERROR: An internal error occurred.
 * @GTK_PRINT_ERROR_NOMEM: A memory allocation failed.
 * @GTK_PRINT_ERROR_INVALID_FILE: An error occurred while loading a page setup
 *   or paper size from a key file.
 *
 * Error codes that identify various errors that can occur while
 * using the GTK printing support.
  }
type
  PGtkPrintError = ^TGtkPrintError;
  TGtkPrintError =  Longint;
  Const
    GTK_PRINT_ERROR_GENERAL = 0;
    GTK_PRINT_ERROR_INTERNAL_ERROR = 1;
    GTK_PRINT_ERROR_NOMEM = 2;
    GTK_PRINT_ERROR_INVALID_FILE = 3;
;

function gtk_print_error_quark:TGQuark;cdecl;external libgtk4;
function gtk_print_operation_get_type:TGType;cdecl;external libgtk4;
function gtk_print_operation_new:PGtkPrintOperation;cdecl;external libgtk4;
procedure gtk_print_operation_set_default_page_setup(op:PGtkPrintOperation; default_page_setup:PGtkPageSetup);cdecl;external libgtk4;
function gtk_print_operation_get_default_page_setup(op:PGtkPrintOperation):PGtkPageSetup;cdecl;external libgtk4;
procedure gtk_print_operation_set_print_settings(op:PGtkPrintOperation; print_settings:PGtkPrintSettings);cdecl;external libgtk4;
function gtk_print_operation_get_print_settings(op:PGtkPrintOperation):PGtkPrintSettings;cdecl;external libgtk4;
procedure gtk_print_operation_set_job_name(op:PGtkPrintOperation; job_name:Pchar);cdecl;external libgtk4;
procedure gtk_print_operation_set_n_pages(op:PGtkPrintOperation; n_pages:longint);cdecl;external libgtk4;
procedure gtk_print_operation_set_current_page(op:PGtkPrintOperation; current_page:longint);cdecl;external libgtk4;
procedure gtk_print_operation_set_use_full_page(op:PGtkPrintOperation; full_page:Tgboolean);cdecl;external libgtk4;
procedure gtk_print_operation_set_unit(op:PGtkPrintOperation; unit:TGtkUnit);cdecl;external libgtk4;
procedure gtk_print_operation_set_export_filename(op:PGtkPrintOperation; filename:Pchar);cdecl;external libgtk4;
procedure gtk_print_operation_set_track_print_status(op:PGtkPrintOperation; track_status:Tgboolean);cdecl;external libgtk4;
procedure gtk_print_operation_set_show_progress(op:PGtkPrintOperation; show_progress:Tgboolean);cdecl;external libgtk4;
procedure gtk_print_operation_set_allow_async(op:PGtkPrintOperation; allow_async:Tgboolean);cdecl;external libgtk4;
procedure gtk_print_operation_set_custom_tab_label(op:PGtkPrintOperation; _label:Pchar);cdecl;external libgtk4;
function gtk_print_operation_run(op:PGtkPrintOperation; action:TGtkPrintOperationAction; parent:PGtkWindow; error:PPGError):TGtkPrintOperationResult;cdecl;external libgtk4;
procedure gtk_print_operation_get_error(op:PGtkPrintOperation; error:PPGError);cdecl;external libgtk4;
function gtk_print_operation_get_status(op:PGtkPrintOperation):TGtkPrintStatus;cdecl;external libgtk4;
function gtk_print_operation_get_status_string(op:PGtkPrintOperation):Pchar;cdecl;external libgtk4;
function gtk_print_operation_is_finished(op:PGtkPrintOperation):Tgboolean;cdecl;external libgtk4;
procedure gtk_print_operation_cancel(op:PGtkPrintOperation);cdecl;external libgtk4;
procedure gtk_print_operation_draw_page_finish(op:PGtkPrintOperation);cdecl;external libgtk4;
procedure gtk_print_operation_set_defer_drawing(op:PGtkPrintOperation);cdecl;external libgtk4;
procedure gtk_print_operation_set_support_selection(op:PGtkPrintOperation; support_selection:Tgboolean);cdecl;external libgtk4;
function gtk_print_operation_get_support_selection(op:PGtkPrintOperation):Tgboolean;cdecl;external libgtk4;
procedure gtk_print_operation_set_has_selection(op:PGtkPrintOperation; has_selection:Tgboolean);cdecl;external libgtk4;
function gtk_print_operation_get_has_selection(op:PGtkPrintOperation):Tgboolean;cdecl;external libgtk4;
procedure gtk_print_operation_set_embed_page_setup(op:PGtkPrintOperation; embed:Tgboolean);cdecl;external libgtk4;
function gtk_print_operation_get_embed_page_setup(op:PGtkPrintOperation):Tgboolean;cdecl;external libgtk4;
function gtk_print_operation_get_n_pages_to_print(op:PGtkPrintOperation):longint;cdecl;external libgtk4;
function gtk_print_run_page_setup_dialog(parent:PGtkWindow; page_setup:PGtkPageSetup; settings:PGtkPrintSettings):PGtkPageSetup;cdecl;external libgtk4;
{*
 * GtkPageSetupDoneFunc:
 * @page_setup: the `GtkPageSetup` that has been passed to
 *   gtk_print_run_page_setup_dialog_async()
 * @data: (closure): user data that has been passed to
 *   gtk_print_run_page_setup_dialog_async()
 *
 * The type of function that is passed to
 * gtk_print_run_page_setup_dialog_async().
 *
 * This function will be called when the page setup dialog
 * is dismissed, and also serves as destroy notify for @data.
  }
type

  TGtkPageSetupDoneFunc = procedure (page_setup:PGtkPageSetup; data:Tgpointer);cdecl;

procedure gtk_print_run_page_setup_dialog_async(parent:PGtkWindow; page_setup:PGtkPageSetup; settings:PGtkPrintSettings; done_cb:TGtkPageSetupDoneFunc; data:Tgpointer);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkPrintOperation, g_object_unref) }

// === Konventiert am: 9-7-26 17:19:11 ===

function GTK_TYPE_PRINT_OPERATION : TGType;
function GTK_PRINT_OPERATION(obj : Pointer) : PGtkPrintOperation;
function GTK_PRINT_OPERATION_CLASS(klass : Pointer) : PGtkPrintOperationClass;
function GTK_IS_PRINT_OPERATION(obj : Pointer) : Tgboolean;
function GTK_IS_PRINT_OPERATION_CLASS(klass : Pointer) : Tgboolean;
function GTK_PRINT_OPERATION_GET_CLASS(obj : Pointer) : PGtkPrintOperationClass;

implementation

function GTK_TYPE_PRINT_OPERATION : TGType;
  begin
    GTK_TYPE_PRINT_OPERATION:=gtk_print_operation_get_type;
  end;

function GTK_PRINT_OPERATION(obj : Pointer) : PGtkPrintOperation;
begin
  Result := PGtkPrintOperation(g_type_check_instance_cast(obj, GTK_TYPE_PRINT_OPERATION));
end;

function GTK_PRINT_OPERATION_CLASS(klass : Pointer) : PGtkPrintOperationClass;
begin
  Result := PGtkPrintOperationClass(g_type_check_class_cast(klass, GTK_TYPE_PRINT_OPERATION));
end;

function GTK_IS_PRINT_OPERATION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_PRINT_OPERATION);
end;

function GTK_IS_PRINT_OPERATION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_PRINT_OPERATION);
end;

function GTK_PRINT_OPERATION_GET_CLASS(obj : Pointer) : PGtkPrintOperationClass;
begin
  Result := PGtkPrintOperationClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function GTK_PRINT_ERROR : longint; { return type might be wrong }
  begin
    GTK_PRINT_ERROR:=gtk_print_error_quark;
  end;


end.

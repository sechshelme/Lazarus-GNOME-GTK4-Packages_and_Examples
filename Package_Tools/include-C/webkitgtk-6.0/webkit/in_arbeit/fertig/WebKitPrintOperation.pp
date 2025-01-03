
unit WebKitPrintOperation;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitPrintOperation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitPrintOperation.h
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
PGtkPageSetup  = ^GtkPageSetup;
PGtkPrintSettings  = ^GtkPrintSettings;
PGtkWindow  = ^GtkWindow;
PWebKitPrintOperation  = ^WebKitPrintOperation;
PWebKitPrintOperationResponse  = ^WebKitPrintOperationResponse;
PWebKitWebView  = ^WebKitWebView;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2012 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitPrintOperation_h}
{$define WebKitPrintOperation_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitWebView.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_PRINT_OPERATION : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitPrintOperation, webkit_print_operation, WEBKIT, PRINT_OPERATION, GObject) }
{*
 * WebKitPrintOperationResponse:
 * @WEBKIT_PRINT_OPERATION_RESPONSE_PRINT: Print button was clicked in print dialog
 * @WEBKIT_PRINT_OPERATION_RESPONSE_CANCEL: Print dialog was cancelled
 *
 * Enum values representing the response of the print dialog shown with
 * webkit_print_operation_run_dialog().
  }
type
  PWebKitPrintOperationResponse = ^TWebKitPrintOperationResponse;
  TWebKitPrintOperationResponse =  Longint;
  Const
    WEBKIT_PRINT_OPERATION_RESPONSE_PRINT = 0;
    WEBKIT_PRINT_OPERATION_RESPONSE_CANCEL = 1;
;

function webkit_print_operation_new(web_view:PWebKitWebView):PWebKitPrintOperation;cdecl;external;
function webkit_print_operation_get_print_settings(print_operation:PWebKitPrintOperation):PGtkPrintSettings;cdecl;external;
procedure webkit_print_operation_set_print_settings(print_operation:PWebKitPrintOperation; print_settings:PGtkPrintSettings);cdecl;external;
function webkit_print_operation_get_page_setup(print_operation:PWebKitPrintOperation):PGtkPageSetup;cdecl;external;
procedure webkit_print_operation_set_page_setup(print_operation:PWebKitPrintOperation; page_setup:PGtkPageSetup);cdecl;external;
function webkit_print_operation_run_dialog(print_operation:PWebKitPrintOperation; parent:PGtkWindow):TWebKitPrintOperationResponse;cdecl;external;
procedure webkit_print_operation_print(print_operation:PWebKitPrintOperation);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_PRINT_OPERATION : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_PRINT_OPERATION:=webkit_print_operation_get_type;
  end;


end.

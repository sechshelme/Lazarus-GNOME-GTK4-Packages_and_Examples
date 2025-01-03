/*
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
 */

#if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit.h> can be included directly."
#endif

#ifndef WebKitPrintOperation_h
#define WebKitPrintOperation_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>
#include <webkit/WebKitWebView.h>



#define WEBKIT_TYPE_PRINT_OPERATION            (webkit_print_operation_get_type())

//WEBKIT_DECLARE_FINAL_TYPE (WebKitPrintOperation, webkit_print_operation, WEBKIT, PRINT_OPERATION, GObject)

/**
 * WebKitPrintOperationResponse:
 * @WEBKIT_PRINT_OPERATION_RESPONSE_PRINT: Print button was clicked in print dialog
 * @WEBKIT_PRINT_OPERATION_RESPONSE_CANCEL: Print dialog was cancelled
 *
 * Enum values representing the response of the print dialog shown with
 * webkit_print_operation_run_dialog().
 */
typedef enum {
    WEBKIT_PRINT_OPERATION_RESPONSE_PRINT,
    WEBKIT_PRINT_OPERATION_RESPONSE_CANCEL
} WebKitPrintOperationResponse;

extern WebKitPrintOperation *
webkit_print_operation_new                (WebKitWebView        *web_view);

extern GtkPrintSettings *
webkit_print_operation_get_print_settings (WebKitPrintOperation *print_operation);

extern void
webkit_print_operation_set_print_settings (WebKitPrintOperation *print_operation,
                                           GtkPrintSettings     *print_settings);

extern GtkPageSetup *
webkit_print_operation_get_page_setup     (WebKitPrintOperation *print_operation);

extern void
webkit_print_operation_set_page_setup     (WebKitPrintOperation *print_operation,
                                           GtkPageSetup         *page_setup);

extern WebKitPrintOperationResponse
webkit_print_operation_run_dialog         (WebKitPrintOperation *print_operation,
                                           GtkWindow            *parent);

extern void
webkit_print_operation_print              (WebKitPrintOperation *print_operation);



#endif

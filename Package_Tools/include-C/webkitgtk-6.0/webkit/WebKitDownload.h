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

#ifndef WebKitDownload_h
#define WebKitDownload_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>
#include <webkit/WebKitURIRequest.h>
#include <webkit/WebKitURIResponse.h>



#define WEBKIT_TYPE_DOWNLOAD            (webkit_download_get_type())
WEBKIT_DECLARE_FINAL_TYPE (WebKitDownload, webkit_download, WEBKIT, DOWNLOAD, GObject)

typedef struct _WebKitWebView WebKitWebView;

extern WebKitURIRequest *
webkit_download_get_request              (WebKitDownload *download);

extern const gchar *
webkit_download_get_destination          (WebKitDownload *download);

extern void
webkit_download_set_destination          (WebKitDownload *download,
                                          const gchar    *destination);

extern WebKitURIResponse*
webkit_download_get_response             (WebKitDownload *download);

extern void
webkit_download_cancel                   (WebKitDownload *download);

extern gdouble
webkit_download_get_estimated_progress   (WebKitDownload *download);

extern gdouble
webkit_download_get_elapsed_time         (WebKitDownload *download);

extern guint64
webkit_download_get_received_data_length (WebKitDownload *download);

extern WebKitWebView *
webkit_download_get_web_view             (WebKitDownload *download);

extern gboolean
webkit_download_get_allow_overwrite      (WebKitDownload *download);

extern void
webkit_download_set_allow_overwrite      (WebKitDownload *download,
                                          gboolean        allowed);



#endif

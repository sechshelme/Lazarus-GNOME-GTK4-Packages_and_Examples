/*
 * Copyright (C) 2011 Igalia S.L.
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

#if !defined(__WEBKIT_H_INSIDE__) && !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit.h> can be included directly."
#endif

#ifndef WebKitURIRequest_h
#define WebKitURIRequest_h

#include <glib-object.h>
#include <libsoup/soup.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_URI_REQUEST            (webkit_uri_request_get_type())

WEBKIT_DECLARE_FINAL_TYPE (WebKitURIRequest, webkit_uri_request, WEBKIT, URI_REQUEST, GObject)

extern WebKitURIRequest *
webkit_uri_request_new              (const gchar      *uri);

extern const gchar *
webkit_uri_request_get_uri          (WebKitURIRequest *request);

extern void
webkit_uri_request_set_uri          (WebKitURIRequest *request,
                                     const gchar      *uri);

extern const gchar *
webkit_uri_request_get_http_method  (WebKitURIRequest *request);

extern SoupMessageHeaders *
webkit_uri_request_get_http_headers (WebKitURIRequest *request);



#endif

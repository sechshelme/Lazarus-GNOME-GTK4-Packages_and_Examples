/*
 * Copyright (C) 2012 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
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

#ifndef WebKitWebInspector_h
#define WebKitWebInspector_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>
#include <webkit/WebKitWebViewBase.h>

G_BEGIN_DECLS

#define WEBKIT_TYPE_WEB_INSPECTOR            (webkit_web_inspector_get_type())

WEBKIT_DECLARE_FINAL_TYPE (WebKitWebInspector, webkit_web_inspector, WEBKIT, WEB_INSPECTOR, GObject)

WEBKIT_API WebKitWebViewBase *
webkit_web_inspector_get_web_view        (WebKitWebInspector *inspector);

WEBKIT_API const char *
webkit_web_inspector_get_inspected_uri   (WebKitWebInspector *inspector);

WEBKIT_API gboolean
webkit_web_inspector_is_attached         (WebKitWebInspector *inspector);

WEBKIT_API void
webkit_web_inspector_attach              (WebKitWebInspector *inspector);

WEBKIT_API void
webkit_web_inspector_detach              (WebKitWebInspector *inspector);

WEBKIT_API void
webkit_web_inspector_show                (WebKitWebInspector *inspector);

WEBKIT_API void
webkit_web_inspector_close               (WebKitWebInspector *inspector);

WEBKIT_API guint
webkit_web_inspector_get_attached_height (WebKitWebInspector *inspector);

WEBKIT_API gboolean
webkit_web_inspector_get_can_attach      (WebKitWebInspector* inspector);

G_END_DECLS

#endif

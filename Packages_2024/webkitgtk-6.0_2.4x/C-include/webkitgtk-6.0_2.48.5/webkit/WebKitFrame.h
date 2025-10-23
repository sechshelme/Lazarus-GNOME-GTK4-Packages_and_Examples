/*
 * Copyright (C) 2013 Igalia S.L.
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

#if !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit-web-process-extension.h> can be included directly."
#endif

#ifndef WebKitFrame_h
#define WebKitFrame_h

#include <glib-object.h>
#include <jsc/jsc.h>
#include <webkit/WebKitDefines.h>
#include <webkit/WebKitScriptWorld.h>


G_BEGIN_DECLS

#define WEBKIT_TYPE_FRAME            (webkit_frame_get_type())

WEBKIT_DECLARE_FINAL_TYPE (WebKitFrame, webkit_frame, WEBKIT, FRAME, GObject)

WEBKIT_API guint64
webkit_frame_get_id                                      (WebKitFrame       *frame);

WEBKIT_API gboolean
webkit_frame_is_main_frame                               (WebKitFrame       *frame);

WEBKIT_API const gchar *
webkit_frame_get_uri                                     (WebKitFrame       *frame);


WEBKIT_API JSCContext *
webkit_frame_get_js_context                              (WebKitFrame       *frame);

WEBKIT_API JSCContext *
webkit_frame_get_js_context_for_script_world             (WebKitFrame       *frame,
                                                          WebKitScriptWorld *world);


G_END_DECLS

#endif

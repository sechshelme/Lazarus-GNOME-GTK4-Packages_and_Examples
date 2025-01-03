/*
 * Copyright (C) 2017 Igalia S.L.
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

#ifndef WebKitApplicationInfo_h
#define WebKitApplicationInfo_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_APPLICATION_INFO (webkit_application_info_get_type())

typedef struct _WebKitApplicationInfo WebKitApplicationInfo;


extern GType
webkit_application_info_get_type    (void);

extern WebKitApplicationInfo *
webkit_application_info_new         (void);

extern WebKitApplicationInfo *
webkit_application_info_ref         (WebKitApplicationInfo *info);

extern void
webkit_application_info_unref       (WebKitApplicationInfo *info);

extern void
webkit_application_info_set_name    (WebKitApplicationInfo *info,
                                     const gchar           *name);
extern const gchar *
webkit_application_info_get_name    (WebKitApplicationInfo *info);

extern void
webkit_application_info_set_version (WebKitApplicationInfo *info,
                                     guint64                major,
                                     guint64                minor,
                                     guint64                micro);

extern void
webkit_application_info_get_version (WebKitApplicationInfo *info,
                                     guint64               *major,
                                     guint64               *minor,
                                     guint64               *micro);



#endif

/*
 * Copyright (C) 2022 Igalia S.L.
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

#ifndef WebKitPermissionStateQuery_h
#define WebKitPermissionStateQuery_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>
#include <webkit/WebKitSecurityOrigin.h>



#define WEBKIT_TYPE_PERMISSION_STATE_QUERY (webkit_permission_state_query_get_type())

typedef struct _WebKitPermissionStateQuery WebKitPermissionStateQuery;

/**
 * WebKitPermissionState:
 * @WEBKIT_PERMISSION_STATE_GRANTED: Access to the feature is granted.
 * @WEBKIT_PERMISSION_STATE_DENIED: Access to the feature is denied.
 * @WEBKIT_PERMISSION_STATE_PROMPT: Access to the feature has to be requested via user prompt.
 *
 * Enum values representing query permission results.
 *
 * Since: 2.40
 */
typedef enum {
    WEBKIT_PERMISSION_STATE_GRANTED,
    WEBKIT_PERMISSION_STATE_DENIED,
    WEBKIT_PERMISSION_STATE_PROMPT,
} WebKitPermissionState;

extern GType
webkit_permission_state_query_get_type    (void);

extern WebKitPermissionStateQuery *
webkit_permission_state_query_ref                 (WebKitPermissionStateQuery *query);

extern void
webkit_permission_state_query_unref               (WebKitPermissionStateQuery *query);

extern const gchar *
webkit_permission_state_query_get_name            (WebKitPermissionStateQuery *query);

extern WebKitSecurityOrigin *
webkit_permission_state_query_get_security_origin (WebKitPermissionStateQuery *query);

extern void
webkit_permission_state_query_finish              (WebKitPermissionStateQuery *query,
                                                   WebKitPermissionState       state);



#endif

/*
 * Copyright (C) 2019 Igalia S.L.
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

#ifndef WebKitGeolocationManager_h
#define WebKitGeolocationManager_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_GEOLOCATION_MANAGER            (webkit_geolocation_manager_get_type())

// WEBKIT_DECLARE_FINAL_TYPE (WebKitGeolocationManager, webkit_geolocation_manager, WEBKIT, GEOLOCATION_MANAGER, GObject)

#define WEBKIT_TYPE_GEOLOCATION_POSITION           (webkit_geolocation_position_get_type())

typedef struct _WebKitGeolocationPosition WebKitGeolocationPosition;

extern void
webkit_geolocation_manager_update_position           (WebKitGeolocationManager  *manager,
                                                     WebKitGeolocationPosition *position);

extern void
webkit_geolocation_manager_failed                    (WebKitGeolocationManager  *manager,
                                                     const char                *error_message);

extern gboolean
webkit_geolocation_manager_get_enable_high_accuracy (WebKitGeolocationManager  *manager);


extern GType
webkit_geolocation_position_get_type                (void);

extern WebKitGeolocationPosition *
webkit_geolocation_position_new                     (double                     latitude,
                                                     double                     longitude,
                                                     double                     accuracy);

extern WebKitGeolocationPosition *
webkit_geolocation_position_copy                    (WebKitGeolocationPosition *position);

extern void
webkit_geolocation_position_free                    (WebKitGeolocationPosition *position);

extern void
webkit_geolocation_position_set_timestamp           (WebKitGeolocationPosition *position,
                                                     guint64                    timestamp);

extern void
webkit_geolocation_position_set_altitude            (WebKitGeolocationPosition *position,
                                                     double                     altitude);

extern void
webkit_geolocation_position_set_altitude_accuracy   (WebKitGeolocationPosition *position,
                                                     double                     altitude_accuracy);

extern void
webkit_geolocation_position_set_heading             (WebKitGeolocationPosition *position,
                                                     double                     heading);

extern void
webkit_geolocation_position_set_speed               (WebKitGeolocationPosition *position,
                                                     double                     speed);



#endif /* WebKitGeolocationManager_h */

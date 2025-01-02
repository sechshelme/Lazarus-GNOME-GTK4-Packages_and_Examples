/*
 * Copyright (C) 2023 Igalia S.L.
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


#ifndef WebKitFeature_h
#define WebKitFeature_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>



/**
 * WebKitFeatureStatus:
 * @WEBKIT_FEATURE_STATUS_EMBEDDER: Feature that adjust behaviour for
 *   specific application needs. The feature is not part of a Web platform
 *   feature, not a mature feature intended to be always on.
 * @WEBKIT_FEATURE_STATUS_UNSTABLE: Feature in development. The feature
 *   may be unfinished, and there are no guarantees about its safety and
 *   stability.
 * @WEBKIT_FEATURE_STATUS_INTERNAL: Feature for debugging the WebKit engine.
 *   The feature is not generally useful for user or web developers, and
 *   always disabled by default.
 * @WEBKIT_FEATURE_STATUS_DEVELOPER: Feature for web developers. The feature
 *   is not generally useful for end users, and always disabled by default.
 * @WEBKIT_FEATURE_STATUS_TESTABLE: Feature in active development and
 *   complete enough for testing. The feature may not be yet ready to
 *   ship and is disabled by default.
 * @WEBKIT_FEATURE_STATUS_PREVIEW: Feature ready to be tested by users.
 *   The feature is disabled by default, but may be enabled by applications
 *   automatically e.g. in their “technology preview” or “beta” versions.
 * @WEBKIT_FEATURE_STATUS_STABLE: Feature ready for general use. The
 *   feature is enabled by default, but it may still be toggled to support
 *   debugging and testing.
 * @WEBKIT_FEATURE_STATUS_MATURE: Feature in general use. The feature is
 *   always enabled and in general there should be no user-facing interface
 *   to toggle it.
 *
 * Describes the status of a [struct@WebKitFeature].
 *
 * The status for a given feature can be obtained with
 * [id@webkit_feature_get_status].
 *
 * Since: 2.42
 */
typedef enum {
    WEBKIT_FEATURE_STATUS_EMBEDDER,
    WEBKIT_FEATURE_STATUS_UNSTABLE,
    WEBKIT_FEATURE_STATUS_INTERNAL,
    WEBKIT_FEATURE_STATUS_DEVELOPER,
    WEBKIT_FEATURE_STATUS_TESTABLE,
    WEBKIT_FEATURE_STATUS_PREVIEW,
    WEBKIT_FEATURE_STATUS_STABLE,
    WEBKIT_FEATURE_STATUS_MATURE,
} WebKitFeatureStatus;

#define WEBKIT_TYPE_FEATURE (webkit_feature_get_type())

typedef struct _WebKitFeature WebKitFeature;

extern GType
webkit_feature_get_type          (void) ;

extern WebKitFeature *
webkit_feature_ref               (WebKitFeature *feature);

extern void
webkit_feature_unref             (WebKitFeature *feature);

extern const char *
webkit_feature_get_identifier    (WebKitFeature *feature);

extern const char *
webkit_feature_get_name          (WebKitFeature *feature);

extern const char *
webkit_feature_get_details       (WebKitFeature *feature);

extern const char *
webkit_feature_get_category      (WebKitFeature *feature);

extern WebKitFeatureStatus
webkit_feature_get_status        (WebKitFeature *feature);

extern gboolean
webkit_feature_get_default_value (WebKitFeature *feature);

G_DEFINE_AUTOPTR_CLEANUP_FUNC(WebKitFeature, webkit_feature_unref)

#define WEBKIT_TYPE_FEATURE_LIST (webkit_feature_list_get_type())

typedef struct _WebKitFeatureList WebKitFeatureList;

extern GType
webkit_feature_list_get_type     (void) ;

extern WebKitFeatureList *
webkit_feature_list_ref          (WebKitFeatureList *feature_list);

extern void
webkit_feature_list_unref        (WebKitFeatureList *feature_list);

extern gsize
webkit_feature_list_get_length   (WebKitFeatureList *feature_list);

extern WebKitFeature *
webkit_feature_list_get          (WebKitFeatureList *feature_list,
                                  gsize              index);

G_DEFINE_AUTOPTR_CLEANUP_FUNC(WebKitFeatureList, webkit_feature_list_unref)



#endif /* WebKitFeature_h */

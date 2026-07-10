/* GStreamer
 * Copyright (C) 2013 Collabora Ltd.
 *   Author: Sebastian Dröge <sebastian.droege@collabora.co.uk>
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
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

#ifndef __GST_CAPS_FEATURES_H__
#define __GST_CAPS_FEATURES_H__

#include <gst/gstconfig.h>
#include <gst/glib-compat.h>
#include <gst/gstidstr.h>
#include <glib-object.h>
#include <glib.h>



typedef struct _GstCapsFeatures GstCapsFeatures;

extern GType _gst_caps_features_type;

#define GST_TYPE_CAPS_FEATURES (_gst_caps_features_type)
#define GST_IS_CAPS_FEATURES(object)       (gst_is_caps_features(object))
#define GST_CAPS_FEATURES_CAST(object)     ((GstCapsFeatures *)(object))
#define GST_CAPS_FEATURES(object)          (GST_CAPS_FEATURES_CAST(object))

#define GST_CAPS_FEATURE_MEMORY_SYSTEM_MEMORY "memory:SystemMemory"

extern GstCapsFeatures *_gst_caps_features_any;
#define GST_CAPS_FEATURES_ANY (_gst_caps_features_any)

extern GstCapsFeatures *_gst_caps_features_memory_system_memory;
#define GST_CAPS_FEATURES_MEMORY_SYSTEM_MEMORY (_gst_caps_features_memory_system_memory)

extern
GType             gst_caps_features_get_type (void);

extern
gboolean          gst_is_caps_features (gconstpointer obj);

extern
GstCapsFeatures * gst_caps_features_new_empty (void) ;

extern
GstCapsFeatures * gst_caps_features_new_any (void) ;

extern
GstCapsFeatures * gst_caps_features_new_single (const gchar *feature)  ;

extern
GstCapsFeatures * gst_caps_features_new_single_static_str (const gchar *feature)  ;

extern
GstCapsFeatures * gst_caps_features_new (const gchar *feature1, ...)  ;

extern
GstCapsFeatures * gst_caps_features_new_static_str (const gchar *feature1, ...)  ;

extern
GstCapsFeatures * gst_caps_features_new_valist (const gchar *feature1, va_list varargs) ;

extern
GstCapsFeatures * gst_caps_features_new_static_str_valist (const gchar *feature1, va_list varargs) ;

extern //xxxxxGLIB_DEPRECATED_IN(gst_caps_features_new_id_str)
GstCapsFeatures * gst_caps_features_new_id (GQuark feature1, ...) ;

extern //xxxxxGLIB_DEPRECATED_IN(gst_caps_features_new_id_str_valist)
GstCapsFeatures * gst_caps_features_new_id_valist (GQuark feature1, va_list varargs) ;

extern
GstCapsFeatures * gst_caps_features_new_id_str (const GstIdStr * feature1, ...) ;

extern
GstCapsFeatures * gst_caps_features_new_id_str_valist (const GstIdStr * feature1, va_list varargs) ;

extern
gboolean          gst_caps_features_set_parent_refcount  (GstCapsFeatures *features, gint * refcount);

extern
GstCapsFeatures * gst_caps_features_copy (const GstCapsFeatures * features) ;

extern
void              gst_caps_features_free (GstCapsFeatures * features);

extern
gchar *           gst_caps_features_to_string (const GstCapsFeatures * features) ;

extern
GstCapsFeatures * gst_caps_features_from_string (const gchar * features);

extern
guint             gst_caps_features_get_size (const GstCapsFeatures * features);

extern
const gchar *     gst_caps_features_get_nth (const GstCapsFeatures * features, guint i);

extern //xxxxxGLIB_DEPRECATED_IN(gst_caps_features_get_nth_id_str)
GQuark            gst_caps_features_get_nth_id (const GstCapsFeatures * features, guint i);

extern
const GstIdStr *  gst_caps_features_get_nth_id_str (const GstCapsFeatures * features, guint i);

extern
gboolean          gst_caps_features_contains (const GstCapsFeatures * features, const gchar * feature);

extern //xxxxxGLIB_DEPRECATED_IN(gst_caps_features_contains_id_str)
gboolean          gst_caps_features_contains_id (const GstCapsFeatures * features, GQuark feature);

extern
gboolean          gst_caps_features_contains_id_str (const GstCapsFeatures * features, const GstIdStr * feature);

extern
gboolean          gst_caps_features_is_equal (const GstCapsFeatures * features1, const GstCapsFeatures * features2);

extern
gboolean          gst_caps_features_is_any (const GstCapsFeatures * features);

extern
void              gst_caps_features_add (GstCapsFeatures * features, const gchar * feature);

extern
void              gst_caps_features_add_static_str (GstCapsFeatures * features, const gchar * feature);

extern //xxxxxGLIB_DEPRECATED_IN(gst_caps_features_add_id_str)
void              gst_caps_features_add_id (GstCapsFeatures * features, GQuark feature);

extern
void              gst_caps_features_add_id_str (GstCapsFeatures * features, const GstIdStr * feature);

extern
void              gst_caps_features_remove (GstCapsFeatures * features, const gchar * feature);

extern //xxxxxGLIB_DEPRECATED_IN(gst_caps_features_remove_id_str)
void              gst_caps_features_remove_id (GstCapsFeatures * features, GQuark feature);

extern
void              gst_caps_features_remove_id_str (GstCapsFeatures * features, const GstIdStr * feature);

////////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstCapsFeatures, gst_caps_features_free)



#endif /* __GST_CAPS_FEATURES_H__ */

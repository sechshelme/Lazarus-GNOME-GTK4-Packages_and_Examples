/* GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *
 * gstobject.h: Header for base GstObject
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

#ifndef __GST_OBJECT_H__
#define __GST_OBJECT_H__

#include <gst/gstconfig.h>

#include <glib-object.h>



#define GST_TYPE_OBJECT			(gst_object_get_type ())
#define GST_IS_OBJECT(obj)		(G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_OBJECT))
#define GST_IS_OBJECT_CLASS(klass)	(G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_OBJECT))
#define GST_OBJECT_GET_CLASS(obj)	(G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_OBJECT, GstObjectClass))
#define GST_OBJECT(obj)			(G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_OBJECT, GstObject))
#define GST_OBJECT_CLASS(klass)		(G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_OBJECT, GstObjectClass))
#define GST_OBJECT_CAST(obj)            ((GstObject*)(obj))
#define GST_OBJECT_CLASS_CAST(klass)    ((GstObjectClass*)(klass))

/**
 * GST_OBJECT_FLAG_CONSTRUCTED:
 *
 * Flag that's set when the object has been constructed. This can be used by
 * API such as base class setters to differentiate between the case where
 * they're called from a subclass's instance init function (and where the
 * object isn't fully constructed yet, and so one shouldn't do anything but
 * set values in the instance structure), and the case where the object is
 * constructed.
 *
 * Since: 1.24
 */

/**
 * GstObjectFlags:
 * @GST_OBJECT_FLAG_MAY_BE_LEAKED: the object is expected to stay alive even
 * after gst_deinit() has been called and so should be ignored by leak
 * detection tools. (Since: 1.10)
 * @GST_OBJECT_FLAG_CONSTRUCTED: flag that's set when the object has been
 * constructed. This can be used by API such as base class setters to
 * differentiate between the case where they're called from a subclass's
 * instance init function (and where the object isn't fully constructed yet,
 * and so one shouldn't do anything but set values in the instance structure),
 * and the case where the object is constructed. (Since: 1.24)
 * @GST_OBJECT_FLAG_LAST: subclasses can add additional flags starting from this flag
 *
 * The standard flags that an gstobject may have.
 */
typedef enum
{
  GST_OBJECT_FLAG_MAY_BE_LEAKED = (1 << 0),
  GST_OBJECT_FLAG_CONSTRUCTED = (1 << 1),
  /* padding */
  GST_OBJECT_FLAG_LAST = (1<<4)
} GstObjectFlags;

typedef struct _GstObject GstObject;
typedef struct _GstObjectClass GstObjectClass;

/**
 * GstObject:
 * @lock: object LOCK
 * @name: The name of the object
 * @parent: this object's parent, weak ref
 * @flags: flags for this object
 *
 * GStreamer base object class.
 */
struct _GstObject {
  GInitiallyUnowned object;

  /*< public >*/ /* with LOCK */
  GMutex         lock;        /* object LOCK */
  gchar         *name;        /* object name */
  GstObject     *parent;      /* this object's parent, weak ref */
  guint32        flags;

  /*< private >*/
  GList         *control_bindings;  /* List of GstControlBinding */
  guint64        control_rate;
  guint64        last_sync;

  gpointer _gst_reserved;
};

/**
 * GstObjectClass:
 * @parent_class: parent
 * @path_string_separator: separator used by gst_object_get_path_string()
 * @deep_notify: default signal handler
 *
 * GStreamer base object class.
 */
struct _GstObjectClass {
  GInitiallyUnownedClass parent_class;

  const gchar	*path_string_separator;

  /* signals */
  void          (*deep_notify)      (GstObject * object, GstObject * orig, GParamSpec * pspec);

  /*< public >*/
  /* virtual methods for subclasses */

  /*< private >*/
  gpointer _gst_reserved[GST_PADDING];
};

/* normal GObject stuff */

extern
GType		gst_object_get_type		(void);

/* name routines */

extern
gboolean	gst_object_set_name		(GstObject *object, const gchar *name);

extern
gchar*		gst_object_get_name		(GstObject *object) ;

/* parentage routines */

extern
gboolean	gst_object_set_parent		(GstObject *object, GstObject *parent);

extern
GstObject*	gst_object_get_parent		(GstObject *object) ;

extern
GstObject*	gst_object_get_toplevel (GstObject *object) ;

extern
void		gst_object_unparent		(GstObject *object);

extern
gboolean	gst_object_has_as_parent		(GstObject *object, GstObject *parent);

extern
gboolean	gst_object_has_as_ancestor	(GstObject *object, GstObject *ancestor);

extern //xxxxxGLIB_DEPRECATED_IN(gst_object_has_as_ancestor)
gboolean	gst_object_has_ancestor		(GstObject *object, GstObject *ancestor);

extern
void            gst_object_default_deep_notify  (GObject *object, GstObject *orig,
                                                 GParamSpec *pspec, gchar **excluded_props);

/* refcounting + life cycle */

extern
gpointer	gst_object_ref			(gpointer object);

extern
void		gst_object_unref		(gpointer object);

extern
void        gst_clear_object (GstObject **object_ptr);
#define     gst_clear_object(object_ptr) g_clear_pointer ((object_ptr), gst_object_unref)

extern
gpointer        gst_object_ref_sink		(gpointer object);

/* replace object pointer */

extern
gboolean        gst_object_replace		(GstObject **oldobj, GstObject *newobj);

/* printing out the 'path' of the object */

extern
gchar *		gst_object_get_path_string	(GstObject *object) ;

/* misc utils */

extern
gboolean	gst_object_check_uniqueness	(GList *list, const gchar *name);

/* controller functions */
#include <gst/gstcontrolbinding.h>
#include <gst/gstcontrolsource.h>

extern
GstClockTime    gst_object_suggest_next_sync      (GstObject * object);

extern
gboolean        gst_object_sync_values            (GstObject * object, GstClockTime timestamp);

extern
gboolean        gst_object_has_active_control_bindings   (GstObject *object);

extern
void            gst_object_set_control_bindings_disabled (GstObject *object, gboolean disabled);

extern
void            gst_object_set_control_binding_disabled  (GstObject *object,
                                                          const gchar * property_name,
                                                          gboolean disabled);

extern
gboolean        gst_object_add_control_binding    (GstObject * object, GstControlBinding * binding);

extern
GstControlBinding *
                gst_object_get_control_binding    (GstObject *object, const gchar * property_name) ;

extern
gboolean        gst_object_remove_control_binding (GstObject * object, GstControlBinding * binding);

extern
GValue *        gst_object_get_value              (GstObject * object, const gchar * property_name,
                                                   GstClockTime timestamp) ;
extern
gboolean        gst_object_get_value_array        (GstObject * object, const gchar * property_name,
                                                   GstClockTime timestamp, GstClockTime interval,
                                                   guint n_values, gpointer values);
extern
gboolean        gst_object_get_g_value_array      (GstObject * object, const gchar * property_name,
                                                   GstClockTime timestamp, GstClockTime interval,
                                                   guint n_values, GValue *values);
extern
GstClockTime    gst_object_get_control_rate       (GstObject * object);

extern
void            gst_object_set_control_rate       (GstObject * object, GstClockTime control_rate);

/**
 * GstObjectCallAsyncFunc:
 * @object: A #GstObject this function has been called against
 * @user_data: Data passed in the function where that callback has been passed
 *
 * Callback prototype used in #gst_object_call_async
 *
 * Since: 1.28
 */
typedef void  (*GstObjectCallAsyncFunc)           (GstObject * object,
                                                   gpointer user_data);

extern
void            gst_object_call_async             (GstObject * object,
                                                   GstObjectCallAsyncFunc func,
                                                   gpointer user_data);

////////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstObject, gst_object_unref)



#endif /* __GST_OBJECT_H__ */


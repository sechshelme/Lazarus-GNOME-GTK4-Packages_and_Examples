/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Object
 *
 * Copyright (C) 2005 Matthias Clasen
 * Copyright (C) 2008,2009 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#ifndef __GIOBJECTINFO_H__
#define __GIOBJECTINFO_H__

#if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)
#error "Only <girepository.h> can be included directly."
#endif

#include <gitypes.h>


/**
 * GIObjectInfoRefFunction: (skip)
 * @object: object instance pointer
 *
 * Increases the reference count of an object instance.
 *
 * Returns: (transfer full): the object instance
 */
typedef void * (*GIObjectInfoRefFunction) (void *object);

/**
 * GIObjectInfoUnrefFunction: (skip)
 * @object: object instance pointer
 *
 * Decreases the reference count of an object instance.
 */
typedef void   (*GIObjectInfoUnrefFunction) (void *object);

/**
 * GIObjectInfoSetValueFunction: (skip)
 * @value: a #GValue
 * @object: object instance pointer
 *
 * Update @value and attach the object instance pointer @object to it.
 */
typedef void   (*GIObjectInfoSetValueFunction) (GValue *value, void *object);

/**
 * GIObjectInfoGetValueFunction: (skip)
 * @value: a #GValue
 *
 * Extract an object instance out of @value
 *
 * Returns: (transfer full): the object instance
 */
typedef void * (*GIObjectInfoGetValueFunction) (const GValue *value);

/**
 * GI_IS_OBJECT_INFO
 * @info: an info structure
 *
 * Checks if @info is a #GIObjectInfo.
 */
#define GI_IS_OBJECT_INFO(info) \
    (g_base_info_get_type((GIBaseInfo*)info) ==  GI_INFO_TYPE_OBJECT)


extern
const gchar *     g_object_info_get_type_name	 (GIObjectInfo *info);

extern
const gchar *     g_object_info_get_type_init	 (GIObjectInfo *info);

extern
gboolean          g_object_info_get_abstract     (GIObjectInfo *info);

gboolean          g_object_info_get_final        (GIObjectInfo *info);

extern
gboolean          g_object_info_get_fundamental  (GIObjectInfo *info);

extern
GIObjectInfo *    g_object_info_get_parent       (GIObjectInfo *info);

extern
gint              g_object_info_get_n_interfaces (GIObjectInfo *info);

extern
GIInterfaceInfo * g_object_info_get_interface    (GIObjectInfo *info,
						  gint          n);

extern
gint              g_object_info_get_n_fields     (GIObjectInfo *info);

extern
GIFieldInfo *     g_object_info_get_field        (GIObjectInfo *info,
						  gint          n);

extern
gint              g_object_info_get_n_properties (GIObjectInfo *info);

extern
GIPropertyInfo *  g_object_info_get_property     (GIObjectInfo *info,
						  gint          n);

extern
gint              g_object_info_get_n_methods    (GIObjectInfo *info);

extern
GIFunctionInfo *  g_object_info_get_method       (GIObjectInfo *info,
						  gint          n);

extern
GIFunctionInfo *  g_object_info_find_method      (GIObjectInfo *info,
						  const gchar  *name);


extern
GIFunctionInfo *  g_object_info_find_method_using_interfaces (GIObjectInfo  *info,
							      const gchar   *name,
							      GIObjectInfo **implementor);


extern
gint              g_object_info_get_n_signals    (GIObjectInfo *info);

extern
GISignalInfo *    g_object_info_get_signal       (GIObjectInfo *info,
						  gint          n);


extern
GISignalInfo *    g_object_info_find_signal      (GIObjectInfo *info,
						  const gchar  *name);


extern
gint              g_object_info_get_n_vfuncs     (GIObjectInfo *info);

extern
GIVFuncInfo *     g_object_info_get_vfunc        (GIObjectInfo *info,
						  gint          n);

extern
GIVFuncInfo *     g_object_info_find_vfunc       (GIObjectInfo *info,
                                                  const gchar  *name);

GIVFuncInfo *     g_object_info_find_vfunc_using_interfaces (GIObjectInfo  *info,
								const gchar   *name,
								GIObjectInfo **implementor);

extern
gint              g_object_info_get_n_constants  (GIObjectInfo *info);

extern
GIConstantInfo *  g_object_info_get_constant     (GIObjectInfo *info,
						  gint          n);

extern
GIStructInfo *    g_object_info_get_class_struct (GIObjectInfo *info);


extern
const char *                 g_object_info_get_ref_function               (GIObjectInfo *info);

extern
GIObjectInfoRefFunction      g_object_info_get_ref_function_pointer       (GIObjectInfo *info);


extern
const char *                 g_object_info_get_unref_function             (GIObjectInfo *info);

extern
GIObjectInfoUnrefFunction    g_object_info_get_unref_function_pointer     (GIObjectInfo *info);


extern
const char *                 g_object_info_get_set_value_function         (GIObjectInfo *info);

extern
GIObjectInfoSetValueFunction g_object_info_get_set_value_function_pointer (GIObjectInfo *info);


extern
const char *                 g_object_info_get_get_value_function         (GIObjectInfo *info);

extern
GIObjectInfoGetValueFunction g_object_info_get_get_value_function_pointer (GIObjectInfo *info);




#endif  /* __GIOBJECTINFO_H__ */


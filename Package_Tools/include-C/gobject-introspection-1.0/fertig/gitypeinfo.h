/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Type
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

#ifndef __GITYPEINFO_H__
#define __GITYPEINFO_H__

#if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)
#error "Only <girepository.h> can be included directly."
#endif

#include <gitypes.h>


/**
 * GI_IS_TYPE_INFO
 * @info: an info structure
 *
 * Checks if @info is a #GITypeInfo.
 */
#define GI_IS_TYPE_INFO(info) \
    (g_base_info_get_type((GIBaseInfo*)info) ==  GI_INFO_TYPE_TYPE)

/**
 * G_TYPE_TAG_IS_BASIC
 * @tag: a type tag
 *
 * Checks if @tag is a basic type.
 *
 * Deprecated: 1.72: Use GI_TYPE_TAG_IS_BASIC() instead
 */
#define G_TYPE_TAG_IS_BASIC(tag) GI_TYPE_TAG_IS_BASIC(tag)

/**
 * GI_TYPE_TAG_IS_BASIC
 * @tag: a type tag
 *
 * Checks if @tag is a basic type.
 *
 * Since: 1.72
 */
//xxxxxxxxxxx #define GI_TYPE_TAG_IS_BASIC(tag) ((tag) < GI_TYPE_TAG_ARRAY || (tag) == GI_TYPE_TAG_UNICHAR)

/**
 * GI_TYPE_TAG_IS_NUMERIC:
 * @tag: a type tag
 *
 * Checks if @tag is a numeric type. That is, integer or floating point.
 *
 * Since: 1.72
 */
#define GI_TYPE_TAG_IS_NUMERIC(tag) ((tag) >= GI_TYPE_TAG_INT8 && (tag) <= GI_TYPE_TAG_DOUBLE)

/**
 * GI_TYPE_TAG_IS_NUMERIC:
 * @tag: a type tag
 *
 * Checks if @tag is a numeric type. That is, integer or floating point.
 *
 * Since: 1.72
 */
#define GI_TYPE_TAG_IS_NUMERIC(tag) ((tag) >= GI_TYPE_TAG_INT8 && (tag) <= GI_TYPE_TAG_DOUBLE)

/**
 * GI_TYPE_TAG_IS_NUMERIC:
 * @tag: a type tag
 *
 * Checks if @tag is a numeric type. That is, integer or floating point.
 *
 * Since: 1.72
 */
#define GI_TYPE_TAG_IS_NUMERIC(tag) ((tag) >= GI_TYPE_TAG_INT8 && (tag) <= GI_TYPE_TAG_DOUBLE)

/**
 * GI_TYPE_TAG_IS_CONTAINER:
 * @tag: a type tag
 *
 * Checks if @tag is a container type. That is, a type which may have a nonnull
 * return from g_type_info_get_param_type().
 *
 * Since: 1.72
 */
// xxxxxxxxxxxxx #define GI_TYPE_TAG_IS_CONTAINER(tag) ((tag) == GI_TYPE_TAG_ARRAY || ((tag) >= GI_TYPE_TAG_GLIST && (tag) <= GI_TYPE_TAG_GHASH))

extern
const gchar*           g_type_tag_to_string            (GITypeTag   type);

extern
const gchar*           g_info_type_to_string           (GIInfoType  type);


extern
gboolean               g_type_info_is_pointer          (GITypeInfo *info);

extern
GITypeTag              g_type_info_get_tag             (GITypeInfo *info);

extern
GITypeInfo *           g_type_info_get_param_type      (GITypeInfo *info,
						        gint       n);

extern
GIBaseInfo *           g_type_info_get_interface       (GITypeInfo *info);

extern
gint                   g_type_info_get_array_length    (GITypeInfo *info);

extern
gint                   g_type_info_get_array_fixed_size(GITypeInfo *info);

extern
gboolean               g_type_info_is_zero_terminated  (GITypeInfo *info);

extern
GIArrayType            g_type_info_get_array_type      (GITypeInfo *info);

GITypeTag              g_type_info_get_storage_type    (GITypeInfo *info);

void                   g_type_info_argument_from_hash_pointer (GITypeInfo *info,
                                                               gpointer    hash_pointer,
                                                               GIArgument *arg);

gpointer               g_type_info_hash_pointer_from_argument (GITypeInfo *info,
                                                               GIArgument *arg);

void                   gi_type_tag_argument_from_hash_pointer (GITypeTag   storage_type,
                                                               gpointer    hash_pointer,
                                                               GIArgument *arg);

gpointer               gi_type_tag_hash_pointer_from_argument (GITypeTag   storage_type,
                                                               GIArgument *arg);



#endif  /* __GITYPEINFO_H__ */


/*
 * Copyright (C) 2018 Igalia S.L.
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

#if !defined(__JSC_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <jsc/jsc.h> can be included directly."
#endif

#ifndef JSCValue_h
#define JSCValue_h

#include <glib-object.h>
#include <jsc/JSCDefines.h>



#define JSC_TYPE_VALUE            (jsc_value_get_type())

//JSC_DECLARE_FINAL_TYPE (JSCValue, jsc_value, JSC, VALUE, GObject)

typedef struct _JSCClass JSCClass;
typedef struct _JSCContext JSCContext;

typedef enum {
    JSC_VALUE_PROPERTY_CONFIGURABLE = 1 << 0,
    JSC_VALUE_PROPERTY_ENUMERABLE   = 1 << 1,
    JSC_VALUE_PROPERTY_WRITABLE     = 1 << 2
} JSCValuePropertyFlags;

typedef enum {
    JSC_TYPED_ARRAY_NONE = 0,
    JSC_TYPED_ARRAY_INT8,
    JSC_TYPED_ARRAY_INT16,
    JSC_TYPED_ARRAY_INT32,
    JSC_TYPED_ARRAY_INT64,
    JSC_TYPED_ARRAY_UINT8,
    JSC_TYPED_ARRAY_UINT8_CLAMPED,
    JSC_TYPED_ARRAY_UINT16,
    JSC_TYPED_ARRAY_UINT32,
    JSC_TYPED_ARRAY_UINT64,
    JSC_TYPED_ARRAY_FLOAT32,
    JSC_TYPED_ARRAY_FLOAT64,
} JSCTypedArrayType;

extern JSCContext *
jsc_value_get_context                     (JSCValue             *value);

extern JSCValue *
jsc_value_new_undefined                   (JSCContext           *context);

extern gboolean
jsc_value_is_undefined                    (JSCValue             *value);

extern JSCValue *
jsc_value_new_null                        (JSCContext           *context);

extern gboolean
jsc_value_is_null                         (JSCValue             *value);

extern JSCValue *
jsc_value_new_number                      (JSCContext           *context,
                                           double                number);
extern gboolean
jsc_value_is_number                       (JSCValue             *value);

extern double
jsc_value_to_double                       (JSCValue             *value);

extern gint32
jsc_value_to_int32                        (JSCValue             *value);

extern JSCValue *
jsc_value_new_boolean                     (JSCContext           *context,
                                           gboolean              value);
extern gboolean
jsc_value_is_boolean                      (JSCValue             *value);

extern gboolean
jsc_value_to_boolean                      (JSCValue             *value);

extern JSCValue *
jsc_value_new_string                      (JSCContext           *context,
                                           const char           *string);

extern JSCValue *
jsc_value_new_string_from_bytes           (JSCContext           *context,
                                           GBytes               *bytes);

extern gboolean
jsc_value_is_string                       (JSCValue             *value);

extern char *
jsc_value_to_string                       (JSCValue             *value);

extern GBytes *
jsc_value_to_string_as_bytes              (JSCValue             *value);

extern JSCValue *
jsc_value_new_array                       (JSCContext           *context,
                                           GType                 first_item_type,
                                           ...);

extern JSCValue *
jsc_value_new_array_from_garray           (JSCContext           *context,
                                           GPtrArray            *array);

extern JSCValue *
jsc_value_new_array_from_strv             (JSCContext           *context,
                                           const char *const    *strv);

extern gboolean
jsc_value_is_array                        (JSCValue             *value);

extern JSCValue *
jsc_value_new_object                      (JSCContext           *context,
                                           gpointer              instance,
                                           JSCClass             *jsc_class);

extern gboolean
jsc_value_is_object                       (JSCValue             *value);

extern gboolean
jsc_value_object_is_instance_of           (JSCValue             *value,
                                           const char           *name);

extern void
jsc_value_object_set_property             (JSCValue             *value,
                                           const char           *name,
                                           JSCValue             *property);

extern JSCValue *
jsc_value_object_get_property             (JSCValue             *value,
                                           const char           *name);

extern void
jsc_value_object_set_property_at_index    (JSCValue             *value,
                                           guint                 index,
                                           JSCValue             *property);

extern JSCValue *
jsc_value_object_get_property_at_index    (JSCValue             *value,
                                           guint                 index);

extern gboolean
jsc_value_object_has_property             (JSCValue             *value,
                                           const char           *name);

extern gboolean
jsc_value_object_delete_property          (JSCValue             *value,
                                           const char           *name);

extern gchar **
jsc_value_object_enumerate_properties     (JSCValue             *value);

extern JSCValue *
jsc_value_object_invoke_method            (JSCValue             *value,
                                           const char           *name,
                                           GType                 first_parameter_type,
                                           ...) ;

extern JSCValue *
jsc_value_object_invoke_methodv           (JSCValue             *value,
                                           const char           *name,
                                           guint                 n_parameters,
                                           JSCValue            **parameters) ;

extern void
jsc_value_object_define_property_data     (JSCValue             *value,
                                           const char           *property_name,
                                           JSCValuePropertyFlags flags,
                                           JSCValue             *property_value);

extern void
jsc_value_object_define_property_accessor (JSCValue             *value,
                                           const char           *property_name,
                                           JSCValuePropertyFlags flags,
                                           GType                 property_type,
                                           GCallback             getter,
                                           GCallback             setter,
                                           gpointer              user_data,
                                           GDestroyNotify        destroy_notify);

extern JSCValue *
jsc_value_new_function                    (JSCContext           *context,
                                           const char           *name,
                                           GCallback             callback,
                                           gpointer              user_data,
                                           GDestroyNotify        destroy_notify,
                                           GType                 return_type,
                                           guint                 n_params,
                                           ...);

extern JSCValue *
jsc_value_new_functionv                   (JSCContext           *context,
                                           const char           *name,
                                           GCallback             callback,
                                           gpointer              user_data,
                                           GDestroyNotify        destroy_notify,
                                           GType                 return_type,
                                           guint                 n_parameters,
                                           GType                *parameter_types);

extern JSCValue *
jsc_value_new_function_variadic           (JSCContext           *context,
                                           const char           *name,
                                           GCallback             callback,
                                           gpointer              user_data,
                                           GDestroyNotify        destroy_notify,
                                           GType                 return_type);

extern gboolean
jsc_value_is_function                     (JSCValue             *value);

extern JSCValue *
jsc_value_function_call                   (JSCValue             *value,
                                           GType                 first_parameter_type,
                                           ...) ;

extern JSCValue *
jsc_value_function_callv                  (JSCValue             *value,
                                           guint                 n_parameters,
                                           JSCValue            **parameters) ;
extern JSCValue *
jsc_value_new_array_buffer                (JSCContext           *context,
                                           gpointer              data,
                                           gsize                 size,
                                           GDestroyNotify        destroy_notify,
                                           gpointer              user_data);

extern gboolean
jsc_value_is_array_buffer                 (JSCValue             *value);

extern gpointer
jsc_value_array_buffer_get_data           (JSCValue             *value,
                                           gsize                *size);

extern gsize
jsc_value_array_buffer_get_size           (JSCValue             *value);

extern JSCValue *
jsc_value_new_typed_array                 (JSCContext           *context,
                                           JSCTypedArrayType     type,
                                           gsize                 length);

extern JSCValue *
jsc_value_new_typed_array_with_buffer     (JSCValue             *array_buffer,
                                           JSCTypedArrayType     type,
                                           gsize                 offset,
                                           gssize                length);

extern gboolean
jsc_value_is_typed_array                  (JSCValue             *value);

extern JSCTypedArrayType
jsc_value_typed_array_get_type            (JSCValue             *value);

extern gpointer
jsc_value_typed_array_get_data            (JSCValue             *value,
                                           gsize                *length);

extern gsize
jsc_value_typed_array_get_length          (JSCValue             *value);

extern gsize
jsc_value_typed_array_get_size            (JSCValue             *value);

extern gsize
jsc_value_typed_array_get_offset          (JSCValue             *value);

extern JSCValue *
jsc_value_typed_array_get_buffer          (JSCValue             *value);

extern gboolean
jsc_value_is_constructor                  (JSCValue             *value);

extern JSCValue *
jsc_value_constructor_call                (JSCValue             *value,
                                           GType                 first_parameter_type,
                                           ...);

extern JSCValue *
jsc_value_constructor_callv               (JSCValue             *value,
                                           guint                 n_parameters,
                                           JSCValue            **parameters);

extern JSCValue *
jsc_value_new_from_json                   (JSCContext           *context,
                                           const char           *json);

extern char *
jsc_value_to_json                         (JSCValue             *value,
                                           guint                 indent);



#endif /* JSCValue_h */

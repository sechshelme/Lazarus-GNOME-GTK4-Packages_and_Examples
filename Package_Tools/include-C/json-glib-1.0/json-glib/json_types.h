/* json-types.h - JSON data types
 * 
 * This file is part of JSON-GLib
 * Copyright (C) 2007  OpenedHand Ltd.
 * Copyright (C) 2009  Intel Corp.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Author:
 *   Emmanuele Bassi  <ebassi@linux.intel.com>
 */

#ifndef __JSON_TYPES_H__
#define __JSON_TYPES_H__

#if !defined(__JSON_GLIB_INSIDE__) && !defined(JSON_COMPILATION)
#error "Only <json-glib/json-glib.h> can be included directly."
#endif

#include <glib-object.h>
#include <json-glib/json-version-macros.h>



/**
 * JSON_NODE_TYPE:
 * @node: (type Json.Node): the [struct@Json.Node] to check
 *
 * Evaluates to the [enum@Json.NodeType] value contained by the node.
 */
#define JSON_NODE_TYPE(node)    (json_node_get_node_type ((node)))

/**
 * JSON_NODE_HOLDS:
 * @node: (type Json.Node): the [struct@Json.Node] to check
 * @t: (type Json.NodeType): the desired [enum@Json.NodeType]
 *
 * Evaluates to `TRUE` if the node holds the given type.
 *
 * Since: 0.10
 */
#define JSON_NODE_HOLDS(node,t)         (json_node_get_node_type ((node)) == (t))

/**
 * JSON_NODE_HOLDS_VALUE:
 * @node: (type Json.Node): the [struct@Json.Node] to check
 *
 * Evaluates to `TRUE` if the node holds a scalar value.
 *
 * Since: 0.10
 */
#define JSON_NODE_HOLDS_VALUE(node)     (JSON_NODE_HOLDS ((node), JSON_NODE_VALUE))

/**
 * JSON_NODE_HOLDS_OBJECT:
 * @node: (type Json.Node): the [struct@Json.Node] to check
 *
 * Evaluates to `TRUE` if the node holds a JSON object.
 *
 * Since: 0.10
 */
#define JSON_NODE_HOLDS_OBJECT(node)    (JSON_NODE_HOLDS ((node), JSON_NODE_OBJECT))

/**
 * JSON_NODE_HOLDS_ARRAY:
 * @node: (type Json.Node): the [struct@Json.Node] to check
 *
 * Evaluates to `TRUE` if the node holds a JSON array.
 *
 * Since: 0.10
 */
#define JSON_NODE_HOLDS_ARRAY(node)     (JSON_NODE_HOLDS ((node), JSON_NODE_ARRAY))

/**
 * JSON_NODE_HOLDS_NULL:
 * @node: (type Json.Node): the [struct@Json.Node] to check
 *
 * Evaluates to `TRUE` if the node holds `null`.
 *
 * Since: 0.10
 */
#define JSON_NODE_HOLDS_NULL(node)      (JSON_NODE_HOLDS ((node), JSON_NODE_NULL))

#define JSON_TYPE_NODE          (json_node_get_type ())
#define JSON_TYPE_OBJECT        (json_object_get_type ())
#define JSON_TYPE_ARRAY         (json_array_get_type ())

typedef struct _JsonNode        JsonNode;
typedef struct _JsonObject      JsonObject;
typedef struct _JsonArray       JsonArray;

/**
 * JsonNodeType:
 * @JSON_NODE_OBJECT: The node contains a JSON object
 * @JSON_NODE_ARRAY: The node contains a JSON array
 * @JSON_NODE_VALUE: The node contains a fundamental type
 * @JSON_NODE_NULL: Special type, for nodes containing null
 *
 * Indicates the content of a node.
 */
typedef enum {
  JSON_NODE_OBJECT,
  JSON_NODE_ARRAY,
  JSON_NODE_VALUE,
  JSON_NODE_NULL
} JsonNodeType;

/**
 * JsonObjectForeach:
 * @object: the iterated JSON object
 * @member_name: the name of the member
 * @member_node: the value of the member
 * @user_data: data passed to the function
 *
 * The function to be passed to [method@Json.Object.foreach_member].
 *
 * You should not add or remove members to and from @object within
 * this function.
 *
 * It is safe to change the value of @member_node.
 *
 * Since: 0.8
 */
typedef void (* JsonObjectForeach) (JsonObject  *object,
                                    const gchar *member_name,
                                    JsonNode    *member_node,
                                    gpointer     user_data);

/**
 * JsonArrayForeach:
 * @array: the iterated JSON array
 * @index_: the index of the element
 * @element_node: the value of the element at the given @index_
 * @user_data: data passed to the function
 *
 * The function to be passed to [method@Json.Array.foreach_element].
 *
 * You should not add or remove elements to and from @array within
 * this function.
 *
 * It is safe to change the value of @element_node.
 *
 * Since: 0.8
 */
typedef void (* JsonArrayForeach) (JsonArray  *array,
                                   guint       index_,
                                   JsonNode   *element_node,
                                   gpointer    user_data);

/*
 * JsonNode
 */

extern
GType                 json_node_get_type        (void) ;
extern
JsonNode *            json_node_new             (JsonNodeType  type);

extern
JsonNode *            json_node_alloc           (void);
extern
JsonNode *            json_node_init            (JsonNode     *node,
                                                 JsonNodeType  type);
extern
JsonNode *            json_node_init_object     (JsonNode     *node,
                                                 JsonObject   *object);
extern
JsonNode *            json_node_init_array      (JsonNode     *node,
                                                 JsonArray    *array);
extern
JsonNode *            json_node_init_int        (JsonNode     *node,
                                                 gint64        value);
extern
JsonNode *            json_node_init_double     (JsonNode     *node,
                                                 gdouble       value);
extern
JsonNode *            json_node_init_boolean    (JsonNode     *node,
                                                 gboolean      value);
extern
JsonNode *            json_node_init_string     (JsonNode     *node,
                                                 const char   *value);
extern
JsonNode *            json_node_init_null       (JsonNode     *node);

extern
JsonNode *            json_node_copy            (JsonNode     *node);
extern
void                  json_node_free            (JsonNode     *node);

extern
JsonNode *            json_node_ref             (JsonNode     *node);
extern
void                  json_node_unref           (JsonNode     *node);

extern
JsonNodeType          json_node_get_node_type   (JsonNode     *node);
extern
GType                 json_node_get_value_type  (JsonNode     *node);
extern
void                  json_node_set_parent      (JsonNode     *node,
                                                 JsonNode     *parent);
extern
JsonNode *            json_node_get_parent      (JsonNode     *node);
extern
const gchar *         json_node_type_name       (JsonNode     *node);

extern
void                  json_node_set_object      (JsonNode     *node,
                                                 JsonObject   *object);
extern
void                  json_node_take_object     (JsonNode     *node,
                                                 JsonObject   *object);
extern
JsonObject *          json_node_get_object      (JsonNode     *node);
extern
JsonObject *          json_node_dup_object      (JsonNode     *node);
extern
void                  json_node_set_array       (JsonNode     *node,
                                                 JsonArray    *array);
extern
void                  json_node_take_array      (JsonNode     *node,
                                                 JsonArray    *array);
extern
JsonArray *           json_node_get_array       (JsonNode     *node);
extern
JsonArray *           json_node_dup_array       (JsonNode     *node);
extern
void                  json_node_set_value       (JsonNode     *node,
                                                 const GValue *value);
extern
void                  json_node_get_value       (JsonNode     *node,
                                                 GValue       *value);
extern
void                  json_node_set_string      (JsonNode     *node,
                                                 const gchar  *value);
extern
const gchar *         json_node_get_string      (JsonNode     *node);
extern
gchar *               json_node_dup_string      (JsonNode     *node);
extern
void                  json_node_set_int         (JsonNode     *node,
                                                 gint64        value);
extern
gint64                json_node_get_int         (JsonNode     *node);
extern
void                  json_node_set_double      (JsonNode     *node,
                                                 gdouble       value);
extern
gdouble               json_node_get_double      (JsonNode     *node);
extern
void                  json_node_set_boolean     (JsonNode     *node,
                                                 gboolean      value);
extern
gboolean              json_node_get_boolean     (JsonNode     *node);
extern
gboolean              json_node_is_null         (JsonNode     *node);

extern
void                  json_node_seal            (JsonNode     *node);
extern
gboolean              json_node_is_immutable    (JsonNode     *node);

extern
guint                 json_string_hash            (gconstpointer  key);
extern
gboolean              json_string_equal           (gconstpointer  a,
                                                   gconstpointer  b);
extern
gint                  json_string_compare         (gconstpointer  a,
                                                   gconstpointer  b);

extern
guint                 json_node_hash              (gconstpointer  key);
extern
gboolean              json_node_equal             (gconstpointer  a,
                                                   gconstpointer  b);

/*
 * JsonObject
 */
extern
GType                 json_object_get_type           (void) ;
extern
JsonObject *          json_object_new                (void);
extern
JsonObject *          json_object_ref                (JsonObject  *object);
extern
void                  json_object_unref              (JsonObject  *object);


void                  json_object_add_member         (JsonObject  *object,
                                                      const gchar *member_name,
                                                      JsonNode    *node); // JSON_DEPRECATED_IN_1_0_FOR(json_object_set_member)

extern
void                  json_object_set_member         (JsonObject  *object,
                                                      const gchar *member_name,
                                                      JsonNode    *node);
extern
void                  json_object_set_int_member     (JsonObject  *object,
                                                      const gchar *member_name,
                                                      gint64       value);
extern
void                  json_object_set_double_member  (JsonObject  *object,
                                                      const gchar *member_name,
                                                      gdouble      value);
extern
void                  json_object_set_boolean_member (JsonObject  *object,
                                                      const gchar *member_name,
                                                      gboolean     value);
extern
void                  json_object_set_string_member  (JsonObject  *object,
                                                      const gchar *member_name,
                                                      const gchar *value);
extern
void                  json_object_set_null_member    (JsonObject  *object,
                                                      const gchar *member_name);
extern
void                  json_object_set_array_member   (JsonObject  *object,
                                                      const gchar *member_name,
                                                      JsonArray   *value);
extern
void                  json_object_set_object_member  (JsonObject  *object,
                                                      const gchar *member_name,
                                                      JsonObject  *value);
extern
GList *               json_object_get_members        (JsonObject  *object);
extern
JsonNode *            json_object_get_member         (JsonObject  *object,
                                                      const gchar *member_name);
extern
JsonNode *            json_object_dup_member         (JsonObject  *object,
                                                      const gchar *member_name);
extern
gint64                json_object_get_int_member                        (JsonObject  *object,
                                                                         const gchar *member_name);
gint64                json_object_get_int_member_with_default           (JsonObject  *object,
                                                                         const char  *member_name,
                                                                        gint64       default_value);
extern
gdouble               json_object_get_double_member                     (JsonObject  *object,
                                                                         const gchar *member_name);
double                json_object_get_double_member_with_default        (JsonObject  *object,
                                                                         const char  *member_name,
                                                                         double       default_value);
extern
gboolean              json_object_get_boolean_member                    (JsonObject  *object,
                                                                         const gchar *member_name);
gboolean              json_object_get_boolean_member_with_default       (JsonObject  *object,
                                                                         const char  *member_name,
                                                                         gboolean     default_value);
extern
const gchar *         json_object_get_string_member                     (JsonObject  *object,
                                                                         const gchar *member_name);
const char *          json_object_get_string_member_with_default        (JsonObject  *object,
                                                                         const char  *member_name,
                                                                         const char  *default_value);
extern
gboolean              json_object_get_null_member    (JsonObject  *object,
                                                      const gchar *member_name);
extern
JsonArray *           json_object_get_array_member   (JsonObject  *object,
                                                      const gchar *member_name);
extern
JsonObject *          json_object_get_object_member  (JsonObject  *object,
                                                      const gchar *member_name);
extern
gboolean              json_object_has_member         (JsonObject  *object,
                                                      const gchar *member_name);
extern
void                  json_object_remove_member      (JsonObject  *object,
                                                      const gchar *member_name);
extern
GList *               json_object_get_values         (JsonObject  *object);
extern
guint                 json_object_get_size           (JsonObject  *object);
extern
void                  json_object_foreach_member     (JsonObject  *object,
                                                      JsonObjectForeach func,
                                                      gpointer     data);

extern
void                  json_object_seal               (JsonObject  *object);
extern
gboolean              json_object_is_immutable       (JsonObject  *object);

extern
guint                 json_object_hash               (gconstpointer key);
extern
gboolean              json_object_equal              (gconstpointer a,
                                                      gconstpointer b);

/**
 * JsonObjectIter:
 *
 * An iterator object used to iterate over the members of a JSON object.
 *
 * `JsonObjectIter` must be allocated on the stack and initialised using
 * [method@Json.ObjectIter.init] or [method@Json.ObjectIter.init_ordered].
 *
 * The iterator is invalidated if the object is modified during
 * iteration.
 *
 * All the fields in the `JsonObjectIter` structure are private and should
 * never be accessed directly.
 *
 * Since: 1.2 
 */
typedef struct {
  /*< private >*/
  gpointer priv_pointer[6];
  int      priv_int[2];
  gboolean priv_boolean[1];
} JsonObjectIter;

extern
void                  json_object_iter_init          (JsonObjectIter  *iter,
                                                      JsonObject      *object);
extern
gboolean              json_object_iter_next          (JsonObjectIter  *iter,
                                                      const gchar    **member_name,
                                                      JsonNode       **member_node);

void                  json_object_iter_init_ordered  (JsonObjectIter  *iter,
                                                      JsonObject      *object);
gboolean              json_object_iter_next_ordered  (JsonObjectIter  *iter,
                                                      const char     **member_name,
                                                      JsonNode       **member_node);

extern
GType                 json_array_get_type            (void) ;
extern
JsonArray *           json_array_new                 (void);
extern
JsonArray *           json_array_sized_new           (guint        n_elements);
extern
JsonArray *           json_array_ref                 (JsonArray   *array);
extern
void                  json_array_unref               (JsonArray   *array);
extern
void                  json_array_add_element         (JsonArray   *array,
                                                      JsonNode    *node);
extern
void                  json_array_add_int_element     (JsonArray   *array,
                                                      gint64       value);
extern
void                  json_array_add_double_element  (JsonArray   *array,
                                                      gdouble      value);
extern
void                  json_array_add_boolean_element (JsonArray   *array,
                                                      gboolean     value);
extern
void                  json_array_add_string_element  (JsonArray   *array,
                                                      const gchar *value);
extern
void                  json_array_add_null_element    (JsonArray   *array);
extern
void                  json_array_add_array_element   (JsonArray   *array,
                                                      JsonArray   *value);
extern
void                  json_array_add_object_element  (JsonArray   *array,
                                                      JsonObject  *value);
extern
GList *               json_array_get_elements        (JsonArray   *array);
extern
JsonNode *            json_array_get_element         (JsonArray   *array,
                                                      guint        index_);
extern
gint64                json_array_get_int_element     (JsonArray   *array,
                                                      guint        index_);
extern
gdouble               json_array_get_double_element  (JsonArray   *array,
                                                      guint        index_);
extern
gboolean              json_array_get_boolean_element (JsonArray   *array,
                                                      guint        index_);
extern
const gchar *         json_array_get_string_element  (JsonArray   *array,
                                                      guint        index_);
extern
gboolean              json_array_get_null_element    (JsonArray   *array,
                                                      guint        index_);
extern
JsonArray *           json_array_get_array_element   (JsonArray   *array,
                                                      guint        index_);
extern
JsonObject *          json_array_get_object_element  (JsonArray   *array,
                                                      guint        index_);
extern
JsonNode *            json_array_dup_element         (JsonArray   *array,
                                                      guint        index_);
extern
void                  json_array_remove_element      (JsonArray   *array,
                                                      guint        index_);
extern
guint                 json_array_get_length          (JsonArray   *array);
extern
void                  json_array_foreach_element     (JsonArray   *array,
                                                      JsonArrayForeach func,
                                                      gpointer     data);
extern
void                  json_array_seal                (JsonArray   *array);
extern
gboolean              json_array_is_immutable        (JsonArray   *array);

extern
guint                 json_array_hash                (gconstpointer key);
extern
gboolean              json_array_equal               (gconstpointer a,
                                                      gconstpointer b);



#endif /* __JSON_TYPES_H__ */

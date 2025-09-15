/* json-generator.h - JSON streams generator
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

#ifndef __JSON_GENERATOR_H__
#define __JSON_GENERATOR_H__

#if !defined(__JSON_GLIB_INSIDE__) && !defined(JSON_COMPILATION)
#error "Only <json-glib/json-glib.h> can be included directly."
#endif

#include <json-glib/json-types.h>
#include <gio/gio.h>



#define JSON_TYPE_GENERATOR             (json_generator_get_type ())
#define JSON_GENERATOR(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), JSON_TYPE_GENERATOR, JsonGenerator))
#define JSON_GENERATOR_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST ((klass), JSON_TYPE_GENERATOR, JsonGeneratorClass))
#define JSON_IS_GENERATOR(obj)          (G_TYPE_CHECK_INSTANCE_TYPE ((obj), JSON_TYPE_GENERATOR))
#define JSON_IS_GENERATOR_CLASS(klass)  (G_TYPE_CHECK_CLASS_TYPE ((klass), JSON_TYPE_GENERATOR))
#define JSON_GENERATOR_GET_CLASS(obj)   (G_TYPE_INSTANCE_GET_CLASS ((obj), JSON_TYPE_GENERATOR, JsonGeneratorClass))

typedef struct _JsonGenerator           JsonGenerator;
typedef struct _JsonGeneratorPrivate    JsonGeneratorPrivate;
typedef struct _JsonGeneratorClass      JsonGeneratorClass;

struct _JsonGenerator
{
  /*< private >*/
  GObject parent_instance;

  JsonGeneratorPrivate *priv;
};

struct _JsonGeneratorClass
{
  /*< private >*/
  GObjectClass parent_class;

  /* padding, for future expansion */
  void (* _json_reserved1) (void);
  void (* _json_reserved2) (void);
  void (* _json_reserved3) (void);
  void (* _json_reserved4) (void);
};

extern
GType json_generator_get_type (void) ;

extern
JsonGenerator * json_generator_new              (void);

extern
void            json_generator_set_pretty       (JsonGenerator  *generator,
                                                 gboolean        is_pretty);
extern
gboolean        json_generator_get_pretty       (JsonGenerator  *generator);
extern
void            json_generator_set_indent       (JsonGenerator  *generator,
                                                 guint           indent_level);
extern
guint           json_generator_get_indent       (JsonGenerator  *generator);
extern
void            json_generator_set_indent_char  (JsonGenerator  *generator,
                                                 gunichar        indent_char);
extern
gunichar        json_generator_get_indent_char  (JsonGenerator  *generator);
extern
void            json_generator_set_root         (JsonGenerator  *generator,
                                                 JsonNode       *node);
extern
JsonNode *      json_generator_get_root         (JsonGenerator  *generator);

extern
GString        *json_generator_to_gstring       (JsonGenerator  *generator,
                                                 GString        *string);

extern
gchar *         json_generator_to_data          (JsonGenerator  *generator,
                                                 gsize          *length);
extern
gboolean        json_generator_to_file          (JsonGenerator  *generator,
                                                 const gchar    *filename,
                                                 GError        **error);
extern
gboolean        json_generator_to_stream        (JsonGenerator  *generator,
                                                 GOutputStream  *stream,
                                                 GCancellable   *cancellable,
                                                 GError        **error);




#endif /* __JSON_GENERATOR_H__ */

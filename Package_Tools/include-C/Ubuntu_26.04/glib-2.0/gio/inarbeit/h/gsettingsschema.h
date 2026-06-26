/*
 * Copyright © 2010 Codethink Limited
 * Copyright © 2011 Canonical Limited
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __G_SETTINGS_SCHEMA_H__
#define __G_SETTINGS_SCHEMA_H__

#include <glib-object.h>
#include <gio/gio-visibility.h>



typedef struct _GSettingsSchemaSource                       GSettingsSchemaSource;
typedef struct _GSettingsSchema                             GSettingsSchema;
typedef struct _GSettingsSchemaKey                          GSettingsSchemaKey;

#define                 G_TYPE_SETTINGS_SCHEMA_SOURCE                   (g_settings_schema_source_get_type ())
extern
GType                   g_settings_schema_source_get_type               (void) ;

extern
GSettingsSchemaSource * g_settings_schema_source_get_default            (void);
extern
GSettingsSchemaSource * g_settings_schema_source_ref                    (GSettingsSchemaSource  *source);
extern
void                    g_settings_schema_source_unref                  (GSettingsSchemaSource  *source);

extern
GSettingsSchemaSource * g_settings_schema_source_new_from_directory     (const gchar            *directory,
                                                                         GSettingsSchemaSource  *parent,
                                                                         gboolean                trusted,
                                                                         GError                **error);

extern
GSettingsSchema *       g_settings_schema_source_lookup                 (GSettingsSchemaSource  *source,
                                                                         const gchar            *schema_id,
                                                                         gboolean                recursive);

extern
void                    g_settings_schema_source_list_schemas           (GSettingsSchemaSource   *source,
                                                                         gboolean                 recursive,
                                                                         gchar                 ***non_relocatable,
                                                                         gchar                 ***relocatable);

#define                 G_TYPE_SETTINGS_SCHEMA                          (g_settings_schema_get_type ())
extern
GType                   g_settings_schema_get_type                      (void) ;

extern
GSettingsSchema *       g_settings_schema_ref                           (GSettingsSchema        *schema);
extern
void                    g_settings_schema_unref                         (GSettingsSchema        *schema);

extern
const gchar *           g_settings_schema_get_id                        (GSettingsSchema        *schema);
extern
const gchar *           g_settings_schema_get_path                      (GSettingsSchema        *schema);
extern
GSettingsSchemaKey *    g_settings_schema_get_key                       (GSettingsSchema        *schema,
                                                                         const gchar            *name);
extern
gboolean                g_settings_schema_has_key                       (GSettingsSchema        *schema,
                                                                         const gchar            *name);
extern
gchar**                 g_settings_schema_list_keys                     (GSettingsSchema        *schema);


extern
gchar **                g_settings_schema_list_children                 (GSettingsSchema        *schema);

#define                 G_TYPE_SETTINGS_SCHEMA_KEY                      (g_settings_schema_key_get_type ())
extern
GType                   g_settings_schema_key_get_type                  (void) ;

extern
GSettingsSchemaKey *    g_settings_schema_key_ref                       (GSettingsSchemaKey     *key);
extern
void                    g_settings_schema_key_unref                     (GSettingsSchemaKey     *key);

extern
const GVariantType *    g_settings_schema_key_get_value_type            (GSettingsSchemaKey     *key);
extern
GVariant *              g_settings_schema_key_get_default_value         (GSettingsSchemaKey     *key);
extern
GVariant *              g_settings_schema_key_get_range                 (GSettingsSchemaKey     *key);
extern
gboolean                g_settings_schema_key_range_check               (GSettingsSchemaKey     *key,
                                                                         GVariant               *value);

extern
const gchar *           g_settings_schema_key_get_name                  (GSettingsSchemaKey     *key);
extern
const gchar *           g_settings_schema_key_get_summary               (GSettingsSchemaKey     *key);
extern
const gchar *           g_settings_schema_key_get_description           (GSettingsSchemaKey     *key);



#endif /* __G_SETTINGS_SCHEMA_H__ */

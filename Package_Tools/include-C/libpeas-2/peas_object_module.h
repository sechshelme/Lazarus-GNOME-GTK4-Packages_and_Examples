/*
 * peas-object-module.h
 * This file is part of libpeas
 *
 * Copyright (C) 2003 Marco Pesenti Gritti
 * Copyright (C) 2003, 2004 Christian Persch
 * Copyright (C) 2005-2007 Paolo Maggi
 * Copyright (C) 2008 Jesse van den Kieboom
 *
 * libpeas is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * libpeas is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined (LIBPEAS_INSIDE) && !defined (LIBPEAS_COMPILATION)
# error "Only <libpeas.h> can be included directly."
#endif

#include <glib-object.h>
#include <gmodule.h>

#include "peas-version-macros.h"


#define PEAS_TYPE_OBJECT_MODULE (peas_object_module_get_type ())

// G_DECLARE_DERIVABLE_TYPE (PeasObjectModule, peas_object_module, PEAS, OBJECT_MODULE, GTypeModule)

/**
 * PeasFactoryFunc:
 * @n_parameters: The number of paramteters.
 * @parameters: (array length=n_parameters): The parameters.
 * @user_data: Optional data to be passed to the function, or %NULL.
 *
 * A #PeasFactoryFunc is a factory function which will instanciate a new
 * extension of a given type. [ctor@GObject.Object.newv] is such a function.
 *
 * It is used with [method@ObjectModule.register_extension_factory].
 *
 * Returns: (transfer full): The created object.
 */
typedef GObject *(*PeasFactoryFunc)   (guint          n_parameters,
                                       GParameter    *parameters,
                                       gpointer       user_data);

/**
 * PeasObjectModuleClass:
 * @parent_class: The parent class.
 *
 * The class structure for #PeasObjectModule.
 */
struct _PeasObjectModuleClass
{
  GTypeModuleClass parent_class;

  /*< private >*/
  gpointer _reserved[8];
};

extern
PeasObjectModule *peas_object_module_new                        (const char       *module_name,
                                                                 const char       *path,
                                                                 gboolean          resident);
extern
PeasObjectModule *peas_object_module_new_full                   (const char       *module_name,
                                                                 const char       *path,
                                                                 gboolean          resident,
                                                                 gboolean          local_linkage);
extern
PeasObjectModule *peas_object_module_new_embedded               (const char       *module_name,
                                                                 const char       *symbol);
// xxxxxxxxxxxG_GNUC_BEGIN_IGNORE_DEPRECATIONS
extern
GObject          *peas_object_module_create_object              (PeasObjectModule *module,
                                                                 GType             exten_type,
                                                                 guint             n_parameters,
                                                                 GParameter       *parameters);
// xxxxxxxxxxxxxxG_GNUC_END_IGNORE_DEPRECATIONS
extern
gboolean          peas_object_module_provides_object            (PeasObjectModule *module,
                                                                 GType             exten_type);
extern
const char       *peas_object_module_get_path                   (PeasObjectModule *module);
extern
const char       *peas_object_module_get_module_name            (PeasObjectModule *module);
extern
const char       *peas_object_module_get_symbol                 (PeasObjectModule *module);
extern
GModule          *peas_object_module_get_library                (PeasObjectModule *module);
extern
void              peas_object_module_register_extension_factory (PeasObjectModule *module,
                                                                 GType             exten_type,
                                                                 PeasFactoryFunc   factory_func,
                                                                 gpointer          user_data,
                                                                 GDestroyNotify    destroy_func);
extern
void              peas_object_module_register_extension_type    (PeasObjectModule *module,
                                                                 GType             exten_type,
                                                                 GType             impl_type);



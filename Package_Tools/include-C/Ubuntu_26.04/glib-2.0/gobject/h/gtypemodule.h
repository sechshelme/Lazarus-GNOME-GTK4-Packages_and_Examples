/* GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 2000 Red Hat, Inc.
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
#ifndef __G_TYPE_MODULE_H__
#define __G_TYPE_MODULE_H__

#if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)
#error "Only <glib-object.h> can be included directly."
#endif

#include <gobject/gobject.h>
#include <gobject/genums.h>



typedef struct _GTypeModule      GTypeModule;
typedef struct _GTypeModuleClass GTypeModuleClass;

#define G_TYPE_TYPE_MODULE              (g_type_module_get_type ())
#define G_TYPE_MODULE(module)           (G_TYPE_CHECK_INSTANCE_CAST ((module), G_TYPE_TYPE_MODULE, GTypeModule))
#define G_TYPE_MODULE_CLASS(class)      (G_TYPE_CHECK_CLASS_CAST ((class), G_TYPE_TYPE_MODULE, GTypeModuleClass))
#define G_IS_TYPE_MODULE(module)        (G_TYPE_CHECK_INSTANCE_TYPE ((module), G_TYPE_TYPE_MODULE))
#define G_IS_TYPE_MODULE_CLASS(class)   (G_TYPE_CHECK_CLASS_TYPE ((class), G_TYPE_TYPE_MODULE))
#define G_TYPE_MODULE_GET_CLASS(module) (G_TYPE_INSTANCE_GET_CLASS ((module), G_TYPE_TYPE_MODULE, GTypeModuleClass))


struct _GTypeModule 
{
  GObject parent_instance;

  guint use_count;
  GSList *type_infos;
  GSList *interface_infos;

  /*< public >*/
  gchar *name;
};

/**
 * GTypeModuleClass:
 * @parent_class: the parent class
 * @load: loads the module and registers one or more types using
 *  g_type_module_register_type().
 * @unload: unloads the module
 * 
 * In order to implement dynamic loading of types based on #GTypeModule, 
 * the @load and @unload functions in #GTypeModuleClass must be implemented.
 */
struct _GTypeModuleClass
{
  GObjectClass parent_class;

  /*< public >*/
  gboolean (* load)   (GTypeModule *module);
  void     (* unload) (GTypeModule *module);

  /*< private >*/
  /* Padding for future expansion */
  void (*reserved1) (void);
  void (*reserved2) (void);
  void (*reserved3) (void);
  void (*reserved4) (void);
};


/**
 * G_IMPLEMENT_INTERFACE_DYNAMIC:
 * @TYPE_IFACE: The #GType of the interface to add
 * @iface_init: The interface init function
 *
 * A convenience macro to ease interface addition in the @_C_ section
 * of G_DEFINE_DYNAMIC_TYPE_EXTENDED().
 *
 * See G_DEFINE_DYNAMIC_TYPE_EXTENDED() for an example.
 *
 * Note that this macro can only be used together with the
 * G_DEFINE_DYNAMIC_TYPE_EXTENDED macros, since it depends on variable
 * names from that macro.
 *
 * Since: 2.24
 */

/**
 * G_ADD_PRIVATE_DYNAMIC:
 * @TypeName: the name of the type in CamelCase
 *
 * A convenience macro to ease adding private data to instances of a new dynamic
 * type in the @_C_ section of G_DEFINE_DYNAMIC_TYPE_EXTENDED().
 *
 * See G_ADD_PRIVATE() for details, it is similar but for static types.
 *
 * Note that this macro can only be used together with the
 * G_DEFINE_DYNAMIC_TYPE_EXTENDED macros, since it depends on variable
 * names from that macro.
 *
 * Since: 2.38
 */

extern
GType    g_type_module_get_type       (void) ;
extern
gboolean g_type_module_use            (GTypeModule          *module);
extern
void     g_type_module_unuse          (GTypeModule          *module);
extern
void     g_type_module_set_name       (GTypeModule          *module,
                                       const gchar          *name);
extern
GType    g_type_module_register_type  (GTypeModule          *module,
                                       GType                 parent_type,
                                       const gchar          *type_name,
                                       const GTypeInfo      *type_info,
                                       GTypeFlags            flags);
extern
void     g_type_module_add_interface  (GTypeModule          *module,
                                       GType                 instance_type,
                                       GType                 interface_type,
                                       const GInterfaceInfo *interface_info);
extern
GType    g_type_module_register_enum  (GTypeModule          *module,
                                       const gchar          *name,
                                       const GEnumValue     *const_static_values);
extern
GType    g_type_module_register_flags (GTypeModule          *module,
                                       const gchar          *name,
                                       const GFlagsValue    *const_static_values);



#endif /* __G_TYPE_MODULE_H__ */

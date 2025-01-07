/*
 * Copyright (C) 2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <glib-object.h>



#define ADW_TYPE_ENUM_LIST_ITEM (adw_enum_list_item_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwEnumListItem, adw_enum_list_item, ADW, ENUM_LIST_ITEM, GObject)

extern
int adw_enum_list_item_get_value (AdwEnumListItem *self);

extern
const char *adw_enum_list_item_get_name (AdwEnumListItem *self);

extern
const char *adw_enum_list_item_get_nick (AdwEnumListItem *self);

#define ADW_TYPE_ENUM_LIST_MODEL (adw_enum_list_model_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwEnumListModel, adw_enum_list_model, ADW, ENUM_LIST_MODEL, GObject)

extern
AdwEnumListModel *adw_enum_list_model_new (GType enum_type) ;

extern
GType adw_enum_list_model_get_enum_type (AdwEnumListModel *self);

extern
guint adw_enum_list_model_find_position (AdwEnumListModel *self,
                                         int               value);



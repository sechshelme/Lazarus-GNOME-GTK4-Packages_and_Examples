/*
 * Copyright (C) 2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <glib-object.h>



#define ADAP_TYPE_ENUM_LIST_ITEM (adap_enum_list_item_get_type())

extern
G_DECLARE_FINAL_TYPE (AdapEnumListItem, adap_enum_list_item, ADAP, ENUM_LIST_ITEM, GObject)

extern
int adap_enum_list_item_get_value (AdapEnumListItem *self);

extern
const char *adap_enum_list_item_get_name (AdapEnumListItem *self);

extern
const char *adap_enum_list_item_get_nick (AdapEnumListItem *self);

#define ADAP_TYPE_ENUM_LIST_MODEL (adap_enum_list_model_get_type())

extern
G_DECLARE_FINAL_TYPE (AdapEnumListModel, adap_enum_list_model, ADAP, ENUM_LIST_MODEL, GObject)

extern
AdapEnumListModel *adap_enum_list_model_new (GType enum_type) ;

extern
GType adap_enum_list_model_get_enum_type (AdapEnumListModel *self);

extern
guint adap_enum_list_model_find_position (AdapEnumListModel *self,
                                         int               value);



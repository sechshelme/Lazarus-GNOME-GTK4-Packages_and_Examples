/*
 * Copyright (C) 2018-2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>
#include "adw-action-row.h"



#define ADW_TYPE_COMBO_ROW (adw_combo_row_get_type())

extern
G_DECLARE_DERIVABLE_TYPE (AdwComboRow, adw_combo_row, ADW, COMBO_ROW, AdwActionRow)

/**
 * AdwComboRowClass
 * @parent_class: The parent class
 */
struct _AdwComboRowClass
{
  AdwActionRowClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adw_combo_row_new (void) ;

extern
GListModel *adw_combo_row_get_model (AdwComboRow *self);
extern
void        adw_combo_row_set_model (AdwComboRow *self,
                                     GListModel  *model);

extern
guint adw_combo_row_get_selected (AdwComboRow *self);
extern
void  adw_combo_row_set_selected (AdwComboRow *self,
                                  guint        position);

extern
gpointer adw_combo_row_get_selected_item (AdwComboRow *self);

extern
GtkListItemFactory *adw_combo_row_get_factory (AdwComboRow        *self);
extern
void                adw_combo_row_set_factory (AdwComboRow        *self,
                                               GtkListItemFactory *factory);

extern
GtkListItemFactory *adw_combo_row_get_list_factory (AdwComboRow        *self);
extern
void                adw_combo_row_set_list_factory (AdwComboRow        *self,
                                                    GtkListItemFactory *factory);

extern
GtkExpression *adw_combo_row_get_expression (AdwComboRow   *self);
extern
void           adw_combo_row_set_expression (AdwComboRow   *self,
                                             GtkExpression *expression);

extern
gboolean adw_combo_row_get_use_subtitle (AdwComboRow *self);
extern
void     adw_combo_row_set_use_subtitle (AdwComboRow *self,
                                         gboolean     use_subtitle);

extern
gboolean adw_combo_row_get_enable_search (AdwComboRow *self);
extern
void     adw_combo_row_set_enable_search (AdwComboRow *self,
                                          gboolean     enable_search);



/*
 * Copyright (C) 2018-2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>
#include "adap-action-row.h"



#define ADAP_TYPE_COMBO_ROW (adap_combo_row_get_type())

extern
//////////G_DECLARE_DERIVABLE_TYPE (AdapComboRow, adap_combo_row, ADAP, COMBO_ROW, AdapActionRow)

/**
 * AdapComboRowClass
 * @parent_class: The parent class
 */
struct _AdapComboRowClass
{
  AdapActionRowClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adap_combo_row_new (void) ;

extern
GListModel *adap_combo_row_get_model (AdapComboRow *self);
extern
void        adap_combo_row_set_model (AdapComboRow *self,
                                     GListModel  *model);

extern
guint adap_combo_row_get_selected (AdapComboRow *self);
extern
void  adap_combo_row_set_selected (AdapComboRow *self,
                                  guint        position);

extern
gpointer adap_combo_row_get_selected_item (AdapComboRow *self);

extern
GtkListItemFactory *adap_combo_row_get_factory (AdapComboRow        *self);
extern
void                adap_combo_row_set_factory (AdapComboRow        *self,
                                               GtkListItemFactory *factory);

extern
GtkListItemFactory *adap_combo_row_get_list_factory (AdapComboRow        *self);
extern
void                adap_combo_row_set_list_factory (AdapComboRow        *self,
                                                    GtkListItemFactory *factory);

extern
GtkExpression *adap_combo_row_get_expression (AdapComboRow   *self);
extern
void           adap_combo_row_set_expression (AdapComboRow   *self,
                                             GtkExpression *expression);

extern
gboolean adap_combo_row_get_use_subtitle (AdapComboRow *self);
extern
void     adap_combo_row_set_use_subtitle (AdapComboRow *self,
                                         gboolean     use_subtitle);

extern
gboolean adap_combo_row_get_enable_search (AdapComboRow *self);
extern
void     adap_combo_row_set_enable_search (AdapComboRow *self,
                                          gboolean     enable_search);



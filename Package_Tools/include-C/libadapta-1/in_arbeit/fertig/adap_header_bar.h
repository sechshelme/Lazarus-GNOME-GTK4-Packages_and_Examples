/*
 * Copyright (c) 2013 Red Hat, Inc.
 * Copyright (C) 2019 Purism SPC
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>



#define ADAP_TYPE_HEADER_BAR (adap_header_bar_get_type())

//G_DECLARE_FINAL_TYPE (AdapHeaderBar, adap_header_bar, ADAP, HEADER_BAR, GtkWidget)

typedef enum {
  ADAP_CENTERING_POLICY_LOOSE,
  ADAP_CENTERING_POLICY_STRICT,
} AdapCenteringPolicy;

extern
GtkWidget *adap_header_bar_new (void) ;

extern
void adap_header_bar_pack_start (AdapHeaderBar *self,
                                GtkWidget    *child);
extern
void adap_header_bar_pack_end   (AdapHeaderBar *self,
                                GtkWidget    *child);
extern
void adap_header_bar_remove     (AdapHeaderBar *self,
                                GtkWidget    *child);

extern
GtkWidget *adap_header_bar_get_title_widget (AdapHeaderBar *self);
extern
void       adap_header_bar_set_title_widget (AdapHeaderBar *self,
                                            GtkWidget    *title_widget);

extern
gboolean adap_header_bar_get_show_start_title_buttons (AdapHeaderBar *self);
extern
void     adap_header_bar_set_show_start_title_buttons (AdapHeaderBar *self,
                                                      gboolean      setting);

extern
gboolean adap_header_bar_get_show_end_title_buttons (AdapHeaderBar *self);
extern
void     adap_header_bar_set_show_end_title_buttons (AdapHeaderBar *self,
                                                    gboolean      setting);

extern
gboolean adap_header_bar_get_show_back_button (AdapHeaderBar *self);
extern
void     adap_header_bar_set_show_back_button (AdapHeaderBar *self,
                                              gboolean      show_back_button);

extern
const char *adap_header_bar_get_decoration_layout (AdapHeaderBar *self);
extern
void        adap_header_bar_set_decoration_layout (AdapHeaderBar *self,
                                                  const char   *layout);

extern
AdapCenteringPolicy adap_header_bar_get_centering_policy (AdapHeaderBar       *self);
extern
void               adap_header_bar_set_centering_policy (AdapHeaderBar       *self,
                                                        AdapCenteringPolicy  centering_policy);

extern
gboolean adap_header_bar_get_show_title (AdapHeaderBar *self);
extern
void     adap_header_bar_set_show_title (AdapHeaderBar *self,
                                        gboolean      show_title);



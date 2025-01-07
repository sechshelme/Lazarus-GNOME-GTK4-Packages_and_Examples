/*
 * Copyright (C) 2013 Red Hat, Inc.
 * Copyright (C) 2021 Frederick Schenk
 *
 * Author: Alexander Larsson <alexl@redhat.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Based on gtkstack.h
 * https://gitlab.gnome.org/GNOME/gtk/-/blob/ba44668478b7184bec02609f292691b85a2c6cdd/gtk/gtkstack.h
 */

#pragma once

#if !defined  (_ADWAITA_INSIDE) && !defined  (ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>



#define ADW_TYPE_VIEW_STACK_PAGE (adw_view_stack_page_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwViewStackPage, adw_view_stack_page, ADW, VIEW_STACK_PAGE, GObject)

extern
GtkWidget *adw_view_stack_page_get_child (AdwViewStackPage *self);

extern
const char *adw_view_stack_page_get_name (AdwViewStackPage *self);
extern
void        adw_view_stack_page_set_name (AdwViewStackPage *self,
                                          const char       *name);

extern
const char *adw_view_stack_page_get_title (AdwViewStackPage *self);
extern
void        adw_view_stack_page_set_title (AdwViewStackPage *self,
                                           const char       *title);

extern
gboolean adw_view_stack_page_get_use_underline (AdwViewStackPage *self);
extern
void     adw_view_stack_page_set_use_underline (AdwViewStackPage *self,
                                                gboolean          use_underline);

extern
const char *adw_view_stack_page_get_icon_name (AdwViewStackPage *self);
extern
void        adw_view_stack_page_set_icon_name (AdwViewStackPage *self,
                                               const char       *icon_name);

extern
gboolean adw_view_stack_page_get_needs_attention (AdwViewStackPage *self);
extern
void     adw_view_stack_page_set_needs_attention (AdwViewStackPage *self,
                                                  gboolean          needs_attention);

extern
guint adw_view_stack_page_get_badge_number (AdwViewStackPage *self);
extern
void  adw_view_stack_page_set_badge_number (AdwViewStackPage *self,
                                            guint             badge_number);

extern
gboolean adw_view_stack_page_get_visible (AdwViewStackPage *self);
extern
void     adw_view_stack_page_set_visible (AdwViewStackPage *self,
                                          gboolean          visible);

#define ADW_TYPE_VIEW_STACK (adw_view_stack_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwViewStack, adw_view_stack, ADW, VIEW_STACK, GtkWidget)

extern
GtkWidget *adw_view_stack_new (void) ;

extern
AdwViewStackPage *adw_view_stack_add       (AdwViewStack *self,
                                            GtkWidget    *child);
extern
AdwViewStackPage *adw_view_stack_add_named (AdwViewStack *self,
                                            GtkWidget    *child,
                                            const char   *name);
extern
AdwViewStackPage *adw_view_stack_add_titled (AdwViewStack *self,
                                             GtkWidget    *child,
                                             const char   *name,
                                             const char   *title);
ADW_AVAILABLE_IN_1_2
AdwViewStackPage *adw_view_stack_add_titled_with_icon (AdwViewStack *self,
                                                       GtkWidget    *child,
                                                       const char   *name,
                                                       const char   *title,
                                                       const char   *icon_name);

extern
void adw_view_stack_remove (AdwViewStack *self,
                            GtkWidget    *child);

extern
AdwViewStackPage *adw_view_stack_get_page (AdwViewStack *self,
                                           GtkWidget    *child);

extern
GtkWidget *adw_view_stack_get_child_by_name (AdwViewStack *self,
                                             const char   *name);

extern
GtkWidget *adw_view_stack_get_visible_child (AdwViewStack *self);
extern
void       adw_view_stack_set_visible_child (AdwViewStack *self,
                                             GtkWidget    *child);

extern
const char *adw_view_stack_get_visible_child_name (AdwViewStack *self);
extern
void        adw_view_stack_set_visible_child_name (AdwViewStack *self,
                                                   const char   *name);

extern
gboolean adw_view_stack_get_hhomogeneous (AdwViewStack *self);
extern
void     adw_view_stack_set_hhomogeneous (AdwViewStack *self,
                                          gboolean      hhomogeneous);

extern
gboolean adw_view_stack_get_vhomogeneous (AdwViewStack *self);
extern
void     adw_view_stack_set_vhomogeneous (AdwViewStack *self,
                                          gboolean      vhomogeneous);

extern
GtkSelectionModel *adw_view_stack_get_pages (AdwViewStack *self);

#define ADW_TYPE_VIEW_STACK_PAGES (adw_view_stack_pages_get_type ())

extern
G_DECLARE_FINAL_TYPE (AdwViewStackPages, adw_view_stack_pages, ADW, VIEW_STACK_PAGES, GObject)

extern
AdwViewStackPage *adw_view_stack_pages_get_selected_page (AdwViewStackPages *self);
extern
void              adw_view_stack_pages_set_selected_page (AdwViewStackPages *self,
                                                          AdwViewStackPage  *page);



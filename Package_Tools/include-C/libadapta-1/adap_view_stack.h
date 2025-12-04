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

#if !defined  (_ADAPTA_INSIDE) && !defined  (ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>



#define ADAP_TYPE_VIEW_STACK_PAGE (adap_view_stack_page_get_type())

extern
G_DECLARE_FINAL_TYPE (AdapViewStackPage, adap_view_stack_page, ADAP, VIEW_STACK_PAGE, GObject)

extern
GtkWidget *adap_view_stack_page_get_child (AdapViewStackPage *self);

extern
const char *adap_view_stack_page_get_name (AdapViewStackPage *self);
extern
void        adap_view_stack_page_set_name (AdapViewStackPage *self,
                                          const char       *name);

extern
const char *adap_view_stack_page_get_title (AdapViewStackPage *self);
extern
void        adap_view_stack_page_set_title (AdapViewStackPage *self,
                                           const char       *title);

extern
gboolean adap_view_stack_page_get_use_underline (AdapViewStackPage *self);
extern
void     adap_view_stack_page_set_use_underline (AdapViewStackPage *self,
                                                gboolean          use_underline);

extern
const char *adap_view_stack_page_get_icon_name (AdapViewStackPage *self);
extern
void        adap_view_stack_page_set_icon_name (AdapViewStackPage *self,
                                               const char       *icon_name);

extern
gboolean adap_view_stack_page_get_needs_attention (AdapViewStackPage *self);
extern
void     adap_view_stack_page_set_needs_attention (AdapViewStackPage *self,
                                                  gboolean          needs_attention);

extern
guint adap_view_stack_page_get_badge_number (AdapViewStackPage *self);
extern
void  adap_view_stack_page_set_badge_number (AdapViewStackPage *self,
                                            guint             badge_number);

extern
gboolean adap_view_stack_page_get_visible (AdapViewStackPage *self);
extern
void     adap_view_stack_page_set_visible (AdapViewStackPage *self,
                                          gboolean          visible);

#define ADAP_TYPE_VIEW_STACK (adap_view_stack_get_type())

extern
G_DECLARE_FINAL_TYPE (AdapViewStack, adap_view_stack, ADAP, VIEW_STACK, GtkWidget)

extern
GtkWidget *adap_view_stack_new (void) ;

extern
AdapViewStackPage *adap_view_stack_add       (AdapViewStack *self,
                                            GtkWidget    *child);
extern
AdapViewStackPage *adap_view_stack_add_named (AdapViewStack *self,
                                            GtkWidget    *child,
                                            const char   *name);
extern
AdapViewStackPage *adap_view_stack_add_titled (AdapViewStack *self,
                                             GtkWidget    *child,
                                             const char   *name,
                                             const char   *title);
extern
AdapViewStackPage *adap_view_stack_add_titled_with_icon (AdapViewStack *self,
                                                       GtkWidget    *child,
                                                       const char   *name,
                                                       const char   *title,
                                                       const char   *icon_name);

extern
void adap_view_stack_remove (AdapViewStack *self,
                            GtkWidget    *child);

extern
AdapViewStackPage *adap_view_stack_get_page (AdapViewStack *self,
                                           GtkWidget    *child);

extern
GtkWidget *adap_view_stack_get_child_by_name (AdapViewStack *self,
                                             const char   *name);

extern
GtkWidget *adap_view_stack_get_visible_child (AdapViewStack *self);
extern
void       adap_view_stack_set_visible_child (AdapViewStack *self,
                                             GtkWidget    *child);

extern
const char *adap_view_stack_get_visible_child_name (AdapViewStack *self);
extern
void        adap_view_stack_set_visible_child_name (AdapViewStack *self,
                                                   const char   *name);

extern
gboolean adap_view_stack_get_hhomogeneous (AdapViewStack *self);
extern
void     adap_view_stack_set_hhomogeneous (AdapViewStack *self,
                                          gboolean      hhomogeneous);

extern
gboolean adap_view_stack_get_vhomogeneous (AdapViewStack *self);
extern
void     adap_view_stack_set_vhomogeneous (AdapViewStack *self,
                                          gboolean      vhomogeneous);

extern
GtkSelectionModel *adap_view_stack_get_pages (AdapViewStack *self);

#define ADAP_TYPE_VIEW_STACK_PAGES (adap_view_stack_pages_get_type ())

extern
G_DECLARE_FINAL_TYPE (AdapViewStackPages, adap_view_stack_pages, ADAP, VIEW_STACK_PAGES, GObject)

extern
AdapViewStackPage *adap_view_stack_pages_get_selected_page (AdapViewStackPages *self);
extern
void              adap_view_stack_pages_set_selected_page (AdapViewStackPages *self,
                                                          AdapViewStackPage  *page);



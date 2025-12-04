/*
 * Copyright (C) 2022-2023 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>



#define ADAP_TYPE_NAVIGATION_PAGE (adap_navigation_page_get_type())

extern
//////////G_DECLARE_DERIVABLE_TYPE (AdapNavigationPage, adap_navigation_page, ADAP, NAVIGATION_PAGE, GtkWidget)

struct _AdapNavigationPageClass
{
  GtkWidgetClass parent_class;

  /**
   * AdapNavigationPageClass::showing:
   * @self: a navigation page
   *
   * Called when the page shows at the beginning of the navigation view
   * transition.
   *
   * Since: 1.4
   */
  void (* showing) (AdapNavigationPage *self);

  /**
   * AdapNavigationPageClass::shown:
   * @self: a navigation page
   *
   * Called when the navigation view transition has been completed and the page
   * is fully shown.
   *
   * Since: 1.4
   */
  void (* shown)   (AdapNavigationPage *self);

  /**
   * AdapNavigationPageClass::hiding:
   * @self: a navigation page
   *
   * Called when the page starts hiding at the beginning of the navigation view
   * transition.
   *
   * Since: 1.4
   */
  void (* hiding)  (AdapNavigationPage *self);

  /**
   * AdapNavigationPageClass::hidden:
   * @self: a navigation page
   *
   * Called when the navigation view transition has been completed and the page
   * is fully hidden.
   *
   * Since: 1.4
   */
  void (* hidden)  (AdapNavigationPage *self);

  /*< private >*/
  gpointer padding[8];
};

extern
AdapNavigationPage *adap_navigation_page_new (GtkWidget  *child,
                                            const char *title) ;

extern
AdapNavigationPage *adap_navigation_page_new_with_tag (GtkWidget  *child,
                                                     const char *title,
                                                     const char *tag) ;

extern
GtkWidget *adap_navigation_page_get_child (AdapNavigationPage *self);
extern
void       adap_navigation_page_set_child (AdapNavigationPage *self,
                                          GtkWidget         *child);

extern
const char *adap_navigation_page_get_tag (AdapNavigationPage *self);
extern
void        adap_navigation_page_set_tag (AdapNavigationPage *self,
                                         const char        *tag);

extern
const char *adap_navigation_page_get_title (AdapNavigationPage *self);
extern
void        adap_navigation_page_set_title (AdapNavigationPage *self,
                                           const char        *title);

extern
gboolean adap_navigation_page_get_can_pop (AdapNavigationPage *self);
extern
void     adap_navigation_page_set_can_pop (AdapNavigationPage *self,
                                          gboolean           can_pop);

#define ADAP_TYPE_NAVIGATION_VIEW (adap_navigation_view_get_type())

extern
G_DECLARE_FINAL_TYPE (AdapNavigationView, adap_navigation_view, ADAP, NAVIGATION_VIEW, GtkWidget)

extern
GtkWidget *adap_navigation_view_new (void) ;

extern
void adap_navigation_view_add (AdapNavigationView *self,
                              AdapNavigationPage *page);

extern
void adap_navigation_view_remove (AdapNavigationView *self,
                                 AdapNavigationPage *page);

extern
AdapNavigationPage *adap_navigation_view_find_page (AdapNavigationView *self,
                                                  const char        *tag);

extern
void adap_navigation_view_push (AdapNavigationView *self,
                               AdapNavigationPage *page);

extern
void adap_navigation_view_push_by_tag (AdapNavigationView *self,
                                      const char        *tag);

extern
gboolean adap_navigation_view_pop (AdapNavigationView *self);

extern
gboolean adap_navigation_view_pop_to_page (AdapNavigationView *self,
                                          AdapNavigationPage *page);

extern
gboolean adap_navigation_view_pop_to_tag (AdapNavigationView *self,
                                         const char        *tag);

extern
void adap_navigation_view_replace (AdapNavigationView  *self,
                                  AdapNavigationPage **pages,
                                  int                 n_pages);

extern
void adap_navigation_view_replace_with_tags (AdapNavigationView  *self,
                                            const char * const *tags,
                                            int                 n_tags);

extern
AdapNavigationPage *adap_navigation_view_get_visible_page (AdapNavigationView *self);

extern
AdapNavigationPage *adap_navigation_view_get_previous_page (AdapNavigationView *self,
                                                          AdapNavigationPage *page);

extern
gboolean adap_navigation_view_get_animate_transitions (AdapNavigationView *self);
extern
void     adap_navigation_view_set_animate_transitions (AdapNavigationView *self,
                                                      gboolean           animate_transitions);

extern
gboolean adap_navigation_view_get_pop_on_escape (AdapNavigationView *self);
extern
void     adap_navigation_view_set_pop_on_escape (AdapNavigationView *self,
                                                gboolean           pop_on_escape);

extern
GListModel *adap_navigation_view_get_navigation_stack (AdapNavigationView *self);



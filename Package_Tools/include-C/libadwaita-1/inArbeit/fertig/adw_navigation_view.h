/*
 * Copyright (C) 2022-2023 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>



#define ADW_TYPE_NAVIGATION_PAGE (adw_navigation_page_get_type())

//G_DECLARE_DERIVABLE_TYPE (AdwNavigationPage, adw_navigation_page, ADW, NAVIGATION_PAGE, GtkWidget)

struct _AdwNavigationPageClass
{
  GtkWidgetClass parent_class;

  /**
   * AdwNavigationPageClass::showing:
   * @self: a navigation page
   *
   * Called when the page shows at the beginning of the navigation view
   * transition.
   *
   * Since: 1.4
   */
  void (* showing) (AdwNavigationPage *self);

  /**
   * AdwNavigationPageClass::shown:
   * @self: a navigation page
   *
   * Called when the navigation view transition has been completed and the page
   * is fully shown.
   *
   * Since: 1.4
   */
  void (* shown)   (AdwNavigationPage *self);

  /**
   * AdwNavigationPageClass::hiding:
   * @self: a navigation page
   *
   * Called when the page starts hiding at the beginning of the navigation view
   * transition.
   *
   * Since: 1.4
   */
  void (* hiding)  (AdwNavigationPage *self);

  /**
   * AdwNavigationPageClass::hidden:
   * @self: a navigation page
   *
   * Called when the navigation view transition has been completed and the page
   * is fully hidden.
   *
   * Since: 1.4
   */
  void (* hidden)  (AdwNavigationPage *self);

  /*< private >*/
  gpointer padding[8];
};

extern
AdwNavigationPage *adw_navigation_page_new (GtkWidget  *child,
                                            const char *title) ;

extern
AdwNavigationPage *adw_navigation_page_new_with_tag (GtkWidget  *child,
                                                     const char *title,
                                                     const char *tag) ;

extern
GtkWidget *adw_navigation_page_get_child (AdwNavigationPage *self);
extern
void       adw_navigation_page_set_child (AdwNavigationPage *self,
                                          GtkWidget         *child);

extern
const char *adw_navigation_page_get_tag (AdwNavigationPage *self);
extern
void        adw_navigation_page_set_tag (AdwNavigationPage *self,
                                         const char        *tag);

extern
const char *adw_navigation_page_get_title (AdwNavigationPage *self);
extern
void        adw_navigation_page_set_title (AdwNavigationPage *self,
                                           const char        *title);

extern
gboolean adw_navigation_page_get_can_pop (AdwNavigationPage *self);
extern
void     adw_navigation_page_set_can_pop (AdwNavigationPage *self,
                                          gboolean           can_pop);

#define ADW_TYPE_NAVIGATION_VIEW (adw_navigation_view_get_type())

//xxxxxxxxxxxxxxextern
//G_DECLARE_FINAL_TYPE (AdwNavigationView, adw_navigation_view, ADW, NAVIGATION_VIEW, GtkWidget)

extern
GtkWidget *adw_navigation_view_new (void) ;

extern
void adw_navigation_view_add (AdwNavigationView *self,
                              AdwNavigationPage *page);

extern
void adw_navigation_view_remove (AdwNavigationView *self,
                                 AdwNavigationPage *page);

extern
AdwNavigationPage *adw_navigation_view_find_page (AdwNavigationView *self,
                                                  const char        *tag);

extern
void adw_navigation_view_push (AdwNavigationView *self,
                               AdwNavigationPage *page);

extern
void adw_navigation_view_push_by_tag (AdwNavigationView *self,
                                      const char        *tag);

extern
gboolean adw_navigation_view_pop (AdwNavigationView *self);

extern
gboolean adw_navigation_view_pop_to_page (AdwNavigationView *self,
                                          AdwNavigationPage *page);

extern
gboolean adw_navigation_view_pop_to_tag (AdwNavigationView *self,
                                         const char        *tag);

extern
void adw_navigation_view_replace (AdwNavigationView  *self,
                                  AdwNavigationPage **pages,
                                  int                 n_pages);

extern
void adw_navigation_view_replace_with_tags (AdwNavigationView  *self,
                                            const char * const *tags,
                                            int                 n_tags);

extern
AdwNavigationPage *adw_navigation_view_get_visible_page (AdwNavigationView *self);

extern
AdwNavigationPage *adw_navigation_view_get_previous_page (AdwNavigationView *self,
                                                          AdwNavigationPage *page);

extern
gboolean adw_navigation_view_get_animate_transitions (AdwNavigationView *self);
extern
void     adw_navigation_view_set_animate_transitions (AdwNavigationView *self,
                                                      gboolean           animate_transitions);

extern
gboolean adw_navigation_view_get_pop_on_escape (AdwNavigationView *self);
extern
void     adw_navigation_view_set_pop_on_escape (AdwNavigationView *self,
                                                gboolean           pop_on_escape);

extern
GListModel *adw_navigation_view_get_navigation_stack (AdwNavigationView *self);



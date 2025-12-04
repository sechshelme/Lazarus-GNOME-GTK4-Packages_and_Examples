/*
 * Copyright (C) 2020 Purism SPC
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
#include "adap-enums.h"



typedef enum /*< flags >*/ {
  ADAP_TAB_VIEW_SHORTCUT_NONE                    = 0,
  ADAP_TAB_VIEW_SHORTCUT_CONTROL_TAB             = 1 << 0,
  ADAP_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_TAB       = 1 << 1,
  ADAP_TAB_VIEW_SHORTCUT_CONTROL_PAGE_UP         = 1 << 2,
  ADAP_TAB_VIEW_SHORTCUT_CONTROL_PAGE_DOWN       = 1 << 3,
  ADAP_TAB_VIEW_SHORTCUT_CONTROL_HOME            = 1 << 4,
  ADAP_TAB_VIEW_SHORTCUT_CONTROL_END             = 1 << 5,
  ADAP_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_PAGE_UP   = 1 << 6,
  ADAP_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_PAGE_DOWN = 1 << 7,
  ADAP_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_HOME      = 1 << 8,
  ADAP_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_END       = 1 << 9,
  ADAP_TAB_VIEW_SHORTCUT_ALT_DIGITS              = 1 << 10,
  ADAP_TAB_VIEW_SHORTCUT_ALT_ZERO                = 1 << 11,
  ADAP_TAB_VIEW_SHORTCUT_ALL_SHORTCUTS           = 0xFFF
} AdapTabViewShortcuts;

#define ADAP_TYPE_TAB_PAGE (adap_tab_page_get_type())

//G_DECLARE_FINAL_TYPE (AdapTabPage, adap_tab_page, ADAP, TAB_PAGE, GObject)

extern
GtkWidget *adap_tab_page_get_child (AdapTabPage *self);

extern
AdapTabPage *adap_tab_page_get_parent (AdapTabPage *self);

extern
gboolean adap_tab_page_get_selected (AdapTabPage *self);

extern
gboolean adap_tab_page_get_pinned (AdapTabPage *self);

extern
const char *adap_tab_page_get_title (AdapTabPage *self);
extern
void        adap_tab_page_set_title (AdapTabPage *self,
                                    const char *title);

extern
const char *adap_tab_page_get_tooltip (AdapTabPage *self);
extern
void        adap_tab_page_set_tooltip (AdapTabPage *self,
                                      const char *tooltip);

extern
GIcon *adap_tab_page_get_icon (AdapTabPage *self);
extern
void   adap_tab_page_set_icon (AdapTabPage *self,
                              GIcon      *icon);

extern
gboolean adap_tab_page_get_loading (AdapTabPage *self);
extern
void     adap_tab_page_set_loading (AdapTabPage *self,
                                   gboolean    loading);

extern
GIcon *adap_tab_page_get_indicator_icon (AdapTabPage *self);
extern
void   adap_tab_page_set_indicator_icon (AdapTabPage *self,
                                        GIcon      *indicator_icon);

extern
const char *adap_tab_page_get_indicator_tooltip (AdapTabPage *self);
extern
void        adap_tab_page_set_indicator_tooltip (AdapTabPage *self,
                                                const char *tooltip);

extern
gboolean adap_tab_page_get_indicator_activatable (AdapTabPage *self);
extern
void     adap_tab_page_set_indicator_activatable (AdapTabPage *self,
                                                 gboolean    activatable);

extern
gboolean adap_tab_page_get_needs_attention (AdapTabPage *self);
extern
void     adap_tab_page_set_needs_attention (AdapTabPage *self,
                                           gboolean    needs_attention);

extern
const char *adap_tab_page_get_keyword (AdapTabPage *self);
extern
void        adap_tab_page_set_keyword (AdapTabPage *self,
                                      const char *keyword);

extern
float adap_tab_page_get_thumbnail_xalign (AdapTabPage *self);
extern
void  adap_tab_page_set_thumbnail_xalign (AdapTabPage *self,
                                         float       xalign);

extern
float adap_tab_page_get_thumbnail_yalign (AdapTabPage *self);
extern
void  adap_tab_page_set_thumbnail_yalign (AdapTabPage *self,
                                         float       yalign);

extern
gboolean adap_tab_page_get_live_thumbnail (AdapTabPage *self);
extern
void     adap_tab_page_set_live_thumbnail (AdapTabPage *self,
                                          gboolean    live_thumbnail);

extern
void adap_tab_page_invalidate_thumbnail (AdapTabPage *self);

#define ADAP_TYPE_TAB_VIEW (adap_tab_view_get_type())

//G_DECLARE_FINAL_TYPE (AdapTabView, adap_tab_view, ADAP, TAB_VIEW, GtkWidget)

extern
AdapTabView *adap_tab_view_new (void) ;

extern
int adap_tab_view_get_n_pages        (AdapTabView *self);
extern
int adap_tab_view_get_n_pinned_pages (AdapTabView *self);

extern
gboolean adap_tab_view_get_is_transferring_page (AdapTabView *self);

extern
AdapTabPage *adap_tab_view_get_selected_page (AdapTabView *self);
extern
void        adap_tab_view_set_selected_page (AdapTabView *self,
                                            AdapTabPage *selected_page);

extern
gboolean adap_tab_view_select_previous_page (AdapTabView *self);
extern
gboolean adap_tab_view_select_next_page     (AdapTabView *self);

extern
GIcon *adap_tab_view_get_default_icon (AdapTabView *self);
extern
void   adap_tab_view_set_default_icon (AdapTabView *self,
                                      GIcon      *default_icon);

extern
GMenuModel *adap_tab_view_get_menu_model (AdapTabView *self);
extern
void        adap_tab_view_set_menu_model (AdapTabView *self,
                                         GMenuModel *menu_model);

extern
AdapTabViewShortcuts adap_tab_view_get_shortcuts    (AdapTabView          *self);
extern
void                adap_tab_view_set_shortcuts    (AdapTabView          *self,
                                                   AdapTabViewShortcuts  shortcuts);
extern
void                adap_tab_view_add_shortcuts    (AdapTabView          *self,
                                                   AdapTabViewShortcuts  shortcuts);
extern
void                adap_tab_view_remove_shortcuts (AdapTabView          *self,
                                                   AdapTabViewShortcuts  shortcuts);

extern
void adap_tab_view_set_page_pinned (AdapTabView *self,
                                   AdapTabPage *page,
                                   gboolean    pinned);

extern
AdapTabPage *adap_tab_view_get_page (AdapTabView *self,
                                   GtkWidget  *child);

extern
AdapTabPage *adap_tab_view_get_nth_page (AdapTabView *self,
                                       int         position);

extern
int adap_tab_view_get_page_position (AdapTabView *self,
                                    AdapTabPage *page);

extern
AdapTabPage *adap_tab_view_add_page (AdapTabView *self,
                                   GtkWidget  *child,
                                   AdapTabPage *parent);

extern
AdapTabPage *adap_tab_view_insert  (AdapTabView *self,
                                  GtkWidget  *child,
                                  int         position);
extern
AdapTabPage *adap_tab_view_prepend (AdapTabView *self,
                                  GtkWidget  *child);
extern
AdapTabPage *adap_tab_view_append  (AdapTabView *self,
                                  GtkWidget  *child);

extern
AdapTabPage *adap_tab_view_insert_pinned  (AdapTabView *self,
                                         GtkWidget  *child,
                                         int         position);
extern
AdapTabPage *adap_tab_view_prepend_pinned (AdapTabView *self,
                                         GtkWidget  *child);
extern
AdapTabPage *adap_tab_view_append_pinned  (AdapTabView *self,
                                         GtkWidget  *child);

extern
void adap_tab_view_close_page        (AdapTabView *self,
                                     AdapTabPage *page);
extern
void adap_tab_view_close_page_finish (AdapTabView *self,
                                     AdapTabPage *page,
                                     gboolean    confirm);

extern
void adap_tab_view_close_other_pages  (AdapTabView *self,
                                      AdapTabPage *page);
extern
void adap_tab_view_close_pages_before (AdapTabView *self,
                                      AdapTabPage *page);
extern
void adap_tab_view_close_pages_after  (AdapTabView *self,
                                      AdapTabPage *page);

extern
gboolean adap_tab_view_reorder_page     (AdapTabView *self,
                                        AdapTabPage *page,
                                        int         position);
extern
gboolean adap_tab_view_reorder_backward (AdapTabView *self,
                                        AdapTabPage *page);
extern
gboolean adap_tab_view_reorder_forward  (AdapTabView *self,
                                        AdapTabPage *page);
extern
gboolean adap_tab_view_reorder_first    (AdapTabView *self,
                                        AdapTabPage *page);
extern
gboolean adap_tab_view_reorder_last     (AdapTabView *self,
                                        AdapTabPage *page);

extern
void adap_tab_view_transfer_page (AdapTabView *self,
                                 AdapTabPage *page,
                                 AdapTabView *other_view,
                                 int         position);

extern
GtkSelectionModel *adap_tab_view_get_pages (AdapTabView *self) ;

extern
void adap_tab_view_invalidate_thumbnails (AdapTabView *self);



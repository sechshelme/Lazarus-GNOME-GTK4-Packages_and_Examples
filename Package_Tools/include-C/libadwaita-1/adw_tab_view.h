/*
 * Copyright (C) 2020 Purism SPC
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
#include "adw-enums.h"



typedef enum /*< flags >*/ {
  ADW_TAB_VIEW_SHORTCUT_NONE                    = 0,
  ADW_TAB_VIEW_SHORTCUT_CONTROL_TAB             = 1 << 0,
  ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_TAB       = 1 << 1,
  ADW_TAB_VIEW_SHORTCUT_CONTROL_PAGE_UP         = 1 << 2,
  ADW_TAB_VIEW_SHORTCUT_CONTROL_PAGE_DOWN       = 1 << 3,
  ADW_TAB_VIEW_SHORTCUT_CONTROL_HOME            = 1 << 4,
  ADW_TAB_VIEW_SHORTCUT_CONTROL_END             = 1 << 5,
  ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_PAGE_UP   = 1 << 6,
  ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_PAGE_DOWN = 1 << 7,
  ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_HOME      = 1 << 8,
  ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_END       = 1 << 9,
  ADW_TAB_VIEW_SHORTCUT_ALT_DIGITS              = 1 << 10,
  ADW_TAB_VIEW_SHORTCUT_ALT_ZERO                = 1 << 11,
  ADW_TAB_VIEW_SHORTCUT_ALL_SHORTCUTS           = 0xFFF
} AdwTabViewShortcuts;

#define ADW_TYPE_TAB_PAGE (adw_tab_page_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwTabPage, adw_tab_page, ADW, TAB_PAGE, GObject)

extern
GtkWidget *adw_tab_page_get_child (AdwTabPage *self);

extern
AdwTabPage *adw_tab_page_get_parent (AdwTabPage *self);

extern
gboolean adw_tab_page_get_selected (AdwTabPage *self);

extern
gboolean adw_tab_page_get_pinned (AdwTabPage *self);

extern
const char *adw_tab_page_get_title (AdwTabPage *self);
extern
void        adw_tab_page_set_title (AdwTabPage *self,
                                    const char *title);

extern
const char *adw_tab_page_get_tooltip (AdwTabPage *self);
extern
void        adw_tab_page_set_tooltip (AdwTabPage *self,
                                      const char *tooltip);

extern
GIcon *adw_tab_page_get_icon (AdwTabPage *self);
extern
void   adw_tab_page_set_icon (AdwTabPage *self,
                              GIcon      *icon);

extern
gboolean adw_tab_page_get_loading (AdwTabPage *self);
extern
void     adw_tab_page_set_loading (AdwTabPage *self,
                                   gboolean    loading);

extern
GIcon *adw_tab_page_get_indicator_icon (AdwTabPage *self);
extern
void   adw_tab_page_set_indicator_icon (AdwTabPage *self,
                                        GIcon      *indicator_icon);

ADW_AVAILABLE_IN_1_2
const char *adw_tab_page_get_indicator_tooltip (AdwTabPage *self);
ADW_AVAILABLE_IN_1_2
void        adw_tab_page_set_indicator_tooltip (AdwTabPage *self,
                                                const char *tooltip);

extern
gboolean adw_tab_page_get_indicator_activatable (AdwTabPage *self);
extern
void     adw_tab_page_set_indicator_activatable (AdwTabPage *self,
                                                 gboolean    activatable);

extern
gboolean adw_tab_page_get_needs_attention (AdwTabPage *self);
extern
void     adw_tab_page_set_needs_attention (AdwTabPage *self,
                                           gboolean    needs_attention);

ADW_AVAILABLE_IN_1_3
const char *adw_tab_page_get_keyword (AdwTabPage *self);
ADW_AVAILABLE_IN_1_3
void        adw_tab_page_set_keyword (AdwTabPage *self,
                                      const char *keyword);

ADW_AVAILABLE_IN_1_3
float adw_tab_page_get_thumbnail_xalign (AdwTabPage *self);
ADW_AVAILABLE_IN_1_3
void  adw_tab_page_set_thumbnail_xalign (AdwTabPage *self,
                                         float       xalign);

ADW_AVAILABLE_IN_1_3
float adw_tab_page_get_thumbnail_yalign (AdwTabPage *self);
ADW_AVAILABLE_IN_1_3
void  adw_tab_page_set_thumbnail_yalign (AdwTabPage *self,
                                         float       yalign);

ADW_AVAILABLE_IN_1_3
gboolean adw_tab_page_get_live_thumbnail (AdwTabPage *self);
ADW_AVAILABLE_IN_1_3
void     adw_tab_page_set_live_thumbnail (AdwTabPage *self,
                                          gboolean    live_thumbnail);

ADW_AVAILABLE_IN_1_3
void adw_tab_page_invalidate_thumbnail (AdwTabPage *self);

#define ADW_TYPE_TAB_VIEW (adw_tab_view_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwTabView, adw_tab_view, ADW, TAB_VIEW, GtkWidget)

extern
AdwTabView *adw_tab_view_new (void) ;

extern
int adw_tab_view_get_n_pages        (AdwTabView *self);
extern
int adw_tab_view_get_n_pinned_pages (AdwTabView *self);

extern
gboolean adw_tab_view_get_is_transferring_page (AdwTabView *self);

extern
AdwTabPage *adw_tab_view_get_selected_page (AdwTabView *self);
extern
void        adw_tab_view_set_selected_page (AdwTabView *self,
                                            AdwTabPage *selected_page);

extern
gboolean adw_tab_view_select_previous_page (AdwTabView *self);
extern
gboolean adw_tab_view_select_next_page     (AdwTabView *self);

extern
GIcon *adw_tab_view_get_default_icon (AdwTabView *self);
extern
void   adw_tab_view_set_default_icon (AdwTabView *self,
                                      GIcon      *default_icon);

extern
GMenuModel *adw_tab_view_get_menu_model (AdwTabView *self);
extern
void        adw_tab_view_set_menu_model (AdwTabView *self,
                                         GMenuModel *menu_model);

ADW_AVAILABLE_IN_1_2
AdwTabViewShortcuts adw_tab_view_get_shortcuts    (AdwTabView          *self);
ADW_AVAILABLE_IN_1_2
void                adw_tab_view_set_shortcuts    (AdwTabView          *self,
                                                   AdwTabViewShortcuts  shortcuts);
ADW_AVAILABLE_IN_1_2
void                adw_tab_view_add_shortcuts    (AdwTabView          *self,
                                                   AdwTabViewShortcuts  shortcuts);
ADW_AVAILABLE_IN_1_2
void                adw_tab_view_remove_shortcuts (AdwTabView          *self,
                                                   AdwTabViewShortcuts  shortcuts);

extern
void adw_tab_view_set_page_pinned (AdwTabView *self,
                                   AdwTabPage *page,
                                   gboolean    pinned);

extern
AdwTabPage *adw_tab_view_get_page (AdwTabView *self,
                                   GtkWidget  *child);

extern
AdwTabPage *adw_tab_view_get_nth_page (AdwTabView *self,
                                       int         position);

extern
int adw_tab_view_get_page_position (AdwTabView *self,
                                    AdwTabPage *page);

extern
AdwTabPage *adw_tab_view_add_page (AdwTabView *self,
                                   GtkWidget  *child,
                                   AdwTabPage *parent);

extern
AdwTabPage *adw_tab_view_insert  (AdwTabView *self,
                                  GtkWidget  *child,
                                  int         position);
extern
AdwTabPage *adw_tab_view_prepend (AdwTabView *self,
                                  GtkWidget  *child);
extern
AdwTabPage *adw_tab_view_append  (AdwTabView *self,
                                  GtkWidget  *child);

extern
AdwTabPage *adw_tab_view_insert_pinned  (AdwTabView *self,
                                         GtkWidget  *child,
                                         int         position);
extern
AdwTabPage *adw_tab_view_prepend_pinned (AdwTabView *self,
                                         GtkWidget  *child);
extern
AdwTabPage *adw_tab_view_append_pinned  (AdwTabView *self,
                                         GtkWidget  *child);

extern
void adw_tab_view_close_page        (AdwTabView *self,
                                     AdwTabPage *page);
extern
void adw_tab_view_close_page_finish (AdwTabView *self,
                                     AdwTabPage *page,
                                     gboolean    confirm);

extern
void adw_tab_view_close_other_pages  (AdwTabView *self,
                                      AdwTabPage *page);
extern
void adw_tab_view_close_pages_before (AdwTabView *self,
                                      AdwTabPage *page);
extern
void adw_tab_view_close_pages_after  (AdwTabView *self,
                                      AdwTabPage *page);

extern
gboolean adw_tab_view_reorder_page     (AdwTabView *self,
                                        AdwTabPage *page,
                                        int         position);
extern
gboolean adw_tab_view_reorder_backward (AdwTabView *self,
                                        AdwTabPage *page);
extern
gboolean adw_tab_view_reorder_forward  (AdwTabView *self,
                                        AdwTabPage *page);
extern
gboolean adw_tab_view_reorder_first    (AdwTabView *self,
                                        AdwTabPage *page);
extern
gboolean adw_tab_view_reorder_last     (AdwTabView *self,
                                        AdwTabPage *page);

extern
void adw_tab_view_transfer_page (AdwTabView *self,
                                 AdwTabPage *page,
                                 AdwTabView *other_view,
                                 int         position);

extern
GtkSelectionModel *adw_tab_view_get_pages (AdwTabView *self) ;

ADW_AVAILABLE_IN_1_3
void adw_tab_view_invalidate_thumbnails (AdwTabView *self);



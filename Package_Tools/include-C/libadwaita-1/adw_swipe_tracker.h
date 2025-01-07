/*
 * Copyright (C) 2019 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>
#include "adw-swipeable.h"



#define ADW_TYPE_SWIPE_TRACKER (adw_swipe_tracker_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwSwipeTracker, adw_swipe_tracker, ADW, SWIPE_TRACKER, GObject)

extern
AdwSwipeTracker *adw_swipe_tracker_new (AdwSwipeable *swipeable) ;

extern
AdwSwipeable *adw_swipe_tracker_get_swipeable (AdwSwipeTracker *self);

extern
gboolean adw_swipe_tracker_get_enabled (AdwSwipeTracker *self);
extern
void     adw_swipe_tracker_set_enabled (AdwSwipeTracker *self,
                                        gboolean         enabled);

extern
gboolean adw_swipe_tracker_get_reversed (AdwSwipeTracker *self);
extern
void     adw_swipe_tracker_set_reversed (AdwSwipeTracker *self,
                                         gboolean         reversed);

extern
gboolean         adw_swipe_tracker_get_allow_mouse_drag (AdwSwipeTracker *self);
extern
void             adw_swipe_tracker_set_allow_mouse_drag (AdwSwipeTracker *self,
                                                         gboolean         allow_mouse_drag);

extern
gboolean adw_swipe_tracker_get_allow_long_swipes (AdwSwipeTracker *self);
extern
void     adw_swipe_tracker_set_allow_long_swipes (AdwSwipeTracker *self,
                                                  gboolean         allow_long_swipes);

extern
gboolean adw_swipe_tracker_get_lower_overshoot (AdwSwipeTracker *self);
extern
void     adw_swipe_tracker_set_lower_overshoot (AdwSwipeTracker *self,
                                                gboolean         overshoot);

extern
gboolean adw_swipe_tracker_get_upper_overshoot (AdwSwipeTracker *self);
extern
void     adw_swipe_tracker_set_upper_overshoot (AdwSwipeTracker *self,
                                                gboolean         overshoot);

extern
gboolean adw_swipe_tracker_get_allow_window_handle (AdwSwipeTracker *self);
extern
void     adw_swipe_tracker_set_allow_window_handle (AdwSwipeTracker *self,
                                                    gboolean         allow_window_handle);

extern
void adw_swipe_tracker_shift_position (AdwSwipeTracker *self,
                                       double           delta);



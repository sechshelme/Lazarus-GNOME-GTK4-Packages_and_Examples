/*
 * Copyright (C) 2019 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>
#include "adap-swipeable.h"



#define ADAP_TYPE_SWIPE_TRACKER (adap_swipe_tracker_get_type())

//G_DECLARE_FINAL_TYPE (AdapSwipeTracker, adap_swipe_tracker, ADAP, SWIPE_TRACKER, GObject)

extern
AdapSwipeTracker *adap_swipe_tracker_new (AdapSwipeable *swipeable) ;

extern
AdapSwipeable *adap_swipe_tracker_get_swipeable (AdapSwipeTracker *self);

extern
gboolean adap_swipe_tracker_get_enabled (AdapSwipeTracker *self);
extern
void     adap_swipe_tracker_set_enabled (AdapSwipeTracker *self,
                                        gboolean         enabled);

extern
gboolean adap_swipe_tracker_get_reversed (AdapSwipeTracker *self);
extern
void     adap_swipe_tracker_set_reversed (AdapSwipeTracker *self,
                                         gboolean         reversed);

extern
gboolean         adap_swipe_tracker_get_allow_mouse_drag (AdapSwipeTracker *self);
extern
void             adap_swipe_tracker_set_allow_mouse_drag (AdapSwipeTracker *self,
                                                         gboolean         allow_mouse_drag);

extern
gboolean adap_swipe_tracker_get_allow_long_swipes (AdapSwipeTracker *self);
extern
void     adap_swipe_tracker_set_allow_long_swipes (AdapSwipeTracker *self,
                                                  gboolean         allow_long_swipes);

extern
gboolean adap_swipe_tracker_get_lower_overshoot (AdapSwipeTracker *self);
extern
void     adap_swipe_tracker_set_lower_overshoot (AdapSwipeTracker *self,
                                                gboolean         overshoot);

extern
gboolean adap_swipe_tracker_get_upper_overshoot (AdapSwipeTracker *self);
extern
void     adap_swipe_tracker_set_upper_overshoot (AdapSwipeTracker *self,
                                                gboolean         overshoot);

extern
gboolean adap_swipe_tracker_get_allow_window_handle (AdapSwipeTracker *self);
extern
void     adap_swipe_tracker_set_allow_window_handle (AdapSwipeTracker *self,
                                                    gboolean         allow_window_handle);

extern
void adap_swipe_tracker_shift_position (AdapSwipeTracker *self,
                                       double           delta);



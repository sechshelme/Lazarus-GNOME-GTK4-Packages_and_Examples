/*
 * Copyright (C) 2019 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>
#include "adw-enums.h"
#include "adw-fold-threshold-policy.h"



#define ADW_TYPE_SQUEEZER_PAGE (adw_squeezer_page_get_type ())


//G_DECLARE_FINAL_TYPE (AdwSqueezerPage, adw_squeezer_page, ADW, SQUEEZER_PAGE, GObject)


GtkWidget *adw_squeezer_page_get_child (AdwSqueezerPage *self);


gboolean adw_squeezer_page_get_enabled (AdwSqueezerPage *self);

void     adw_squeezer_page_set_enabled (AdwSqueezerPage *self,
                                        gboolean         enabled);

#define ADW_TYPE_SQUEEZER (adw_squeezer_get_type ())

// xxxxxxxxxxxxxxxxxx
//G_DECLARE_FINAL_TYPE (AdwSqueezer, adw_squeezer, ADW, SQUEEZER, GtkWidget)

typedef enum {
  ADW_SQUEEZER_TRANSITION_TYPE_NONE,
  ADW_SQUEEZER_TRANSITION_TYPE_CROSSFADE,
} AdwSqueezerTransitionType;


GtkWidget *adw_squeezer_new (void) ;


AdwSqueezerPage *adw_squeezer_add    (AdwSqueezer *self,
                                      GtkWidget   *child);

void             adw_squeezer_remove (AdwSqueezer *self,
                                      GtkWidget   *child);


AdwSqueezerPage *adw_squeezer_get_page (AdwSqueezer *self,
                                        GtkWidget   *child);


GtkWidget *adw_squeezer_get_visible_child (AdwSqueezer *self);


gboolean adw_squeezer_get_homogeneous (AdwSqueezer *self);

void     adw_squeezer_set_homogeneous (AdwSqueezer *self,
                                       gboolean     homogeneous);


AdwFoldThresholdPolicy adw_squeezer_get_switch_threshold_policy (AdwSqueezer             *self);

void                   adw_squeezer_set_switch_threshold_policy (AdwSqueezer            *self,
                                                                 AdwFoldThresholdPolicy  policy);


gboolean adw_squeezer_get_allow_none (AdwSqueezer *self);

void     adw_squeezer_set_allow_none (AdwSqueezer *self,
                                      gboolean     allow_none);


guint adw_squeezer_get_transition_duration (AdwSqueezer *self);

void  adw_squeezer_set_transition_duration (AdwSqueezer *self,
                                            guint        duration);


AdwSqueezerTransitionType adw_squeezer_get_transition_type (AdwSqueezer               *self);

void                      adw_squeezer_set_transition_type (AdwSqueezer               *self,
                                                            AdwSqueezerTransitionType  transition);


gboolean adw_squeezer_get_transition_running (AdwSqueezer *self);


gboolean adw_squeezer_get_interpolate_size (AdwSqueezer *self);

void     adw_squeezer_set_interpolate_size (AdwSqueezer *self,
                                            gboolean     interpolate_size);


float adw_squeezer_get_xalign (AdwSqueezer *self);

void  adw_squeezer_set_xalign (AdwSqueezer *self,
                               float        xalign);


float adw_squeezer_get_yalign (AdwSqueezer *self);

void  adw_squeezer_set_yalign (AdwSqueezer *self,
                               float        yalign);


GtkSelectionModel *adw_squeezer_get_pages (AdwSqueezer *self) ;



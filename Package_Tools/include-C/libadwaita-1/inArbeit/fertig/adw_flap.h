/*
 * Copyright (C) 2020 Felix Häcker <haeckerfelix@gnome.org>
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
#include "adw-spring-params.h"



#define ADW_TYPE_FLAP (adw_flap_get_type ())


//G_DECLARE_FINAL_TYPE (AdwFlap, adw_flap, ADW, FLAP, GtkWidget)

typedef enum {
  ADW_FLAP_FOLD_POLICY_NEVER,
  ADW_FLAP_FOLD_POLICY_ALWAYS,
  ADW_FLAP_FOLD_POLICY_AUTO,
} AdwFlapFoldPolicy;

typedef enum {
  ADW_FLAP_TRANSITION_TYPE_OVER,
  ADW_FLAP_TRANSITION_TYPE_UNDER,
  ADW_FLAP_TRANSITION_TYPE_SLIDE,
} AdwFlapTransitionType;


GtkWidget *adw_flap_new (void) ;


GtkWidget *adw_flap_get_content (AdwFlap   *self);

void       adw_flap_set_content (AdwFlap   *self,
                                 GtkWidget *content);


GtkWidget *adw_flap_get_flap (AdwFlap   *self);

void       adw_flap_set_flap (AdwFlap   *self,
                              GtkWidget *flap);


GtkWidget *adw_flap_get_separator (AdwFlap   *self);

void       adw_flap_set_separator (AdwFlap   *self,
                                   GtkWidget *separator);


GtkPackType adw_flap_get_flap_position (AdwFlap     *self);

void        adw_flap_set_flap_position (AdwFlap     *self,
                                        GtkPackType  position);


gboolean adw_flap_get_reveal_flap (AdwFlap  *self);

void     adw_flap_set_reveal_flap (AdwFlap  *self,
                                   gboolean  reveal_flap);


AdwSpringParams *adw_flap_get_reveal_params (AdwFlap         *self);

void             adw_flap_set_reveal_params (AdwFlap         *self,
                                             AdwSpringParams *params);


double adw_flap_get_reveal_progress (AdwFlap *self);


AdwFlapFoldPolicy adw_flap_get_fold_policy (AdwFlap           *self);

void              adw_flap_set_fold_policy (AdwFlap           *self,
                                            AdwFlapFoldPolicy  policy);


AdwFoldThresholdPolicy adw_flap_get_fold_threshold_policy (AdwFlap                *self);

void                   adw_flap_set_fold_threshold_policy (AdwFlap                *self,
                                                           AdwFoldThresholdPolicy  policy);


guint adw_flap_get_fold_duration (AdwFlap *self);

void  adw_flap_set_fold_duration (AdwFlap *self,
                                  guint    duration);


gboolean adw_flap_get_folded (AdwFlap *self);


gboolean adw_flap_get_locked (AdwFlap *self);

void     adw_flap_set_locked (AdwFlap  *self,
                              gboolean  locked);


AdwFlapTransitionType adw_flap_get_transition_type (AdwFlap               *self);

void                  adw_flap_set_transition_type (AdwFlap               *self,
                                                    AdwFlapTransitionType  transition_type);


gboolean adw_flap_get_modal (AdwFlap  *self);

void     adw_flap_set_modal (AdwFlap  *self,
                             gboolean  modal);


gboolean adw_flap_get_swipe_to_open (AdwFlap  *self);

void     adw_flap_set_swipe_to_open (AdwFlap  *self,
                                     gboolean  swipe_to_open);


gboolean adw_flap_get_swipe_to_close (AdwFlap  *self);

void     adw_flap_set_swipe_to_close (AdwFlap  *self,
                                      gboolean  swipe_to_close);



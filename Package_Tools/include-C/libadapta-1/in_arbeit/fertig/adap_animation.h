/*
 * Copyright (C) 2019 Purism SPC
 * Copyright (C) 2021 Manuel Genovés <manuel.genoves@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>

#include "adap-animation-target.h"
#include "adap-enums.h"



/**
 * ADAP_DURATION_INFINITE:
 *
 * Indicates an [class@Animation] with an infinite duration.
 *
 * This value is mostly used internally.
 */

#define ADAP_DURATION_INFINITE ((guint) 0xffffffff)

#define ADAP_TYPE_ANIMATION (adap_animation_get_type())

//////////G_DECLARE_DERIVABLE_TYPE (AdapAnimation, adap_animation, ADAP, ANIMATION, GObject)

typedef enum {
  ADAP_ANIMATION_IDLE,
  ADAP_ANIMATION_PAUSED,
  ADAP_ANIMATION_PLAYING,
  ADAP_ANIMATION_FINISHED,
} AdapAnimationState;

extern
GtkWidget *adap_animation_get_widget (AdapAnimation *self);

extern
AdapAnimationTarget *adap_animation_get_target (AdapAnimation       *self);
extern
void                adap_animation_set_target (AdapAnimation       *self,
                                              AdapAnimationTarget *target);

extern
double adap_animation_get_value (AdapAnimation *self);

extern
AdapAnimationState adap_animation_get_state (AdapAnimation *self);

extern
void adap_animation_play   (AdapAnimation *self);
extern
void adap_animation_pause  (AdapAnimation *self);
extern
void adap_animation_resume (AdapAnimation *self);
extern
void adap_animation_reset  (AdapAnimation *self);
extern
void adap_animation_skip   (AdapAnimation *self);

extern
gboolean adap_animation_get_follow_enable_animations_setting (AdapAnimation *self);
extern
void     adap_animation_set_follow_enable_animations_setting (AdapAnimation *self,
                                                             gboolean      setting);



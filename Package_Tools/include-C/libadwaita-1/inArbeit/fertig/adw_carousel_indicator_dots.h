/*
 * Copyright (C) 2020 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>
#include "adw-carousel.h"



#define ADW_TYPE_CAROUSEL_INDICATOR_DOTS (adw_carousel_indicator_dots_get_type())

//G_DECLARE_FINAL_TYPE (AdwCarouselIndicatorDots, adw_carousel_indicator_dots, ADW, CAROUSEL_INDICATOR_DOTS, GtkWidget)

extern
GtkWidget *adw_carousel_indicator_dots_new (void) ;

extern
AdwCarousel *adw_carousel_indicator_dots_get_carousel (AdwCarouselIndicatorDots *self);
extern
void         adw_carousel_indicator_dots_set_carousel (AdwCarouselIndicatorDots *self,
                                                       AdwCarousel              *carousel);



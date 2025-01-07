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



#define ADW_TYPE_CAROUSEL_INDICATOR_LINES (adw_carousel_indicator_lines_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwCarouselIndicatorLines, adw_carousel_indicator_lines, ADW, CAROUSEL_INDICATOR_LINES, GtkWidget)

extern
GtkWidget *adw_carousel_indicator_lines_new (void) ;

extern
AdwCarousel *adw_carousel_indicator_lines_get_carousel (AdwCarouselIndicatorLines *self);
extern
void         adw_carousel_indicator_lines_set_carousel (AdwCarouselIndicatorLines *self,
                                                        AdwCarousel               *carousel);



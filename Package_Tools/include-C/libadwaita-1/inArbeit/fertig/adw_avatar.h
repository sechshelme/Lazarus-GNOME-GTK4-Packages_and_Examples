/*
 * Copyright (C) 2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>



#define ADW_TYPE_AVATAR (adw_avatar_get_type())

//G_DECLARE_FINAL_TYPE (AdwAvatar, adw_avatar, ADW, AVATAR, GtkWidget)

extern
GtkWidget *adw_avatar_new (int         size,
                           const char *text,
                           gboolean    show_initials) ;

extern
const char *adw_avatar_get_icon_name (AdwAvatar  *self);
extern
void        adw_avatar_set_icon_name (AdwAvatar  *self,
                                      const char *icon_name);

extern
const char *adw_avatar_get_text (AdwAvatar  *self);
extern
void        adw_avatar_set_text (AdwAvatar  *self,
                                 const char *text);

extern
gboolean adw_avatar_get_show_initials (AdwAvatar *self);
extern
void     adw_avatar_set_show_initials (AdwAvatar *self,
                                       gboolean   show_initials);

extern
GdkPaintable *adw_avatar_get_custom_image (AdwAvatar    *self);
extern
void          adw_avatar_set_custom_image (AdwAvatar    *self,
                                           GdkPaintable *custom_image);

extern
int  adw_avatar_get_size (AdwAvatar *self);
extern
void adw_avatar_set_size (AdwAvatar *self,
                          int        size);

extern
GdkTexture *adw_avatar_draw_to_texture (AdwAvatar *self,
                                        int        scale_factor) ;



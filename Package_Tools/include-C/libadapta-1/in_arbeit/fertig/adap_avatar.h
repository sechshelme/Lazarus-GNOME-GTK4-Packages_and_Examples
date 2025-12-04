/*
 * Copyright (C) 2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>



#define ADAP_TYPE_AVATAR (adap_avatar_get_type())

//G_DECLARE_FINAL_TYPE (AdapAvatar, adap_avatar, ADAP, AVATAR, GtkWidget)

extern
GtkWidget *adap_avatar_new (int         size,
                           const char *text,
                           gboolean    show_initials) ;

extern
const char *adap_avatar_get_icon_name (AdapAvatar  *self);
extern
void        adap_avatar_set_icon_name (AdapAvatar  *self,
                                      const char *icon_name);

extern
const char *adap_avatar_get_text (AdapAvatar  *self);
extern
void        adap_avatar_set_text (AdapAvatar  *self,
                                 const char *text);

extern
gboolean adap_avatar_get_show_initials (AdapAvatar *self);
extern
void     adap_avatar_set_show_initials (AdapAvatar *self,
                                       gboolean   show_initials);

extern
GdkPaintable *adap_avatar_get_custom_image (AdapAvatar    *self);
extern
void          adap_avatar_set_custom_image (AdapAvatar    *self,
                                           GdkPaintable *custom_image);

extern
int  adap_avatar_get_size (AdapAvatar *self);
extern
void adap_avatar_set_size (AdapAvatar *self,
                          int        size);

extern
GdkTexture *adap_avatar_draw_to_texture (AdapAvatar *self,
                                        int        scale_factor) ;



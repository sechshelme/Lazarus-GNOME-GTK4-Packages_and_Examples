/* GStreamer Editing Services
 * Copyright (C) 2010 Brandon Lewis <brandon.lewis@collabora.co.uk>
 *               2010 Nokia Corporation
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

#pragma once

#include <glib-object.h>
#include <ges/ges-types.h>
#include <ges/ges-title-source.h>
#include <ges/ges-operation.h>


#define GES_TYPE_TEXT_OVERLAY ges_text_overlay_get_type()
//GES_DECLARE_TYPE( TextOverlay, text_overlay, TEXT_OVERLAY);

/**
 * GESTextOverlay:
 */
struct _GESTextOverlay
{
  GESOperation parent;

  /*< private > */
  GESTextOverlayPrivate *priv;

  /* Padding for API extension */
  gpointer _ges_reserved[GES_PADDING];
};

struct _GESTextOverlayClass
{
  GESOperationClass parent_class;

  /*< private > */

  /* Padding for API extension */
  gpointer _ges_reserved[GES_PADDING];
};

extern
void ges_text_overlay_set_text (GESTextOverlay * self,
    const gchar * text);
extern
void ges_text_overlay_set_font_desc (GESTextOverlay * self,
    const gchar * font_desc);

extern
void ges_text_overlay_set_halignment (GESTextOverlay * self,
    GESTextHAlign halign);

extern
void ges_text_overlay_set_valignment (GESTextOverlay * self,
    GESTextVAlign valign);
extern
void ges_text_overlay_set_color (GESTextOverlay * self,
    guint32 color);
extern
void ges_text_overlay_set_xpos (GESTextOverlay * self,
    gdouble position);
extern
void ges_text_overlay_set_ypos (GESTextOverlay * self,
    gdouble position);

GESTextOverlay *ges_text_overlay_new (void);

extern
const gchar *ges_text_overlay_get_text (GESTextOverlay * self);
extern
const char *ges_text_overlay_get_font_desc (GESTextOverlay * self);
extern
GESTextHAlign ges_text_overlay_get_halignment (GESTextOverlay *
    self);
extern
GESTextVAlign ges_text_overlay_get_valignment (GESTextOverlay *
    self);
extern
const guint32 ges_text_overlay_get_color (GESTextOverlay * self);
extern
const gdouble ges_text_overlay_get_xpos (GESTextOverlay * self);
extern
const gdouble ges_text_overlay_get_ypos (GESTextOverlay * self);



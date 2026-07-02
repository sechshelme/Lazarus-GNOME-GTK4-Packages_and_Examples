/* GDK - The GIMP Drawing Kit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
 */

#pragma once

#if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gdk/gdk.h> can be included directly."
#endif

/* GDK uses "glib". (And so does GTK).
 */
#include <glib.h>
#include <glib-object.h>
#include <gio/gio.h>
#include <cairo.h>
#include <pango/pango.h>

/* The system specific file gdkconfig.h contains such configuration
 * settings that are needed not only when compiling GDK (or GTK)
 * itself, but also occasionally when compiling programs that use GDK
 * (or GTK). One such setting is what windowing API backend is in use.
 */
#include <gdk/gdkconfig.h>
#include <gdk/gdkenums.h>
#include <gdk/version/gdkversionmacros.h>



/**
 * GDK_CURRENT_TIME:
 *
 * Represents the current time, and can be used anywhere a time is expected.
 */
#define GDK_CURRENT_TIME     0L

#ifdef __GI_SCANNER__
/* The introspection scanner is currently unable to lookup how
 * cairo_rectangle_int_t is actually defined. This prevents
 * introspection data for the GdkRectangle type to include fields
 * descriptions. To workaround this issue, we define it with the same
 * content as cairo_rectangle_int_t, but only under the introspection
 * define.
 */
struct _GdkRectangle
{
    int x, y;
    int width, height;
};
typedef struct _GdkRectangle          GdkRectangle;
#else
typedef cairo_rectangle_int_t         GdkRectangle;
#endif

/* Forward declarations of commonly used types */
typedef struct _GdkRGBA               GdkRGBA;
typedef struct _GdkCicpParams         GdkCicpParams;
typedef struct _GdkColorState         GdkColorState;
typedef struct _GdkContentFormats     GdkContentFormats;
typedef struct _GdkContentProvider    GdkContentProvider;
typedef struct _GdkCursor             GdkCursor;
typedef struct _GdkTexture            GdkTexture;
typedef struct _GdkTextureDownloader  GdkTextureDownloader;
typedef struct _GdkDevice             GdkDevice;
typedef struct _GdkDrag               GdkDrag;
typedef struct _GdkDrop               GdkDrop;

typedef struct _GdkClipboard          GdkClipboard;
typedef struct _GdkDisplayManager     GdkDisplayManager;
typedef struct _GdkDisplay            GdkDisplay;
typedef struct _GdkSurface             GdkSurface;
typedef struct _GdkAppLaunchContext   GdkAppLaunchContext;
typedef struct _GdkSeat               GdkSeat;
typedef struct _GdkSnapshot           GdkSnapshot;

typedef struct _GdkDrawContext        GdkDrawContext;
typedef struct _GdkCairoContext       GdkCairoContext;
typedef struct _GdkGLContext          GdkGLContext;
typedef struct _GdkVulkanContext      GdkVulkanContext;

typedef struct _GdkDmabufFormats      GdkDmabufFormats;
typedef struct _GdkDmabufTexture      GdkDmabufTexture;

  

typedef struct _GdkKeymapKey GdkKeymapKey;

/**
 * GdkKeymapKey:
 * @keycode: the hardware keycode. This is an identifying number for a
 *   physical key.
 * @group: indicates movement in a horizontal direction. Usually groups are used
 *   for two different languages. In group 0, a key might have two English
 *   characters, and in group 1 it might have two Hebrew characters. The Hebrew
 *   characters will be printed on the key next to the English characters.
 * @level: indicates which symbol on the key will be used, in a vertical direction.
 *   So on a standard US keyboard, the key with the number “1” on it also has the
 *   exclamation point ("!") character on it. The level indicates whether to use
 *   the “1” or the “!” symbol. The letter keys are considered to have a lowercase
 *   letter at level 0, and an uppercase letter at level 1, though only the
 *   uppercase letter is printed.
 *
 * Represents a hardware key that can be mapped to a keyval.
 */
struct _GdkKeymapKey
{
  guint keycode;
  int   group;
  int   level;
};




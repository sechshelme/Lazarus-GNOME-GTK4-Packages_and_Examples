/*
 * Copyright (C) 2012 Igalia S.L.
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
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

#if !defined(__WEBKIT_H_INSIDE__) && !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit.h> can be included directly."
#endif

#ifndef WebKitContextMenu_h
#define WebKitContextMenu_h

#include <glib-object.h>
#include <gtk/gtk.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_CONTEXT_MENU            (webkit_context_menu_get_type())

//WEBKIT_DECLARE_FINAL_TYPE (WebKitContextMenu, webkit_context_menu, WEBKIT, CONTEXT_MENU, GObject)

typedef struct _WebKitContextMenuItem WebKitContextMenuItem;

extern WebKitContextMenu *
webkit_context_menu_new                  (void);

extern WebKitContextMenu *
webkit_context_menu_new_with_items       (GList                 *items);

extern void
webkit_context_menu_prepend              (WebKitContextMenu     *menu,
                                          WebKitContextMenuItem *item);

extern void
webkit_context_menu_append               (WebKitContextMenu     *menu,
                                          WebKitContextMenuItem *item);

extern void
webkit_context_menu_insert               (WebKitContextMenu     *menu,
                                          WebKitContextMenuItem *item,
                                          gint                   position);

extern void
webkit_context_menu_move_item            (WebKitContextMenu     *menu,
                                          WebKitContextMenuItem *item,
                                          gint                   position);
extern GList *
webkit_context_menu_get_items            (WebKitContextMenu     *menu);

extern guint
webkit_context_menu_get_n_items          (WebKitContextMenu     *menu);

extern WebKitContextMenuItem *
webkit_context_menu_first                (WebKitContextMenu     *menu);

extern WebKitContextMenuItem *
webkit_context_menu_last                 (WebKitContextMenu     *menu);

extern WebKitContextMenuItem *
webkit_context_menu_get_item_at_position (WebKitContextMenu     *menu,
                                          guint                  position);

extern void
webkit_context_menu_remove               (WebKitContextMenu     *menu,
                                          WebKitContextMenuItem *item);

extern void
webkit_context_menu_remove_all           (WebKitContextMenu     *menu);

extern void
webkit_context_menu_set_user_data        (WebKitContextMenu     *menu,
                                          GVariant              *user_data);

extern GVariant *
webkit_context_menu_get_user_data        (WebKitContextMenu     *menu);

extern GdkEvent *
webkit_context_menu_get_event            (WebKitContextMenu     *menu);



#endif

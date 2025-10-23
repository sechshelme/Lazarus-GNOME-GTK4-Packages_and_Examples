/*
 * Copyright (C) 2012, 2017 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
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

#if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit.h> can be included directly."
#endif

#ifndef WebKitFaviconDatabase_h
#define WebKitFaviconDatabase_h

#include <gio/gio.h>
#include <glib-object.h>
#include <webkit/WebKitDefines.h>

#include <gtk/gtk.h>

G_BEGIN_DECLS

#define WEBKIT_FAVICON_DATABASE_ERROR           (webkit_favicon_database_error_quark())
#define WEBKIT_TYPE_FAVICON_DATABASE            (webkit_favicon_database_get_type())

WEBKIT_DECLARE_FINAL_TYPE (WebKitFaviconDatabase, webkit_favicon_database, WEBKIT, FAVICON_DATABASE, GObject)

/**
 * WebKitFaviconDatabaseError:
 * @WEBKIT_FAVICON_DATABASE_ERROR_NOT_INITIALIZED: The #WebKitFaviconDatabase is closed
 * @WEBKIT_FAVICON_DATABASE_ERROR_FAVICON_NOT_FOUND: There is not an icon available for the requested URL
 * @WEBKIT_FAVICON_DATABASE_ERROR_FAVICON_UNKNOWN: There might be an icon for the requested URL, but its data is unknown at the moment
 *
 * Enum values used to denote the various errors related to the #WebKitFaviconDatabase.
 **/
typedef enum {
    WEBKIT_FAVICON_DATABASE_ERROR_NOT_INITIALIZED,
    WEBKIT_FAVICON_DATABASE_ERROR_FAVICON_NOT_FOUND,
    WEBKIT_FAVICON_DATABASE_ERROR_FAVICON_UNKNOWN
} WebKitFaviconDatabaseError;

WEBKIT_API GQuark
webkit_favicon_database_error_quark        (void);

WEBKIT_API void
webkit_favicon_database_get_favicon        (WebKitFaviconDatabase *database,
                                            const gchar           *page_uri,
                                            GCancellable          *cancellable,
                                            GAsyncReadyCallback    callback,
                                            gpointer               user_data);

WEBKIT_API GdkTexture *
webkit_favicon_database_get_favicon_finish (WebKitFaviconDatabase *database,
                                            GAsyncResult          *result,
                                            GError               **error);

WEBKIT_API gchar *
webkit_favicon_database_get_favicon_uri    (WebKitFaviconDatabase *database,
                                            const gchar           *page_uri);
WEBKIT_API void
webkit_favicon_database_clear              (WebKitFaviconDatabase *database);

G_END_DECLS

#endif

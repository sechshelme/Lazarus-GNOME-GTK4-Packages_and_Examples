/*
 * Copyright (C) 2012 Igalia S.L.
 * Copyright (C) 2017 Endless Mobile, Inc.
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

#ifndef WebKitCookieManager_h
#define WebKitCookieManager_h

#include <gio/gio.h>
#include <glib-object.h>
#include <libsoup/soup.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_COOKIE_MANAGER            (webkit_cookie_manager_get_type())

//WEBKIT_DECLARE_FINAL_TYPE (WebKitCookieManager, webkit_cookie_manager, WEBKIT, COOKIE_MANAGER, GObject)

/**
 * WebKitCookiePersistentStorage:
 * @WEBKIT_COOKIE_PERSISTENT_STORAGE_TEXT: Cookies are stored in a text
 *  file in the Mozilla "cookies.txt" format.
 * @WEBKIT_COOKIE_PERSISTENT_STORAGE_SQLITE: Cookies are stored in a SQLite
 *  file in the current Mozilla format.
 *
 * Enum values used to denote the cookie persistent storage types.
 */
typedef enum {
    WEBKIT_COOKIE_PERSISTENT_STORAGE_TEXT,
    WEBKIT_COOKIE_PERSISTENT_STORAGE_SQLITE
} WebKitCookiePersistentStorage;

/**
 * WebKitCookieAcceptPolicy:
 * @WEBKIT_COOKIE_POLICY_ACCEPT_ALWAYS: Accept all cookies unconditionally.
 * @WEBKIT_COOKIE_POLICY_ACCEPT_NEVER: Reject all cookies unconditionally.
 * @WEBKIT_COOKIE_POLICY_ACCEPT_NO_THIRD_PARTY: Accept only cookies set by the main document loaded.
 *
 * Enum values used to denote the cookie acceptance policies.
 */
typedef enum {
    WEBKIT_COOKIE_POLICY_ACCEPT_ALWAYS,
    WEBKIT_COOKIE_POLICY_ACCEPT_NEVER,
    WEBKIT_COOKIE_POLICY_ACCEPT_NO_THIRD_PARTY
} WebKitCookieAcceptPolicy;

extern void
webkit_cookie_manager_set_persistent_storage          (WebKitCookieManager          *cookie_manager,
                                                       const gchar                  *filename,
                                                       WebKitCookiePersistentStorage storage);

extern void
webkit_cookie_manager_set_accept_policy               (WebKitCookieManager          *cookie_manager,
                                                       WebKitCookieAcceptPolicy      policy);

extern void
webkit_cookie_manager_get_accept_policy               (WebKitCookieManager          *cookie_manager,
                                                       GCancellable                 *cancellable,
                                                       GAsyncReadyCallback           callback,
                                                       gpointer                      user_data);

extern WebKitCookieAcceptPolicy
webkit_cookie_manager_get_accept_policy_finish        (WebKitCookieManager          *cookie_manager,
                                                       GAsyncResult                 *result,
                                                       GError                      **error);

extern void
webkit_cookie_manager_add_cookie                      (WebKitCookieManager          *cookie_manager,
                                                       SoupCookie                   *cookie,
                                                       GCancellable                 *cancellable,
                                                       GAsyncReadyCallback           callback,
                                                       gpointer                      user_data);

extern gboolean
webkit_cookie_manager_add_cookie_finish               (WebKitCookieManager          *cookie_manager,
                                                       GAsyncResult                 *result,
                                                       GError                      **error);

extern void
webkit_cookie_manager_get_cookies                     (WebKitCookieManager          *cookie_manager,
                                                       const gchar                  *uri,
                                                       GCancellable                 *cancellable,
                                                       GAsyncReadyCallback           callback,
                                                       gpointer                      user_data);

extern GList *
webkit_cookie_manager_get_cookies_finish              (WebKitCookieManager          *cookie_manager,
                                                       GAsyncResult                 *result,
                                                       GError                      **error);

extern void
webkit_cookie_manager_delete_cookie                   (WebKitCookieManager          *cookie_manager,
                                                       SoupCookie                   *cookie,
                                                       GCancellable                 *cancellable,
                                                       GAsyncReadyCallback           callback,
                                                       gpointer                      user_data);

extern gboolean
webkit_cookie_manager_delete_cookie_finish            (WebKitCookieManager          *cookie_manager,
                                                       GAsyncResult                 *result,
                                                       GError                      **error);


extern void
webkit_cookie_manager_replace_cookies                 (WebKitCookieManager          *cookie_manager,
                                                       GList                        *cookies,
                                                       GCancellable                 *cancellable,
                                                       GAsyncReadyCallback           callback,
                                                       gpointer                      user_data);

extern gboolean
webkit_cookie_manager_replace_cookies_finish          (WebKitCookieManager          *cookie_manager,
                                                       GAsyncResult                 *result,
                                                       GError                      **error);

extern void
webkit_cookie_manager_get_all_cookies                 (WebKitCookieManager          *cookie_manager,
                                                       GCancellable                 *cancellable,
                                                       GAsyncReadyCallback           callback,
                                                       gpointer                      user_data);

extern GList *
webkit_cookie_manager_get_all_cookies_finish          (WebKitCookieManager          *cookie_manager,
                                                       GAsyncResult                 *result,
                                                       GError                      **error);




#endif

/*
 * Copyright (C) 2011 Igalia S.L.
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

#if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit.h> can be included directly."
#endif

#ifndef WebKitWebContext_h
#define WebKitWebContext_h

#include <glib-object.h>
#include <webkit/WebKitAutomationSession.h>
#include <webkit/WebKitCookieManager.h>
#include <webkit/WebKitDefines.h>
#include <webkit/WebKitDownload.h>
#include <webkit/WebKitGeolocationManager.h>
#include <webkit/WebKitNetworkProxySettings.h>
#include <webkit/WebKitNetworkSession.h>
#include <webkit/WebKitSecurityManager.h>
#include <webkit/WebKitURISchemeRequest.h>
#include <webkit/WebKitUserMessage.h>
#include <webkit/WebKitWebsiteDataManager.h>



#define WEBKIT_TYPE_WEB_CONTEXT            (webkit_web_context_get_type())
//WEBKIT_DECLARE_FINAL_TYPE (WebKitWebContext, webkit_web_context, WEBKIT, WEB_CONTEXT, GObject)

/**
 * WebKitCacheModel:
 * @WEBKIT_CACHE_MODEL_DOCUMENT_VIEWER: Disable the cache completely, which
 *   substantially reduces memory usage. Useful for applications that only
 *   access a single local file, with no navigation to other pages. No remote
 *   resources will be cached.
 * @WEBKIT_CACHE_MODEL_DOCUMENT_BROWSER: A cache model optimized for viewing
 *   a series of local files -- for example, a documentation viewer or a website
 *   designer. WebKit will cache a moderate number of resources.
 * @WEBKIT_CACHE_MODEL_WEB_BROWSER: Improve document load speed substantially
 *   by caching a very large number of resources and previously viewed content.
 *
 * Enum values used for determining the #WebKitWebContext cache model.
 */
typedef enum {
    WEBKIT_CACHE_MODEL_DOCUMENT_VIEWER,
    WEBKIT_CACHE_MODEL_WEB_BROWSER,
    WEBKIT_CACHE_MODEL_DOCUMENT_BROWSER
} WebKitCacheModel;


/**
 * WebKitURISchemeRequestCallback:
 * @request: the #WebKitURISchemeRequest
 * @user_data: user data passed to the callback
 *
 * Type definition for a function that will be called back when an URI request is
 * made for a user registered URI scheme.
 */
typedef void (* WebKitURISchemeRequestCallback) (WebKitURISchemeRequest *request,
                                                 gpointer                user_data);

extern WebKitWebContext *
webkit_web_context_get_default                      (void);

extern WebKitWebContext *
webkit_web_context_new                              (void);


extern gboolean
webkit_web_context_is_automation_allowed            (WebKitWebContext              *context);

extern void
webkit_web_context_set_automation_allowed           (WebKitWebContext              *context,
                                                     gboolean                       allowed);

extern WebKitNetworkSession *
webkit_web_context_get_network_session_for_automation(WebKitWebContext             *context);

extern void
webkit_web_context_set_cache_model                  (WebKitWebContext              *context,
                                                     WebKitCacheModel               cache_model);
extern WebKitCacheModel
webkit_web_context_get_cache_model                  (WebKitWebContext              *context);



extern WebKitGeolocationManager *
webkit_web_context_get_geolocation_manager          (WebKitWebContext              *context);


extern WebKitSecurityManager *
webkit_web_context_get_security_manager             (WebKitWebContext              *context);


extern void
webkit_web_context_register_uri_scheme              (WebKitWebContext              *context,
                                                     const gchar                   *scheme,
                                                     WebKitURISchemeRequestCallback callback,
                                                     gpointer                       user_data,
                                                     GDestroyNotify                 user_data_destroy_func);


extern void
webkit_web_context_add_path_to_sandbox              (WebKitWebContext              *context,
                                                     const char                    *path,
                                                     gboolean                       read_only);

extern gboolean
webkit_web_context_get_spell_checking_enabled       (WebKitWebContext              *context);

extern void
webkit_web_context_set_spell_checking_enabled       (WebKitWebContext              *context,
                                                     gboolean                       enabled);
extern const gchar * const *
webkit_web_context_get_spell_checking_languages     (WebKitWebContext              *context);

extern void
webkit_web_context_set_spell_checking_languages     (WebKitWebContext              *context,
                                                     const gchar * const           *languages);

extern void
webkit_web_context_set_preferred_languages          (WebKitWebContext              *context,
                                                     const gchar * const           *languages);


/**
 * webkit_web_context_set_web_process_extensions_directory:
 * @context: a #WebKitWebContext
 * @directory: the directory to add
 *
 * Set the directory where WebKit will look for web process extensions.
 *
 * This method must be called before loading anything in this context,
 * otherwise it will not have any effect. You can connect to
 * #WebKitWebContext::initialize-web-process-extensions to call this method
 * before anything is loaded.
 */
extern void
webkit_web_context_set_web_process_extensions_directory (WebKitWebContext              *context,
                                                         const gchar                   *directory);

/**
 * webkit_web_context_set_web_process_extensions_initialization_user_data:
 * @context: a #WebKitWebContext
 * @user_data: a #GVariant
 *
 * Set user data to be passed to Web Extensions on initialization.
 *
 * The data will be passed to the
 * #WebKitWebProcessExtensionInitializeWithUserDataFunction.
 * This method must be called before loading anything in this context,
 * otherwise it will not have any effect. You can connect to
 * #WebKitWebContext::initialize-web-process-extensions to call this method
 * before anything is loaded.
 *
 * Since: 2.4
 */
extern void
webkit_web_context_set_web_process_extensions_initialization_user_data
                                                    (WebKitWebContext              *context,
                                                     GVariant                      *user_data);

/**
 * WebKitWebContext::initialize-web-process-extensions:
 * @context: the #WebKitWebContext
 *
 * This signal is emitted when a new web process is about to be
 * launched. It signals the most appropriate moment to use
 * webkit_web_context_set_web_process_extensions_initialization_user_data()
 * and webkit_web_context_set_web_process_extensions_directory().
 *
 * Since: 2.4
 */


extern void
webkit_web_context_initialize_notification_permissions
                                                    (WebKitWebContext              *context,
                                                     GList                         *allowed_origins,
                                                     GList                         *disallowed_origins);

extern void
webkit_web_context_send_message_to_all_extensions   (WebKitWebContext              *context,
                                                     WebKitUserMessage             *message);


extern const gchar*
webkit_web_context_get_time_zone_override           (WebKitWebContext              *context);



#endif

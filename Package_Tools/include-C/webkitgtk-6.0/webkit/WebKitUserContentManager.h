/*
 * Copyright (C) 2014, 2020 Igalia S.L.
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


#ifndef WebKitUserContentManager_h
#define WebKitUserContentManager_h

#include <glib-object.h>
#include <jsc/jsc.h>
#include <webkit/WebKitDefines.h>
#include <webkit/WebKitUserContent.h>



#define WEBKIT_TYPE_USER_CONTENT_MANAGER            (webkit_user_content_manager_get_type())

WEBKIT_DECLARE_FINAL_TYPE (WebKitUserContentManager, webkit_user_content_manager, WEBKIT, USER_CONTENT_MANAGER, GObject)

extern WebKitUserContentManager *
webkit_user_content_manager_new                                        (void);

extern void
webkit_user_content_manager_add_style_sheet                            (WebKitUserContentManager *manager,
                                                                        WebKitUserStyleSheet     *stylesheet);

extern void
webkit_user_content_manager_remove_style_sheet                         (WebKitUserContentManager *manager,
                                                                        WebKitUserStyleSheet     *stylesheet);

extern void
webkit_user_content_manager_remove_all_style_sheets                    (WebKitUserContentManager *manager);

/**
 * webkit_user_content_manager_register_script_message_handler:
 * @manager: A #WebKitUserContentManager
 * @name: Name of the script message channel
 * @world_name: (nullable): the name of a #WebKitScriptWorld
 *
 * Registers a new user script message handler in script world.
 *
 * After it is registered,
 * scripts can use `window.webkit.messageHandlers.<name>.postMessage(value)`
 * to send messages. Those messages are received by connecting handlers
 * to the #WebKitUserContentManager::script-message-received signal. The
 * handler name is used as the detail of the signal. To avoid race
 * conditions between registering the handler name, and starting to
 * receive the signals, it is recommended to connect to the signal
 * *before* registering the handler name:
 *
 * ```c
 * WebKitWebView *view = webkit_web_view_new ();
 * WebKitUserContentManager *manager = webkit_web_view_get_user_content_manager ();
 * g_signal_connect (manager, "script-message-received::foobar",
 *                   G_CALLBACK (handle_script_message), NULL);
 * webkit_user_content_manager_register_script_message_handler (manager, "foobar");
 * ```
 *
 * Registering a script message handler will fail if the requested
 * name has been already registered before.
 *
 * If %NULL is passed as the @world_name, the default world will be used.
 *
 * The registered handler can be unregistered by using
 * webkit_user_content_manager_unregister_script_message_handler().
 *
 * Returns: %TRUE if message handler was registered successfully, or %FALSE otherwise.
 *
 * Since: 2.40
 */
extern gboolean
webkit_user_content_manager_register_script_message_handler            (WebKitUserContentManager *manager,
                                                                        const char               *name,
                                                                        const char               *world_name);


/**
 * webkit_user_content_manager_unregister_script_message_handler:
 * @manager: A #WebKitUserContentManager
 * @name: Name of the script message channel
 * @world_name: (nullable): the name of a #WebKitScriptWorld
 *
 * Unregisters a previously registered message handler in script world with name @world_name.
 * If %NULL is passed as the @world_name, the default world will be used.
 *
 * Note that this does *not* disconnect handlers for the
 * #WebKitUserContentManager::script-message-received signal;
 * they will be kept connected, but the signal will not be emitted
 * unless the handler name is registered again.
 *
 * See also webkit_user_content_manager_register_script_message_handler().
 *
 * Since: 2.40
 */
extern void
webkit_user_content_manager_unregister_script_message_handler          (WebKitUserContentManager *manager,
                                                                        const gchar              *name,
                                                                        const gchar              *world_name);

extern gboolean
webkit_user_content_manager_register_script_message_handler_with_reply (WebKitUserContentManager *manager,
                                                                        const char               *name,
                                                                        const char               *world_name);


extern void
webkit_user_content_manager_add_script                                 (WebKitUserContentManager *manager,
                                                                        WebKitUserScript         *script);

extern void
webkit_user_content_manager_remove_script                              (WebKitUserContentManager *manager,
                                                                        WebKitUserScript         *script);

extern void
webkit_user_content_manager_remove_all_scripts                         (WebKitUserContentManager *manager);

extern void
webkit_user_content_manager_add_filter                                 (WebKitUserContentManager *manager,
                                                                        WebKitUserContentFilter  *filter);

extern void
webkit_user_content_manager_remove_filter                              (WebKitUserContentManager *manager,
                                                                        WebKitUserContentFilter  *filter);

extern void
webkit_user_content_manager_remove_filter_by_id                        (WebKitUserContentManager *manager,
                                                                        const char               *filter_id);

extern void
webkit_user_content_manager_remove_all_filters                         (WebKitUserContentManager *manager);

#define WEBKIT_TYPE_SCRIPT_MESSAGE_REPLY                               (webkit_script_message_reply_get_type())

typedef struct _WebKitScriptMessageReply WebKitScriptMessageReply;

extern GType
webkit_script_message_reply_get_type                                   (void);

extern WebKitScriptMessageReply *
webkit_script_message_reply_ref                                        (WebKitScriptMessageReply *script_message_reply);

extern void
webkit_script_message_reply_unref                                      (WebKitScriptMessageReply *script_message_reply);

extern void
webkit_script_message_reply_return_value                               (WebKitScriptMessageReply *script_message_reply,
                                                                        JSCValue                 *reply_value);

extern void
webkit_script_message_reply_return_error_message                       (WebKitScriptMessageReply *script_message_reply,
                                                                        const char               *error_message);



#endif

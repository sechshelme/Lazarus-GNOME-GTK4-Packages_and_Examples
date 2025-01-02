/*
 * Copyright (C) 2018 Igalia S.L.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE INC. AND ITS CONTRIBUTORS ``AS IS''
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL APPLE INC. OR ITS CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 */

#if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit.h> can be included directly."
#endif

#ifndef WebKitUserContentFilterStore_h
#define WebKitUserContentFilterStore_h

#include <gio/gio.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_USER_CONTENT_FILTER_STORE            (webkit_user_content_filter_store_get_type())

WEBKIT_DECLARE_FINAL_TYPE (WebKitUserContentFilterStore, webkit_user_content_filter_store, WEBKIT, USER_CONTENT_FILTER_STORE, GObject)

typedef struct _WebKitUserContentFilter WebKitUserContentFilter;

extern WebKitUserContentFilterStore *
webkit_user_content_filter_store_new                      (const gchar                  *storage_path);

extern const gchar *
webkit_user_content_filter_store_get_path                 (WebKitUserContentFilterStore *store);

extern void
webkit_user_content_filter_store_save                     (WebKitUserContentFilterStore *store,
                                                           const gchar                  *identifier,
                                                           GBytes                       *source,
                                                           GCancellable                 *cancellable,
                                                           GAsyncReadyCallback           callback,
                                                           gpointer                      user_data);

extern WebKitUserContentFilter *
webkit_user_content_filter_store_save_finish              (WebKitUserContentFilterStore *store,
                                                           GAsyncResult                 *result,
                                                           GError                      **error);

extern void
webkit_user_content_filter_store_save_from_file           (WebKitUserContentFilterStore *store,
                                                           const gchar                  *identifier,
                                                           GFile                        *file,
                                                           GCancellable                 *cancellable,
                                                           GAsyncReadyCallback           callback,
                                                           gpointer                      user_data);

extern WebKitUserContentFilter *
webkit_user_content_filter_store_save_from_file_finish    (WebKitUserContentFilterStore *store,
                                                           GAsyncResult                 *result,
                                                           GError                      **error);

extern void
webkit_user_content_filter_store_remove                   (WebKitUserContentFilterStore *store,
                                                           const gchar                  *identifier,
                                                           GCancellable                 *cancellable,
                                                           GAsyncReadyCallback           callback,
                                                           gpointer                      user_data);

extern gboolean
webkit_user_content_filter_store_remove_finish            (WebKitUserContentFilterStore *store,
                                                           GAsyncResult                 *result,
                                                           GError                      **error);

extern void
webkit_user_content_filter_store_load                     (WebKitUserContentFilterStore *store,
                                                           const gchar                  *identifier,
                                                           GCancellable                 *cancellable,
                                                           GAsyncReadyCallback           callback,
                                                           gpointer                      user_data);

extern WebKitUserContentFilter *
webkit_user_content_filter_store_load_finish              (WebKitUserContentFilterStore *store,
                                                           GAsyncResult                 *result,
                                                           GError                      **error);

extern void
webkit_user_content_filter_store_fetch_identifiers        (WebKitUserContentFilterStore *store,
                                                           GCancellable                 *cancellable,
                                                           GAsyncReadyCallback           callback,
                                                           gpointer                      user_data);

extern gchar**
webkit_user_content_filter_store_fetch_identifiers_finish (WebKitUserContentFilterStore *store,
                                                           GAsyncResult                 *result);



#endif /* !WebKitUserContentFilterStore_h */

/*
 * Copyright (C) 2013 Samsung Electronics Inc. All rights reserved.
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

#ifndef WebKitCredential_h
#define WebKitCredential_h

#include <glib-object.h>
#include <gio/gio.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_CREDENTIAL (webkit_credential_get_type())

typedef struct _WebKitCredential WebKitCredential;

/**
 * WebKitCredentialPersistence:
 * @WEBKIT_CREDENTIAL_PERSISTENCE_NONE: Credential does not persist
 * @WEBKIT_CREDENTIAL_PERSISTENCE_FOR_SESSION: Credential persists for session only
 * @WEBKIT_CREDENTIAL_PERSISTENCE_PERMANENT: Credential persists permanently
 *
 * Enum values representing the duration for which a credential persists.
 *
 * Since: 2.2
 */
typedef enum {
    WEBKIT_CREDENTIAL_PERSISTENCE_NONE,
    WEBKIT_CREDENTIAL_PERSISTENCE_FOR_SESSION,
    WEBKIT_CREDENTIAL_PERSISTENCE_PERMANENT
} WebKitCredentialPersistence;

extern GType
webkit_credential_get_type                (void);

extern WebKitCredential *
webkit_credential_new                     (const gchar                 *username,
                                           const gchar                 *password,
                                           WebKitCredentialPersistence  persistence);

extern WebKitCredential *
webkit_credential_new_for_certificate_pin (const gchar                 *pin,
                                           WebKitCredentialPersistence  persistence);

extern WebKitCredential *
webkit_credential_new_for_certificate     (GTlsCertificate             *certificate,
                                           WebKitCredentialPersistence  persistence);

extern WebKitCredential *
webkit_credential_copy                    (WebKitCredential            *credential);

extern void
webkit_credential_free                    (WebKitCredential            *credential);

extern const gchar *
webkit_credential_get_username            (WebKitCredential            *credential);

extern const gchar *
webkit_credential_get_password            (WebKitCredential            *credential);

extern gboolean
webkit_credential_has_password            (WebKitCredential            *credential);

extern GTlsCertificate *
webkit_credential_get_certificate         (WebKitCredential            *credential);

extern WebKitCredentialPersistence
webkit_credential_get_persistence         (WebKitCredential            *credential);



#endif

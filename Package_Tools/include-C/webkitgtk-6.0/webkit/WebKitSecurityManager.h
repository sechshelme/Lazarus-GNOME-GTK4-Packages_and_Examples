/*
 * Copyright (C) 2012 Igalia S.L.
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

#ifndef WebKitSecurityManager_h
#define WebKitSecurityManager_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_SECURITY_MANAGER            (webkit_security_manager_get_type())

WEBKIT_DECLARE_FINAL_TYPE (WebKitSecurityManager, webkit_security_manager, WEBKIT, SECURITY_MANAGER, GObject)

extern void
webkit_security_manager_register_uri_scheme_as_local            (WebKitSecurityManager *security_manager,
                                                                 const gchar           *scheme);

extern gboolean
webkit_security_manager_uri_scheme_is_local                     (WebKitSecurityManager *security_manager,
                                                                 const gchar           *scheme);

extern void
webkit_security_manager_register_uri_scheme_as_no_access        (WebKitSecurityManager *security_manager,
                                                                 const gchar           *scheme);

extern gboolean
webkit_security_manager_uri_scheme_is_no_access                 (WebKitSecurityManager *security_manager,
                                                                 const gchar           *scheme);

extern void
webkit_security_manager_register_uri_scheme_as_display_isolated (WebKitSecurityManager *security_manager,
                                                                 const gchar           *scheme);

extern gboolean
webkit_security_manager_uri_scheme_is_display_isolated          (WebKitSecurityManager *security_manager,
                                                                 const gchar           *scheme);

extern void
webkit_security_manager_register_uri_scheme_as_secure           (WebKitSecurityManager *security_manager,
                                                                 const gchar           *scheme);

extern gboolean
webkit_security_manager_uri_scheme_is_secure                    (WebKitSecurityManager *security_manager,
                                                                 const gchar           *scheme);

extern void
webkit_security_manager_register_uri_scheme_as_cors_enabled     (WebKitSecurityManager *security_manager,
                                                                 const gchar           *scheme);

extern gboolean
webkit_security_manager_uri_scheme_is_cors_enabled              (WebKitSecurityManager *security_manager,
                                                                 const gchar           *scheme);

extern void
webkit_security_manager_register_uri_scheme_as_empty_document   (WebKitSecurityManager *security_manager,
                                                                 const gchar           *scheme);

extern gboolean
webkit_security_manager_uri_scheme_is_empty_document            (WebKitSecurityManager *security_manager,
                                                                 const gchar           *scheme);



#endif

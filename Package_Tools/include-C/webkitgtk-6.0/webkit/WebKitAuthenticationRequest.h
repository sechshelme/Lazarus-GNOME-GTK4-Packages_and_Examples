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

#ifndef WebKitAuthenticationRequest_h
#define WebKitAuthenticationRequest_h

#include <webkit/WebKitCredential.h>
#include <webkit/WebKitDefines.h>
#include <webkit/WebKitSecurityOrigin.h>

#include <gtk/gtk.h>



#define WEBKIT_TYPE_AUTHENTICATION_REQUEST            (webkit_authentication_request_get_type())

WEBKIT_DECLARE_FINAL_TYPE (WebKitAuthenticationRequest, webkit_authentication_request, WEBKIT, AUTHENTICATION_REQUEST, GObject)

/**
 * WebKitAuthenticationScheme:
 * @WEBKIT_AUTHENTICATION_SCHEME_DEFAULT: The default authentication scheme of WebKit.
 * @WEBKIT_AUTHENTICATION_SCHEME_HTTP_BASIC: Basic authentication scheme as defined in RFC 2617.
 * @WEBKIT_AUTHENTICATION_SCHEME_HTTP_DIGEST: Digest authentication scheme as defined in RFC 2617.
 * @WEBKIT_AUTHENTICATION_SCHEME_HTML_FORM: HTML Form authentication.
 * @WEBKIT_AUTHENTICATION_SCHEME_NTLM: NTLM Microsoft proprietary authentication scheme.
 * @WEBKIT_AUTHENTICATION_SCHEME_NEGOTIATE: Negotiate (or SPNEGO) authentication scheme as defined in RFC 4559.
 * @WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_REQUESTED: Client Certificate Authentication (see RFC 2246).
 * @WEBKIT_AUTHENTICATION_SCHEME_SERVER_TRUST_EVALUATION_REQUESTED: Server Trust Authentication.
 * @WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_PIN_REQUESTED: Client certificate PIN required for use. Since: 2.34
 * @WEBKIT_AUTHENTICATION_SCHEME_UNKNOWN: Authentication scheme unknown.
 *
 * Enum values representing the authentication scheme.
 *
 * Since: 2.2
 */
typedef enum {
    WEBKIT_AUTHENTICATION_SCHEME_DEFAULT = 1,
    WEBKIT_AUTHENTICATION_SCHEME_HTTP_BASIC = 2,
    WEBKIT_AUTHENTICATION_SCHEME_HTTP_DIGEST = 3,
    WEBKIT_AUTHENTICATION_SCHEME_HTML_FORM = 4,
    WEBKIT_AUTHENTICATION_SCHEME_NTLM = 5,
    WEBKIT_AUTHENTICATION_SCHEME_NEGOTIATE = 6,
    WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_REQUESTED = 7,
    WEBKIT_AUTHENTICATION_SCHEME_SERVER_TRUST_EVALUATION_REQUESTED = 8,
    WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_PIN_REQUESTED = 9,
    WEBKIT_AUTHENTICATION_SCHEME_UNKNOWN = 100,
} WebKitAuthenticationScheme;


extern gboolean
webkit_authentication_request_can_save_credentials    (WebKitAuthenticationRequest *request);

extern void
webkit_authentication_request_set_can_save_credentials(WebKitAuthenticationRequest *request,
                                                       gboolean                     enabled);

extern WebKitCredential *
webkit_authentication_request_get_proposed_credential (WebKitAuthenticationRequest *request);

extern void
webkit_authentication_request_set_proposed_credential (WebKitAuthenticationRequest *request,
                                                       WebKitCredential            *credential);

extern const gchar *
webkit_authentication_request_get_host                (WebKitAuthenticationRequest *request);

extern guint
webkit_authentication_request_get_port                (WebKitAuthenticationRequest *request);

extern WebKitSecurityOrigin *
webkit_authentication_request_get_security_origin     (WebKitAuthenticationRequest *request);

extern const gchar *
webkit_authentication_request_get_realm               (WebKitAuthenticationRequest *request);

extern WebKitAuthenticationScheme
webkit_authentication_request_get_scheme              (WebKitAuthenticationRequest *request);

extern gboolean
webkit_authentication_request_is_for_proxy            (WebKitAuthenticationRequest *request);

extern gboolean
webkit_authentication_request_is_retry                (WebKitAuthenticationRequest *request);

extern void
webkit_authentication_request_authenticate            (WebKitAuthenticationRequest *request,
                                                       WebKitCredential            *credential);

extern void
webkit_authentication_request_cancel                  (WebKitAuthenticationRequest *request);

extern GTlsPasswordFlags
webkit_authentication_request_get_certificate_pin_flags (WebKitAuthenticationRequest* request);



#endif

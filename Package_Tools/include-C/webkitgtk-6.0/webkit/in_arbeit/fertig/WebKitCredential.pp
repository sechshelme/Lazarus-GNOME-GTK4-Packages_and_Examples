
unit WebKitCredential;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitCredential.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitCredential.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
PGTlsCertificate  = ^GTlsCertificate;
PWebKitCredential  = ^WebKitCredential;
PWebKitCredentialPersistence  = ^WebKitCredentialPersistence;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
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
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitCredential_h}
{$define WebKitCredential_h}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_CREDENTIAL : longint; { return type might be wrong }

type
{*
 * WebKitCredentialPersistence:
 * @WEBKIT_CREDENTIAL_PERSISTENCE_NONE: Credential does not persist
 * @WEBKIT_CREDENTIAL_PERSISTENCE_FOR_SESSION: Credential persists for session only
 * @WEBKIT_CREDENTIAL_PERSISTENCE_PERMANENT: Credential persists permanently
 *
 * Enum values representing the duration for which a credential persists.
 *
 * Since: 2.2
  }

  PWebKitCredentialPersistence = ^TWebKitCredentialPersistence;
  TWebKitCredentialPersistence =  Longint;
  Const
    WEBKIT_CREDENTIAL_PERSISTENCE_NONE = 0;
    WEBKIT_CREDENTIAL_PERSISTENCE_FOR_SESSION = 1;
    WEBKIT_CREDENTIAL_PERSISTENCE_PERMANENT = 2;
;

function webkit_credential_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function webkit_credential_new(username:Pgchar; password:Pgchar; persistence:TWebKitCredentialPersistence):PWebKitCredential;cdecl;external;
(* Const before type ignored *)
function webkit_credential_new_for_certificate_pin(pin:Pgchar; persistence:TWebKitCredentialPersistence):PWebKitCredential;cdecl;external;
function webkit_credential_new_for_certificate(certificate:PGTlsCertificate; persistence:TWebKitCredentialPersistence):PWebKitCredential;cdecl;external;
function webkit_credential_copy(credential:PWebKitCredential):PWebKitCredential;cdecl;external;
procedure webkit_credential_free(credential:PWebKitCredential);cdecl;external;
(* Const before type ignored *)
function webkit_credential_get_username(credential:PWebKitCredential):Pgchar;cdecl;external;
(* Const before type ignored *)
function webkit_credential_get_password(credential:PWebKitCredential):Pgchar;cdecl;external;
function webkit_credential_has_password(credential:PWebKitCredential):Tgboolean;cdecl;external;
function webkit_credential_get_certificate(credential:PWebKitCredential):PGTlsCertificate;cdecl;external;
function webkit_credential_get_persistence(credential:PWebKitCredential):TWebKitCredentialPersistence;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_CREDENTIAL : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_CREDENTIAL:=webkit_credential_get_type;
  end;


end.

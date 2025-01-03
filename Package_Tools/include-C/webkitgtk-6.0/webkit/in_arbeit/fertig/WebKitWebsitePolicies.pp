
unit WebKitWebsitePolicies;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitWebsitePolicies.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitWebsitePolicies.h
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
PWebKitAutoplayPolicy  = ^WebKitAutoplayPolicy;
PWebKitWebsitePolicies  = ^WebKitWebsitePolicies;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Igalia S.L.
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
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <gio/gio.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_WEBSITE_POLICIES : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitWebsitePolicies, webkit_website_policies, WEBKIT, WEBSITE_POLICIES, GObject) }
{*
 * WebKitAutoplayPolicy:
 * @WEBKIT_AUTOPLAY_ALLOW: Do not restrict autoplay.
 * @WEBKIT_AUTOPLAY_ALLOW_WITHOUT_SOUND: Allow videos to autoplay if
 *     they have no audio track, or if their audio track is muted.
 * @WEBKIT_AUTOPLAY_DENY: Never allow autoplay.
 *
 * Enum values used to specify autoplay policies.
 *
 * Since: 2.30
  }
type
  PWebKitAutoplayPolicy = ^TWebKitAutoplayPolicy;
  TWebKitAutoplayPolicy =  Longint;
  Const
    WEBKIT_AUTOPLAY_ALLOW = 0;
    WEBKIT_AUTOPLAY_ALLOW_WITHOUT_SOUND = 1;
    WEBKIT_AUTOPLAY_DENY = 2;
;

function webkit_website_policies_new:PWebKitWebsitePolicies;cdecl;external;
(* Const before type ignored *)
function webkit_website_policies_new_with_policies(first_policy_name:Pgchar; args:array of const):PWebKitWebsitePolicies;cdecl;external;
function webkit_website_policies_new_with_policies(first_policy_name:Pgchar):PWebKitWebsitePolicies;cdecl;external;
function webkit_website_policies_get_autoplay_policy(policies:PWebKitWebsitePolicies):TWebKitAutoplayPolicy;cdecl;external;

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_WEBSITE_POLICIES : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_WEBSITE_POLICIES:=webkit_website_policies_get_type;
  end;


end.

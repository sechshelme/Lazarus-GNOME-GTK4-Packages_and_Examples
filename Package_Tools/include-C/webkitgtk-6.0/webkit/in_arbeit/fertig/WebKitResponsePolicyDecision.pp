
unit WebKitResponsePolicyDecision;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitResponsePolicyDecision.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitResponsePolicyDecision.h
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
PWebKitResponsePolicyDecision  = ^WebKitResponsePolicyDecision;
PWebKitURIRequest  = ^WebKitURIRequest;
PWebKitURIResponse  = ^WebKitURIResponse;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2012 Igalia S.L.
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
{$ifndef WebKitResponsePolicyDecision_h}
{$define WebKitResponsePolicyDecision_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitPolicyDecision.h>}
{$include <webkit/WebKitURIResponse.h>}
{$include <webkit/WebKitURIRequest.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_RESPONSE_POLICY_DECISION : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitResponsePolicyDecision, webkit_response_policy_decision, WEBKIT, RESPONSE_POLICY_DECISION, WebKitPolicyDecision) }
function webkit_response_policy_decision_get_request(decision:PWebKitResponsePolicyDecision):PWebKitURIRequest;cdecl;external;
function webkit_response_policy_decision_get_response(decision:PWebKitResponsePolicyDecision):PWebKitURIResponse;cdecl;external;
function webkit_response_policy_decision_is_mime_type_supported(decision:PWebKitResponsePolicyDecision):Tgboolean;cdecl;external;
function webkit_response_policy_decision_is_main_frame_main_resource(decision:PWebKitResponsePolicyDecision):Tgboolean;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_RESPONSE_POLICY_DECISION : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_RESPONSE_POLICY_DECISION:=webkit_response_policy_decision_get_type;
  end;


end.

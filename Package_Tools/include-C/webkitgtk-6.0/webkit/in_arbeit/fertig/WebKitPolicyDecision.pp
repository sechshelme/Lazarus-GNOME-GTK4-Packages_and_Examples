
unit WebKitPolicyDecision;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitPolicyDecision.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitPolicyDecision.h
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
PWebKitPolicyDecision  = ^WebKitPolicyDecision;
PWebKitPolicyDecisionClass  = ^WebKitPolicyDecisionClass;
PWebKitWebsitePolicies  = ^WebKitWebsitePolicies;
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
{$ifndef WebKitPolicyDecision_h}
{$define WebKitPolicyDecision_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitWebsitePolicies.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_POLICY_DECISION : longint; { return type might be wrong }

{WEBKIT_DECLARE_DERIVABLE_TYPE (WebKitPolicyDecision, webkit_policy_decision, WEBKIT, POLICY_DECISION, GObject) }
{< private > }
type
  PWebKitPolicyDecisionClass = ^TWebKitPolicyDecisionClass;
  TWebKitPolicyDecisionClass = record
      parent_class : TGObjectClass;
      _webkit_reserved0 : procedure ;cdecl;
      _webkit_reserved1 : procedure ;cdecl;
      _webkit_reserved2 : procedure ;cdecl;
      _webkit_reserved3 : procedure ;cdecl;
      _webkit_reserved4 : procedure ;cdecl;
      _webkit_reserved5 : procedure ;cdecl;
      _webkit_reserved6 : procedure ;cdecl;
      _webkit_reserved7 : procedure ;cdecl;
    end;


procedure webkit_policy_decision_use(decision:PWebKitPolicyDecision);cdecl;external;
procedure webkit_policy_decision_use_with_policies(decision:PWebKitPolicyDecision; policies:PWebKitWebsitePolicies);cdecl;external;
procedure webkit_policy_decision_ignore(decision:PWebKitPolicyDecision);cdecl;external;
procedure webkit_policy_decision_download(decision:PWebKitPolicyDecision);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_POLICY_DECISION : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_POLICY_DECISION:=webkit_policy_decision_get_type;
  end;


end.

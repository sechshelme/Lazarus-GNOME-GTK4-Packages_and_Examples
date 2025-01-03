
unit WebKitAutomationSession;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitAutomationSession.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitAutomationSession.h
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
Pchar  = ^char;
PWebKitApplicationInfo  = ^WebKitApplicationInfo;
PWebKitAutomationBrowsingContextPresentation  = ^WebKitAutomationBrowsingContextPresentation;
PWebKitAutomationSession  = ^WebKitAutomationSession;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2017 Igalia S.L.
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
{$ifndef WebKitAutomationSession_h}
{$define WebKitAutomationSession_h}
{$include <glib-object.h>}
{$include <webkit/WebKitApplicationInfo.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_AUTOMATION_SESSION : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitAutomationSession, webkit_automation_session, WEBKIT, AUTOMATION_SESSION, GObject) }
{*
 * WebKitAutomationBrowsingContextPresentation:
 * @WEBKIT_AUTOMATION_BROWSING_CONTEXT_PRESENTATION_WINDOW: a window
 * @WEBKIT_AUTOMATION_BROWSING_CONTEXT_PRESENTATION_TAB: a tab
 *
 * Enum values used for determining the automation browsing context presentation.
 *
 * Since: 2.28
  }
type
  PWebKitAutomationBrowsingContextPresentation = ^TWebKitAutomationBrowsingContextPresentation;
  TWebKitAutomationBrowsingContextPresentation =  Longint;
  Const
    WEBKIT_AUTOMATION_BROWSING_CONTEXT_PRESENTATION_WINDOW = 0;
    WEBKIT_AUTOMATION_BROWSING_CONTEXT_PRESENTATION_TAB = 1;
;
(* Const before type ignored *)

function webkit_automation_session_get_id(session:PWebKitAutomationSession):Pchar;cdecl;external;
procedure webkit_automation_session_set_application_info(session:PWebKitAutomationSession; info:PWebKitApplicationInfo);cdecl;external;
function webkit_automation_session_get_application_info(session:PWebKitAutomationSession):PWebKitApplicationInfo;cdecl;external;
{$endif}
{ WebKitAutomationSession_h  }

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_AUTOMATION_SESSION : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_AUTOMATION_SESSION:=webkit_automation_session_get_type;
  end;


end.

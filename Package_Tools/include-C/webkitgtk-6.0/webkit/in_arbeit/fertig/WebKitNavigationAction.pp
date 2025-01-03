
unit WebKitNavigationAction;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitNavigationAction.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitNavigationAction.h
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
PWebKitNavigationAction  = ^WebKitNavigationAction;
PWebKitNavigationType  = ^WebKitNavigationType;
PWebKitURIRequest  = ^WebKitURIRequest;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2014 Igalia S.L.
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
{$ifndef WebKitNavigationAction_h}
{$define WebKitNavigationAction_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitURIRequest.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_NAVIGATION_ACTION : longint; { return type might be wrong }

{*
 * WebKitNavigationType:
 * @WEBKIT_NAVIGATION_TYPE_LINK_CLICKED: The navigation was triggered by clicking a link.
 * @WEBKIT_NAVIGATION_TYPE_FORM_SUBMITTED: The navigation was triggered by submitting a form.
 * @WEBKIT_NAVIGATION_TYPE_BACK_FORWARD: The navigation was triggered by navigating forward or backward.
 * @WEBKIT_NAVIGATION_TYPE_RELOAD: The navigation was triggered by reloading.
 * @WEBKIT_NAVIGATION_TYPE_FORM_RESUBMITTED: The navigation was triggered by resubmitting a form.
 * @WEBKIT_NAVIGATION_TYPE_OTHER: The navigation was triggered by some other action.
 *
 * Enum values used to denote the various navigation types.
  }
type
  PWebKitNavigationType = ^TWebKitNavigationType;
  TWebKitNavigationType =  Longint;
  Const
    WEBKIT_NAVIGATION_TYPE_LINK_CLICKED = 0;
    WEBKIT_NAVIGATION_TYPE_FORM_SUBMITTED = 1;
    WEBKIT_NAVIGATION_TYPE_BACK_FORWARD = 2;
    WEBKIT_NAVIGATION_TYPE_RELOAD = 3;
    WEBKIT_NAVIGATION_TYPE_FORM_RESUBMITTED = 4;
    WEBKIT_NAVIGATION_TYPE_OTHER = 5;
;
type

function webkit_navigation_action_get_type:TGType;cdecl;external;
function webkit_navigation_action_copy(navigation:PWebKitNavigationAction):PWebKitNavigationAction;cdecl;external;
procedure webkit_navigation_action_free(navigation:PWebKitNavigationAction);cdecl;external;
function webkit_navigation_action_get_navigation_type(navigation:PWebKitNavigationAction):TWebKitNavigationType;cdecl;external;
function webkit_navigation_action_get_mouse_button(navigation:PWebKitNavigationAction):Tguint;cdecl;external;
function webkit_navigation_action_get_modifiers(navigation:PWebKitNavigationAction):Tguint;cdecl;external;
function webkit_navigation_action_get_request(navigation:PWebKitNavigationAction):PWebKitURIRequest;cdecl;external;
function webkit_navigation_action_is_user_gesture(navigation:PWebKitNavigationAction):Tgboolean;cdecl;external;
function webkit_navigation_action_is_redirect(navigation:PWebKitNavigationAction):Tgboolean;cdecl;external;
(* Const before type ignored *)
function webkit_navigation_action_get_frame_name(navigation:PWebKitNavigationAction):Pchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_NAVIGATION_ACTION : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_NAVIGATION_ACTION:=webkit_navigation_action_get_type;
  end;


end.

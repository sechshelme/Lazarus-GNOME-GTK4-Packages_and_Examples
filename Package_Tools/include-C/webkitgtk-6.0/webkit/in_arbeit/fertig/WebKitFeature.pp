
unit WebKitFeature;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitFeature.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitFeature.h
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
PWebKitFeature  = ^WebKitFeature;
PWebKitFeatureList  = ^WebKitFeatureList;
PWebKitFeatureStatus  = ^WebKitFeatureStatus;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2023 Igalia S.L.
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
{$ifndef WebKitFeature_h}
{$define WebKitFeature_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{*
 * WebKitFeatureStatus:
 * @WEBKIT_FEATURE_STATUS_EMBEDDER: Feature that adjust behaviour for
 *   specific application needs. The feature is not part of a Web platform
 *   feature, not a mature feature intended to be always on.
 * @WEBKIT_FEATURE_STATUS_UNSTABLE: Feature in development. The feature
 *   may be unfinished, and there are no guarantees about its safety and
 *   stability.
 * @WEBKIT_FEATURE_STATUS_INTERNAL: Feature for debugging the WebKit engine.
 *   The feature is not generally useful for user or web developers, and
 *   always disabled by default.
 * @WEBKIT_FEATURE_STATUS_DEVELOPER: Feature for web developers. The feature
 *   is not generally useful for end users, and always disabled by default.
 * @WEBKIT_FEATURE_STATUS_TESTABLE: Feature in active development and
 *   complete enough for testing. The feature may not be yet ready to
 *   ship and is disabled by default.
 * @WEBKIT_FEATURE_STATUS_PREVIEW: Feature ready to be tested by users.
 *   The feature is disabled by default, but may be enabled by applications
 *   automatically e.g. in their “technology preview” or “beta” versions.
 * @WEBKIT_FEATURE_STATUS_STABLE: Feature ready for general use. The
 *   feature is enabled by default, but it may still be toggled to support
 *   debugging and testing.
 * @WEBKIT_FEATURE_STATUS_MATURE: Feature in general use. The feature is
 *   always enabled and in general there should be no user-facing interface
 *   to toggle it.
 *
 * Describes the status of a [struct@WebKitFeature].
 *
 * The status for a given feature can be obtained with
 * [id@webkit_feature_get_status].
 *
 * Since: 2.42
  }
type
  PWebKitFeatureStatus = ^TWebKitFeatureStatus;
  TWebKitFeatureStatus =  Longint;
  Const
    WEBKIT_FEATURE_STATUS_EMBEDDER = 0;
    WEBKIT_FEATURE_STATUS_UNSTABLE = 1;
    WEBKIT_FEATURE_STATUS_INTERNAL = 2;
    WEBKIT_FEATURE_STATUS_DEVELOPER = 3;
    WEBKIT_FEATURE_STATUS_TESTABLE = 4;
    WEBKIT_FEATURE_STATUS_PREVIEW = 5;
    WEBKIT_FEATURE_STATUS_STABLE = 6;
    WEBKIT_FEATURE_STATUS_MATURE = 7;
;

{ was #define dname def_expr }
function WEBKIT_TYPE_FEATURE : longint; { return type might be wrong }

type

function webkit_feature_get_type:TGType;cdecl;external;
function webkit_feature_ref(feature:PWebKitFeature):PWebKitFeature;cdecl;external;
procedure webkit_feature_unref(feature:PWebKitFeature);cdecl;external;
(* Const before type ignored *)
function webkit_feature_get_identifier(feature:PWebKitFeature):Pchar;cdecl;external;
(* Const before type ignored *)
function webkit_feature_get_name(feature:PWebKitFeature):Pchar;cdecl;external;
(* Const before type ignored *)
function webkit_feature_get_details(feature:PWebKitFeature):Pchar;cdecl;external;
(* Const before type ignored *)
function webkit_feature_get_category(feature:PWebKitFeature):Pchar;cdecl;external;
function webkit_feature_get_status(feature:PWebKitFeature):TWebKitFeatureStatus;cdecl;external;
function webkit_feature_get_default_value(feature:PWebKitFeature):Tgboolean;cdecl;external;
{G_DEFINE_AUTOPTR_CLEANUP_FUNC(WebKitFeature, webkit_feature_unref) }
{ was #define dname def_expr }
function WEBKIT_TYPE_FEATURE_LIST : longint; { return type might be wrong }

type

function webkit_feature_list_get_type:TGType;cdecl;external;
function webkit_feature_list_ref(feature_list:PWebKitFeatureList):PWebKitFeatureList;cdecl;external;
procedure webkit_feature_list_unref(feature_list:PWebKitFeatureList);cdecl;external;
function webkit_feature_list_get_length(feature_list:PWebKitFeatureList):Tgsize;cdecl;external;
function webkit_feature_list_get(feature_list:PWebKitFeatureList; index:Tgsize):PWebKitFeature;cdecl;external;
{G_DEFINE_AUTOPTR_CLEANUP_FUNC(WebKitFeatureList, webkit_feature_list_unref) }
{$endif}
{ WebKitFeature_h  }

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_FEATURE : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_FEATURE:=webkit_feature_get_type;
  end;

{ was #define dname def_expr }
function WEBKIT_TYPE_FEATURE_LIST : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_FEATURE_LIST:=webkit_feature_list_get_type;
  end;


end.

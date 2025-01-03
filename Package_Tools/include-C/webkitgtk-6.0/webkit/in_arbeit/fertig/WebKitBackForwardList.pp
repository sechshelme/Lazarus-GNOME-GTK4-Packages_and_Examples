
unit WebKitBackForwardList;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitBackForwardList.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitBackForwardList.h
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
PGList  = ^GList;
PWebKitBackForwardList  = ^WebKitBackForwardList;
PWebKitBackForwardListItem  = ^WebKitBackForwardListItem;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2011 Igalia S.L.
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
{$ifndef WebKitBackForwardList_h}
{$define WebKitBackForwardList_h}
{$include <glib-object.h>}
{$include <webkit/WebKitBackForwardListItem.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_BACK_FORWARD_LIST : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitBackForwardList, webkit_back_forward_list, WEBKIT, BACK_FORWARD_LIST, GObject) }
function webkit_back_forward_list_get_current_item(back_forward_list:PWebKitBackForwardList):PWebKitBackForwardListItem;cdecl;external;
function webkit_back_forward_list_get_back_item(back_forward_list:PWebKitBackForwardList):PWebKitBackForwardListItem;cdecl;external;
function webkit_back_forward_list_get_forward_item(back_forward_list:PWebKitBackForwardList):PWebKitBackForwardListItem;cdecl;external;
function webkit_back_forward_list_get_nth_item(back_forward_list:PWebKitBackForwardList; index:Tgint):PWebKitBackForwardListItem;cdecl;external;
function webkit_back_forward_list_get_length(back_forward_list:PWebKitBackForwardList):Tguint;cdecl;external;
function webkit_back_forward_list_get_back_list(back_forward_list:PWebKitBackForwardList):PGList;cdecl;external;
function webkit_back_forward_list_get_back_list_with_limit(back_forward_list:PWebKitBackForwardList; limit:Tguint):PGList;cdecl;external;
function webkit_back_forward_list_get_forward_list(back_forward_list:PWebKitBackForwardList):PGList;cdecl;external;
function webkit_back_forward_list_get_forward_list_with_limit(back_forward_list:PWebKitBackForwardList; limit:Tguint):PGList;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_BACK_FORWARD_LIST : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_BACK_FORWARD_LIST:=webkit_back_forward_list_get_type;
  end;


end.

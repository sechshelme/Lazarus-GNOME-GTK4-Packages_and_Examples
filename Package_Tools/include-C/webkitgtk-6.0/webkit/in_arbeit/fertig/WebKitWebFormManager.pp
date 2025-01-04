
unit WebKitWebFormManager;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitWebFormManager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitWebFormManager.h
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
PJSCValue  = ^JSCValue;
PWebKitWebFormManager  = ^WebKitWebFormManager;
PWebKitWebFormManagerClass  = ^WebKitWebFormManagerClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2022 Igalia S.L.
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
{$if !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit-web-process-extension.h> can be included directly."}
{$endif}
{$ifndef WebKitWebFormManager_h}
{$define WebKitWebFormManager_h}
{$include <glib-object.h>}
{$include <jsc/jsc.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_FORM_MANAGER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WEBKIT_WEB_FORM_MANAGER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WEBKIT_WEB_FORM_MANAGER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WEBKIT_IS_WEB_FORM_MANAGER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WEBKIT_IS_WEB_FORM_MANAGER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WEBKIT_WEB_FORM_MANAGER_GET_CLASS(obj : longint) : longint;

type
  PWebKitWebFormManager = ^TWebKitWebFormManager;
  TWebKitWebFormManager = record
      parent : TGObject;
    end;

  PWebKitWebFormManagerClass = ^TWebKitWebFormManagerClass;
  TWebKitWebFormManagerClass = record
      parent_class : TGObjectClass;
    end;


function webkit_web_form_manager_get_type:TGType;cdecl;external;
function webkit_web_form_manager_input_element_is_user_edited(element:PJSCValue):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure webkit_web_form_manager_input_element_auto_fill(element:PJSCValue; value:Pchar);cdecl;external;
function webkit_web_form_manager_input_element_is_auto_filled(element:PJSCValue):Tgboolean;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_FORM_MANAGER : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_WEB_FORM_MANAGER:=webkit_web_form_manager_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WEBKIT_WEB_FORM_MANAGER(obj : longint) : longint;
begin
  WEBKIT_WEB_FORM_MANAGER:=G_TYPE_CHECK_INSTANCE_CAST(obj,WEBKIT_TYPE_WEB_FORM_MANAGER,WebKitWebFormManager);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WEBKIT_WEB_FORM_MANAGER_CLASS(klass : longint) : longint;
begin
  WEBKIT_WEB_FORM_MANAGER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,WEBKIT_TYPE_WEB_FORM_MANAGER,WebKitWebFormManagerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WEBKIT_IS_WEB_FORM_MANAGER(obj : longint) : longint;
begin
  WEBKIT_IS_WEB_FORM_MANAGER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,WEBKIT_TYPE_WEB_FORM_MANAGER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WEBKIT_IS_WEB_FORM_MANAGER_CLASS(klass : longint) : longint;
begin
  WEBKIT_IS_WEB_FORM_MANAGER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,WEBKIT_TYPE_WEB_FORM_MANAGER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WEBKIT_WEB_FORM_MANAGER_GET_CLASS(obj : longint) : longint;
begin
  WEBKIT_WEB_FORM_MANAGER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,WEBKIT_TYPE_WEB_FORM_MANAGER,WebKitWebFormManagerClass);
end;


end.

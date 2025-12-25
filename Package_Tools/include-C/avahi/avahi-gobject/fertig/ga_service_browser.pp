
unit ga_service_browser;
interface

{
  Automatically converted by H2Pas 1.0.0 from ga_service_browser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ga_service_browser.h
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
PGaClient  = ^GaClient;
PGaServiceBrowser  = ^GaServiceBrowser;
PGaServiceBrowserClass  = ^GaServiceBrowserClass;
Pgchar  = ^gchar;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * ga-service-browser.h - Header for GaServiceBrowser
 * Copyright (C) 2006-2007 Collabora Ltd.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$ifndef __GA_SERVICE_BROWSER_H__}
{$define __GA_SERVICE_BROWSER_H__}
{$include <glib-object.h>}
{$include <avahi-client/lookup.h>}
{$include <avahi-common/defs.h>}
{$include "ga-client.h"}
{$include "ga-enums.h"}
type
  PGaServiceBrowserClass = ^TGaServiceBrowserClass;
  TGaServiceBrowserClass = record
      parent_class : TGObjectClass;
    end;

  PGaServiceBrowser = ^TGaServiceBrowser;
  TGaServiceBrowser = record
      parent : TGObject;
    end;


function ga_service_browser_get_type:TGType;cdecl;external;
{ TYPE MACROS  }
{ was #define dname def_expr }
function GA_TYPE_SERVICE_BROWSER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_SERVICE_BROWSER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_SERVICE_BROWSER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GA_SERVICE_BROWSER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GA_SERVICE_BROWSER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_SERVICE_BROWSER_GET_CLASS(obj : longint) : longint;

(* Const before type ignored *)
function ga_service_browser_new(_type:Pgchar):PGaServiceBrowser;cdecl;external;
(* Const before type ignored *)
function ga_service_browser_new_full(interface:TAvahiIfIndex; protocol:TAvahiProtocol; _type:Pgchar; domain:Pgchar; flags:TGaLookupFlags):PGaServiceBrowser;cdecl;external;
function ga_service_browser_attach(browser:PGaServiceBrowser; client:PGaClient; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ #ifndef __GA_SERVICE_BROWSER_H__  }

implementation

{ was #define dname def_expr }
function GA_TYPE_SERVICE_BROWSER : longint; { return type might be wrong }
  begin
    GA_TYPE_SERVICE_BROWSER:=ga_service_browser_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_SERVICE_BROWSER(obj : longint) : longint;
begin
  GA_SERVICE_BROWSER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GA_TYPE_SERVICE_BROWSER,GaServiceBrowser);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_SERVICE_BROWSER_CLASS(klass : longint) : longint;
begin
  GA_SERVICE_BROWSER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GA_TYPE_SERVICE_BROWSER,GaServiceBrowserClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GA_SERVICE_BROWSER(obj : longint) : longint;
begin
  IS_GA_SERVICE_BROWSER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GA_TYPE_SERVICE_BROWSER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GA_SERVICE_BROWSER_CLASS(klass : longint) : longint;
begin
  IS_GA_SERVICE_BROWSER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GA_TYPE_SERVICE_BROWSER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_SERVICE_BROWSER_GET_CLASS(obj : longint) : longint;
begin
  GA_SERVICE_BROWSER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GA_TYPE_SERVICE_BROWSER,GaServiceBrowserClass);
end;


end.

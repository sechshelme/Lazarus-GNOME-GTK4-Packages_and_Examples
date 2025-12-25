unit ga_service_browser;

interface

uses
  fp_avahi_common;

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


function ga_service_browser_get_type:TGType;cdecl;external libavahi_gobject;
{ TYPE MACROS  }
function ga_service_browser_new(_type:Pgchar):PGaServiceBrowser;cdecl;external libavahi_gobject;
function ga_service_browser_new_full(interface:TAvahiIfIndex; protocol:TAvahiProtocol; _type:Pgchar; domain:Pgchar; flags:TGaLookupFlags):PGaServiceBrowser;cdecl;external libavahi_gobject;
function ga_service_browser_attach(browser:PGaServiceBrowser; client:PGaClient; error:PPGError):Tgboolean;cdecl;external libavahi_gobject;
{$endif}
{ #ifndef __GA_SERVICE_BROWSER_H__  }

// === Konventiert am: 25-12-25 15:57:09 ===

function GA_TYPE_SERVICE_BROWSER : TGType;
function GA_SERVICE_BROWSER(obj : Pointer) : PGaServiceBrowser;
function GA_SERVICE_BROWSER_CLASS(klass : Pointer) : PGaServiceBrowserClass;
function IS_GA_SERVICE_BROWSER(obj : Pointer) : Tgboolean;
function IS_GA_SERVICE_BROWSER_CLASS(klass : Pointer) : Tgboolean;
function GA_SERVICE_BROWSER_GET_CLASS(obj : Pointer) : PGaServiceBrowserClass;

implementation

function GA_TYPE_SERVICE_BROWSER : TGType;
  begin
    GA_TYPE_SERVICE_BROWSER:=ga_service_browser_get_type;
  end;

function GA_SERVICE_BROWSER(obj : Pointer) : PGaServiceBrowser;
begin
  Result := PGaServiceBrowser(g_type_check_instance_cast(obj, GA_TYPE_SERVICE_BROWSER));
end;

function GA_SERVICE_BROWSER_CLASS(klass : Pointer) : PGaServiceBrowserClass;
begin
  Result := PGaServiceBrowserClass(g_type_check_class_cast(klass, GA_TYPE_SERVICE_BROWSER));
end;

function IS_GA_SERVICE_BROWSER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GA_TYPE_SERVICE_BROWSER);
end;

function IS_GA_SERVICE_BROWSER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GA_TYPE_SERVICE_BROWSER);
end;

function GA_SERVICE_BROWSER_GET_CLASS(obj : Pointer) : PGaServiceBrowserClass;
begin
  Result := PGaServiceBrowserClass(PGTypeInstance(obj)^.g_class);
end;



end.

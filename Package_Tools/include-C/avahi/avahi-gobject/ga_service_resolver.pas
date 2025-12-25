unit ga_service_resolver;

interface

uses
  fp_avahi_common;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * ga-service-resolver.h - Header for GaServiceResolver
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
{$ifndef __GA_SERVICE_RESOLVER_H__}
{$define __GA_SERVICE_RESOLVER_H__}
{$include <avahi-common/address.h>}
{$include <glib-object.h>}
{$include "ga-client.h"}
{$include "ga-enums.h"}
type
  PGaServiceResolverClass = ^TGaServiceResolverClass;
  TGaServiceResolverClass = record
      parent_class : TGObjectClass;
    end;

  PGaServiceResolver = ^TGaServiceResolver;
  TGaServiceResolver = record
      parent : TGObject;
    end;


function ga_service_resolver_get_type:TGType;cdecl;external libavahi_gobject;
{ TYPE MACROS  }
function ga_service_resolver_new(interface:TAvahiIfIndex; protocol:TAvahiProtocol; name:Pgchar; _type:Pgchar; domain:Pgchar; 
           address_protocol:TAvahiProtocol; flags:TGaLookupFlags):PGaServiceResolver;cdecl;external libavahi_gobject;
function ga_service_resolver_attach(resolver:PGaServiceResolver; client:PGaClient; error:PPGError):Tgboolean;cdecl;external libavahi_gobject;
function ga_service_resolver_get_address(resolver:PGaServiceResolver; address:PAvahiAddress; port:Puint16_t):Tgboolean;cdecl;external libavahi_gobject;
{$endif}
{ #ifndef __GA_SERVICE_RESOLVER_H__  }

// === Konventiert am: 25-12-25 15:58:43 ===

function GA_TYPE_SERVICE_RESOLVER : TGType;
function GA_SERVICE_RESOLVER(obj : Pointer) : PGaServiceResolver;
function GA_SERVICE_RESOLVER_CLASS(klass : Pointer) : PGaServiceResolverClass;
function IS_GA_SERVICE_RESOLVER(obj : Pointer) : Tgboolean;
function IS_GA_SERVICE_RESOLVER_CLASS(klass : Pointer) : Tgboolean;
function GA_SERVICE_RESOLVER_GET_CLASS(obj : Pointer) : PGaServiceResolverClass;

implementation

function GA_TYPE_SERVICE_RESOLVER : TGType;
  begin
    GA_TYPE_SERVICE_RESOLVER:=ga_service_resolver_get_type;
  end;

function GA_SERVICE_RESOLVER(obj : Pointer) : PGaServiceResolver;
begin
  Result := PGaServiceResolver(g_type_check_instance_cast(obj, GA_TYPE_SERVICE_RESOLVER));
end;

function GA_SERVICE_RESOLVER_CLASS(klass : Pointer) : PGaServiceResolverClass;
begin
  Result := PGaServiceResolverClass(g_type_check_class_cast(klass, GA_TYPE_SERVICE_RESOLVER));
end;

function IS_GA_SERVICE_RESOLVER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GA_TYPE_SERVICE_RESOLVER);
end;

function IS_GA_SERVICE_RESOLVER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GA_TYPE_SERVICE_RESOLVER);
end;

function GA_SERVICE_RESOLVER_GET_CLASS(obj : Pointer) : PGaServiceResolverClass;
begin
  Result := PGaServiceResolverClass(PGTypeInstance(obj)^.g_class);
end;



end.

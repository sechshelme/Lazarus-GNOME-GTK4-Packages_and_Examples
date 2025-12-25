
unit ga_service_resolver;
interface

{
  Automatically converted by H2Pas 1.0.0 from ga_service_resolver.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ga_service_resolver.h
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
PAvahiAddress  = ^AvahiAddress;
PGaClient  = ^GaClient;
PGaServiceResolver  = ^GaServiceResolver;
PGaServiceResolverClass  = ^GaServiceResolverClass;
Pgchar  = ^gchar;
PGError  = ^GError;
Puint16_t  = ^uint16_t;
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


function ga_service_resolver_get_type:TGType;cdecl;external;
{ TYPE MACROS  }
{ was #define dname def_expr }
function GA_TYPE_SERVICE_RESOLVER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_SERVICE_RESOLVER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_SERVICE_RESOLVER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GA_SERVICE_RESOLVER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GA_SERVICE_RESOLVER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_SERVICE_RESOLVER_GET_CLASS(obj : longint) : longint;

(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ga_service_resolver_new(interface:TAvahiIfIndex; protocol:TAvahiProtocol; name:Pgchar; _type:Pgchar; domain:Pgchar; 
           address_protocol:TAvahiProtocol; flags:TGaLookupFlags):PGaServiceResolver;cdecl;external;
function ga_service_resolver_attach(resolver:PGaServiceResolver; client:PGaClient; error:PPGError):Tgboolean;cdecl;external;
function ga_service_resolver_get_address(resolver:PGaServiceResolver; address:PAvahiAddress; port:Puint16_t):Tgboolean;cdecl;external;
{$endif}
{ #ifndef __GA_SERVICE_RESOLVER_H__  }

implementation

{ was #define dname def_expr }
function GA_TYPE_SERVICE_RESOLVER : longint; { return type might be wrong }
  begin
    GA_TYPE_SERVICE_RESOLVER:=ga_service_resolver_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_SERVICE_RESOLVER(obj : longint) : longint;
begin
  GA_SERVICE_RESOLVER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GA_TYPE_SERVICE_RESOLVER,GaServiceResolver);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_SERVICE_RESOLVER_CLASS(klass : longint) : longint;
begin
  GA_SERVICE_RESOLVER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GA_TYPE_SERVICE_RESOLVER,GaServiceResolverClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GA_SERVICE_RESOLVER(obj : longint) : longint;
begin
  IS_GA_SERVICE_RESOLVER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GA_TYPE_SERVICE_RESOLVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GA_SERVICE_RESOLVER_CLASS(klass : longint) : longint;
begin
  IS_GA_SERVICE_RESOLVER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GA_TYPE_SERVICE_RESOLVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_SERVICE_RESOLVER_GET_CLASS(obj : longint) : longint;
begin
  GA_SERVICE_RESOLVER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GA_TYPE_SERVICE_RESOLVER,GaServiceResolverClass);
end;


end.

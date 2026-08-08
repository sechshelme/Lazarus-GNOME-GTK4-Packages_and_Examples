
unit nma_mobile_providers;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_mobile_providers.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_mobile_providers.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
PGSList  = ^GSList;
Pguint32  = ^guint32;
PNMACountryInfo  = ^NMACountryInfo;
PNMAMobileAccessMethod  = ^NMAMobileAccessMethod;
PNMAMobileFamily  = ^NMAMobileFamily;
PNMAMobileProvider  = ^NMAMobileProvider;
PNMAMobileProvidersDatabase  = ^NMAMobileProvidersDatabase;
PNMAMobileProvidersDatabaseClass  = ^NMAMobileProvidersDatabaseClass;
PNMAMobileProvidersDatabasePrivate  = ^NMAMobileProvidersDatabasePrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1+ }
{
 * Copyright (C) 2009 Novell, Inc.
 * Author: Tambet Ingo (tambet@gmail.com).
 *
 * Copyright (C) 2009 - 2012 Red Hat, Inc.
 * Copyright (C) 2012 Lanedo GmbH.
  }
{$ifndef __NMA_MOBILE_PROVIDERS_H__}
{$define __NMA_MOBILE_PROVIDERS_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include "nma-version.h"}
{**************************************************************************** }
{ Access method type  }
{*
 * NMAMobileFamily:
 * @NMA_MOBILE_FAMILY_UNKNOWN: Unknown or invalid network access method
 * @NMA_MOBILE_FAMILY_3GPP: 3rd Generation Partnership Project (3GPP) network
 * @NMA_MOBILE_FAMILY_CDMA: A CDMA network
  }
type
  PNMAMobileFamily = ^TNMAMobileFamily;
  TNMAMobileFamily =  Longint;
  Const
    NMA_MOBILE_FAMILY_UNKNOWN = 0;
    NMA_MOBILE_FAMILY_3GPP = 1;
    NMA_MOBILE_FAMILY_CDMA = 2;
;

{ was #define dname def_expr }
function NMA_TYPE_MOBILE_ACCESS_METHOD : longint; { return type might be wrong }

type

function nma_mobile_access_method_get_type:TGType;cdecl;external;
function nma_mobile_access_method_ref(method:PNMAMobileAccessMethod):PNMAMobileAccessMethod;cdecl;external;
procedure nma_mobile_access_method_unref(method:PNMAMobileAccessMethod);cdecl;external;
(* Const before type ignored *)
function nma_mobile_access_method_get_name(method:PNMAMobileAccessMethod):Pgchar;cdecl;external;
(* Const before type ignored *)
function nma_mobile_access_method_get_username(method:PNMAMobileAccessMethod):Pgchar;cdecl;external;
(* Const before type ignored *)
function nma_mobile_access_method_get_password(method:PNMAMobileAccessMethod):Pgchar;cdecl;external;
(* Const before type ignored *)
function nma_mobile_access_method_get_gateway(method:PNMAMobileAccessMethod):Pgchar;cdecl;external;
(* Const before type ignored *)
function nma_mobile_access_method_get_dns(method:PNMAMobileAccessMethod):^Pgchar;cdecl;external;
(* Const before type ignored *)
function nma_mobile_access_method_get_3gpp_apn(method:PNMAMobileAccessMethod):Pgchar;cdecl;external;
function nma_mobile_access_method_get_family(method:PNMAMobileAccessMethod):TNMAMobileFamily;cdecl;external;
{**************************************************************************** }
{ Mobile provider type  }
{ was #define dname def_expr }
function NMA_TYPE_MOBILE_PROVIDER : longint; { return type might be wrong }

type

function nma_mobile_provider_get_type:TGType;cdecl;external;
function nma_mobile_provider_ref(provider:PNMAMobileProvider):PNMAMobileProvider;cdecl;external;
procedure nma_mobile_provider_unref(provider:PNMAMobileProvider);cdecl;external;
(* Const before type ignored *)
function nma_mobile_provider_get_name(provider:PNMAMobileProvider):Pgchar;cdecl;external;
function nma_mobile_provider_get_methods(provider:PNMAMobileProvider):PGSList;cdecl;external;
(* Const before type ignored *)
function nma_mobile_provider_get_3gpp_mcc_mnc(provider:PNMAMobileProvider):^Pgchar;cdecl;external;
(* Const before type ignored *)
function nma_mobile_provider_get_cdma_sid(provider:PNMAMobileProvider):Pguint32;cdecl;external;
{**************************************************************************** }
{ Country Info type  }
{ was #define dname def_expr }
function NMA_TYPE_COUNTRY_INFO : longint; { return type might be wrong }

type

function nma_country_info_get_type:TGType;cdecl;external;
function nma_country_info_ref(country_info:PNMACountryInfo):PNMACountryInfo;cdecl;external;
procedure nma_country_info_unref(country_info:PNMACountryInfo);cdecl;external;
(* Const before type ignored *)
function nma_country_info_get_country_code(country_info:PNMACountryInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function nma_country_info_get_country_name(country_info:PNMACountryInfo):Pgchar;cdecl;external;
function nma_country_info_get_providers(country_info:PNMACountryInfo):PGSList;cdecl;external;
{**************************************************************************** }
{ Mobile providers database type  }
{ was #define dname def_expr }
function NMA_TYPE_MOBILE_PROVIDERS_DATABASE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_MOBILE_PROVIDERS_DATABASE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_MOBILE_PROVIDERS_DATABASE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_MOBILE_PROVIDERS_DATABASE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_MOBILE_PROVIDERS_DATABASE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_MOBILE_PROVIDERS_DATABASE_GET_CLASS(obj : longint) : longint;

type
  PNMAMobileProvidersDatabase = ^TNMAMobileProvidersDatabase;
  TNMAMobileProvidersDatabase = record
      parent : TGObject;
      priv : PNMAMobileProvidersDatabasePrivate;
    end;

  PNMAMobileProvidersDatabaseClass = ^TNMAMobileProvidersDatabaseClass;
  TNMAMobileProvidersDatabaseClass = record
      parent : TGObjectClass;
    end;


function nma_mobile_providers_database_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure nma_mobile_providers_database_new(country_codes:Pgchar; service_providers:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nma_mobile_providers_database_new_finish(res:PGAsyncResult; error:PPGError):PNMAMobileProvidersDatabase;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nma_mobile_providers_database_new_sync(country_codes:Pgchar; service_providers:Pgchar; cancellable:PGCancellable; error:PPGError):PNMAMobileProvidersDatabase;cdecl;external;
function nma_mobile_providers_database_get_countries(self:PNMAMobileProvidersDatabase):PGHashTable;cdecl;external;
procedure nma_mobile_providers_database_dump(self:PNMAMobileProvidersDatabase);cdecl;external;
(* Const before type ignored *)
function nma_mobile_providers_database_lookup_country(self:PNMAMobileProvidersDatabase; country_code:Pgchar):PNMACountryInfo;cdecl;external;
(* Const before type ignored *)
function nma_mobile_providers_database_lookup_3gpp_mcc_mnc(self:PNMAMobileProvidersDatabase; mccmnc:Pgchar):PNMAMobileProvider;cdecl;external;
function nma_mobile_providers_database_lookup_cdma_sid(self:PNMAMobileProvidersDatabase; sid:Tguint32):PNMAMobileProvider;cdecl;external;
{**************************************************************************** }
{ Utils  }
(* Const before type ignored *)
function nma_mobile_providers_split_3gpp_mcc_mnc(mccmnc:Pgchar; mcc:PPgchar; mnc:PPgchar):Tgboolean;cdecl;external;
{$endif}
{ __NMA_MOBILE_PROVIDERS_H__  }

implementation

{ was #define dname def_expr }
function NMA_TYPE_MOBILE_PROVIDERS_DATABASE : longint; { return type might be wrong }
  begin
    NMA_TYPE_MOBILE_PROVIDERS_DATABASE:=nma_mobile_providers_database_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_MOBILE_PROVIDERS_DATABASE(obj : longint) : longint;
begin
  NMA_MOBILE_PROVIDERS_DATABASE:=G_TYPE_CHECK_INSTANCE_CAST(obj,NMA_TYPE_MOBILE_PROVIDERS_DATABASE,NMAMobileProvidersDatabase);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_MOBILE_PROVIDERS_DATABASE_CLASS(klass : longint) : longint;
begin
  NMA_MOBILE_PROVIDERS_DATABASE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NMA_TYPE_MOBILE_PROVIDERS_DATABASE,NMAMobileProvidersDatabaseClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_MOBILE_PROVIDERS_DATABASE(obj : longint) : longint;
begin
  NMA_IS_MOBILE_PROVIDERS_DATABASE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NMA_TYPE_MOBILE_PROVIDERS_DATABASE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_MOBILE_PROVIDERS_DATABASE_CLASS(klass : longint) : longint;
begin
  NMA_IS_MOBILE_PROVIDERS_DATABASE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NMA_TYPE_MOBILE_PROVIDERS_DATABASE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_MOBILE_PROVIDERS_DATABASE_GET_CLASS(obj : longint) : longint;
begin
  NMA_MOBILE_PROVIDERS_DATABASE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NMA_TYPE_MOBILE_PROVIDERS_DATABASE,NMAMobileProvidersDatabaseClass);
end;


{ was #define dname def_expr }
function NMA_TYPE_MOBILE_ACCESS_METHOD : longint; { return type might be wrong }
  begin
    NMA_TYPE_MOBILE_ACCESS_METHOD:=nma_mobile_access_method_get_type;
  end;

{ was #define dname def_expr }
function NMA_TYPE_MOBILE_PROVIDER : longint; { return type might be wrong }
  begin
    NMA_TYPE_MOBILE_PROVIDER:=nma_mobile_provider_get_type;
  end;

{ was #define dname def_expr }
function NMA_TYPE_COUNTRY_INFO : longint; { return type might be wrong }
  begin
    NMA_TYPE_COUNTRY_INFO:=nma_country_info_get_type;
  end;




end.

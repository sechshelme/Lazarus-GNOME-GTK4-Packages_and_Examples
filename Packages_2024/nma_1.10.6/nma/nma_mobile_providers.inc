{$IFDEF read_interface}

type
  PNMAMobileFamily = ^TNMAMobileFamily;
  TNMAMobileFamily = longint;

const
  NMA_MOBILE_FAMILY_UNKNOWN = 0;
  NMA_MOBILE_FAMILY_3GPP = 1;
  NMA_MOBILE_FAMILY_CDMA = 2;

type
  PNMAMobileAccessMethod = type Pointer;

function nma_mobile_access_method_get_type: TGType; cdecl; external libnma;
function nma_mobile_access_method_ref(method: PNMAMobileAccessMethod): PNMAMobileAccessMethod; cdecl; external libnma;
procedure nma_mobile_access_method_unref(method: PNMAMobileAccessMethod); cdecl; external libnma;
function nma_mobile_access_method_get_name(method: PNMAMobileAccessMethod): Pgchar; cdecl; external libnma;
function nma_mobile_access_method_get_username(method: PNMAMobileAccessMethod): Pgchar; cdecl; external libnma;
function nma_mobile_access_method_get_password(method: PNMAMobileAccessMethod): Pgchar; cdecl; external libnma;
function nma_mobile_access_method_get_gateway(method: PNMAMobileAccessMethod): Pgchar; cdecl; external libnma;
function nma_mobile_access_method_get_dns(method: PNMAMobileAccessMethod): PPgchar; cdecl; external libnma;
function nma_mobile_access_method_get_3gpp_apn(method: PNMAMobileAccessMethod): Pgchar; cdecl; external libnma;
function nma_mobile_access_method_get_family(method: PNMAMobileAccessMethod): TNMAMobileFamily; cdecl; external libnma;

type
  PNMAMobileProvider = type Pointer;

function nma_mobile_provider_get_type: TGType; cdecl; external libnma;
function nma_mobile_provider_ref(provider: PNMAMobileProvider): PNMAMobileProvider; cdecl; external libnma;
procedure nma_mobile_provider_unref(provider: PNMAMobileProvider); cdecl; external libnma;
function nma_mobile_provider_get_name(provider: PNMAMobileProvider): Pgchar; cdecl; external libnma;
function nma_mobile_provider_get_methods(provider: PNMAMobileProvider): PGSList; cdecl; external libnma;
function nma_mobile_provider_get_3gpp_mcc_mnc(provider: PNMAMobileProvider): PPgchar; cdecl; external libnma;
function nma_mobile_provider_get_cdma_sid(provider: PNMAMobileProvider): Pguint32; cdecl; external libnma;

type
  PNMACountryInfo = type Pointer;

function nma_country_info_get_type: TGType; cdecl; external libnma;
function nma_country_info_ref(country_info: PNMACountryInfo): PNMACountryInfo; cdecl; external libnma;
procedure nma_country_info_unref(country_info: PNMACountryInfo); cdecl; external libnma;
function nma_country_info_get_country_code(country_info: PNMACountryInfo): Pgchar; cdecl; external libnma;
function nma_country_info_get_country_name(country_info: PNMACountryInfo): Pgchar; cdecl; external libnma;
function nma_country_info_get_providers(country_info: PNMACountryInfo): PGSList; cdecl; external libnma;

type
  PNMAMobileProvidersDatabase = ^TNMAMobileProvidersDatabase;

  PNMAMobileProvidersDatabasePrivate = type Pointer;

  TNMAMobileProvidersDatabase = record
    parent: TGObject;
    priv: PNMAMobileProvidersDatabasePrivate;
  end;

  PNMAMobileProvidersDatabaseClass = ^TNMAMobileProvidersDatabaseClass;

  TNMAMobileProvidersDatabaseClass = record
    parent: TGObjectClass;
  end;

function nma_mobile_providers_database_get_type: TGType; cdecl; external libnma;
procedure nma_mobile_providers_database_new(country_codes: Pgchar; service_providers: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnma;
function nma_mobile_providers_database_new_finish(res: PGAsyncResult; error: PPGError): PNMAMobileProvidersDatabase; cdecl; external libnma;
function nma_mobile_providers_database_new_sync(country_codes: Pgchar; service_providers: Pgchar; cancellable: PGCancellable; error: PPGError): PNMAMobileProvidersDatabase; cdecl; external libnma;
function nma_mobile_providers_database_get_countries(self: PNMAMobileProvidersDatabase): PGHashTable; cdecl; external libnma;
procedure nma_mobile_providers_database_dump(self: PNMAMobileProvidersDatabase); cdecl; external libnma;
function nma_mobile_providers_database_lookup_country(self: PNMAMobileProvidersDatabase; country_code: Pgchar): PNMACountryInfo; cdecl; external libnma;
function nma_mobile_providers_database_lookup_3gpp_mcc_mnc(self: PNMAMobileProvidersDatabase; mccmnc: Pgchar): PNMAMobileProvider; cdecl; external libnma;
function nma_mobile_providers_database_lookup_cdma_sid(self: PNMAMobileProvidersDatabase; sid: Tguint32): PNMAMobileProvider; cdecl; external libnma;

function nma_mobile_providers_split_3gpp_mcc_mnc(mccmnc: Pgchar; mcc: PPgchar; mnc: PPgchar): Tgboolean; cdecl; external libnma;

// === Konventiert am: 8-8-26 13:26:52 ===

function NMA_TYPE_MOBILE_PROVIDERS_DATABASE: TGType;
function NMA_MOBILE_PROVIDERS_DATABASE(obj: Pointer): PNMAMobileProvidersDatabase;
function NMA_MOBILE_PROVIDERS_DATABASE_CLASS(klass: Pointer): PNMAMobileProvidersDatabaseClass;
function NMA_IS_MOBILE_PROVIDERS_DATABASE(obj: Pointer): Tgboolean;
function NMA_IS_MOBILE_PROVIDERS_DATABASE_CLASS(klass: Pointer): Tgboolean;
function NMA_MOBILE_PROVIDERS_DATABASE_GET_CLASS(obj: Pointer): PNMAMobileProvidersDatabaseClass;

function NMA_TYPE_MOBILE_ACCESS_METHOD: TGType;
function NMA_TYPE_MOBILE_PROVIDER: TGType;
function NMA_TYPE_COUNTRY_INFO: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function NMA_TYPE_MOBILE_PROVIDERS_DATABASE: TGType;
begin
  NMA_TYPE_MOBILE_PROVIDERS_DATABASE := nma_mobile_providers_database_get_type;
end;

function NMA_MOBILE_PROVIDERS_DATABASE(obj: Pointer): PNMAMobileProvidersDatabase;
begin
  Result := PNMAMobileProvidersDatabase(g_type_check_instance_cast(obj, NMA_TYPE_MOBILE_PROVIDERS_DATABASE));
end;

function NMA_MOBILE_PROVIDERS_DATABASE_CLASS(klass: Pointer): PNMAMobileProvidersDatabaseClass;
begin
  Result := PNMAMobileProvidersDatabaseClass(g_type_check_class_cast(klass, NMA_TYPE_MOBILE_PROVIDERS_DATABASE));
end;

function NMA_IS_MOBILE_PROVIDERS_DATABASE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NMA_TYPE_MOBILE_PROVIDERS_DATABASE);
end;

function NMA_IS_MOBILE_PROVIDERS_DATABASE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NMA_TYPE_MOBILE_PROVIDERS_DATABASE);
end;

function NMA_MOBILE_PROVIDERS_DATABASE_GET_CLASS(obj: Pointer): PNMAMobileProvidersDatabaseClass;
begin
  Result := PNMAMobileProvidersDatabaseClass(PGTypeInstance(obj)^.g_class);
end;


function NMA_TYPE_MOBILE_ACCESS_METHOD: TGType;
begin
  NMA_TYPE_MOBILE_ACCESS_METHOD := nma_mobile_access_method_get_type;
end;

function NMA_TYPE_MOBILE_PROVIDER: TGType;
begin
  NMA_TYPE_MOBILE_PROVIDER := nma_mobile_provider_get_type;
end;

function NMA_TYPE_COUNTRY_INFO: TGType;
begin
  NMA_TYPE_COUNTRY_INFO := nma_country_info_get_type;
end;

{$ENDIF read_implementation}

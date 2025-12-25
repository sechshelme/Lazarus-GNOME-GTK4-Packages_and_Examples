{$IFDEF read_interface}


type
  TGaServiceResolverClass = record
    parent_class: TGObjectClass;
  end;
  PGaServiceResolverClass = ^TGaServiceResolverClass;

  TGaServiceResolver = record
    parent: TGObject;
  end;
  PGaServiceResolver = ^TGaServiceResolver;


function ga_service_resolver_get_type: TGType; cdecl; external libavahi_gobject;
function ga_service_resolver_new(iface: TAvahiIfIndex; protocol: TAvahiProtocol; name: Pgchar; _type: Pgchar; domain: Pgchar;
  address_protocol: TAvahiProtocol; flags: TGaLookupFlags): PGaServiceResolver; cdecl; external libavahi_gobject;
function ga_service_resolver_attach(resolver: PGaServiceResolver; client: PGaClient; error: PPGError): Tgboolean; cdecl; external libavahi_gobject;
function ga_service_resolver_get_address(resolver: PGaServiceResolver; address: PAvahiAddress; port: Puint16_t): Tgboolean; cdecl; external libavahi_gobject;

// === Konventiert am: 25-12-25 15:58:43 ===

function GA_TYPE_SERVICE_RESOLVER: TGType;
function GA_SERVICE_RESOLVER(obj: Pointer): PGaServiceResolver;
function GA_SERVICE_RESOLVER_CLASS(klass: Pointer): PGaServiceResolverClass;
function IS_GA_SERVICE_RESOLVER(obj: Pointer): Tgboolean;
function IS_GA_SERVICE_RESOLVER_CLASS(klass: Pointer): Tgboolean;
function GA_SERVICE_RESOLVER_GET_CLASS(obj: Pointer): PGaServiceResolverClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GA_TYPE_SERVICE_RESOLVER: TGType;
begin
  GA_TYPE_SERVICE_RESOLVER := ga_service_resolver_get_type;
end;

function GA_SERVICE_RESOLVER(obj: Pointer): PGaServiceResolver;
begin
  Result := PGaServiceResolver(g_type_check_instance_cast(obj, GA_TYPE_SERVICE_RESOLVER));
end;

function GA_SERVICE_RESOLVER_CLASS(klass: Pointer): PGaServiceResolverClass;
begin
  Result := PGaServiceResolverClass(g_type_check_class_cast(klass, GA_TYPE_SERVICE_RESOLVER));
end;

function IS_GA_SERVICE_RESOLVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GA_TYPE_SERVICE_RESOLVER);
end;

function IS_GA_SERVICE_RESOLVER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GA_TYPE_SERVICE_RESOLVER);
end;

function GA_SERVICE_RESOLVER_GET_CLASS(obj: Pointer): PGaServiceResolverClass;
begin
  Result := PGaServiceResolverClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

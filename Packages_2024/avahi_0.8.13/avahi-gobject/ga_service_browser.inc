{$IFDEF read_interface}


type
  TGaServiceBrowserClass = record
    parent_class: TGObjectClass;
  end;
  PGaServiceBrowserClass = ^TGaServiceBrowserClass;

  TGaServiceBrowser = record
    parent: TGObject;
  end;
  PGaServiceBrowser = ^TGaServiceBrowser;


function ga_service_browser_get_type: TGType; cdecl; external libavahi_gobject;
function ga_service_browser_new(_type: Pgchar): PGaServiceBrowser; cdecl; external libavahi_gobject;
function ga_service_browser_new_full(iface: TAvahiIfIndex; protocol: TAvahiProtocol; _type: Pgchar; domain: Pgchar; flags: TGaLookupFlags): PGaServiceBrowser; cdecl; external libavahi_gobject;
function ga_service_browser_attach(browser: PGaServiceBrowser; client: PGaClient; error: PPGError): Tgboolean; cdecl; external libavahi_gobject;

// === Konventiert am: 25-12-25 15:57:09 ===

function GA_TYPE_SERVICE_BROWSER: TGType;
function GA_SERVICE_BROWSER(obj: Pointer): PGaServiceBrowser;
function GA_SERVICE_BROWSER_CLASS(klass: Pointer): PGaServiceBrowserClass;
function IS_GA_SERVICE_BROWSER(obj: Pointer): Tgboolean;
function IS_GA_SERVICE_BROWSER_CLASS(klass: Pointer): Tgboolean;
function GA_SERVICE_BROWSER_GET_CLASS(obj: Pointer): PGaServiceBrowserClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GA_TYPE_SERVICE_BROWSER: TGType;
begin
  GA_TYPE_SERVICE_BROWSER := ga_service_browser_get_type;
end;

function GA_SERVICE_BROWSER(obj: Pointer): PGaServiceBrowser;
begin
  Result := PGaServiceBrowser(g_type_check_instance_cast(obj, GA_TYPE_SERVICE_BROWSER));
end;

function GA_SERVICE_BROWSER_CLASS(klass: Pointer): PGaServiceBrowserClass;
begin
  Result := PGaServiceBrowserClass(g_type_check_class_cast(klass, GA_TYPE_SERVICE_BROWSER));
end;

function IS_GA_SERVICE_BROWSER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GA_TYPE_SERVICE_BROWSER);
end;

function IS_GA_SERVICE_BROWSER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GA_TYPE_SERVICE_BROWSER);
end;

function GA_SERVICE_BROWSER_GET_CLASS(obj: Pointer): PGaServiceBrowserClass;
begin
  Result := PGaServiceBrowserClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

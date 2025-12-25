{$IFDEF read_interface}


type
  TGaRecordBrowserClass = record
    parent_class: TGObjectClass;
  end;
  PGaRecordBrowserClass = ^TGaRecordBrowserClass;

  TGaRecordBrowser = record
    parent: TGObject;
  end;
  PGaRecordBrowser = ^TGaRecordBrowser;


function ga_record_browser_get_type: TGType; cdecl; external libavahi_gobject;
function ga_record_browser_new(name: Pgchar; _type: Tguint16): PGaRecordBrowser; cdecl; external libavahi_gobject;
function ga_record_browser_new_full(iface: TAvahiIfIndex; protocol: TAvahiProtocol; name: Pgchar; clazz: Tguint16; _type: Tguint16;
  flags: TGaLookupFlags): PGaRecordBrowser; cdecl; external libavahi_gobject;
function ga_record_browser_attach(browser: PGaRecordBrowser; client: PGaClient; error: PPGError): Tgboolean; cdecl; external libavahi_gobject;

// === Konventiert am: 25-12-25 15:57:03 ===

function GA_TYPE_RECORD_BROWSER: TGType;
function GA_RECORD_BROWSER(obj: Pointer): PGaRecordBrowser;
function GA_RECORD_BROWSER_CLASS(klass: Pointer): PGaRecordBrowserClass;
function IS_GA_RECORD_BROWSER(obj: Pointer): Tgboolean;
function IS_GA_RECORD_BROWSER_CLASS(klass: Pointer): Tgboolean;
function GA_RECORD_BROWSER_GET_CLASS(obj: Pointer): PGaRecordBrowserClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GA_TYPE_RECORD_BROWSER: TGType;
begin
  GA_TYPE_RECORD_BROWSER := ga_record_browser_get_type;
end;

function GA_RECORD_BROWSER(obj: Pointer): PGaRecordBrowser;
begin
  Result := PGaRecordBrowser(g_type_check_instance_cast(obj, GA_TYPE_RECORD_BROWSER));
end;

function GA_RECORD_BROWSER_CLASS(klass: Pointer): PGaRecordBrowserClass;
begin
  Result := PGaRecordBrowserClass(g_type_check_class_cast(klass, GA_TYPE_RECORD_BROWSER));
end;

function IS_GA_RECORD_BROWSER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GA_TYPE_RECORD_BROWSER);
end;

function IS_GA_RECORD_BROWSER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GA_TYPE_RECORD_BROWSER);
end;

function GA_RECORD_BROWSER_GET_CLASS(obj: Pointer): PGaRecordBrowserClass;
begin
  Result := PGaRecordBrowserClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

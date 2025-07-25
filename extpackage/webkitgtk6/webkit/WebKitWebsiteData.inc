{$IFDEF read_interface}

type
  PWebKitWebsiteDataTypes = ^TWebKitWebsiteDataTypes;
  TWebKitWebsiteDataTypes = longint;

const
  WEBKIT_WEBSITE_DATA_MEMORY_CACHE = 1 shl 0;
  WEBKIT_WEBSITE_DATA_DISK_CACHE = 1 shl 1;
  WEBKIT_WEBSITE_DATA_OFFLINE_APPLICATION_CACHE = 1 shl 2;
  WEBKIT_WEBSITE_DATA_SESSION_STORAGE = 1 shl 3;
  WEBKIT_WEBSITE_DATA_LOCAL_STORAGE = 1 shl 4;
  WEBKIT_WEBSITE_DATA_INDEXEDDB_DATABASES = 1 shl 5;
  WEBKIT_WEBSITE_DATA_COOKIES = 1 shl 6;
  WEBKIT_WEBSITE_DATA_DEVICE_ID_HASH_SALT = 1 shl 7;
  WEBKIT_WEBSITE_DATA_HSTS_CACHE = 1 shl 8;
  WEBKIT_WEBSITE_DATA_ITP = 1 shl 9;
  WEBKIT_WEBSITE_DATA_SERVICE_WORKER_REGISTRATIONS = 1 shl 10;
  WEBKIT_WEBSITE_DATA_DOM_CACHE = 1 shl 11;
  WEBKIT_WEBSITE_DATA_ALL = (1 shl 12) - 1;

type
  TWebKitWebsiteData = record
  end;
  PWebKitWebsiteData = ^TWebKitWebsiteData;

function webkit_website_data_get_type: TGType; cdecl; external libwebkit;
function webkit_website_data_ref(website_data: PWebKitWebsiteData): PWebKitWebsiteData; cdecl; external libwebkit;
procedure webkit_website_data_unref(website_data: PWebKitWebsiteData); cdecl; external libwebkit;
function webkit_website_data_get_name(website_data: PWebKitWebsiteData): pchar; cdecl; external libwebkit;
function webkit_website_data_get_types(website_data: PWebKitWebsiteData): TWebKitWebsiteDataTypes; cdecl; external libwebkit;
function webkit_website_data_get_size(website_data: PWebKitWebsiteData; types: TWebKitWebsiteDataTypes): Tguint64; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 17:40:08 ===

function WEBKIT_TYPE_WEBSITE_DATA: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_WEBSITE_DATA: TGType;
begin
  WEBKIT_TYPE_WEBSITE_DATA := webkit_website_data_get_type;
end;



{$ENDIF read_implementation}

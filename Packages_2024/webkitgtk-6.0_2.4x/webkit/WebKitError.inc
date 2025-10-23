{$IFDEF read_interface}


type
  PWebKitNetworkError = ^TWebKitNetworkError;
  TWebKitNetworkError = longint;

const
  WEBKIT_NETWORK_ERROR_FAILED = 399;
  WEBKIT_NETWORK_ERROR_TRANSPORT = 300;
  WEBKIT_NETWORK_ERROR_UNKNOWN_PROTOCOL = 301;
  WEBKIT_NETWORK_ERROR_CANCELLED = 302;
  WEBKIT_NETWORK_ERROR_FILE_DOES_NOT_EXIST = 303;

type
  PWebKitPolicyError = ^TWebKitPolicyError;
  TWebKitPolicyError = longint;

const
  WEBKIT_POLICY_ERROR_FAILED = 199;
  WEBKIT_POLICY_ERROR_CANNOT_SHOW_MIME_TYPE = 100;
  WEBKIT_POLICY_ERROR_CANNOT_SHOW_URI = 101;
  WEBKIT_POLICY_ERROR_FRAME_LOAD_INTERRUPTED_BY_POLICY_CHANGE = 102;
  WEBKIT_POLICY_ERROR_CANNOT_USE_RESTRICTED_PORT = 103;

type
  PWebKitDownloadError = ^TWebKitDownloadError;
  TWebKitDownloadError = longint;

const
  WEBKIT_DOWNLOAD_ERROR_NETWORK = 499;
  WEBKIT_DOWNLOAD_ERROR_CANCELLED_BY_USER = 400;
  WEBKIT_DOWNLOAD_ERROR_DESTINATION = 401;

type
  PWebKitPrintError = ^TWebKitPrintError;
  TWebKitPrintError = longint;

const
  WEBKIT_PRINT_ERROR_GENERAL = 599;
  WEBKIT_PRINT_ERROR_PRINTER_NOT_FOUND = 500;
  WEBKIT_PRINT_ERROR_INVALID_PAGE_RANGE = 501;

type
  PWebKitJavascriptError = ^TWebKitJavascriptError;
  TWebKitJavascriptError = longint;

const
  WEBKIT_JAVASCRIPT_ERROR_SCRIPT_FAILED = 699;
  WEBKIT_JAVASCRIPT_ERROR_INVALID_PARAMETER = 600;
  WEBKIT_JAVASCRIPT_ERROR_INVALID_RESULT = 601;

type
  PWebKitSnapshotError = ^TWebKitSnapshotError;
  TWebKitSnapshotError = longint;

const
  WEBKIT_SNAPSHOT_ERROR_FAILED_TO_CREATE = 799;

type
  PWebKitWebExtensionMatchPatternError = ^TWebKitWebExtensionMatchPatternError;
  TWebKitWebExtensionMatchPatternError = longint;

const
  WEBKIT_WEB_EXTENSION_MATCH_PATTERN_ERROR_UNKNOWN = 899;
  WEBKIT_WEB_EXTENSION_MATCH_PATTERN_ERROR_INVALID_SCHEME = 808;
  WEBKIT_WEB_EXTENSION_MATCH_PATTERN_ERROR_INVALID_HOST = 809;
  WEBKIT_WEB_EXTENSION_MATCH_PATTERN_ERROR_INVALID_PATH = 810;

type
  PWebKitUserContentFilterError = ^TWebKitUserContentFilterError;
  TWebKitUserContentFilterError = longint;

const
  WEBKIT_USER_CONTENT_FILTER_ERROR_INVALID_SOURCE = 0;
  WEBKIT_USER_CONTENT_FILTER_ERROR_NOT_FOUND = 1;

type
  PWebKitMediaError = ^TWebKitMediaError;
  TWebKitMediaError = longint;

const
  WEBKIT_MEDIA_ERROR_WILL_HANDLE_LOAD = 204;

function webkit_network_error_quark: TGQuark; cdecl; external libwebkit;
function webkit_policy_error_quark: TGQuark; cdecl; external libwebkit;
function webkit_download_error_quark: TGQuark; cdecl; external libwebkit;
function webkit_print_error_quark: TGQuark; cdecl; external libwebkit;
function webkit_javascript_error_quark: TGQuark; cdecl; external libwebkit;
function webkit_snapshot_error_quark: TGQuark; cdecl; external libwebkit;
function webkit_web_extension_match_pattern_error_quark: TGQuark; cdecl; external libwebkit;
function webkit_user_content_filter_error_quark: TGQuark; cdecl; external libwebkit;
function webkit_media_error_quark: TGQuark; cdecl; external libwebkit;

function WEBKIT_NETWORK_ERROR: TGQuark;
function WEBKIT_POLICY_ERROR: TGQuark;
function WEBKIT_DOWNLOAD_ERROR: TGQuark;
function WEBKIT_JAVASCRIPT_ERROR: TGQuark;
function WEBKIT_SNAPSHOT_ERROR: TGQuark;
function WEBKIT_USER_CONTENT_FILTER_ERROR: TGQuark;
function WEBKIT_WEB_EXTENSION_MATCH_PATTERN_ERROR: TGQuark;
function WEBKIT_PRINT_ERROR: TGQuark;
function WEBKIT_MEDIA_ERROR: TGQuark;

// === Konventiert am: 4-1-25 13:43:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function WEBKIT_NETWORK_ERROR: TGQuark;
begin
  WEBKIT_NETWORK_ERROR := webkit_network_error_quark;
end;

function WEBKIT_POLICY_ERROR: TGQuark;
begin
  WEBKIT_POLICY_ERROR := webkit_policy_error_quark;
end;

function WEBKIT_DOWNLOAD_ERROR: TGQuark;
begin
  WEBKIT_DOWNLOAD_ERROR := webkit_download_error_quark;
end;

function WEBKIT_JAVASCRIPT_ERROR: TGQuark;
begin
  WEBKIT_JAVASCRIPT_ERROR := webkit_javascript_error_quark;
end;

function WEBKIT_SNAPSHOT_ERROR: TGQuark;
begin
  WEBKIT_SNAPSHOT_ERROR := webkit_snapshot_error_quark;
end;

function WEBKIT_USER_CONTENT_FILTER_ERROR: TGQuark;
begin
  WEBKIT_USER_CONTENT_FILTER_ERROR := webkit_user_content_filter_error_quark;
end;

function WEBKIT_WEB_EXTENSION_MATCH_PATTERN_ERROR: TGQuark;
begin
  Result := webkit_web_extension_match_pattern_error_quark;
  // Bug im original Header ???
//  WEBKIT_WEB_EXTENSION_MATCH_PATTERN_ERROR := webkit_web_extension_error_quark
end;

function WEBKIT_PRINT_ERROR: TGQuark;
begin
  WEBKIT_PRINT_ERROR := webkit_print_error_quark;
end;

function WEBKIT_MEDIA_ERROR: TGQuark;
begin
  WEBKIT_MEDIA_ERROR := webkit_media_error_quark;
end;


{$ENDIF read_implementation}

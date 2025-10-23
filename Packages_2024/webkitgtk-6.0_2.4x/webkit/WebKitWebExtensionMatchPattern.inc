{$IFDEF read_interface}

type
  PWebKitWebExtensionMatchPatternOptions = ^TWebKitWebExtensionMatchPatternOptions;
  TWebKitWebExtensionMatchPatternOptions = longint;

const
  WEBKIT_WEB_EXTENSION_MATCH_PATTERN_OPTIONS_NONE = 1 shl 0;
  WEBKIT_WEB_EXTENSION_MATCH_PATTERN_OPTIONS_IGNORE_SCHEMES = 1 shl 1;
  WEBKIT_WEB_EXTENSION_MATCH_PATTERN_OPTIONS_IGNORE_PATHS = 1 shl 2;
  WEBKIT_WEB_EXTENSION_MATCH_PATTERN_OPTIONS_MATCH_BIDIRECTIONALLY = 1 shl 3;

type
  TWebKitWebExtensionMatchPattern = record
  end;
  PWebKitWebExtensionMatchPattern = ^TWebKitWebExtensionMatchPattern;

function webkit_web_extension_match_pattern_get_type: TGType; cdecl; external libwebkit;
function webkit_web_extension_match_pattern_ref(matchPattern: PWebKitWebExtensionMatchPattern): PWebKitWebExtensionMatchPattern; cdecl; external libwebkit;
procedure webkit_web_extension_match_pattern_unref(matchPattern: PWebKitWebExtensionMatchPattern); cdecl; external libwebkit;
function webkit_web_extension_match_pattern_new_all_urls: PWebKitWebExtensionMatchPattern; cdecl; external libwebkit;
function webkit_web_extension_match_pattern_new_all_hosts_and_schemes: PWebKitWebExtensionMatchPattern; cdecl; external libwebkit;
function webkit_web_extension_match_pattern_new_with_string(_string: Pgchar; error: PPGError): PWebKitWebExtensionMatchPattern; cdecl; external libwebkit;
function webkit_web_extension_match_pattern_new_with_scheme(scheme: Pgchar; host: Pgchar; path: Pgchar; error: PPGError): PWebKitWebExtensionMatchPattern; cdecl; external libwebkit;
procedure webkit_web_extension_match_pattern_register_custom_URL_scheme(urlScheme: Pgchar); cdecl; external libwebkit;
function webkit_web_extension_match_pattern_get_string(matchPattern: PWebKitWebExtensionMatchPattern): Pgchar; cdecl; external libwebkit;
function webkit_web_extension_match_pattern_get_scheme(matchPattern: PWebKitWebExtensionMatchPattern): Pgchar; cdecl; external libwebkit;
function webkit_web_extension_match_pattern_get_host(matchPattern: PWebKitWebExtensionMatchPattern): Pgchar; cdecl; external libwebkit;
function webkit_web_extension_match_pattern_get_path(matchPattern: PWebKitWebExtensionMatchPattern): Pgchar; cdecl; external libwebkit;
function webkit_web_extension_match_pattern_get_matches_all_urls(matchPattern: PWebKitWebExtensionMatchPattern): Tgboolean; cdecl; external libwebkit;
function webkit_web_extension_match_pattern_get_matches_all_hosts(matchPattern: PWebKitWebExtensionMatchPattern): Tgboolean; cdecl; external libwebkit;
function webkit_web_extension_match_pattern_matches_url(matchPattern: PWebKitWebExtensionMatchPattern; url: Pgchar; options: TWebKitWebExtensionMatchPatternOptions): Tgboolean; cdecl; external libwebkit;
function webkit_web_extension_match_pattern_matches_pattern(matchPattern: PWebKitWebExtensionMatchPattern; pattern: PWebKitWebExtensionMatchPattern; options: TWebKitWebExtensionMatchPatternOptions): Tgboolean; cdecl; external libwebkit;

// === Konventiert am: 1-4-25 19:33:20 ===

function WEBKIT_TYPE_WEB_EXTENSION_MATCH_PATTERN : TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}


function WEBKIT_TYPE_WEB_EXTENSION_MATCH_PATTERN : TGType;
  begin
    WEBKIT_TYPE_WEB_EXTENSION_MATCH_PATTERN:=webkit_web_extension_match_pattern_get_type;
  end;


{$ENDIF read_implementation}

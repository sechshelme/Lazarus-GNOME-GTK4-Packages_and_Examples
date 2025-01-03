unit WebKitFeature;

interface

uses
  fp_glib2, fp_GTK4, web_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PWebKitFeatureStatus = ^TWebKitFeatureStatus;
  TWebKitFeatureStatus = longint;

const
  WEBKIT_FEATURE_STATUS_EMBEDDER = 0;
  WEBKIT_FEATURE_STATUS_UNSTABLE = 1;
  WEBKIT_FEATURE_STATUS_INTERNAL = 2;
  WEBKIT_FEATURE_STATUS_DEVELOPER = 3;
  WEBKIT_FEATURE_STATUS_TESTABLE = 4;
  WEBKIT_FEATURE_STATUS_PREVIEW = 5;
  WEBKIT_FEATURE_STATUS_STABLE = 6;
  WEBKIT_FEATURE_STATUS_MATURE = 7;

type
  TWebKitFeature = record
  end;
  PWebKitFeature = ^TWebKitFeature;

function webkit_feature_get_type: TGType; cdecl; external libwebkit;
function webkit_feature_ref(feature: PWebKitFeature): PWebKitFeature; cdecl; external libwebkit;
procedure webkit_feature_unref(feature: PWebKitFeature); cdecl; external libwebkit;
function webkit_feature_get_identifier(feature: PWebKitFeature): pchar; cdecl; external libwebkit;
function webkit_feature_get_name(feature: PWebKitFeature): pchar; cdecl; external libwebkit;
function webkit_feature_get_details(feature: PWebKitFeature): pchar; cdecl; external libwebkit;
function webkit_feature_get_category(feature: PWebKitFeature): pchar; cdecl; external libwebkit;
function webkit_feature_get_status(feature: PWebKitFeature): TWebKitFeatureStatus; cdecl; external libwebkit;
function webkit_feature_get_default_value(feature: PWebKitFeature): Tgboolean; cdecl; external libwebkit;

type
  TWebKitFeatureList = record
  end;
  PWebKitFeatureList = ^TWebKitFeatureList;

function webkit_feature_list_get_type: TGType; cdecl; external libwebkit;
function webkit_feature_list_ref(feature_list: PWebKitFeatureList): PWebKitFeatureList; cdecl; external libwebkit;
procedure webkit_feature_list_unref(feature_list: PWebKitFeatureList); cdecl; external libwebkit;
function webkit_feature_list_get_length(feature_list: PWebKitFeatureList): Tgsize; cdecl; external libwebkit;
function webkit_feature_list_get(feature_list: PWebKitFeatureList; index: Tgsize): PWebKitFeature; cdecl; external libwebkit;

function WEBKIT_TYPE_FEATURE_LIST: TGType;

// === Konventiert am: 3-1-25 19:47:00 ===


implementation

function WEBKIT_TYPE_FEATURE: TGType;
begin
  WEBKIT_TYPE_FEATURE := webkit_feature_get_type;
end;

function WEBKIT_TYPE_FEATURE_LIST: TGType;
begin
  WEBKIT_TYPE_FEATURE_LIST := webkit_feature_list_get_type;
end;


end.

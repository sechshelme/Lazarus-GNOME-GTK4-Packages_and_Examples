{$IFDEF read_interface}

  {WEBKIT_DECLARE_FINAL_TYPE (WebKitHitTestResult, webkit_hit_test_result, WEBKIT, HIT_TEST_RESULT, GObject) }
type
  PWebKitHitTestResultContext = ^TWebKitHitTestResultContext;
  TWebKitHitTestResultContext = longint;

const
  WEBKIT_HIT_TEST_RESULT_CONTEXT_DOCUMENT = 1 shl 1;
  WEBKIT_HIT_TEST_RESULT_CONTEXT_LINK = 1 shl 2;
  WEBKIT_HIT_TEST_RESULT_CONTEXT_IMAGE = 1 shl 3;
  WEBKIT_HIT_TEST_RESULT_CONTEXT_MEDIA = 1 shl 4;
  WEBKIT_HIT_TEST_RESULT_CONTEXT_EDITABLE = 1 shl 5;
  WEBKIT_HIT_TEST_RESULT_CONTEXT_SCROLLBAR = 1 shl 6;
  WEBKIT_HIT_TEST_RESULT_CONTEXT_SELECTION = 1 shl 7;

type
  TWebKitHitTestResult = record
  end;
  PWebKitHitTestResult = ^TWebKitHitTestResult;

  TWebKitHitTestResultClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitHitTestResultClass = ^TWebKitHitTestResultClass;

function webkit_hit_test_result_get_type: TGType; cdecl; external libwebkit;
function webkit_hit_test_result_get_context(hit_test_result: PWebKitHitTestResult): Tguint; cdecl; external libwebkit;
function webkit_hit_test_result_context_is_link(hit_test_result: PWebKitHitTestResult): Tgboolean; cdecl; external libwebkit;
function webkit_hit_test_result_context_is_image(hit_test_result: PWebKitHitTestResult): Tgboolean; cdecl; external libwebkit;
function webkit_hit_test_result_context_is_media(hit_test_result: PWebKitHitTestResult): Tgboolean; cdecl; external libwebkit;
function webkit_hit_test_result_context_is_editable(hit_test_result: PWebKitHitTestResult): Tgboolean; cdecl; external libwebkit;
function webkit_hit_test_result_context_is_selection(hit_test_result: PWebKitHitTestResult): Tgboolean; cdecl; external libwebkit;
function webkit_hit_test_result_get_link_uri(hit_test_result: PWebKitHitTestResult): Pgchar; cdecl; external libwebkit;
function webkit_hit_test_result_get_link_title(hit_test_result: PWebKitHitTestResult): Pgchar; cdecl; external libwebkit;
function webkit_hit_test_result_get_link_label(hit_test_result: PWebKitHitTestResult): Pgchar; cdecl; external libwebkit;
function webkit_hit_test_result_get_image_uri(hit_test_result: PWebKitHitTestResult): Pgchar; cdecl; external libwebkit;
function webkit_hit_test_result_get_media_uri(hit_test_result: PWebKitHitTestResult): Pgchar; cdecl; external libwebkit;
function webkit_hit_test_result_context_is_scrollbar(hit_test_result: PWebKitHitTestResult): Tgboolean; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:25:48 ===

function WEBKIT_TYPE_HIT_TEST_RESULT: TGType;
function WEBKIT_HIT_TEST_RESULT(obj: Pointer): PWebKitHitTestResult;
function WEBKIT_IS_HIT_TEST_RESULT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_HIT_TEST_RESULT: TGType;
begin
  Result := webkit_hit_test_result_get_type;
end;

function WEBKIT_HIT_TEST_RESULT(obj: Pointer): PWebKitHitTestResult;
begin
  Result := PWebKitHitTestResult(g_type_check_instance_cast(obj, WEBKIT_TYPE_HIT_TEST_RESULT));
end;

function WEBKIT_IS_HIT_TEST_RESULT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_HIT_TEST_RESULT);
end;




{$ENDIF read_implementation}

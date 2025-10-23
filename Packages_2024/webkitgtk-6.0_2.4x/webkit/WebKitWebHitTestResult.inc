{$IFDEF read_interface}

  {WEBKIT_DECLARE_FINAL_TYPE (WebKitWebHitTestResult, webkit_web_hit_test_result, WEBKIT, WEB_HIT_TEST_RESULT, GObject) }
type
  TWebKitWebHitTestResult = record
  end;
  PWebKitWebHitTestResult = ^TWebKitWebHitTestResult;

  TWebKitWebHitTestResultClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitWebHitTestResultClass = ^TWebKitWebHitTestResultClass;

function webkit_web_hit_test_result_get_type: TGType; cdecl; external libwebkit;
function webkit_web_hit_test_result_get_context(web_hit_test_result: PWebKitWebHitTestResult): Tguint; cdecl; external libwebkit;
function webkit_web_hit_test_result_context_is_link(web_hit_test_result: PWebKitWebHitTestResult): Tgboolean; cdecl; external libwebkit;
function webkit_web_hit_test_result_context_is_image(web_hit_test_result: PWebKitWebHitTestResult): Tgboolean; cdecl; external libwebkit;
function webkit_web_hit_test_result_context_is_media(web_hit_test_result: PWebKitWebHitTestResult): Tgboolean; cdecl; external libwebkit;
function webkit_web_hit_test_result_context_is_editable(web_hit_test_result: PWebKitWebHitTestResult): Tgboolean; cdecl; external libwebkit;
function webkit_web_hit_test_result_context_is_selection(web_hit_test_result: PWebKitWebHitTestResult): Tgboolean; cdecl; external libwebkit;
function webkit_web_hit_test_result_get_link_uri(web_hit_test_result: PWebKitWebHitTestResult): Pgchar; cdecl; external libwebkit;
function webkit_web_hit_test_result_get_link_title(web_hit_test_result: PWebKitWebHitTestResult): Pgchar; cdecl; external libwebkit;
function webkit_web_hit_test_result_get_link_label(web_hit_test_result: PWebKitWebHitTestResult): Pgchar; cdecl; external libwebkit;
function webkit_web_hit_test_result_get_image_uri(web_hit_test_result: PWebKitWebHitTestResult): Pgchar; cdecl; external libwebkit;
function webkit_web_hit_test_result_get_media_uri(web_hit_test_result: PWebKitWebHitTestResult): Pgchar; cdecl; external libwebkit;
function webkit_web_hit_test_result_context_is_scrollbar(web_hit_test_result: PWebKitWebHitTestResult): Tgboolean; cdecl; external libwebkit;
function webkit_web_hit_test_result_get_js_node(web_hit_test_result: PWebKitWebHitTestResult; world: PWebKitScriptWorld): PJSCValue; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 15:31:51 ===

function WEBKIT_TYPE_WEB_HIT_TEST_RESULT: TGType;
function WEBKIT_WEB_HIT_TEST_RESULT(obj: Pointer): PWebKitWebHitTestResult;
function WEBKIT_IS_WEB_HIT_TEST_RESULT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_WEB_HIT_TEST_RESULT: TGType;
begin
  Result := webkit_web_hit_test_result_get_type;
end;

function WEBKIT_WEB_HIT_TEST_RESULT(obj: Pointer): PWebKitWebHitTestResult;
begin
  Result := PWebKitWebHitTestResult(g_type_check_instance_cast(obj, WEBKIT_TYPE_WEB_HIT_TEST_RESULT));
end;

function WEBKIT_IS_WEB_HIT_TEST_RESULT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WEB_HIT_TEST_RESULT);
end;


{$ENDIF read_implementation}

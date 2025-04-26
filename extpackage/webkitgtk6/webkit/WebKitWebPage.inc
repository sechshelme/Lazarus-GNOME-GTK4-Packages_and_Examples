{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitWebPage, webkit_web_page, WEBKIT, WEB_PAGE, GObject) }
type
  TWebKitWebPageClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitWebPageClass = ^TWebKitWebPageClass;

function webkit_web_page_get_type: TGType; cdecl; external libwebkit;
function webkit_web_page_get_id(web_page: PWebKitWebPage): Tguint64; cdecl; external libwebkit;
function webkit_web_page_get_uri(web_page: PWebKitWebPage): Pgchar; cdecl; external libwebkit;
function webkit_web_page_get_main_frame(web_page: PWebKitWebPage): PWebKitFrame; cdecl; external libwebkit; deprecated 'WEBKIT_DEPRECATED';
function webkit_web_page_get_editor(web_page: PWebKitWebPage): PWebKitWebEditor; cdecl; external libwebkit;
function webkit_web_page_get_form_manager(web_page: PWebKitWebPage; world: PWebKitScriptWorld): PWebKitWebFormManager; cdecl; external libwebkit;
procedure webkit_web_page_send_message_to_view(web_page: PWebKitWebPage; message: PWebKitUserMessage; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_web_page_send_message_to_view_finish(web_page: PWebKitWebPage; Result: PGAsyncResult; error: PPGError): PWebKitUserMessage; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 13:55:59 ===

function WEBKIT_TYPE_WEB_PAGE: TGType;
function WEBKIT_WEB_PAGE(obj: Pointer): PWebKitWebPage;
function WEBKIT_IS_WEB_PAGE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_WEB_PAGE: TGType;
begin
  Result := webkit_web_page_get_type;
end;

function WEBKIT_WEB_PAGE(obj: Pointer): PWebKitWebPage;
begin
  Result := PWebKitWebPage(g_type_check_instance_cast(obj, WEBKIT_TYPE_WEB_PAGE));
end;

function WEBKIT_IS_WEB_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WEB_PAGE);
end;


{$ENDIF read_implementation}

unit WebKitWebView;

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PWebKitPolicyDecisionType = ^TWebKitPolicyDecisionType;
  TWebKitPolicyDecisionType = longint;

const
  WEBKIT_POLICY_DECISION_TYPE_NAVIGATION_ACTION = 0;
  WEBKIT_POLICY_DECISION_TYPE_NEW_WINDOW_ACTION = 1;
  WEBKIT_POLICY_DECISION_TYPE_RESPONSE = 2;

type
  PWebKitLoadEvent = ^TWebKitLoadEvent;
  TWebKitLoadEvent = longint;

const
  WEBKIT_LOAD_STARTED = 0;
  WEBKIT_LOAD_REDIRECTED = 1;
  WEBKIT_LOAD_COMMITTED = 2;
  WEBKIT_LOAD_FINISHED = 3;

type
  PWebKitSaveMode = ^TWebKitSaveMode;
  TWebKitSaveMode = longint;

const
  WEBKIT_SAVE_MODE_MHTML = 0;

type
  PWebKitInsecureContentEvent = ^TWebKitInsecureContentEvent;
  TWebKitInsecureContentEvent = longint;

const
  WEBKIT_INSECURE_CONTENT_RUN = 0;
  WEBKIT_INSECURE_CONTENT_DISPLAYED = 1;

type
  PWebKitSnapshotOptions = ^TWebKitSnapshotOptions;
  TWebKitSnapshotOptions = longint;

const
  WEBKIT_SNAPSHOT_OPTIONS_NONE = 0;
  WEBKIT_SNAPSHOT_OPTIONS_INCLUDE_SELECTION_HIGHLIGHTING = 1 shl 0;
  WEBKIT_SNAPSHOT_OPTIONS_TRANSPARENT_BACKGROUND = 1 shl 1;

type
  PWebKitSnapshotRegion = ^TWebKitSnapshotRegion;
  TWebKitSnapshotRegion = longint;

const
  WEBKIT_SNAPSHOT_REGION_VISIBLE = 0;
  WEBKIT_SNAPSHOT_REGION_FULL_DOCUMENT = 1;

type
  PWebKitWebProcessTerminationReason = ^TWebKitWebProcessTerminationReason;
  TWebKitWebProcessTerminationReason = longint;

const
  WEBKIT_WEB_PROCESS_CRASHED = 0;
  WEBKIT_WEB_PROCESS_EXCEEDED_MEMORY_LIMIT = 1;
  WEBKIT_WEB_PROCESS_TERMINATED_BY_API = 2;

type
  PWebKitMediaCaptureState = ^TWebKitMediaCaptureState;
  TWebKitMediaCaptureState = longint;

const
  WEBKIT_MEDIA_CAPTURE_STATE_NONE = 0;
  WEBKIT_MEDIA_CAPTURE_STATE_ACTIVE = 1;
  WEBKIT_MEDIA_CAPTURE_STATE_MUTED = 2;

type
  PWebKitWebExtensionMode = ^TWebKitWebExtensionMode;
  TWebKitWebExtensionMode = longint;

const
  WEBKIT_WEB_EXTENSION_MODE_NONE = 0;
  WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2 = 1;
  WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3 = 2;

type
  {WEBKIT_DECLARE_DERIVABLE_TYPE (WebKitWebView, webkit_web_view, WEBKIT, WEB_VIEW, WebKitWebViewBase) }
  TWebKitWebView = record
  end;
  PWebKitWebView = ^TWebKitWebView;

  TWebKitWebViewClass = record
    parent: TWebKitWebViewBaseClass;
    load_changed: procedure(web_view: PWebKitWebView; load_event: TWebKitLoadEvent); cdecl;
    load_failed: function(web_view: PWebKitWebView; load_event: TWebKitLoadEvent; failing_uri: Pgchar; error: PGError): Tgboolean; cdecl;
    Create: function(web_view: PWebKitWebView; navigation_action: PWebKitNavigationAction): PGtkWidget; cdecl;
    ready_to_show: procedure(web_view: PWebKitWebView); cdecl;
    run_as_modal: procedure(web_view: PWebKitWebView); cdecl;
    Close: procedure(web_view: PWebKitWebView); cdecl;
    script_dialog: function(web_view: PWebKitWebView; dialog: PWebKitScriptDialog): Tgboolean; cdecl;
    decide_policy: function(web_view: PWebKitWebView; decision: PWebKitPolicyDecision; _type: TWebKitPolicyDecisionType): Tgboolean; cdecl;
    permission_request: function(web_view: PWebKitWebView; permission_request: PWebKitPermissionRequest): Tgboolean; cdecl;
    mouse_target_changed: procedure(web_view: PWebKitWebView; hit_test_result: PWebKitHitTestResult; modifiers: Tguint); cdecl;
    print: function(web_view: PWebKitWebView; print_operation: PWebKitPrintOperation): Tgboolean; cdecl;
    resource_load_started: procedure(web_view: PWebKitWebView; resource: PWebKitWebResource; request: PWebKitURIRequest); cdecl;
    enter_fullscreen: function(web_view: PWebKitWebView): Tgboolean; cdecl;
    leave_fullscreen: function(web_view: PWebKitWebView): Tgboolean; cdecl;
    run_file_chooser: function(web_view: PWebKitWebView; request: PWebKitFileChooserRequest): Tgboolean; cdecl;
    context_menu: function(web_view: PWebKitWebView; context_menu: PWebKitContextMenu; hit_test_result: PWebKitHitTestResult): Tgboolean; cdecl;
    context_menu_dismissed: procedure(web_view: PWebKitWebView); cdecl;
    submit_form: procedure(web_view: PWebKitWebView; request: PWebKitFormSubmissionRequest); cdecl;
    insecure_content_detected: procedure(web_view: PWebKitWebView; event: TWebKitInsecureContentEvent); cdecl;
    web_process_crashed: function(web_view: PWebKitWebView): Tgboolean; cdecl;
    authenticate: function(web_view: PWebKitWebView; request: PWebKitAuthenticationRequest): Tgboolean; cdecl;
    load_failed_with_tls_errors: function(web_view: PWebKitWebView; failing_uri: Pgchar; certificate: PGTlsCertificate; errors: TGTlsCertificateFlags): Tgboolean; cdecl;
    show_notification: function(web_view: PWebKitWebView; notification: PWebKitNotification): Tgboolean; cdecl;
    run_color_chooser: function(web_view: PWebKitWebView; request: PWebKitColorChooserRequest): Tgboolean; cdecl;
    show_option_menu: function(web_view: PWebKitWebView; menu: PWebKitOptionMenu; rectangle: PGdkRectangle): Tgboolean; cdecl;
    web_process_terminated: procedure(web_view: PWebKitWebView; reason: TWebKitWebProcessTerminationReason); cdecl;
    user_message_received: function(web_view: PWebKitWebView; message: PWebKitUserMessage): Tgboolean; cdecl;
    query_permission_state: function(web_view: PWebKitWebView; query: PWebKitPermissionStateQuery): Tgboolean; cdecl;
    _webkit_reserved0: procedure; cdecl;
    _webkit_reserved1: procedure; cdecl;
    _webkit_reserved2: procedure; cdecl;
    _webkit_reserved3: procedure; cdecl;
    _webkit_reserved4: procedure; cdecl;
    _webkit_reserved5: procedure; cdecl;
    _webkit_reserved6: procedure; cdecl;
    _webkit_reserved7: procedure; cdecl;
    _webkit_reserved8: procedure; cdecl;
    _webkit_reserved9: procedure; cdecl;
    _webkit_reserved10: procedure; cdecl;
    _webkit_reserved11: procedure; cdecl;
    _webkit_reserved12: procedure; cdecl;
    _webkit_reserved13: procedure; cdecl;
    _webkit_reserved14: procedure; cdecl;
    _webkit_reserved15: procedure; cdecl;
    _webkit_reserved16: procedure; cdecl;
    _webkit_reserved17: procedure; cdecl;
    _webkit_reserved18: procedure; cdecl;
    _webkit_reserved19: procedure; cdecl;
    _webkit_reserved20: procedure; cdecl;
    _webkit_reserved21: procedure; cdecl;
    _webkit_reserved22: procedure; cdecl;
    _webkit_reserved23: procedure; cdecl;
    _webkit_reserved24: procedure; cdecl;
    _webkit_reserved25: procedure; cdecl;
    _webkit_reserved26: procedure; cdecl;
    _webkit_reserved27: procedure; cdecl;
    _webkit_reserved28: procedure; cdecl;
    _webkit_reserved29: procedure; cdecl;
    _webkit_reserved30: procedure; cdecl;
  end;
  PWebKitWebViewClass = ^TWebKitWebViewClass;

  TWebKitWebViewPrivate = record
  end;
  PWebKitWebViewPrivate = ^TWebKitWebViewPrivate;

function webkit_web_view_get_type: TGType; cdecl; external libwebkit;
function webkit_web_view_new: PGtkWidget; cdecl; external libwebkit;
function webkit_web_view_is_controlled_by_automation(web_view: PWebKitWebView): Tgboolean; cdecl; external libwebkit;
function webkit_web_view_get_automation_presentation_type(web_view: PWebKitWebView): TWebKitAutomationBrowsingContextPresentation; cdecl; external libwebkit;
function webkit_web_view_get_network_session(web_view: PWebKitWebView): PWebKitNetworkSession; cdecl; external libwebkit;
function webkit_web_view_get_context(web_view: PWebKitWebView): PWebKitWebContext; cdecl; external libwebkit;
procedure webkit_web_view_try_close(web_view: PWebKitWebView); cdecl; external libwebkit;
procedure webkit_web_view_load_uri(web_view: PWebKitWebView; uri: Pgchar); cdecl; external libwebkit;
procedure webkit_web_view_load_html(web_view: PWebKitWebView; content: Pgchar; base_uri: Pgchar); cdecl; external libwebkit;
procedure webkit_web_view_load_alternate_html(web_view: PWebKitWebView; content: Pgchar; content_uri: Pgchar; base_uri: Pgchar); cdecl; external libwebkit;
procedure webkit_web_view_load_plain_text(web_view: PWebKitWebView; plain_text: Pgchar); cdecl; external libwebkit;
procedure webkit_web_view_load_bytes(web_view: PWebKitWebView; bytes: PGBytes; mime_type: Pgchar; encoding: Pgchar; base_uri: Pgchar); cdecl; external libwebkit;
procedure webkit_web_view_load_request(web_view: PWebKitWebView; request: PWebKitURIRequest); cdecl; external libwebkit;
procedure webkit_web_view_stop_loading(web_view: PWebKitWebView); cdecl; external libwebkit;
function webkit_web_view_is_loading(web_view: PWebKitWebView): Tgboolean; cdecl; external libwebkit;
function webkit_web_view_is_playing_audio(web_view: PWebKitWebView): Tgboolean; cdecl; external libwebkit;
procedure webkit_web_view_set_is_muted(web_view: PWebKitWebView; muted: Tgboolean); cdecl; external libwebkit;
function webkit_web_view_get_is_muted(web_view: PWebKitWebView): Tgboolean; cdecl; external libwebkit;
function webkit_web_view_get_page_id(web_view: PWebKitWebView): Tguint64; cdecl; external libwebkit;
function webkit_web_view_get_title(web_view: PWebKitWebView): Pgchar; cdecl; external libwebkit;
procedure webkit_web_view_reload(web_view: PWebKitWebView); cdecl; external libwebkit;
procedure webkit_web_view_reload_bypass_cache(web_view: PWebKitWebView); cdecl; external libwebkit;
function webkit_web_view_get_estimated_load_progress(web_view: PWebKitWebView): Tgdouble; cdecl; external libwebkit;
procedure webkit_web_view_go_back(web_view: PWebKitWebView); cdecl; external libwebkit;
function webkit_web_view_can_go_back(web_view: PWebKitWebView): Tgboolean; cdecl; external libwebkit;
procedure webkit_web_view_go_forward(web_view: PWebKitWebView); cdecl; external libwebkit;
function webkit_web_view_can_go_forward(web_view: PWebKitWebView): Tgboolean; cdecl; external libwebkit;
function webkit_web_view_get_back_forward_list(web_view: PWebKitWebView): PWebKitBackForwardList; cdecl; external libwebkit;
procedure webkit_web_view_go_to_back_forward_list_item(web_view: PWebKitWebView; list_item: PWebKitBackForwardListItem); cdecl; external libwebkit;
function webkit_web_view_get_uri(web_view: PWebKitWebView): Pgchar; cdecl; external libwebkit;
function webkit_web_view_get_favicon(web_view: PWebKitWebView): PGdkTexture; cdecl; external libwebkit;
function webkit_web_view_get_custom_charset(web_view: PWebKitWebView): Pgchar; cdecl; external libwebkit;
procedure webkit_web_view_set_custom_charset(web_view: PWebKitWebView; charset: Pgchar); cdecl; external libwebkit;
procedure webkit_web_view_set_settings(web_view: PWebKitWebView; settings: PWebKitSettings); cdecl; external libwebkit;
function webkit_web_view_get_settings(web_view: PWebKitWebView): PWebKitSettings; cdecl; external libwebkit;
function webkit_web_view_get_window_properties(web_view: PWebKitWebView): PWebKitWindowProperties; cdecl; external libwebkit;
procedure webkit_web_view_set_zoom_level(web_view: PWebKitWebView; zoom_level: Tgdouble); cdecl; external libwebkit;
function webkit_web_view_get_zoom_level(web_view: PWebKitWebView): Tgdouble; cdecl; external libwebkit;
procedure webkit_web_view_can_execute_editing_command(web_view: PWebKitWebView; command: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_web_view_can_execute_editing_command_finish(web_view: PWebKitWebView; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libwebkit;
procedure webkit_web_view_execute_editing_command(web_view: PWebKitWebView; command: Pgchar); cdecl; external libwebkit;
procedure webkit_web_view_execute_editing_command_with_argument(web_view: PWebKitWebView; command: pchar; argument: pchar); cdecl; external libwebkit;
function webkit_web_view_get_find_controller(web_view: PWebKitWebView): PWebKitFindController; cdecl; external libwebkit;
procedure webkit_web_view_evaluate_javascript(web_view: PWebKitWebView; script: pchar; length: Tgssize; world_name: pchar; source_uri: pchar;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_web_view_evaluate_javascript_finish(web_view: PWebKitWebView; Result: PGAsyncResult; error: PPGError): PJSCValue; cdecl; external libwebkit;
procedure webkit_web_view_call_async_javascript_function(web_view: PWebKitWebView; body: pchar; length: Tgssize; arguments: PGVariant; world_name: pchar;
  source_uri: pchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_web_view_call_async_javascript_function_finish(web_view: PWebKitWebView; Result: PGAsyncResult; error: PPGError): PJSCValue; cdecl; external libwebkit;
function webkit_web_view_get_main_resource(web_view: PWebKitWebView): PWebKitWebResource; cdecl; external libwebkit;
function webkit_web_view_get_inspector(web_view: PWebKitWebView): PWebKitWebInspector; cdecl; external libwebkit;
function webkit_web_view_can_show_mime_type(web_view: PWebKitWebView; mime_type: Pgchar): Tgboolean; cdecl; external libwebkit;
procedure webkit_web_view_save(web_view: PWebKitWebView; save_mode: TWebKitSaveMode; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_web_view_save_finish(web_view: PWebKitWebView; Result: PGAsyncResult; error: PPGError): PGInputStream; cdecl; external libwebkit;
procedure webkit_web_view_save_to_file(web_view: PWebKitWebView; file_: PGFile; save_mode: TWebKitSaveMode; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libwebkit;
function webkit_web_view_save_to_file_finish(web_view: PWebKitWebView; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libwebkit;
function webkit_web_view_download_uri(web_view: PWebKitWebView; uri: pchar): PWebKitDownload; cdecl; external libwebkit;
function webkit_web_view_get_tls_info(web_view: PWebKitWebView; certificate: PPGTlsCertificate; errors: PGTlsCertificateFlags): Tgboolean; cdecl; external libwebkit;
procedure webkit_web_view_get_snapshot(web_view: PWebKitWebView; region: TWebKitSnapshotRegion; options: TWebKitSnapshotOptions; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libwebkit;
function webkit_web_view_get_snapshot_finish(web_view: PWebKitWebView; Result: PGAsyncResult; error: PPGError): PGdkTexture; cdecl; external libwebkit;
function webkit_web_view_get_user_content_manager(web_view: PWebKitWebView): PWebKitUserContentManager; cdecl; external libwebkit;
procedure webkit_web_view_set_background_color(web_view: PWebKitWebView; rgba: PGdkRGBA); cdecl; external libwebkit;
procedure webkit_web_view_get_background_color(web_view: PWebKitWebView; rgba: PGdkRGBA); cdecl; external libwebkit;
function webkit_web_view_is_editable(web_view: PWebKitWebView): Tgboolean; cdecl; external libwebkit;
procedure webkit_web_view_set_editable(web_view: PWebKitWebView; editable: Tgboolean); cdecl; external libwebkit;
function webkit_web_view_get_editor_state(web_view: PWebKitWebView): PWebKitEditorState; cdecl; external libwebkit;
function webkit_web_view_get_session_state(web_view: PWebKitWebView): PWebKitWebViewSessionState; cdecl; external libwebkit;
procedure webkit_web_view_restore_session_state(web_view: PWebKitWebView; state: PWebKitWebViewSessionState); cdecl; external libwebkit;
procedure webkit_web_view_send_message_to_page(web_view: PWebKitWebView; message: PWebKitUserMessage; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_web_view_send_message_to_page_finish(web_view: PWebKitWebView; Result: PGAsyncResult; error: PPGError): PWebKitUserMessage; cdecl; external libwebkit;
procedure webkit_web_view_set_input_method_context(web_view: PWebKitWebView; context: PWebKitInputMethodContext); cdecl; external libwebkit;
function webkit_web_view_get_input_method_context(web_view: PWebKitWebView): PWebKitInputMethodContext; cdecl; external libwebkit;
procedure webkit_web_view_set_cors_allowlist(web_view: PWebKitWebView; allowlist: PPgchar); cdecl; external libwebkit;
function webkit_web_view_get_website_policies(web_view: PWebKitWebView): PWebKitWebsitePolicies; cdecl; external libwebkit;
function webkit_web_view_get_is_web_process_responsive(web_view: PWebKitWebView): Tgboolean; cdecl; external libwebkit;
procedure webkit_web_view_terminate_web_process(web_view: PWebKitWebView); cdecl; external libwebkit;
function webkit_web_view_get_camera_capture_state(web_view: PWebKitWebView): TWebKitMediaCaptureState; cdecl; external libwebkit;
procedure webkit_web_view_set_camera_capture_state(web_view: PWebKitWebView; state: TWebKitMediaCaptureState); cdecl; external libwebkit;
function webkit_web_view_get_microphone_capture_state(web_view: PWebKitWebView): TWebKitMediaCaptureState; cdecl; external libwebkit;
procedure webkit_web_view_set_microphone_capture_state(web_view: PWebKitWebView; state: TWebKitMediaCaptureState); cdecl; external libwebkit;
function webkit_web_view_get_display_capture_state(web_view: PWebKitWebView): TWebKitMediaCaptureState; cdecl; external libwebkit;
procedure webkit_web_view_set_display_capture_state(web_view: PWebKitWebView; state: TWebKitMediaCaptureState); cdecl; external libwebkit;
function webkit_web_view_get_web_extension_mode(web_view: PWebKitWebView): TWebKitWebExtensionMode; cdecl; external libwebkit;
function webkit_web_view_get_default_content_security_policy(web_view: PWebKitWebView): Pgchar; cdecl; external libwebkit;

// === Konventiert am: 2-1-25 17:29:55 ===

function WEBKIT_TYPE_WEB_VIEW: TGType;
function WEBKIT_WEB_VIEW(obj: Pointer): PWebKitWebView;
function WEBKIT_IS_WEB_VIEW(obj: Pointer): Tgboolean;
function WEBKIT_WEB_VIEW_CLASS(klass: Pointer): PWebKitWebViewClass;
function WEBKIT_IS_WEB_VIEW_CLASS(klass: Pointer): Tgboolean;
function WEBKIT_WEB_VIEW_GET_CLASS(obj: Pointer): PWebKitWebViewClass;

implementation

function WEBKIT_TYPE_WEB_VIEW: TGType;
begin
  Result := webkit_web_view_get_type;
end;

function WEBKIT_WEB_VIEW(obj: Pointer): PWebKitWebView;
begin
  Result := PWebKitWebView(g_type_check_instance_cast(obj, WEBKIT_TYPE_WEB_VIEW));
end;

function WEBKIT_IS_WEB_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WEB_VIEW);
end;

function WEBKIT_WEB_VIEW_CLASS(klass: Pointer): PWebKitWebViewClass;
begin
  Result := PWebKitWebViewClass(g_type_check_class_cast(klass, WEBKIT_TYPE_WEB_VIEW));
end;

function WEBKIT_IS_WEB_VIEW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, WEBKIT_TYPE_WEB_VIEW);
end;

function WEBKIT_WEB_VIEW_GET_CLASS(obj: Pointer): PWebKitWebViewClass;
begin
  Result := PWebKitWebViewClass(PGTypeInstance(obj)^.g_class);
end;


end.

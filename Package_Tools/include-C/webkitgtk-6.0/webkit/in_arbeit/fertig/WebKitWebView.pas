unit WebKitWebView;

interface

uses
  fp_glib2, fp_GTK4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2007 Holger Hans Peter Freyther
 * Copyright (C) 2007, 2008 Alp Toker <alp@atoker.com>
 * Copyright (C) 2008 Collabora Ltd.
 * Copyright (C) 2011, 2017 Igalia S.L.
 * Portions Copyright (c) 2011 Motorola Mobility, Inc.  All rights reserved.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitWebView_h}
{$define WebKitWebView_h}
{$include <webkit/WebKitAuthenticationRequest.h>}
{$include <webkit/WebKitBackForwardList.h>}
{$include <webkit/WebKitContextMenu.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitEditorState.h>}
{$include <webkit/WebKitFileChooserRequest.h>}
{$include <webkit/WebKitFindController.h>}
{$include <webkit/WebKitFormSubmissionRequest.h>}
{$include <webkit/WebKitHitTestResult.h>}
{$include <webkit/WebKitInputMethodContext.h>}
{$include <webkit/WebKitNavigationAction.h>}
{$include <webkit/WebKitNotification.h>}
{$include <webkit/WebKitOptionMenu.h>}
{$include <webkit/WebKitPermissionRequest.h>}
{$include <webkit/WebKitPermissionStateQuery.h>}
{$include <webkit/WebKitPolicyDecision.h>}
{$include <webkit/WebKitScriptDialog.h>}
{$include <webkit/WebKitSettings.h>}
{$include <webkit/WebKitURIRequest.h>}
{$include <webkit/WebKitUserContentManager.h>}
{$include <webkit/WebKitUserMessage.h>}
{$include <webkit/WebKitWebContext.h>}
{$include <webkit/WebKitWebResource.h>}
{$include <webkit/WebKitWebViewSessionState.h>}
{$include <webkit/WebKitWebsitePolicies.h>}
{$include <webkit/WebKitWindowProperties.h>}
{$include <webkit/WebKitNetworkSession.h>}
{$include <webkit/WebKitColorChooserRequest.h>}
{$include <webkit/WebKitWebInspector.h>}
{$include <webkit/WebKitWebViewBase.h>}

{WEBKIT_DECLARE_DERIVABLE_TYPE (WebKitWebView, webkit_web_view, WEBKIT, WEB_VIEW, WebKitWebViewBase) }
type
{*
 * WebKitPolicyDecisionType:
 * @WEBKIT_POLICY_DECISION_TYPE_NAVIGATION_ACTION: This type of policy decision
 *   is requested when WebKit is about to navigate to a new page in either the
 *   main frame or a subframe. Acceptable policy decisions are either
 *   webkit_policy_decision_use() or webkit_policy_decision_ignore(). This
 *   type of policy decision is always a #WebKitNavigationPolicyDecision.
 * @WEBKIT_POLICY_DECISION_TYPE_NEW_WINDOW_ACTION: This type of policy decision
 *   is requested when WebKit is about to create a new window. Acceptable policy
 *   decisions are either webkit_policy_decision_use() or
 *   webkit_policy_decision_ignore(). This type of policy decision is always
 *   a #WebKitNavigationPolicyDecision. These decisions are useful for implementing
 *   special actions for new windows, such as forcing the new window to open
 *   in a tab when a keyboard modifier is active or handling a special
 *   target attribute on <a> elements.
 * @WEBKIT_POLICY_DECISION_TYPE_RESPONSE: This type of decision is used when WebKit has
 *   received a response for a network resource and is about to start the load.
 *   Note that these resources include all subresources of a page such as images
 *   and stylesheets as well as main documents. Appropriate policy responses to
 *   this decision are webkit_policy_decision_use(), webkit_policy_decision_ignore(),
 *   or webkit_policy_decision_download(). This type of policy decision is always
 *   a #WebKitResponsePolicyDecision. This decision is useful for forcing
 *   some types of resources to be downloaded rather than rendered in the WebView
 *   or to block the transfer of resources entirely.
 *
 * Enum values used for determining the type of a policy decision during
 * #WebKitWebView::decide-policy.
  }

  PWebKitPolicyDecisionType = ^TWebKitPolicyDecisionType;
  TWebKitPolicyDecisionType =  Longint;
  Const
    WEBKIT_POLICY_DECISION_TYPE_NAVIGATION_ACTION = 0;
    WEBKIT_POLICY_DECISION_TYPE_NEW_WINDOW_ACTION = 1;
    WEBKIT_POLICY_DECISION_TYPE_RESPONSE = 2;
;
{*
 * WebKitLoadEvent:
 * @WEBKIT_LOAD_STARTED: A new load request has been made.
 * No data has been received yet, empty structures have
 * been allocated to perform the load; the load may still
 * fail due to transport issues such as not being able to
 * resolve a name, or connect to a port.
 * @WEBKIT_LOAD_REDIRECTED: A provisional data source received
 * a server redirect.
 * @WEBKIT_LOAD_COMMITTED: The content started arriving for a page load.
 * The necessary transport requirements are established, and the
 * load is being performed.
 * @WEBKIT_LOAD_FINISHED: Load completed. All resources are done loading
 * or there was an error during the load operation.
 *
 * Enum values used to denote the different events that happen during a
 * #WebKitWebView load operation.
  }
type
  PWebKitLoadEvent = ^TWebKitLoadEvent;
  TWebKitLoadEvent =  Longint;
  Const
    WEBKIT_LOAD_STARTED = 0;
    WEBKIT_LOAD_REDIRECTED = 1;
    WEBKIT_LOAD_COMMITTED = 2;
    WEBKIT_LOAD_FINISHED = 3;
;
{*
 * WebKitSaveMode:
 * @WEBKIT_SAVE_MODE_MHTML: Save the current page using the MHTML format.
 *
 * Enum values to specify the different ways in which a #WebKitWebView
 * can save its current web page into a self-contained file.
  }
type
  PWebKitSaveMode = ^TWebKitSaveMode;
  TWebKitSaveMode =  Longint;
  Const
    WEBKIT_SAVE_MODE_MHTML = 0;
;
{*
 * WebKitInsecureContentEvent:
 * @WEBKIT_INSECURE_CONTENT_RUN: Insecure content has been detected by
 * trying to execute any kind of logic (e.g. a script) from an
 * untrusted source.
 * @WEBKIT_INSECURE_CONTENT_DISPLAYED: Insecure content has been
 * detected by trying to display any kind of resource (e.g. an image)
 * from an untrusted source.
 *
 * Enum values previously used to denote the different events which can trigger
 * the detection of insecure content. Since 2.46, WebKit generally no longer
 * loads insecure content in secure contexts.
 *
 * Deprecated: 2.46
  }
type
  PWebKitInsecureContentEvent = ^TWebKitInsecureContentEvent;
  TWebKitInsecureContentEvent =  Longint;
  Const
    WEBKIT_INSECURE_CONTENT_RUN = 0;
    WEBKIT_INSECURE_CONTENT_DISPLAYED = 1;
;
{*
 * WebKitSnapshotOptions:
 * @WEBKIT_SNAPSHOT_OPTIONS_NONE: Do not include any special options.
 * @WEBKIT_SNAPSHOT_OPTIONS_INCLUDE_SELECTION_HIGHLIGHTING: Whether to include in the
 * snapshot the highlight of the selected content.
 * @WEBKIT_SNAPSHOT_OPTIONS_TRANSPARENT_BACKGROUND: Do not fill the background with white before
 * rendering the snapshot. Since 2.8
 *
 * Enum values used to specify options when taking a snapshot
 * from a #WebKitWebView.
  }
type
  PWebKitSnapshotOptions = ^TWebKitSnapshotOptions;
  TWebKitSnapshotOptions =  Longint;
  Const
    WEBKIT_SNAPSHOT_OPTIONS_NONE = 0;
    WEBKIT_SNAPSHOT_OPTIONS_INCLUDE_SELECTION_HIGHLIGHTING = 1 shl 0;
    WEBKIT_SNAPSHOT_OPTIONS_TRANSPARENT_BACKGROUND = 1 shl 1;
;
{*
 * WebKitSnapshotRegion:
 * @WEBKIT_SNAPSHOT_REGION_VISIBLE: Specifies a snapshot only for the area that is
 * visible in the webview
 * @WEBKIT_SNAPSHOT_REGION_FULL_DOCUMENT: A snapshot of the entire document.
 *
 * Enum values used to specify the region from which to get a #WebKitWebView
 * snapshot
  }
type
  PWebKitSnapshotRegion = ^TWebKitSnapshotRegion;
  TWebKitSnapshotRegion =  Longint;
  Const
    WEBKIT_SNAPSHOT_REGION_VISIBLE = 0;
    WEBKIT_SNAPSHOT_REGION_FULL_DOCUMENT = 1;
;
{*
 * WebKitWebProcessTerminationReason:
 * @WEBKIT_WEB_PROCESS_CRASHED: the web process crashed.
 * @WEBKIT_WEB_PROCESS_EXCEEDED_MEMORY_LIMIT: the web process exceeded the memory limit.
 * @WEBKIT_WEB_PROCESS_TERMINATED_BY_API: the web process termination was requested by an API call. Since: 2.34
 *
 * Enum values used to specify the reason why the web process terminated abnormally.
 *
 * Since: 2.20
  }
type
  PWebKitWebProcessTerminationReason = ^TWebKitWebProcessTerminationReason;
  TWebKitWebProcessTerminationReason =  Longint;
  Const
    WEBKIT_WEB_PROCESS_CRASHED = 0;
    WEBKIT_WEB_PROCESS_EXCEEDED_MEMORY_LIMIT = 1;
    WEBKIT_WEB_PROCESS_TERMINATED_BY_API = 2;
;
{*
 * WebKitMediaCaptureState:
 * @WEBKIT_MEDIA_CAPTURE_STATE_NONE: Media capture is disabled.
 * @WEBKIT_MEDIA_CAPTURE_STATE_ACTIVE: Media capture is active.
 * @WEBKIT_MEDIA_CAPTURE_STATE_MUTED: Media capture is muted.
 *
 * Enum values used to specify the capture state of a media device.
 *
 * Since: 2.34
  }
type
  PWebKitMediaCaptureState = ^TWebKitMediaCaptureState;
  TWebKitMediaCaptureState =  Longint;
  Const
    WEBKIT_MEDIA_CAPTURE_STATE_NONE = 0;
    WEBKIT_MEDIA_CAPTURE_STATE_ACTIVE = 1;
    WEBKIT_MEDIA_CAPTURE_STATE_MUTED = 2;
;
{*
 * WebKitWebExtensionMode:
 * @WEBKIT_WEB_EXTENSION_MODE_NONE: Not for an extension.
 * @WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2: For a ManifestV2 extension.
 * @WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3: For a ManifestV3 extension.
 *
 * Enum values used for setting if a #WebKitWebView is intended for
 * WebExtensions.
 *
 * Since: 2.38
  }
type
  PWebKitWebExtensionMode = ^TWebKitWebExtensionMode;
  TWebKitWebExtensionMode =  Longint;
  Const
    WEBKIT_WEB_EXTENSION_MODE_NONE = 0;
    WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2 = 1;
    WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3 = 2;
;
{< public > }
{< private > }
type
  PWebKitWebViewClass = ^TWebKitWebViewClass;
  TWebKitWebViewClass = record
      parent : TWebKitWebViewBaseClass;
      load_changed : procedure (web_view:PWebKitWebView; load_event:TWebKitLoadEvent);cdecl;
      load_failed : function (web_view:PWebKitWebView; load_event:TWebKitLoadEvent; failing_uri:Pgchar; error:PGError):Tgboolean;cdecl;
      create : function (web_view:PWebKitWebView; navigation_action:PWebKitNavigationAction):PGtkWidget;cdecl;
      ready_to_show : procedure (web_view:PWebKitWebView);cdecl;
      run_as_modal : procedure (web_view:PWebKitWebView);cdecl;
      close : procedure (web_view:PWebKitWebView);cdecl;
      script_dialog : function (web_view:PWebKitWebView; dialog:PWebKitScriptDialog):Tgboolean;cdecl;
      decide_policy : function (web_view:PWebKitWebView; decision:PWebKitPolicyDecision; _type:TWebKitPolicyDecisionType):Tgboolean;cdecl;
      permission_request : function (web_view:PWebKitWebView; permission_request:PWebKitPermissionRequest):Tgboolean;cdecl;
      mouse_target_changed : procedure (web_view:PWebKitWebView; hit_test_result:PWebKitHitTestResult; modifiers:Tguint);cdecl;
      print : function (web_view:PWebKitWebView; print_operation:PWebKitPrintOperation):Tgboolean;cdecl;
      resource_load_started : procedure (web_view:PWebKitWebView; resource:PWebKitWebResource; request:PWebKitURIRequest);cdecl;
      enter_fullscreen : function (web_view:PWebKitWebView):Tgboolean;cdecl;
      leave_fullscreen : function (web_view:PWebKitWebView):Tgboolean;cdecl;
      run_file_chooser : function (web_view:PWebKitWebView; request:PWebKitFileChooserRequest):Tgboolean;cdecl;
      context_menu : function (web_view:PWebKitWebView; context_menu:PWebKitContextMenu; hit_test_result:PWebKitHitTestResult):Tgboolean;cdecl;
      context_menu_dismissed : procedure (web_view:PWebKitWebView);cdecl;
      submit_form : procedure (web_view:PWebKitWebView; request:PWebKitFormSubmissionRequest);cdecl;
      insecure_content_detected : procedure (web_view:PWebKitWebView; event:TWebKitInsecureContentEvent);cdecl;
      web_process_crashed : function (web_view:PWebKitWebView):Tgboolean;cdecl;
      authenticate : function (web_view:PWebKitWebView; request:PWebKitAuthenticationRequest):Tgboolean;cdecl;
      load_failed_with_tls_errors : function (web_view:PWebKitWebView; failing_uri:Pgchar; certificate:PGTlsCertificate; errors:TGTlsCertificateFlags):Tgboolean;cdecl;
      show_notification : function (web_view:PWebKitWebView; notification:PWebKitNotification):Tgboolean;cdecl;
      run_color_chooser : function (web_view:PWebKitWebView; request:PWebKitColorChooserRequest):Tgboolean;cdecl;
      show_option_menu : function (web_view:PWebKitWebView; menu:PWebKitOptionMenu; rectangle:PGdkRectangle):Tgboolean;cdecl;
      web_process_terminated : procedure (web_view:PWebKitWebView; reason:TWebKitWebProcessTerminationReason);cdecl;
      user_message_received : function (web_view:PWebKitWebView; message:PWebKitUserMessage):Tgboolean;cdecl;
      query_permission_state : function (web_view:PWebKitWebView; query:PWebKitPermissionStateQuery):Tgboolean;cdecl;
      _webkit_reserved0 : procedure ;cdecl;
      _webkit_reserved1 : procedure ;cdecl;
      _webkit_reserved2 : procedure ;cdecl;
      _webkit_reserved3 : procedure ;cdecl;
      _webkit_reserved4 : procedure ;cdecl;
      _webkit_reserved5 : procedure ;cdecl;
      _webkit_reserved6 : procedure ;cdecl;
      _webkit_reserved7 : procedure ;cdecl;
      _webkit_reserved8 : procedure ;cdecl;
      _webkit_reserved9 : procedure ;cdecl;
      _webkit_reserved10 : procedure ;cdecl;
      _webkit_reserved11 : procedure ;cdecl;
      _webkit_reserved12 : procedure ;cdecl;
      _webkit_reserved13 : procedure ;cdecl;
      _webkit_reserved14 : procedure ;cdecl;
      _webkit_reserved15 : procedure ;cdecl;
      _webkit_reserved16 : procedure ;cdecl;
      _webkit_reserved17 : procedure ;cdecl;
      _webkit_reserved18 : procedure ;cdecl;
      _webkit_reserved19 : procedure ;cdecl;
      _webkit_reserved20 : procedure ;cdecl;
      _webkit_reserved21 : procedure ;cdecl;
      _webkit_reserved22 : procedure ;cdecl;
      _webkit_reserved23 : procedure ;cdecl;
      _webkit_reserved24 : procedure ;cdecl;
      _webkit_reserved25 : procedure ;cdecl;
      _webkit_reserved26 : procedure ;cdecl;
      _webkit_reserved27 : procedure ;cdecl;
      _webkit_reserved28 : procedure ;cdecl;
      _webkit_reserved29 : procedure ;cdecl;
      _webkit_reserved30 : procedure ;cdecl;
    end;


function webkit_web_view_new:PGtkWidget;cdecl;external libwebkit;
function webkit_web_view_is_controlled_by_automation(web_view:PWebKitWebView):Tgboolean;cdecl;external libwebkit;
function webkit_web_view_get_automation_presentation_type(web_view:PWebKitWebView):TWebKitAutomationBrowsingContextPresentation;cdecl;external libwebkit;
function webkit_web_view_get_network_session(web_view:PWebKitWebView):PWebKitNetworkSession;cdecl;external libwebkit;
function webkit_web_view_get_context(web_view:PWebKitWebView):PWebKitWebContext;cdecl;external libwebkit;
procedure webkit_web_view_try_close(web_view:PWebKitWebView);cdecl;external libwebkit;
procedure webkit_web_view_load_uri(web_view:PWebKitWebView; uri:Pgchar);cdecl;external libwebkit;
procedure webkit_web_view_load_html(web_view:PWebKitWebView; content:Pgchar; base_uri:Pgchar);cdecl;external libwebkit;
procedure webkit_web_view_load_alternate_html(web_view:PWebKitWebView; content:Pgchar; content_uri:Pgchar; base_uri:Pgchar);cdecl;external libwebkit;
procedure webkit_web_view_load_plain_text(web_view:PWebKitWebView; plain_text:Pgchar);cdecl;external libwebkit;
procedure webkit_web_view_load_bytes(web_view:PWebKitWebView; bytes:PGBytes; mime_type:Pgchar; encoding:Pgchar; base_uri:Pgchar);cdecl;external libwebkit;
procedure webkit_web_view_load_request(web_view:PWebKitWebView; request:PWebKitURIRequest);cdecl;external libwebkit;
procedure webkit_web_view_stop_loading(web_view:PWebKitWebView);cdecl;external libwebkit;
function webkit_web_view_is_loading(web_view:PWebKitWebView):Tgboolean;cdecl;external libwebkit;
function webkit_web_view_is_playing_audio(web_view:PWebKitWebView):Tgboolean;cdecl;external libwebkit;
procedure webkit_web_view_set_is_muted(web_view:PWebKitWebView; muted:Tgboolean);cdecl;external libwebkit;
function webkit_web_view_get_is_muted(web_view:PWebKitWebView):Tgboolean;cdecl;external libwebkit;
function webkit_web_view_get_page_id(web_view:PWebKitWebView):Tguint64;cdecl;external libwebkit;
function webkit_web_view_get_title(web_view:PWebKitWebView):Pgchar;cdecl;external libwebkit;
procedure webkit_web_view_reload(web_view:PWebKitWebView);cdecl;external libwebkit;
procedure webkit_web_view_reload_bypass_cache(web_view:PWebKitWebView);cdecl;external libwebkit;
function webkit_web_view_get_estimated_load_progress(web_view:PWebKitWebView):Tgdouble;cdecl;external libwebkit;
procedure webkit_web_view_go_back(web_view:PWebKitWebView);cdecl;external libwebkit;
function webkit_web_view_can_go_back(web_view:PWebKitWebView):Tgboolean;cdecl;external libwebkit;
procedure webkit_web_view_go_forward(web_view:PWebKitWebView);cdecl;external libwebkit;
function webkit_web_view_can_go_forward(web_view:PWebKitWebView):Tgboolean;cdecl;external libwebkit;
function webkit_web_view_get_back_forward_list(web_view:PWebKitWebView):PWebKitBackForwardList;cdecl;external libwebkit;
procedure webkit_web_view_go_to_back_forward_list_item(web_view:PWebKitWebView; list_item:PWebKitBackForwardListItem);cdecl;external libwebkit;
function webkit_web_view_get_uri(web_view:PWebKitWebView):Pgchar;cdecl;external libwebkit;
function webkit_web_view_get_favicon(web_view:PWebKitWebView):PGdkTexture;cdecl;external libwebkit;
function webkit_web_view_get_custom_charset(web_view:PWebKitWebView):Pgchar;cdecl;external libwebkit;
procedure webkit_web_view_set_custom_charset(web_view:PWebKitWebView; charset:Pgchar);cdecl;external libwebkit;
procedure webkit_web_view_set_settings(web_view:PWebKitWebView; settings:PWebKitSettings);cdecl;external libwebkit;
function webkit_web_view_get_settings(web_view:PWebKitWebView):PWebKitSettings;cdecl;external libwebkit;
function webkit_web_view_get_window_properties(web_view:PWebKitWebView):PWebKitWindowProperties;cdecl;external libwebkit;
procedure webkit_web_view_set_zoom_level(web_view:PWebKitWebView; zoom_level:Tgdouble);cdecl;external libwebkit;
function webkit_web_view_get_zoom_level(web_view:PWebKitWebView):Tgdouble;cdecl;external libwebkit;
procedure webkit_web_view_can_execute_editing_command(web_view:PWebKitWebView; command:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libwebkit;
function webkit_web_view_can_execute_editing_command_finish(web_view:PWebKitWebView; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libwebkit;
procedure webkit_web_view_execute_editing_command(web_view:PWebKitWebView; command:Pgchar);cdecl;external libwebkit;
procedure webkit_web_view_execute_editing_command_with_argument(web_view:PWebKitWebView; command:Pchar; argument:Pchar);cdecl;external libwebkit;
function webkit_web_view_get_find_controller(web_view:PWebKitWebView):PWebKitFindController;cdecl;external libwebkit;
procedure webkit_web_view_evaluate_javascript(web_view:PWebKitWebView; script:Pchar; length:Tgssize; world_name:Pchar; source_uri:Pchar; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libwebkit;
function webkit_web_view_evaluate_javascript_finish(web_view:PWebKitWebView; result:PGAsyncResult; error:PPGError):PJSCValue;cdecl;external libwebkit;
procedure webkit_web_view_call_async_javascript_function(web_view:PWebKitWebView; body:Pchar; length:Tgssize; arguments:PGVariant; world_name:Pchar; 
            source_uri:Pchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libwebkit;
function webkit_web_view_call_async_javascript_function_finish(web_view:PWebKitWebView; result:PGAsyncResult; error:PPGError):PJSCValue;cdecl;external libwebkit;
function webkit_web_view_get_main_resource(web_view:PWebKitWebView):PWebKitWebResource;cdecl;external libwebkit;
function webkit_web_view_get_inspector(web_view:PWebKitWebView):PWebKitWebInspector;cdecl;external libwebkit;
function webkit_web_view_can_show_mime_type(web_view:PWebKitWebView; mime_type:Pgchar):Tgboolean;cdecl;external libwebkit;
procedure webkit_web_view_save(web_view:PWebKitWebView; save_mode:TWebKitSaveMode; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libwebkit;
function webkit_web_view_save_finish(web_view:PWebKitWebView; result:PGAsyncResult; error:PPGError):PGInputStream;cdecl;external libwebkit;
procedure webkit_web_view_save_to_file(web_view:PWebKitWebView; file:PGFile; save_mode:TWebKitSaveMode; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libwebkit;
function webkit_web_view_save_to_file_finish(web_view:PWebKitWebView; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libwebkit;
function webkit_web_view_download_uri(web_view:PWebKitWebView; uri:Pchar):PWebKitDownload;cdecl;external libwebkit;
function webkit_web_view_get_tls_info(web_view:PWebKitWebView; certificate:PPGTlsCertificate; errors:PGTlsCertificateFlags):Tgboolean;cdecl;external libwebkit;
procedure webkit_web_view_get_snapshot(web_view:PWebKitWebView; region:TWebKitSnapshotRegion; options:TWebKitSnapshotOptions; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libwebkit;
function webkit_web_view_get_snapshot_finish(web_view:PWebKitWebView; result:PGAsyncResult; error:PPGError):PGdkTexture;cdecl;external libwebkit;
function webkit_web_view_get_user_content_manager(web_view:PWebKitWebView):PWebKitUserContentManager;cdecl;external libwebkit;
procedure webkit_web_view_set_background_color(web_view:PWebKitWebView; rgba:PGdkRGBA);cdecl;external libwebkit;
procedure webkit_web_view_get_background_color(web_view:PWebKitWebView; rgba:PGdkRGBA);cdecl;external libwebkit;
function webkit_web_view_is_editable(web_view:PWebKitWebView):Tgboolean;cdecl;external libwebkit;
procedure webkit_web_view_set_editable(web_view:PWebKitWebView; editable:Tgboolean);cdecl;external libwebkit;
function webkit_web_view_get_editor_state(web_view:PWebKitWebView):PWebKitEditorState;cdecl;external libwebkit;
function webkit_web_view_get_session_state(web_view:PWebKitWebView):PWebKitWebViewSessionState;cdecl;external libwebkit;
procedure webkit_web_view_restore_session_state(web_view:PWebKitWebView; state:PWebKitWebViewSessionState);cdecl;external libwebkit;
procedure webkit_web_view_send_message_to_page(web_view:PWebKitWebView; message:PWebKitUserMessage; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libwebkit;
function webkit_web_view_send_message_to_page_finish(web_view:PWebKitWebView; result:PGAsyncResult; error:PPGError):PWebKitUserMessage;cdecl;external libwebkit;
procedure webkit_web_view_set_input_method_context(web_view:PWebKitWebView; context:PWebKitInputMethodContext);cdecl;external libwebkit;
function webkit_web_view_get_input_method_context(web_view:PWebKitWebView):PWebKitInputMethodContext;cdecl;external libwebkit;
procedure webkit_web_view_set_cors_allowlist(web_view:PWebKitWebView; allowlist:PPgchar);cdecl;external libwebkit;
function webkit_web_view_get_website_policies(web_view:PWebKitWebView):PWebKitWebsitePolicies;cdecl;external libwebkit;
function webkit_web_view_get_is_web_process_responsive(web_view:PWebKitWebView):Tgboolean;cdecl;external libwebkit;
procedure webkit_web_view_terminate_web_process(web_view:PWebKitWebView);cdecl;external libwebkit;
function webkit_web_view_get_camera_capture_state(web_view:PWebKitWebView):TWebKitMediaCaptureState;cdecl;external libwebkit;
procedure webkit_web_view_set_camera_capture_state(web_view:PWebKitWebView; state:TWebKitMediaCaptureState);cdecl;external libwebkit;
function webkit_web_view_get_microphone_capture_state(web_view:PWebKitWebView):TWebKitMediaCaptureState;cdecl;external libwebkit;
procedure webkit_web_view_set_microphone_capture_state(web_view:PWebKitWebView; state:TWebKitMediaCaptureState);cdecl;external libwebkit;
function webkit_web_view_get_display_capture_state(web_view:PWebKitWebView):TWebKitMediaCaptureState;cdecl;external libwebkit;
procedure webkit_web_view_set_display_capture_state(web_view:PWebKitWebView; state:TWebKitMediaCaptureState);cdecl;external libwebkit;
function webkit_web_view_get_web_extension_mode(web_view:PWebKitWebView):TWebKitWebExtensionMode;cdecl;external libwebkit;
function webkit_web_view_get_default_content_security_policy(web_view:PWebKitWebView):Pgchar;cdecl;external libwebkit;
{*
 * webkit_web_view_run_async_javascript_function_in_world: (finish-func webkit_web_view_run_javascript_in_world_finish)
 * @web_view: a #WebKitWebView
 * @body: the JavaScript function body
 * @arguments: a #GVariant with format `&sv` storing the function arguments. Function argument values must be one of the following types, or contain only the following GVariant types: number, string, array, and dictionary.
 * @world_name: (nullable): the name of a #WebKitScriptWorld, if no name (i.e. %NULL) is provided, the default world is used. Any value that is not %NULL is a distinct world.
 * @cancellable: (allow-none): a #GCancellable or %NULL to ignore
 * @callback: (scope async): a #GAsyncReadyCallback to call when the script finished
 * @user_data: the data to pass to callback function
 *
 * Asynchronously run @body in the script world with name @world_name of the current page context in
 * @web_view. If WebKitSettings:enable-javascript is FALSE, this method will do nothing. This API
 * differs from webkit_web_view_run_javascript_in_world() in that the JavaScript function can return a
 * Promise and its result will be properly passed to the callback.
 *
 * When the operation is finished, @callback will be called. You can then call
 * webkit_web_view_run_javascript_in_world_finish() to get the result of the operation.
 *
 * For instance here is a dummy example that shows how to pass arguments to a JS function that
 * returns a Promise that resolves with the passed argument:
 *
 * ```c
 * static void
 * web_view_javascript_finished (GObject      *object,
 *                               GAsyncResult *result,
 *                               gpointer      user_data)
 * 
 *     WebKitJavascriptResult *js_result;
 *     JSCValue               *value;
 *     GError                 *error = NULL;
 *
 *     js_result = webkit_web_view_run_javascript_finish (WEBKIT_WEB_VIEW (object), result, &error);
 *     if (!js_result) 
 *         g_warning ("Error running javascript: %s", error->message);
 *         g_error_free (error);
 *         return;
 *     
 *
 *     value = webkit_javascript_result_get_js_value (js_result);
 *     if (jsc_value_is_number (value)) 
 *         gint32        int_value = jsc_value_to_string (value);
 *         JSCException *exception = jsc_context_get_exception (jsc_value_get_context (value));
 *         if (exception)
 *             g_warning ("Error running javascript: %s", jsc_exception_get_message (exception));
 *         else
 *             g_print ("Script result: %d\n", int_value);
 *         g_free (str_value);
 *      else 
 *         g_warning ("Error running javascript: unexpected return value");
 *     
 *     webkit_javascript_result_unref (js_result);
 * 
 *
 * static void
 * web_view_evaluate_promise (WebKitWebView *web_view)
 * 
 *     GVariantDict dict;
 *     g_variant_dict_init (&dict, NULL);
 *     g_variant_dict_insert (&dict, "count", "u", 42);
 *     GVariant *args = g_variant_dict_end (&dict);
 *     const gchar *body = "return new Promise((resolve) =>  resolve(count); );";
 *     webkit_web_view_run_async_javascript_function_in_world (web_view, body, arguments, NULL, NULL, web_view_javascript_finished, NULL);
 * 
 * ```
 *
 * Since: 2.38
 *
 * Deprecated: 2.40: Use webkit_web_view_call_async_javascript_function() instead.
  }
{$endif}

// === Konventiert am: 2-1-25 19:48:44 ===

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

type 
  TWebKitWebView = record
    parent_instance: TWebKitWebViewBase;
    priv: PWebKitWebViewPrivate;
  end;
  PWebKitWebView = ^TWebKitWebView;

  TWebKitWebViewClass = record
  end;
  PWebKitWebViewClass = ^TWebKitWebViewClass;

  TWebKitWebViewPrivate = record
  end;
  PWebKitWebViewPrivate = ^TWebKitWebViewPrivate;

function webkit_web_view_get_type: TGType; cdecl; external libgxxxxxxx;



end.

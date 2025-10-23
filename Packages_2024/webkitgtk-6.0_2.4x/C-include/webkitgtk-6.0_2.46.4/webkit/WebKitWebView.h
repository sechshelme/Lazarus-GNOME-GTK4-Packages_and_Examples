/*
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
 */

#if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit.h> can be included directly."
#endif

#ifndef WebKitWebView_h
#define WebKitWebView_h

#include <webkit/WebKitAuthenticationRequest.h>
#include <webkit/WebKitBackForwardList.h>
#include <webkit/WebKitContextMenu.h>
#include <webkit/WebKitDefines.h>
#include <webkit/WebKitEditorState.h>
#include <webkit/WebKitFileChooserRequest.h>
#include <webkit/WebKitFindController.h>
#include <webkit/WebKitFormSubmissionRequest.h>
#include <webkit/WebKitHitTestResult.h>
#include <webkit/WebKitInputMethodContext.h>
#include <webkit/WebKitNavigationAction.h>
#include <webkit/WebKitNotification.h>
#include <webkit/WebKitOptionMenu.h>
#include <webkit/WebKitPermissionRequest.h>
#include <webkit/WebKitPermissionStateQuery.h>
#include <webkit/WebKitPolicyDecision.h>
#include <webkit/WebKitScriptDialog.h>
#include <webkit/WebKitSettings.h>
#include <webkit/WebKitURIRequest.h>
#include <webkit/WebKitUserContentManager.h>
#include <webkit/WebKitUserMessage.h>
#include <webkit/WebKitWebContext.h>
#include <webkit/WebKitWebResource.h>
#include <webkit/WebKitWebViewSessionState.h>
#include <webkit/WebKitWebsitePolicies.h>
#include <webkit/WebKitWindowProperties.h>

#include <webkit/WebKitNetworkSession.h>

#include <webkit/WebKitColorChooserRequest.h>
#include <webkit/WebKitWebInspector.h>
#include <webkit/WebKitWebViewBase.h>

G_BEGIN_DECLS

#define WEBKIT_TYPE_WEB_VIEW            (webkit_web_view_get_type())

WEBKIT_DECLARE_DERIVABLE_TYPE (WebKitWebView, webkit_web_view, WEBKIT, WEB_VIEW, WebKitWebViewBase)

typedef struct _WebKitPrintOperation WebKitPrintOperation;

/**
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
 */
typedef enum {
    WEBKIT_POLICY_DECISION_TYPE_NAVIGATION_ACTION,
    WEBKIT_POLICY_DECISION_TYPE_NEW_WINDOW_ACTION,
    WEBKIT_POLICY_DECISION_TYPE_RESPONSE,
} WebKitPolicyDecisionType;

/**
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
 */
typedef enum {
    WEBKIT_LOAD_STARTED,
    WEBKIT_LOAD_REDIRECTED,
    WEBKIT_LOAD_COMMITTED,
    WEBKIT_LOAD_FINISHED
} WebKitLoadEvent;

/**
 * WebKitSaveMode:
 * @WEBKIT_SAVE_MODE_MHTML: Save the current page using the MHTML format.
 *
 * Enum values to specify the different ways in which a #WebKitWebView
 * can save its current web page into a self-contained file.
 */
typedef enum {
    WEBKIT_SAVE_MODE_MHTML
} WebKitSaveMode;

/**
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
 */
typedef enum {
    WEBKIT_INSECURE_CONTENT_RUN,
    WEBKIT_INSECURE_CONTENT_DISPLAYED
} WebKitInsecureContentEvent;

/**
 * WebKitSnapshotOptions:
 * @WEBKIT_SNAPSHOT_OPTIONS_NONE: Do not include any special options.
 * @WEBKIT_SNAPSHOT_OPTIONS_INCLUDE_SELECTION_HIGHLIGHTING: Whether to include in the
 * snapshot the highlight of the selected content.
 * @WEBKIT_SNAPSHOT_OPTIONS_TRANSPARENT_BACKGROUND: Do not fill the background with white before
 * rendering the snapshot. Since 2.8
 *
 * Enum values used to specify options when taking a snapshot
 * from a #WebKitWebView.
 */
typedef enum {
  WEBKIT_SNAPSHOT_OPTIONS_NONE = 0,
  WEBKIT_SNAPSHOT_OPTIONS_INCLUDE_SELECTION_HIGHLIGHTING = 1 << 0,
  WEBKIT_SNAPSHOT_OPTIONS_TRANSPARENT_BACKGROUND = 1 << 1,
} WebKitSnapshotOptions;

/**
 * WebKitSnapshotRegion:
 * @WEBKIT_SNAPSHOT_REGION_VISIBLE: Specifies a snapshot only for the area that is
 * visible in the webview
 * @WEBKIT_SNAPSHOT_REGION_FULL_DOCUMENT: A snapshot of the entire document.
 *
 * Enum values used to specify the region from which to get a #WebKitWebView
 * snapshot
 */
typedef enum {
  WEBKIT_SNAPSHOT_REGION_VISIBLE = 0,
  WEBKIT_SNAPSHOT_REGION_FULL_DOCUMENT,
} WebKitSnapshotRegion;

/**
 * WebKitWebProcessTerminationReason:
 * @WEBKIT_WEB_PROCESS_CRASHED: the web process crashed.
 * @WEBKIT_WEB_PROCESS_EXCEEDED_MEMORY_LIMIT: the web process exceeded the memory limit.
 * @WEBKIT_WEB_PROCESS_TERMINATED_BY_API: the web process termination was requested by an API call. Since: 2.34
 *
 * Enum values used to specify the reason why the web process terminated abnormally.
 *
 * Since: 2.20
 */
typedef enum {
    WEBKIT_WEB_PROCESS_CRASHED,
    WEBKIT_WEB_PROCESS_EXCEEDED_MEMORY_LIMIT,
    WEBKIT_WEB_PROCESS_TERMINATED_BY_API
} WebKitWebProcessTerminationReason;

/**
 * WebKitMediaCaptureState:
 * @WEBKIT_MEDIA_CAPTURE_STATE_NONE: Media capture is disabled.
 * @WEBKIT_MEDIA_CAPTURE_STATE_ACTIVE: Media capture is active.
 * @WEBKIT_MEDIA_CAPTURE_STATE_MUTED: Media capture is muted.
 *
 * Enum values used to specify the capture state of a media device.
 *
 * Since: 2.34
 */
typedef enum {
    WEBKIT_MEDIA_CAPTURE_STATE_NONE,
    WEBKIT_MEDIA_CAPTURE_STATE_ACTIVE,
    WEBKIT_MEDIA_CAPTURE_STATE_MUTED,
} WebKitMediaCaptureState;

/**
 * WebKitWebExtensionMode:
 * @WEBKIT_WEB_EXTENSION_MODE_NONE: Not for an extension.
 * @WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2: For a ManifestV2 extension.
 * @WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3: For a ManifestV3 extension.
 *
 * Enum values used for setting if a #WebKitWebView is intended for
 * WebExtensions.
 *
 * Since: 2.38
 */
typedef enum {
    WEBKIT_WEB_EXTENSION_MODE_NONE,
    WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2,
    WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3,
} WebKitWebExtensionMode;


struct _WebKitWebViewClass {
    WebKitWebViewBaseClass parent;

    /*< public >*/
    void       (* load_changed)                (WebKitWebView               *web_view,
                                                WebKitLoadEvent              load_event);
    gboolean   (* load_failed)                 (WebKitWebView               *web_view,
                                                WebKitLoadEvent              load_event,
                                                const gchar                 *failing_uri,
                                                GError                      *error);

    GtkWidget *(* create)                      (WebKitWebView               *web_view,
                                                WebKitNavigationAction      *navigation_action);

    void       (* ready_to_show)               (WebKitWebView               *web_view);
    void       (* run_as_modal)                (WebKitWebView               *web_view);
    void       (* close)                       (WebKitWebView               *web_view);

    gboolean   (* script_dialog)               (WebKitWebView               *web_view,
                                                WebKitScriptDialog          *dialog)  ;

    gboolean   (* decide_policy)               (WebKitWebView               *web_view,
                                                WebKitPolicyDecision        *decision,
                                                WebKitPolicyDecisionType     type);
    gboolean   (* permission_request)          (WebKitWebView               *web_view,
                                                WebKitPermissionRequest     *permission_request);
    void       (* mouse_target_changed)        (WebKitWebView               *web_view,
                                                WebKitHitTestResult         *hit_test_result,
                                                guint                        modifiers);

    gboolean   (* print)                       (WebKitWebView               *web_view,
                                                WebKitPrintOperation        *print_operation);

    void       (* resource_load_started)       (WebKitWebView               *web_view,
                                                WebKitWebResource           *resource,
                                                WebKitURIRequest            *request);
    gboolean   (* enter_fullscreen)            (WebKitWebView               *web_view);
    gboolean   (* leave_fullscreen)            (WebKitWebView               *web_view);
    gboolean   (* run_file_chooser)            (WebKitWebView               *web_view,
                                                WebKitFileChooserRequest    *request);

    gboolean   (* context_menu)                (WebKitWebView               *web_view,
                                                WebKitContextMenu           *context_menu,
                                                WebKitHitTestResult         *hit_test_result);

    void       (* context_menu_dismissed)      (WebKitWebView               *web_view);
    void       (* submit_form)                 (WebKitWebView               *web_view,
                                                WebKitFormSubmissionRequest *request);
    void       (* insecure_content_detected)   (WebKitWebView               *web_view,
                                                WebKitInsecureContentEvent   event);
    gboolean   (* web_process_crashed)         (WebKitWebView               *web_view);

    gboolean   (* authenticate)                (WebKitWebView               *web_view,
                                                WebKitAuthenticationRequest *request);
    gboolean   (* load_failed_with_tls_errors) (WebKitWebView               *web_view,
                                                const gchar                 *failing_uri,
                                                GTlsCertificate             *certificate,
                                                GTlsCertificateFlags         errors);
    gboolean   (* show_notification)           (WebKitWebView               *web_view,
                                                WebKitNotification          *notification);

    gboolean   (* run_color_chooser)           (WebKitWebView               *web_view,
                                                WebKitColorChooserRequest   *request);
    gboolean   (* show_option_menu)            (WebKitWebView               *web_view,
                                                WebKitOptionMenu            *menu,
                                                GdkRectangle                *rectangle);

    void       (* web_process_terminated)      (WebKitWebView               *web_view,
                                                WebKitWebProcessTerminationReason reason);
    gboolean   (* user_message_received)       (WebKitWebView               *web_view,
                                                WebKitUserMessage           *message);


    gboolean   (* query_permission_state)      (WebKitWebView               *web_view,
                                                WebKitPermissionStateQuery  *query);


    /*< private >*/
    void (*_webkit_reserved0)  (void);
    void (*_webkit_reserved1)  (void);
    void (*_webkit_reserved2)  (void);
    void (*_webkit_reserved3)  (void);
    void (*_webkit_reserved4)  (void);
    void (*_webkit_reserved5)  (void);
    void (*_webkit_reserved6)  (void);
    void (*_webkit_reserved7)  (void);
    void (*_webkit_reserved8)  (void);
    void (*_webkit_reserved9)  (void);
    void (*_webkit_reserved10) (void);
    void (*_webkit_reserved11) (void);
    void (*_webkit_reserved12) (void);
    void (*_webkit_reserved13) (void);
    void (*_webkit_reserved14) (void);
    void (*_webkit_reserved15) (void);
    void (*_webkit_reserved16) (void);
    void (*_webkit_reserved17) (void);
    void (*_webkit_reserved18) (void);
    void (*_webkit_reserved19) (void);
    void (*_webkit_reserved20) (void);
    void (*_webkit_reserved21) (void);
    void (*_webkit_reserved22) (void);
    void (*_webkit_reserved23) (void);
    void (*_webkit_reserved24) (void);
    void (*_webkit_reserved25) (void);
    void (*_webkit_reserved26) (void);
    void (*_webkit_reserved27) (void);
    void (*_webkit_reserved28) (void);
    void (*_webkit_reserved29) (void);
    void (*_webkit_reserved30) (void);
};

WEBKIT_API GtkWidget *
webkit_web_view_new                                  (void);




WEBKIT_API gboolean
webkit_web_view_is_controlled_by_automation          (WebKitWebView             *web_view);

WEBKIT_API WebKitAutomationBrowsingContextPresentation
webkit_web_view_get_automation_presentation_type     (WebKitWebView             *web_view);

WEBKIT_API WebKitNetworkSession *
webkit_web_view_get_network_session                  (WebKitWebView             *web_view);

WEBKIT_API WebKitWebContext *
webkit_web_view_get_context                          (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_try_close                            (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_load_uri                             (WebKitWebView             *web_view,
                                                      const gchar               *uri);

WEBKIT_API void
webkit_web_view_load_html                            (WebKitWebView             *web_view,
                                                      const gchar               *content,
                                                      const gchar               *base_uri);
WEBKIT_API void
webkit_web_view_load_alternate_html                  (WebKitWebView             *web_view,
                                                      const gchar               *content,
                                                      const gchar               *content_uri,
                                                      const gchar               *base_uri);
WEBKIT_API void
webkit_web_view_load_plain_text                      (WebKitWebView             *web_view,
                                                      const gchar               *plain_text);

WEBKIT_API void
webkit_web_view_load_bytes                           (WebKitWebView             *web_view,
                                                      GBytes                    *bytes,
                                                      const gchar               *mime_type,
                                                      const gchar               *encoding,
                                                      const gchar               *base_uri);

WEBKIT_API void
webkit_web_view_load_request                         (WebKitWebView             *web_view,
                                                      WebKitURIRequest          *request);

WEBKIT_API void
webkit_web_view_stop_loading                         (WebKitWebView             *web_view);

WEBKIT_API gboolean
webkit_web_view_is_loading                           (WebKitWebView             *web_view);

WEBKIT_API gboolean
webkit_web_view_is_playing_audio                     (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_set_is_muted                         (WebKitWebView             *web_view,
                                                      gboolean                   muted);

WEBKIT_API gboolean
webkit_web_view_get_is_muted                         (WebKitWebView             *web_view);

WEBKIT_API guint64
webkit_web_view_get_page_id                          (WebKitWebView             *web_view);

WEBKIT_API const gchar *
webkit_web_view_get_title                            (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_reload                               (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_reload_bypass_cache                  (WebKitWebView             *web_view);

WEBKIT_API gdouble
webkit_web_view_get_estimated_load_progress          (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_go_back                              (WebKitWebView             *web_view);

WEBKIT_API gboolean
webkit_web_view_can_go_back                          (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_go_forward                           (WebKitWebView             *web_view);

WEBKIT_API gboolean
webkit_web_view_can_go_forward                       (WebKitWebView             *web_view);

WEBKIT_API WebKitBackForwardList *
webkit_web_view_get_back_forward_list                (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_go_to_back_forward_list_item         (WebKitWebView             *web_view,
                                                      WebKitBackForwardListItem *list_item);
WEBKIT_API const gchar *
webkit_web_view_get_uri                              (WebKitWebView             *web_view);

WEBKIT_API GdkTexture *
webkit_web_view_get_favicon                          (WebKitWebView             *web_view);

WEBKIT_API const gchar *
webkit_web_view_get_custom_charset                   (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_set_custom_charset                   (WebKitWebView             *web_view,
                                                      const gchar               *charset);

WEBKIT_API void
webkit_web_view_set_settings                         (WebKitWebView             *web_view,
                                                      WebKitSettings            *settings);

WEBKIT_API WebKitSettings *
webkit_web_view_get_settings                         (WebKitWebView             *web_view);

WEBKIT_API WebKitWindowProperties *
webkit_web_view_get_window_properties                (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_set_zoom_level                       (WebKitWebView             *web_view,
                                                      gdouble                    zoom_level);
WEBKIT_API gdouble
webkit_web_view_get_zoom_level                       (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_can_execute_editing_command          (WebKitWebView             *web_view,
                                                      const gchar               *command,
                                                      GCancellable              *cancellable,
                                                      GAsyncReadyCallback        callback,
                                                      gpointer                   user_data);

WEBKIT_API gboolean
webkit_web_view_can_execute_editing_command_finish   (WebKitWebView             *web_view,
                                                      GAsyncResult              *result,
                                                      GError                   **error);

WEBKIT_API void
webkit_web_view_execute_editing_command              (WebKitWebView             *web_view,
                                                      const gchar               *command);

WEBKIT_API void
webkit_web_view_execute_editing_command_with_argument(WebKitWebView             *web_view,
                                                      const char                *command,
                                                      const char                *argument);

WEBKIT_API WebKitFindController *
webkit_web_view_get_find_controller                  (WebKitWebView             *web_view);


WEBKIT_API void
webkit_web_view_evaluate_javascript                  (WebKitWebView             *web_view,
                                                      const char                *script,
                                                      gssize                     length,
                                                      const char                *world_name,
                                                      const char                *source_uri,
                                                      GCancellable              *cancellable,
                                                      GAsyncReadyCallback        callback,
                                                      gpointer                   user_data);

WEBKIT_API JSCValue *
webkit_web_view_evaluate_javascript_finish           (WebKitWebView             *web_view,
                                                      GAsyncResult              *result,
                                                      GError                   **error);

WEBKIT_API void
webkit_web_view_call_async_javascript_function       (WebKitWebView             *web_view,
                                                      const char                *body,
                                                      gssize                     length,
                                                      GVariant                  *arguments,
                                                      const char                *world_name,
                                                      const char                *source_uri,
                                                      GCancellable              *cancellable,
                                                      GAsyncReadyCallback        callback,
                                                      gpointer                   user_data);

WEBKIT_API JSCValue *
webkit_web_view_call_async_javascript_function_finish(WebKitWebView             *web_view,
                                                      GAsyncResult              *result,
                                                      GError                   **error);


WEBKIT_API WebKitWebResource *
webkit_web_view_get_main_resource                    (WebKitWebView             *web_view);

WEBKIT_API WebKitWebInspector *
webkit_web_view_get_inspector                        (WebKitWebView             *web_view);

WEBKIT_API gboolean
webkit_web_view_can_show_mime_type                   (WebKitWebView             *web_view,
                                                      const gchar               *mime_type);

WEBKIT_API void
webkit_web_view_save                                 (WebKitWebView             *web_view,
                                                      WebKitSaveMode             save_mode,
                                                      GCancellable              *cancellable,
                                                      GAsyncReadyCallback        callback,
                                                      gpointer                   user_data);

WEBKIT_API GInputStream *
webkit_web_view_save_finish                          (WebKitWebView             *web_view,
                                                      GAsyncResult              *result,
                                                      GError                   **error);

WEBKIT_API void
webkit_web_view_save_to_file                         (WebKitWebView             *web_view,
                                                      GFile                     *file,
                                                      WebKitSaveMode             save_mode,
                                                      GCancellable              *cancellable,
                                                      GAsyncReadyCallback        callback,
                                                      gpointer                   user_data);

WEBKIT_API gboolean
webkit_web_view_save_to_file_finish                  (WebKitWebView             *web_view,
                                                      GAsyncResult              *result,
                                                      GError                   **error);

WEBKIT_API WebKitDownload *
webkit_web_view_download_uri                         (WebKitWebView             *web_view,
                                                      const char                *uri);

WEBKIT_API gboolean
webkit_web_view_get_tls_info                         (WebKitWebView             *web_view,
                                                      GTlsCertificate          **certificate,
                                                      GTlsCertificateFlags      *errors);

WEBKIT_API void
webkit_web_view_get_snapshot                         (WebKitWebView             *web_view,
                                                      WebKitSnapshotRegion       region,
                                                      WebKitSnapshotOptions      options,
                                                      GCancellable              *cancellable,
                                                      GAsyncReadyCallback        callback,
                                                      gpointer                   user_data);
WEBKIT_API GdkTexture *
webkit_web_view_get_snapshot_finish                  (WebKitWebView             *web_view,
                                                      GAsyncResult              *result,
                                                      GError                   **error);

WEBKIT_API WebKitUserContentManager *
webkit_web_view_get_user_content_manager             (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_set_background_color                 (WebKitWebView             *web_view,
                                                      const GdkRGBA             *rgba);

WEBKIT_API void
webkit_web_view_get_background_color                 (WebKitWebView             *web_view,
                                                      GdkRGBA                   *rgba);


WEBKIT_API gboolean
webkit_web_view_is_editable                          (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_set_editable                         (WebKitWebView             *web_view,
                                                      gboolean                  editable);

WEBKIT_API WebKitEditorState *
webkit_web_view_get_editor_state                     (WebKitWebView             *web_view);

WEBKIT_API WebKitWebViewSessionState *
webkit_web_view_get_session_state                    (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_restore_session_state                (WebKitWebView             *web_view,
                                                      WebKitWebViewSessionState *state);


WEBKIT_API void
webkit_web_view_send_message_to_page                 (WebKitWebView             *web_view,
                                                      WebKitUserMessage         *message,
                                                      GCancellable              *cancellable,
                                                      GAsyncReadyCallback        callback,
                                                      gpointer                   user_data);

WEBKIT_API WebKitUserMessage *
webkit_web_view_send_message_to_page_finish          (WebKitWebView             *web_view,
                                                      GAsyncResult              *result,
                                                      GError                   **error);

WEBKIT_API void
webkit_web_view_set_input_method_context             (WebKitWebView             *web_view,
                                                      WebKitInputMethodContext  *context);

WEBKIT_API WebKitInputMethodContext *
webkit_web_view_get_input_method_context             (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_set_cors_allowlist                   (WebKitWebView             *web_view,
                                                      const gchar * const       *allowlist);

WEBKIT_API WebKitWebsitePolicies *
webkit_web_view_get_website_policies                 (WebKitWebView             *web_view);

WEBKIT_API gboolean
webkit_web_view_get_is_web_process_responsive        (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_terminate_web_process                (WebKitWebView             *web_view);

WEBKIT_API WebKitMediaCaptureState
webkit_web_view_get_camera_capture_state             (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_set_camera_capture_state             (WebKitWebView             *web_view,
                                                      WebKitMediaCaptureState    state);

WEBKIT_API WebKitMediaCaptureState
webkit_web_view_get_microphone_capture_state         (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_set_microphone_capture_state         (WebKitWebView             *web_view,
                                                      WebKitMediaCaptureState    state);

WEBKIT_API WebKitMediaCaptureState
webkit_web_view_get_display_capture_state            (WebKitWebView             *web_view);

WEBKIT_API void
webkit_web_view_set_display_capture_state            (WebKitWebView             *web_view,
                                                      WebKitMediaCaptureState    state);

WEBKIT_API WebKitWebExtensionMode
webkit_web_view_get_web_extension_mode               (WebKitWebView             *web_view);

WEBKIT_API const gchar*
webkit_web_view_get_default_content_security_policy  (WebKitWebView             *web_view);

/**
 * webkit_web_view_run_async_javascript_function_in_world: (finish-func webkit_web_view_run_javascript_in_world_finish)
 * @web_view: a #WebKitWebView
 * @body: the JavaScript function body
 * @arguments: a #GVariant with format `{&sv}` storing the function arguments. Function argument values must be one of the following types, or contain only the following GVariant types: number, string, array, and dictionary.
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
 * {
 *     WebKitJavascriptResult *js_result;
 *     JSCValue               *value;
 *     GError                 *error = NULL;
 *
 *     js_result = webkit_web_view_run_javascript_finish (WEBKIT_WEB_VIEW (object), result, &error);
 *     if (!js_result) {
 *         g_warning ("Error running javascript: %s", error->message);
 *         g_error_free (error);
 *         return;
 *     }
 *
 *     value = webkit_javascript_result_get_js_value (js_result);
 *     if (jsc_value_is_number (value)) {
 *         gint32        int_value = jsc_value_to_string (value);
 *         JSCException *exception = jsc_context_get_exception (jsc_value_get_context (value));
 *         if (exception)
 *             g_warning ("Error running javascript: %s", jsc_exception_get_message (exception));
 *         else
 *             g_print ("Script result: %d\n", int_value);
 *         g_free (str_value);
 *     } else {
 *         g_warning ("Error running javascript: unexpected return value");
 *     }
 *     webkit_javascript_result_unref (js_result);
 * }
 *
 * static void
 * web_view_evaluate_promise (WebKitWebView *web_view)
 * {
 *     GVariantDict dict;
 *     g_variant_dict_init (&dict, NULL);
 *     g_variant_dict_insert (&dict, "count", "u", 42);
 *     GVariant *args = g_variant_dict_end (&dict);
 *     const gchar *body = "return new Promise((resolve) => { resolve(count); });";
 *     webkit_web_view_run_async_javascript_function_in_world (web_view, body, arguments, NULL, NULL, web_view_javascript_finished, NULL);
 * }
 * ```
 *
 * Since: 2.38
 *
 * Deprecated: 2.40: Use webkit_web_view_call_async_javascript_function() instead.
 */

G_END_DECLS

#endif

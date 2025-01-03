
unit WebKitSettings;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitSettings.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitSettings.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
PGError  = ^GError;
PGKeyFile  = ^GKeyFile;
PWebKitFeature  = ^WebKitFeature;
PWebKitFeatureList  = ^WebKitFeatureList;
PWebKitHardwareAccelerationPolicy  = ^WebKitHardwareAccelerationPolicy;
PWebKitSettings  = ^WebKitSettings;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2011 Motorola Mobility, Inc.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation and/or
 * other materials provided with the distribution.
 *
 * Neither the name of Motorola Mobility, Inc. nor the names of its contributors may
 * be used to endorse or promote products derived from this software without
 * specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  }
{$ifndef WebKitSettings_h}
{$define WebKitSettings_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_SETTINGS : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitSettings, webkit_settings, WEBKIT, SETTINGS, GObject) }
{*
 * WebKitHardwareAccelerationPolicy:
 * @WEBKIT_HARDWARE_ACCELERATION_POLICY_ALWAYS: Hardware acceleration is always enabled, even for websites not requesting it.
 * @WEBKIT_HARDWARE_ACCELERATION_POLICY_NEVER: Hardware acceleration is always disabled, even for websites requesting it.
 *
 * Enum values used for determining the hardware acceleration policy.
 *
 * Since: 2.16
  }
type
  PWebKitHardwareAccelerationPolicy = ^TWebKitHardwareAccelerationPolicy;
  TWebKitHardwareAccelerationPolicy =  Longint;
  Const
    WEBKIT_HARDWARE_ACCELERATION_POLICY_ALWAYS = 0;
    WEBKIT_HARDWARE_ACCELERATION_POLICY_NEVER = 1;
;

function webkit_settings_new:PWebKitSettings;cdecl;external;
(* Const before type ignored *)
function webkit_settings_new_with_settings(first_setting_name:Pgchar; args:array of const):PWebKitSettings;cdecl;external;
function webkit_settings_new_with_settings(first_setting_name:Pgchar):PWebKitSettings;cdecl;external;
function webkit_settings_get_enable_javascript(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_javascript(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_auto_load_images(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_auto_load_images(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_load_icons_ignoring_image_load_setting(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_load_icons_ignoring_image_load_setting(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_offline_web_application_cache(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_offline_web_application_cache(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_html5_local_storage(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_html5_local_storage(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_html5_database(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_html5_database(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_javascript_can_open_windows_automatically(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_javascript_can_open_windows_automatically(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_hyperlink_auditing(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_hyperlink_auditing(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
(* Const before type ignored *)
function webkit_settings_get_default_font_family(settings:PWebKitSettings):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_settings_set_default_font_family(settings:PWebKitSettings; default_font_family:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_settings_get_monospace_font_family(settings:PWebKitSettings):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_settings_set_monospace_font_family(settings:PWebKitSettings; monospace_font_family:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_settings_get_serif_font_family(settings:PWebKitSettings):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_settings_set_serif_font_family(settings:PWebKitSettings; serif_font_family:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_settings_get_sans_serif_font_family(settings:PWebKitSettings):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_settings_set_sans_serif_font_family(settings:PWebKitSettings; sans_serif_font_family:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_settings_get_cursive_font_family(settings:PWebKitSettings):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_settings_set_cursive_font_family(settings:PWebKitSettings; cursive_font_family:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_settings_get_fantasy_font_family(settings:PWebKitSettings):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_settings_set_fantasy_font_family(settings:PWebKitSettings; fantasy_font_family:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_settings_get_pictograph_font_family(settings:PWebKitSettings):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_settings_set_pictograph_font_family(settings:PWebKitSettings; pictograph_font_family:Pgchar);cdecl;external;
function webkit_settings_get_default_font_size(settings:PWebKitSettings):Tguint32;cdecl;external;
procedure webkit_settings_set_default_font_size(settings:PWebKitSettings; font_size:Tguint32);cdecl;external;
function webkit_settings_get_default_monospace_font_size(settings:PWebKitSettings):Tguint32;cdecl;external;
procedure webkit_settings_set_default_monospace_font_size(settings:PWebKitSettings; font_size:Tguint32);cdecl;external;
function webkit_settings_get_minimum_font_size(settings:PWebKitSettings):Tguint32;cdecl;external;
procedure webkit_settings_set_minimum_font_size(settings:PWebKitSettings; font_size:Tguint32);cdecl;external;
(* Const before type ignored *)
function webkit_settings_get_default_charset(settings:PWebKitSettings):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_settings_set_default_charset(settings:PWebKitSettings; default_charset:Pgchar);cdecl;external;
function webkit_settings_get_enable_developer_extras(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_developer_extras(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_resizable_text_areas(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_resizable_text_areas(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_tabs_to_links(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_tabs_to_links(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_dns_prefetching(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_dns_prefetching(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_caret_browsing(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_caret_browsing(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_fullscreen(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_fullscreen(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_print_backgrounds(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_print_backgrounds(settings:PWebKitSettings; print_backgrounds:Tgboolean);cdecl;external;
function webkit_settings_get_enable_webaudio(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_webaudio(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_webgl(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_webgl(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
procedure webkit_settings_set_allow_modal_dialogs(settings:PWebKitSettings; allowed:Tgboolean);cdecl;external;
function webkit_settings_get_allow_modal_dialogs(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_zoom_text_only(settings:PWebKitSettings; zoom_text_only:Tgboolean);cdecl;external;
function webkit_settings_get_zoom_text_only(settings:PWebKitSettings):Tgboolean;cdecl;external;
function webkit_settings_get_javascript_can_access_clipboard(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_javascript_can_access_clipboard(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_media_playback_requires_user_gesture(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_media_playback_requires_user_gesture(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_media_playback_allows_inline(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_media_playback_allows_inline(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_draw_compositing_indicators(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_draw_compositing_indicators(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_site_specific_quirks(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_site_specific_quirks(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_page_cache(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_page_cache(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
(* Const before type ignored *)
function webkit_settings_get_user_agent(settings:PWebKitSettings):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_settings_set_user_agent(settings:PWebKitSettings; user_agent:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure webkit_settings_set_user_agent_with_application_details(settings:PWebKitSettings; application_name:Pgchar; application_version:Pgchar);cdecl;external;
function webkit_settings_get_enable_smooth_scrolling(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_smooth_scrolling(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_2d_canvas_acceleration(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_2d_canvas_acceleration(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_write_console_messages_to_stdout(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_write_console_messages_to_stdout(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_media_stream(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_media_stream(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_mock_capture_devices(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_mock_capture_devices(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_spatial_navigation(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_spatial_navigation(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_mediasource(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_mediasource(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_encrypted_media(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_encrypted_media(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_media_capabilities(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_media_capabilities(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_allow_file_access_from_file_urls(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_allow_file_access_from_file_urls(settings:PWebKitSettings; allowed:Tgboolean);cdecl;external;
function webkit_settings_get_allow_universal_access_from_file_urls(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_allow_universal_access_from_file_urls(settings:PWebKitSettings; allowed:Tgboolean);cdecl;external;
function webkit_settings_get_allow_top_navigation_to_data_urls(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_allow_top_navigation_to_data_urls(settings:PWebKitSettings; allowed:Tgboolean);cdecl;external;
function webkit_settings_get_hardware_acceleration_policy(settings:PWebKitSettings):TWebKitHardwareAccelerationPolicy;cdecl;external;
procedure webkit_settings_set_hardware_acceleration_policy(settings:PWebKitSettings; policy:TWebKitHardwareAccelerationPolicy);cdecl;external;
function webkit_settings_get_enable_back_forward_navigation_gestures(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_back_forward_navigation_gestures(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_font_size_to_points(pixels:Tguint32):Tguint32;cdecl;external;
function webkit_settings_font_size_to_pixels(points:Tguint32):Tguint32;cdecl;external;
function webkit_settings_get_enable_javascript_markup(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_javascript_markup(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_enable_media(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_media(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
(* Const before type ignored *)
function webkit_settings_get_media_content_types_requiring_hardware_support(settings:PWebKitSettings):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_settings_set_media_content_types_requiring_hardware_support(settings:PWebKitSettings; content_types:Pgchar);cdecl;external;
function webkit_settings_get_enable_webrtc(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_enable_webrtc(settings:PWebKitSettings; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_disable_web_security(settings:PWebKitSettings):Tgboolean;cdecl;external;
procedure webkit_settings_set_disable_web_security(settings:PWebKitSettings; disabled:Tgboolean);cdecl;external;
type

procedure webkit_settings_set_feature_enabled(settings:PWebKitSettings; feature:PWebKitFeature; enabled:Tgboolean);cdecl;external;
function webkit_settings_get_feature_enabled(settings:PWebKitSettings; feature:PWebKitFeature):Tgboolean;cdecl;external;
function webkit_settings_get_all_features:PWebKitFeatureList;cdecl;external;
function webkit_settings_get_experimental_features:PWebKitFeatureList;cdecl;external;
function webkit_settings_get_development_features:PWebKitFeatureList;cdecl;external;
(* Const before type ignored *)
function webkit_settings_apply_from_key_file(settings:PWebKitSettings; key_file:PGKeyFile; group_name:Pgchar; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ WebKitSettings_h  }

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_SETTINGS : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_SETTINGS:=webkit_settings_get_type;
  end;


end.

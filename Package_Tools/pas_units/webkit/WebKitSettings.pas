unit WebKitSettings;

interface

uses
  fp_glib2, fp_GTK4, web_common, WebKitFeature;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitSettings, webkit_settings, WEBKIT, SETTINGS, GObject) }
type
  PWebKitHardwareAccelerationPolicy = ^TWebKitHardwareAccelerationPolicy;
  TWebKitHardwareAccelerationPolicy = longint;

const
  WEBKIT_HARDWARE_ACCELERATION_POLICY_ALWAYS = 0;
  WEBKIT_HARDWARE_ACCELERATION_POLICY_NEVER = 1;

type
  TWebKitSettings = record
  end;
  PWebKitSettings = ^TWebKitSettings;

  TWebKitSettingsClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitSettingsClass = ^TWebKitSettingsClass;

function webkit_settings_get_type: TGType; cdecl; external libwebkit;
function webkit_settings_new: PWebKitSettings; cdecl; external libwebkit;
function webkit_settings_new_with_settings(first_setting_name: Pgchar; args: array of const): PWebKitSettings; cdecl; external libwebkit;
function webkit_settings_new_with_settings(first_setting_name: Pgchar): PWebKitSettings; cdecl; external libwebkit;
function webkit_settings_get_enable_javascript(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_javascript(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_auto_load_images(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_auto_load_images(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_load_icons_ignoring_image_load_setting(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_load_icons_ignoring_image_load_setting(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_offline_web_application_cache(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_offline_web_application_cache(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_html5_local_storage(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_html5_local_storage(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_html5_database(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_html5_database(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_javascript_can_open_windows_automatically(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_javascript_can_open_windows_automatically(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_hyperlink_auditing(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_hyperlink_auditing(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_default_font_family(settings: PWebKitSettings): Pgchar; cdecl; external libwebkit;
procedure webkit_settings_set_default_font_family(settings: PWebKitSettings; default_font_family: Pgchar); cdecl; external libwebkit;
function webkit_settings_get_monospace_font_family(settings: PWebKitSettings): Pgchar; cdecl; external libwebkit;
procedure webkit_settings_set_monospace_font_family(settings: PWebKitSettings; monospace_font_family: Pgchar); cdecl; external libwebkit;
function webkit_settings_get_serif_font_family(settings: PWebKitSettings): Pgchar; cdecl; external libwebkit;
procedure webkit_settings_set_serif_font_family(settings: PWebKitSettings; serif_font_family: Pgchar); cdecl; external libwebkit;
function webkit_settings_get_sans_serif_font_family(settings: PWebKitSettings): Pgchar; cdecl; external libwebkit;
procedure webkit_settings_set_sans_serif_font_family(settings: PWebKitSettings; sans_serif_font_family: Pgchar); cdecl; external libwebkit;
function webkit_settings_get_cursive_font_family(settings: PWebKitSettings): Pgchar; cdecl; external libwebkit;
procedure webkit_settings_set_cursive_font_family(settings: PWebKitSettings; cursive_font_family: Pgchar); cdecl; external libwebkit;
function webkit_settings_get_fantasy_font_family(settings: PWebKitSettings): Pgchar; cdecl; external libwebkit;
procedure webkit_settings_set_fantasy_font_family(settings: PWebKitSettings; fantasy_font_family: Pgchar); cdecl; external libwebkit;
function webkit_settings_get_pictograph_font_family(settings: PWebKitSettings): Pgchar; cdecl; external libwebkit;
procedure webkit_settings_set_pictograph_font_family(settings: PWebKitSettings; pictograph_font_family: Pgchar); cdecl; external libwebkit;
function webkit_settings_get_default_font_size(settings: PWebKitSettings): Tguint32; cdecl; external libwebkit;
procedure webkit_settings_set_default_font_size(settings: PWebKitSettings; font_size: Tguint32); cdecl; external libwebkit;
function webkit_settings_get_default_monospace_font_size(settings: PWebKitSettings): Tguint32; cdecl; external libwebkit;
procedure webkit_settings_set_default_monospace_font_size(settings: PWebKitSettings; font_size: Tguint32); cdecl; external libwebkit;
function webkit_settings_get_minimum_font_size(settings: PWebKitSettings): Tguint32; cdecl; external libwebkit;
procedure webkit_settings_set_minimum_font_size(settings: PWebKitSettings; font_size: Tguint32); cdecl; external libwebkit;
function webkit_settings_get_default_charset(settings: PWebKitSettings): Pgchar; cdecl; external libwebkit;
procedure webkit_settings_set_default_charset(settings: PWebKitSettings; default_charset: Pgchar); cdecl; external libwebkit;
function webkit_settings_get_enable_developer_extras(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_developer_extras(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_resizable_text_areas(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_resizable_text_areas(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_tabs_to_links(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_tabs_to_links(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_dns_prefetching(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_dns_prefetching(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_caret_browsing(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_caret_browsing(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_fullscreen(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_fullscreen(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_print_backgrounds(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_print_backgrounds(settings: PWebKitSettings; print_backgrounds: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_webaudio(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_webaudio(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_webgl(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_webgl(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
procedure webkit_settings_set_allow_modal_dialogs(settings: PWebKitSettings; allowed: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_allow_modal_dialogs(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_zoom_text_only(settings: PWebKitSettings; zoom_text_only: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_zoom_text_only(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
function webkit_settings_get_javascript_can_access_clipboard(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_javascript_can_access_clipboard(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_media_playback_requires_user_gesture(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_media_playback_requires_user_gesture(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_media_playback_allows_inline(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_media_playback_allows_inline(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_draw_compositing_indicators(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_draw_compositing_indicators(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_site_specific_quirks(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_site_specific_quirks(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_page_cache(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_page_cache(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_user_agent(settings: PWebKitSettings): Pgchar; cdecl; external libwebkit;
procedure webkit_settings_set_user_agent(settings: PWebKitSettings; user_agent: Pgchar); cdecl; external libwebkit;
procedure webkit_settings_set_user_agent_with_application_details(settings: PWebKitSettings; application_name: Pgchar; application_version: Pgchar); cdecl; external libwebkit;
function webkit_settings_get_enable_smooth_scrolling(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_smooth_scrolling(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_2d_canvas_acceleration(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_2d_canvas_acceleration(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_write_console_messages_to_stdout(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_write_console_messages_to_stdout(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_media_stream(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_media_stream(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_mock_capture_devices(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_mock_capture_devices(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_spatial_navigation(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_spatial_navigation(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_mediasource(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_mediasource(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_encrypted_media(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_encrypted_media(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_media_capabilities(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_media_capabilities(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_allow_file_access_from_file_urls(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_allow_file_access_from_file_urls(settings: PWebKitSettings; allowed: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_allow_universal_access_from_file_urls(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_allow_universal_access_from_file_urls(settings: PWebKitSettings; allowed: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_allow_top_navigation_to_data_urls(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_allow_top_navigation_to_data_urls(settings: PWebKitSettings; allowed: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_hardware_acceleration_policy(settings: PWebKitSettings): TWebKitHardwareAccelerationPolicy; cdecl; external libwebkit;
procedure webkit_settings_set_hardware_acceleration_policy(settings: PWebKitSettings; policy: TWebKitHardwareAccelerationPolicy); cdecl; external libwebkit;
function webkit_settings_get_enable_back_forward_navigation_gestures(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_back_forward_navigation_gestures(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_font_size_to_points(pixels: Tguint32): Tguint32; cdecl; external libwebkit;
function webkit_settings_font_size_to_pixels(points: Tguint32): Tguint32; cdecl; external libwebkit;
function webkit_settings_get_enable_javascript_markup(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_javascript_markup(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_enable_media(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_media(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_media_content_types_requiring_hardware_support(settings: PWebKitSettings): Pgchar; cdecl; external libwebkit;
procedure webkit_settings_set_media_content_types_requiring_hardware_support(settings: PWebKitSettings; content_types: Pgchar); cdecl; external libwebkit;
function webkit_settings_get_enable_webrtc(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_enable_webrtc(settings: PWebKitSettings; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_disable_web_security(settings: PWebKitSettings): Tgboolean; cdecl; external libwebkit;
procedure webkit_settings_set_disable_web_security(settings: PWebKitSettings; disabled: Tgboolean); cdecl; external libwebkit;
procedure webkit_settings_set_feature_enabled(settings: PWebKitSettings; feature: PWebKitFeature; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_settings_get_feature_enabled(settings: PWebKitSettings; feature: PWebKitFeature): Tgboolean; cdecl; external libwebkit;
function webkit_settings_get_all_features: PWebKitFeatureList; cdecl; external libwebkit;
function webkit_settings_get_experimental_features: PWebKitFeatureList; cdecl; external libwebkit;
function webkit_settings_get_development_features: PWebKitFeatureList; cdecl; external libwebkit;
function webkit_settings_apply_from_key_file(settings: PWebKitSettings; key_file: PGKeyFile; group_name: Pgchar; error: PPGError): Tgboolean; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 19:43:05 ===

function WEBKIT_TYPE_SETTINGS: TGType;
function WEBKIT_SETTINGS(obj: Pointer): PWebKitSettings;
function WEBKIT_IS_SETTINGS(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_SETTINGS: TGType;
begin
  Result := webkit_settings_get_type;
end;

function WEBKIT_SETTINGS(obj: Pointer): PWebKitSettings;
begin
  Result := PWebKitSettings(g_type_check_instance_cast(obj, WEBKIT_TYPE_SETTINGS));
end;

function WEBKIT_IS_SETTINGS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_SETTINGS);
end;


end.

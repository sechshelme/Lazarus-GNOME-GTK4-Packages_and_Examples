/*
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
 */


#ifndef WebKitSettings_h
#define WebKitSettings_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_SETTINGS            (webkit_settings_get_type())

WEBKIT_DECLARE_FINAL_TYPE (WebKitSettings, webkit_settings, WEBKIT, SETTINGS, GObject)

/**
 * WebKitHardwareAccelerationPolicy:
 * @WEBKIT_HARDWARE_ACCELERATION_POLICY_ALWAYS: Hardware acceleration is always enabled, even for websites not requesting it.
 * @WEBKIT_HARDWARE_ACCELERATION_POLICY_NEVER: Hardware acceleration is always disabled, even for websites requesting it.
 *
 * Enum values used for determining the hardware acceleration policy.
 *
 * Since: 2.16
 */
typedef enum {
    WEBKIT_HARDWARE_ACCELERATION_POLICY_ALWAYS,
    WEBKIT_HARDWARE_ACCELERATION_POLICY_NEVER
} WebKitHardwareAccelerationPolicy;

extern WebKitSettings *
webkit_settings_new                                            (void);

extern WebKitSettings *
webkit_settings_new_with_settings                              (const gchar    *first_setting_name,
                                                                ...);

extern gboolean
webkit_settings_get_enable_javascript                          (WebKitSettings *settings);

extern void
webkit_settings_set_enable_javascript                          (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_auto_load_images                           (WebKitSettings *settings);

extern void
webkit_settings_set_auto_load_images                           (WebKitSettings *settings,
                                                                gboolean        enabled);

WEBKIT_DEPRECATED gboolean
webkit_settings_get_load_icons_ignoring_image_load_setting     (WebKitSettings *settings);

WEBKIT_DEPRECATED void
webkit_settings_set_load_icons_ignoring_image_load_setting     (WebKitSettings *settings,
                                                                gboolean        enabled);

WEBKIT_DEPRECATED gboolean
webkit_settings_get_enable_offline_web_application_cache       (WebKitSettings *settings);

WEBKIT_DEPRECATED void
webkit_settings_set_enable_offline_web_application_cache       (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_html5_local_storage                 (WebKitSettings *settings);

extern void
webkit_settings_set_enable_html5_local_storage                 (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_html5_database                      (WebKitSettings *settings);

extern void
webkit_settings_set_enable_html5_database                      (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_javascript_can_open_windows_automatically  (WebKitSettings *settings);

extern void
webkit_settings_set_javascript_can_open_windows_automatically  (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_hyperlink_auditing                  (WebKitSettings *settings);

extern void
webkit_settings_set_enable_hyperlink_auditing                  (WebKitSettings *settings,
                                                                gboolean        enabled);

extern const gchar *
webkit_settings_get_default_font_family                        (WebKitSettings *settings);

extern void
webkit_settings_set_default_font_family                        (WebKitSettings *settings,
                                                                const gchar    *default_font_family);

extern const gchar *
webkit_settings_get_monospace_font_family                      (WebKitSettings *settings);

extern void
webkit_settings_set_monospace_font_family                      (WebKitSettings *settings,
                                                                const gchar    *monospace_font_family);

extern const gchar *
webkit_settings_get_serif_font_family                          (WebKitSettings *settings);

extern void
webkit_settings_set_serif_font_family                          (WebKitSettings *settings,
                                                                const gchar    *serif_font_family);

extern const gchar *
webkit_settings_get_sans_serif_font_family                     (WebKitSettings *settings);

extern void
webkit_settings_set_sans_serif_font_family                     (WebKitSettings *settings,
                                                                const gchar    *sans_serif_font_family);

extern const gchar *
webkit_settings_get_cursive_font_family                        (WebKitSettings *settings);

extern void
webkit_settings_set_cursive_font_family                        (WebKitSettings *settings,
                                                                const gchar    *cursive_font_family);

extern const gchar *
webkit_settings_get_fantasy_font_family                        (WebKitSettings *settings);

extern void
webkit_settings_set_fantasy_font_family                        (WebKitSettings *settings,
                                                                const gchar    *fantasy_font_family);

extern const gchar *
webkit_settings_get_pictograph_font_family                     (WebKitSettings *settings);

extern void
webkit_settings_set_pictograph_font_family                     (WebKitSettings *settings,
                                                                const gchar    *pictograph_font_family);

extern guint32
webkit_settings_get_default_font_size                          (WebKitSettings *settings);

extern void
webkit_settings_set_default_font_size                          (WebKitSettings *settings,
                                                                guint32         font_size);

extern guint32
webkit_settings_get_default_monospace_font_size                (WebKitSettings *settings);

extern void
webkit_settings_set_default_monospace_font_size                (WebKitSettings *settings,
                                                                guint32         font_size);

extern guint32
webkit_settings_get_minimum_font_size                          (WebKitSettings *settings);

extern void
webkit_settings_set_minimum_font_size                          (WebKitSettings *settings,
                                                                guint32         font_size);

extern const gchar *
webkit_settings_get_default_charset                            (WebKitSettings *settings);

extern void
webkit_settings_set_default_charset                            (WebKitSettings *settings,
                                                                const gchar    *default_charset);


extern gboolean
webkit_settings_get_enable_developer_extras                    (WebKitSettings *settings);

extern void
webkit_settings_set_enable_developer_extras                    (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_resizable_text_areas                (WebKitSettings *settings);

extern void
webkit_settings_set_enable_resizable_text_areas                (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_tabs_to_links                       (WebKitSettings *settings);

extern void
webkit_settings_set_enable_tabs_to_links                       (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_dns_prefetching                     (WebKitSettings *settings);

extern void
webkit_settings_set_enable_dns_prefetching                     (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_caret_browsing                      (WebKitSettings *settings);

extern void
webkit_settings_set_enable_caret_browsing                      (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_fullscreen                          (WebKitSettings *settings);

extern void
webkit_settings_set_enable_fullscreen                          (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_print_backgrounds                          (WebKitSettings *settings);

extern void
webkit_settings_set_print_backgrounds                          (WebKitSettings *settings,
                                                                gboolean        print_backgrounds);

extern gboolean
webkit_settings_get_enable_webaudio                            (WebKitSettings *settings);

extern void
webkit_settings_set_enable_webaudio                            (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_webgl                               (WebKitSettings *settings);

extern void
webkit_settings_set_enable_webgl                               (WebKitSettings *settings,
                                                                gboolean        enabled);

extern void
webkit_settings_set_allow_modal_dialogs                        (WebKitSettings *settings,
                                                                gboolean        allowed);

extern gboolean
webkit_settings_get_allow_modal_dialogs                        (WebKitSettings *settings);

extern void
webkit_settings_set_zoom_text_only                             (WebKitSettings *settings,
                                                                gboolean        zoom_text_only);

extern gboolean
webkit_settings_get_zoom_text_only                             (WebKitSettings *settings);

extern gboolean
webkit_settings_get_javascript_can_access_clipboard            (WebKitSettings *settings);

extern void
webkit_settings_set_javascript_can_access_clipboard            (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_media_playback_requires_user_gesture       (WebKitSettings *settings);

extern void
webkit_settings_set_media_playback_requires_user_gesture       (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_media_playback_allows_inline               (WebKitSettings *settings);

extern void
webkit_settings_set_media_playback_allows_inline               (WebKitSettings *settings,
                                                                gboolean        enabled);
extern gboolean
webkit_settings_get_draw_compositing_indicators                (WebKitSettings *settings);

extern void
webkit_settings_set_draw_compositing_indicators                (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_site_specific_quirks                (WebKitSettings *settings);

extern void
webkit_settings_set_enable_site_specific_quirks                (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_page_cache                          (WebKitSettings *settings);

extern void
webkit_settings_set_enable_page_cache                          (WebKitSettings *settings,
                                                                gboolean        enabled);

extern const gchar *
webkit_settings_get_user_agent                                 (WebKitSettings *settings);

extern void
webkit_settings_set_user_agent                                 (WebKitSettings *settings,
                                                                const gchar    *user_agent);
extern void
webkit_settings_set_user_agent_with_application_details        (WebKitSettings *settings,
                                                                const gchar    *application_name,
                                                                const gchar    *application_version);

extern gboolean
webkit_settings_get_enable_smooth_scrolling                    (WebKitSettings *settings);

extern void
webkit_settings_set_enable_smooth_scrolling                    (WebKitSettings *settings,
                                                                gboolean        enabled);


extern gboolean
webkit_settings_get_enable_2d_canvas_acceleration              (WebKitSettings *settings);

extern void
webkit_settings_set_enable_2d_canvas_acceleration              (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_write_console_messages_to_stdout    (WebKitSettings *settings);

extern void
webkit_settings_set_enable_write_console_messages_to_stdout    (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_media_stream                        (WebKitSettings *settings);

extern void
webkit_settings_set_enable_media_stream                        (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_mock_capture_devices                (WebKitSettings *settings);

extern void
webkit_settings_set_enable_mock_capture_devices                (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_spatial_navigation                  (WebKitSettings *settings);

extern void
webkit_settings_set_enable_spatial_navigation                  (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_mediasource                         (WebKitSettings *settings);

extern void
webkit_settings_set_enable_mediasource                         (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_encrypted_media                     (WebKitSettings *settings);

extern void
webkit_settings_set_enable_encrypted_media                     (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_media_capabilities                  (WebKitSettings *settings);

extern void
webkit_settings_set_enable_media_capabilities                  (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_allow_file_access_from_file_urls           (WebKitSettings *settings);

extern void
webkit_settings_set_allow_file_access_from_file_urls           (WebKitSettings *settings,
                                                                gboolean        allowed);

extern gboolean
webkit_settings_get_allow_universal_access_from_file_urls      (WebKitSettings *settings);

extern void
webkit_settings_set_allow_universal_access_from_file_urls      (WebKitSettings *settings,
                                                                gboolean        allowed);

extern gboolean
webkit_settings_get_allow_top_navigation_to_data_urls          (WebKitSettings *settings);

extern void
webkit_settings_set_allow_top_navigation_to_data_urls          (WebKitSettings *settings,
                                                                gboolean        allowed);

extern WebKitHardwareAccelerationPolicy
webkit_settings_get_hardware_acceleration_policy               (WebKitSettings *settings);

extern void
webkit_settings_set_hardware_acceleration_policy               (WebKitSettings *settings,
                                                                WebKitHardwareAccelerationPolicy policy);

extern gboolean
webkit_settings_get_enable_back_forward_navigation_gestures    (WebKitSettings *settings);

extern void
webkit_settings_set_enable_back_forward_navigation_gestures    (WebKitSettings *settings,
                                                                gboolean        enabled);

extern guint32
webkit_settings_font_size_to_points                            (guint32 pixels);

extern guint32
webkit_settings_font_size_to_pixels                            (guint32 points);

extern gboolean
webkit_settings_get_enable_javascript_markup                   (WebKitSettings *settings);

extern void
webkit_settings_set_enable_javascript_markup                   (WebKitSettings *settings,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_enable_media                               (WebKitSettings *settings);

extern void
webkit_settings_set_enable_media                               (WebKitSettings *settings,
                                                                gboolean        enabled);

extern const gchar *
webkit_settings_get_media_content_types_requiring_hardware_support (WebKitSettings *settings);

extern void
webkit_settings_set_media_content_types_requiring_hardware_support (WebKitSettings *settings,
                                                                    const gchar *content_types);

extern gboolean
webkit_settings_get_enable_webrtc                              (WebKitSettings *settings);

extern void
webkit_settings_set_enable_webrtc                              (WebKitSettings *settings,
                                                                gboolean enabled);

extern gboolean
webkit_settings_get_disable_web_security                       (WebKitSettings *settings);

extern void
webkit_settings_set_disable_web_security                       (WebKitSettings *settings,
                                                                gboolean        disabled);

typedef struct _WebKitFeature WebKitFeature;
typedef struct _WebKitFeatureList WebKitFeatureList;

extern void
webkit_settings_set_feature_enabled                            (WebKitSettings *settings,
                                                                WebKitFeature  *feature,
                                                                gboolean        enabled);

extern gboolean
webkit_settings_get_feature_enabled                            (WebKitSettings *settings,
                                                                WebKitFeature  *feature);

extern WebKitFeatureList *
webkit_settings_get_all_features                               (void);

extern WebKitFeatureList *
webkit_settings_get_experimental_features                      (void);

extern WebKitFeatureList *
webkit_settings_get_development_features                       (void);

extern gboolean
webkit_settings_apply_from_key_file                            (WebKitSettings  *settings,
                                                                GKeyFile        *key_file,
                                                                const gchar     *group_name,
                                                                GError         **error);



#endif /* WebKitSettings_h */

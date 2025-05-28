unit elm_config;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_edje, elm_general;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_config_save: TEina_Bool; cdecl; external libelementary;
procedure elm_config_reload; cdecl; external libelementary;
procedure elm_config_all_flush; cdecl; external libelementary;
function elm_config_profile_get: pchar; cdecl; external libelementary;
function elm_config_profile_dir_get(profile: pchar; is_user: TEina_Bool): pchar; cdecl; external libelementary;
procedure elm_config_profile_dir_free(p_dir: pchar); cdecl; external libelementary;
function elm_config_profile_list_get: PEina_List; cdecl; external libelementary;
function elm_config_profile_list_full_get: PEina_List; cdecl; external libelementary;
procedure elm_config_profile_list_free(l: PEina_List); cdecl; external libelementary;
function elm_config_profile_exists(profile: pchar): TEina_Bool; cdecl; external libelementary;
procedure elm_config_profile_set(profile: pchar); cdecl; external libelementary;
procedure elm_config_profile_save(profile: pchar); cdecl; external libelementary;
procedure elm_config_profile_derived_add(profile: pchar; derive_options: pchar); cdecl; external libelementary;
procedure elm_config_profile_derived_del(profile: pchar); cdecl; external libelementary;
function elm_config_scroll_bounce_enabled_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_scroll_bounce_enabled_set(enabled: TEina_Bool); cdecl; external libelementary;
function elm_config_scroll_bounce_friction_get: double; cdecl; external libelementary;
procedure elm_config_scroll_bounce_friction_set(friction: double); cdecl; external libelementary;
function elm_config_scroll_page_scroll_friction_get: double; cdecl; external libelementary;
procedure elm_config_scroll_page_scroll_friction_set(friction: double); cdecl; external libelementary;
function elm_config_context_menu_disabled_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_context_menu_disabled_set(disabled: TEina_Bool); cdecl; external libelementary;
function elm_config_scroll_bring_in_scroll_friction_get: double; cdecl; external libelementary;
procedure elm_config_scroll_bring_in_scroll_friction_set(friction: double); cdecl; external libelementary;
function elm_config_scroll_zoom_friction_get: double; cdecl; external libelementary;
procedure elm_config_scroll_zoom_friction_set(friction: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_enabled_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_enabled_set(enabled: TEina_Bool); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_threshold_get: dword; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_threshold_set(threshold: dword); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_hold_threshold_get: dword; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_hold_threshold_set(threshold: dword); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_momentum_threshold_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_momentum_threshold_set(threshold: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_momentum_distance_max_get: dword; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_momentum_distance_max_set(distance: dword); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_momentum_friction_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_momentum_friction_set(friction: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_border_friction_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_border_friction_set(friction: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_sensitivity_friction_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_sensitivity_friction_set(friction: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_smooth_start_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_smooth_start_set(enable: TEina_Bool); cdecl; external libelementary;
function elm_config_scroll_animation_disabled_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_scroll_animation_disabled_set(disable: TEina_Bool); cdecl; external libelementary;
function elm_config_scroll_accel_factor_get: double; cdecl; external libelementary;
procedure elm_config_scroll_accel_factor_set(factor: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_smooth_amount_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_smooth_amount_set(amount: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_smooth_time_window_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_smooth_time_window_set(amount: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_acceleration_threshold_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_acceleration_threshold_set(threshold: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_acceleration_time_limit_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_acceleration_time_limit_set(time_limit: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_acceleration_weight_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_acceleration_weight_set(weight: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_momentum_animation_duration_min_limit_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_momentum_animation_duration_min_limit_set(min: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_momentum_animation_duration_max_limit_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_momentum_animation_duration_max_limit_set(max: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_min_friction_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_min_friction_set(friction: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_friction_standard_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_friction_standard_set(standard: double); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_flick_distance_tolerance_get: dword; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_flick_distance_tolerance_set(distance: dword); cdecl; external libelementary;
function elm_config_scroll_thumbscroll_friction_get: double; cdecl; external libelementary;
procedure elm_config_scroll_thumbscroll_friction_set(friction: double); cdecl; external libelementary;
function elm_config_focus_autoscroll_mode_get: TElm_Focus_Autoscroll_Mode; cdecl; external libelementary;
procedure elm_config_focus_autoscroll_mode_set(mode: TElm_Focus_Autoscroll_Mode); cdecl; external libelementary;
procedure elm_config_slider_indicator_visible_mode_set(mode: TElm_Slider_Indicator_Visible_Mode); cdecl; external libelementary;
function elm_config_slider_indicator_visible_mode_get: TElm_Slider_Indicator_Visible_Mode; cdecl; external libelementary;
function elm_config_longpress_timeout_get: double; cdecl; external libelementary;
procedure elm_config_longpress_timeout_set(longpress_timeout: double); cdecl; external libelementary;
procedure elm_config_softcursor_mode_set(mode: TElm_Softcursor_Mode); cdecl; external libelementary;
function elm_config_softcursor_mode_get: TElm_Softcursor_Mode; cdecl; external libelementary;
function elm_config_tooltip_delay_get: double; cdecl; external libelementary;
procedure elm_config_tooltip_delay_set(delay: double); cdecl; external libelementary;
function elm_config_cursor_engine_only_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_cursor_engine_only_set(engine_only: TEina_Bool); cdecl; external libelementary;
function elm_config_scale_get: double; cdecl; external libelementary;
procedure elm_config_scale_set(scale: double); cdecl; external libelementary;
function elm_config_icon_theme_get: pchar; cdecl; external libelementary;
procedure elm_config_icon_theme_set(theme: pchar); cdecl; external libelementary;

type
  TElm_Palette_Color = record
    name: pchar;
    r: byte;
    g: byte;
    b: byte;
    a: byte;
  end;
  PElm_Palette_Color = ^TElm_Palette_Color;

  TElm_Palette = record
    version: longint;
    colors: PEina_List;
  end;
  PElm_Palette = ^TElm_Palette;

function elm_config_palette_get: pchar; cdecl; external libelementary;
procedure elm_config_palette_set(palette: pchar); cdecl; external libelementary;
function elm_config_palette_load(palette: pchar): PElm_Palette; cdecl; external libelementary;
procedure elm_config_palette_color_set(pal: PElm_Palette; name: pchar; r: longint; g: longint; b: longint;
  a: longint); cdecl; external libelementary;
procedure elm_config_palette_color_unset(pal: PElm_Palette; name: pchar); cdecl; external libelementary;
procedure elm_config_palette_save(pal: PElm_Palette; palette: pchar); cdecl; external libelementary;
procedure elm_config_palette_free(pal: PElm_Palette); cdecl; external libelementary;
procedure elm_config_palette_delete(palette: pchar); cdecl; external libelementary;
function elm_config_palette_system_has(palette: pchar): TEina_Bool; cdecl; external libelementary;
function elm_config_palette_list: PEina_List; cdecl; external libelementary;
procedure elm_config_palette_list_free(list: PEina_List); cdecl; external libelementary;
function elm_config_password_show_last_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_password_show_last_set(password_show_last: TEina_Bool); cdecl; external libelementary;
function elm_config_password_show_last_timeout_get: double; cdecl; external libelementary;
procedure elm_config_password_show_last_timeout_set(password_show_last_timeout: double); cdecl; external libelementary;
function elm_config_engine_get: pchar; cdecl; external libelementary; deprecated;
procedure elm_config_engine_set(engine: pchar); cdecl; external libelementary; deprecated;
function elm_config_preferred_engine_get: pchar; cdecl; external libelementary;
procedure elm_config_preferred_engine_set(engine: pchar); cdecl; external libelementary;
function elm_config_accel_preference_get: pchar; cdecl; external libelementary;
procedure elm_config_accel_preference_set(pref: pchar); cdecl; external libelementary;

type
  TElm_Text_Class = record
    name: pchar;
    desc: pchar;
  end;
  PElm_Text_Class = ^TElm_Text_Class;

  TElm_Font_Overlay = record
    text_class: pchar;
    font: pchar;
    size: TEvas_Font_Size;
  end;
  PElm_Font_Overlay = ^TElm_Font_Overlay;

function elm_config_text_classes_list_get: PEina_List; cdecl; external libelementary;
procedure elm_config_text_classes_list_free(list: PEina_List); cdecl; external libelementary;
function elm_config_font_overlay_list_get: PEina_List; cdecl; external libelementary;
procedure elm_config_font_overlay_set(text_class: pchar; font: pchar; size: TEvas_Font_Size); cdecl; external libelementary;
function elm_config_access_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_access_set(is_access: TEina_Bool); cdecl; external libelementary;
function elm_config_selection_unfocused_clear_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_selection_unfocused_clear_set(enabled: TEina_Bool); cdecl; external libelementary;
procedure elm_config_font_overlay_unset(text_class: pchar); cdecl; external libelementary;
procedure elm_config_font_overlay_apply; cdecl; external libelementary;
procedure elm_config_font_hint_type_set(_type: longint); cdecl; external libelementary;
function elm_config_finger_size_get: TEvas_Coord; cdecl; external libelementary;
procedure elm_config_finger_size_set(size: TEvas_Coord); cdecl; external libelementary;
function elm_config_cache_flush_interval_get: longint; cdecl; external libelementary;
procedure elm_config_cache_flush_interval_set(size: longint); cdecl; external libelementary;
function elm_config_cache_flush_enabled_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_cache_flush_enabled_set(enabled: TEina_Bool); cdecl; external libelementary;
function elm_config_cache_font_cache_size_get: longint; cdecl; external libelementary;
procedure elm_config_cache_font_cache_size_set(size: longint); cdecl; external libelementary;
function elm_config_cache_image_cache_size_get: longint; cdecl; external libelementary;
procedure elm_config_cache_image_cache_size_set(size: longint); cdecl; external libelementary;
function elm_config_cache_edje_file_cache_size_get: longint; cdecl; external libelementary;
procedure elm_config_cache_edje_file_cache_size_set(size: longint); cdecl; external libelementary;
function elm_config_cache_edje_collection_cache_size_get: longint; cdecl; external libelementary;
procedure elm_config_cache_edje_collection_cache_size_set(size: longint); cdecl; external libelementary;
function elm_config_vsync_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_vsync_set(enabled: TEina_Bool); cdecl; external libelementary;
function elm_config_agressive_withdrawn_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_agressive_withdrawn_set(enabled: TEina_Bool); cdecl; external libelementary;
function elm_config_accel_preference_override_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_accel_preference_override_set(enabled: TEina_Bool); cdecl; external libelementary;
function elm_config_focus_highlight_enabled_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_focus_highlight_enabled_set(enable: TEina_Bool); cdecl; external libelementary;
function elm_config_focus_highlight_animate_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_focus_highlight_animate_set(animate: TEina_Bool); cdecl; external libelementary;
function elm_config_focus_highlight_clip_disabled_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_focus_highlight_clip_disabled_set(disable: TEina_Bool); cdecl; external libelementary;
function elm_config_focus_move_policy_get: TElm_Focus_Move_Policy; cdecl; external libelementary;
procedure elm_config_focus_move_policy_set(policy: TElm_Focus_Move_Policy); cdecl; external libelementary;
function elm_config_item_select_on_focus_disabled_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_item_select_on_focus_disabled_set(disabled: TEina_Bool); cdecl; external libelementary;
function elm_config_first_item_focus_on_first_focusin_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_first_item_focus_on_first_focusin_set(enabled: TEina_Bool); cdecl; external libelementary;
function elm_config_mirrored_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_mirrored_set(mirrored: TEina_Bool); cdecl; external libelementary;
function elm_config_clouseau_enabled_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_clouseau_enabled_set(enabled: TEina_Bool); cdecl; external libelementary;
function elm_config_indicator_service_get(rotation: longint): pchar; cdecl; external libelementary;
function elm_config_glayer_long_tap_start_timeout_get: double; cdecl; external libelementary;
procedure elm_config_glayer_long_tap_start_timeout_set(long_tap_timeout: double); cdecl; external libelementary;
function elm_config_glayer_double_tap_timeout_get: double; cdecl; external libelementary;
procedure elm_config_glayer_double_tap_timeout_set(double_tap_timeout: double); cdecl; external libelementary;

type
  TElm_Color_Class = record
    name: pchar;
    desc: pchar;
  end;
  PElm_Color_Class = ^TElm_Color_Class;

  TElm_Color_Overlay = record
    color_class: pchar;
    color: record
      r: byte;
      g: byte;
      b: byte;
      a: byte;
      end;
    outline: record
      r: byte;
      g: byte;
      b: byte;
      a: byte;
      end;
    shadow: record
      r: byte;
      g: byte;
      b: byte;
      a: byte;
      end;
  end;
  PElm_Color_Overlay = ^TElm_Color_Overlay;

function elm_config_color_classes_list_get: PEina_List; cdecl; external libelementary;
procedure elm_config_color_classes_list_free(list: PEina_List); cdecl; external libelementary;
function elm_config_color_overlay_list_get: PEina_List; cdecl; external libelementary;
procedure elm_config_color_overlay_set(color_class: pchar; r: longint; g: longint; b: longint; a: longint;
  r2: longint; g2: longint; b2: longint; a2: longint; r3: longint;
  g3: longint; b3: longint; a3: longint); cdecl; external libelementary;
procedure elm_config_color_overlay_unset(color_class: pchar); cdecl; external libelementary;
procedure elm_config_color_overlay_apply; cdecl; external libelementary;
function elm_config_desktop_entry_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_desktop_entry_set(enable: TEina_Bool); cdecl; external libelementary;
function elm_config_magnifier_enable_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_magnifier_enable_set(enable: TEina_Bool); cdecl; external libelementary;
function elm_config_magnifier_scale_get: double; cdecl; external libelementary;
procedure elm_config_magnifier_scale_set(scale: double); cdecl; external libelementary;
function elm_config_audio_mute_get(channel: TEdje_Channel): TEina_Bool; cdecl; external libelementary;
procedure elm_config_audio_mute_set(channel: TEdje_Channel; mute: TEina_Bool); cdecl; external libelementary;
function elm_config_window_auto_focus_enable_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_window_auto_focus_enable_set(enable: TEina_Bool); cdecl; external libelementary;
function elm_config_window_auto_focus_animate_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_window_auto_focus_animate_set(enable: TEina_Bool); cdecl; external libelementary;
function elm_config_popup_scrollable_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_popup_scrollable_set(scrollable: TEina_Bool); cdecl; external libelementary;
function elm_config_atspi_mode_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_atspi_mode_set(is_atspi: TEina_Bool); cdecl; external libelementary;
procedure elm_config_transition_duration_factor_set(factor: double); cdecl; external libelementary;
function elm_config_transition_duration_factor_get: double; cdecl; external libelementary;
procedure elm_config_web_backend_set(backend: pchar); cdecl; external libelementary;
function elm_config_web_backend_get: pchar; cdecl; external libelementary;
function elm_config_offline_get: TEina_Bool; cdecl; external libelementary;
procedure elm_config_offline_set(set_: TEina_Bool); cdecl; external libelementary;
function elm_config_powersave_get: longint; cdecl; external libelementary;
procedure elm_config_powersave_set(set_: longint); cdecl; external libelementary;
function elm_config_drag_anim_duration_get: double; cdecl; external libelementary;
procedure elm_config_drag_anim_duration_set(set_: double); cdecl; external libelementary;

// === Konventiert am: 23-5-25 17:22:47 ===


implementation



end.


unit xproto;
interface

{
  Automatically converted by H2Pas 1.0.0 from xproto.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xproto.h
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
Pchar  = ^char;
Puint32_t  = ^uint32_t;
Puint8_t  = ^uint8_t;
Pxcb_access_control_t  = ^xcb_access_control_t;
Pxcb_access_error_t  = ^xcb_access_error_t;
Pxcb_alloc_color_cells_cookie_t  = ^xcb_alloc_color_cells_cookie_t;
Pxcb_alloc_color_cells_reply_t  = ^xcb_alloc_color_cells_reply_t;
Pxcb_alloc_color_cells_request_t  = ^xcb_alloc_color_cells_request_t;
Pxcb_alloc_color_cookie_t  = ^xcb_alloc_color_cookie_t;
Pxcb_alloc_color_planes_cookie_t  = ^xcb_alloc_color_planes_cookie_t;
Pxcb_alloc_color_planes_reply_t  = ^xcb_alloc_color_planes_reply_t;
Pxcb_alloc_color_planes_request_t  = ^xcb_alloc_color_planes_request_t;
Pxcb_alloc_color_reply_t  = ^xcb_alloc_color_reply_t;
Pxcb_alloc_color_request_t  = ^xcb_alloc_color_request_t;
Pxcb_alloc_error_t  = ^xcb_alloc_error_t;
Pxcb_alloc_named_color_cookie_t  = ^xcb_alloc_named_color_cookie_t;
Pxcb_alloc_named_color_reply_t  = ^xcb_alloc_named_color_reply_t;
Pxcb_alloc_named_color_request_t  = ^xcb_alloc_named_color_request_t;
Pxcb_allow_events_request_t  = ^xcb_allow_events_request_t;
Pxcb_allow_t  = ^xcb_allow_t;
Pxcb_arc_iterator_t  = ^xcb_arc_iterator_t;
Pxcb_arc_mode_t  = ^xcb_arc_mode_t;
Pxcb_arc_t  = ^xcb_arc_t;
Pxcb_atom_enum_t  = ^xcb_atom_enum_t;
Pxcb_atom_error_t  = ^xcb_atom_error_t;
Pxcb_atom_iterator_t  = ^xcb_atom_iterator_t;
Pxcb_atom_t  = ^xcb_atom_t;
Pxcb_auto_repeat_mode_t  = ^xcb_auto_repeat_mode_t;
Pxcb_back_pixmap_t  = ^xcb_back_pixmap_t;
Pxcb_backing_store_t  = ^xcb_backing_store_t;
Pxcb_bell_request_t  = ^xcb_bell_request_t;
Pxcb_blanking_t  = ^xcb_blanking_t;
Pxcb_bool32_iterator_t  = ^xcb_bool32_iterator_t;
Pxcb_bool32_t  = ^xcb_bool32_t;
Pxcb_button_index_t  = ^xcb_button_index_t;
Pxcb_button_iterator_t  = ^xcb_button_iterator_t;
Pxcb_button_mask_t  = ^xcb_button_mask_t;
Pxcb_button_press_event_t  = ^xcb_button_press_event_t;
Pxcb_button_release_event_t  = ^xcb_button_release_event_t;
Pxcb_button_t  = ^xcb_button_t;
Pxcb_cap_style_t  = ^xcb_cap_style_t;
Pxcb_change_active_pointer_grab_request_t  = ^xcb_change_active_pointer_grab_request_t;
Pxcb_change_gc_request_t  = ^xcb_change_gc_request_t;
Pxcb_change_gc_value_list_t  = ^xcb_change_gc_value_list_t;
Pxcb_change_hosts_request_t  = ^xcb_change_hosts_request_t;
Pxcb_change_keyboard_control_request_t  = ^xcb_change_keyboard_control_request_t;
Pxcb_change_keyboard_control_value_list_t  = ^xcb_change_keyboard_control_value_list_t;
Pxcb_change_keyboard_mapping_request_t  = ^xcb_change_keyboard_mapping_request_t;
Pxcb_change_pointer_control_request_t  = ^xcb_change_pointer_control_request_t;
Pxcb_change_property_request_t  = ^xcb_change_property_request_t;
Pxcb_change_save_set_request_t  = ^xcb_change_save_set_request_t;
Pxcb_change_window_attributes_request_t  = ^xcb_change_window_attributes_request_t;
Pxcb_change_window_attributes_value_list_t  = ^xcb_change_window_attributes_value_list_t;
Pxcb_char2b_iterator_t  = ^xcb_char2b_iterator_t;
Pxcb_char2b_t  = ^xcb_char2b_t;
Pxcb_charinfo_iterator_t  = ^xcb_charinfo_iterator_t;
Pxcb_charinfo_t  = ^xcb_charinfo_t;
Pxcb_circulate_notify_event_t  = ^xcb_circulate_notify_event_t;
Pxcb_circulate_request_event_t  = ^xcb_circulate_request_event_t;
Pxcb_circulate_t  = ^xcb_circulate_t;
Pxcb_circulate_window_request_t  = ^xcb_circulate_window_request_t;
Pxcb_clear_area_request_t  = ^xcb_clear_area_request_t;
Pxcb_client_message_data_iterator_t  = ^xcb_client_message_data_iterator_t;
Pxcb_client_message_data_t  = ^xcb_client_message_data_t;
Pxcb_client_message_event_t  = ^xcb_client_message_event_t;
Pxcb_clip_ordering_t  = ^xcb_clip_ordering_t;
Pxcb_close_down_t  = ^xcb_close_down_t;
Pxcb_close_font_request_t  = ^xcb_close_font_request_t;
Pxcb_color_flag_t  = ^xcb_color_flag_t;
Pxcb_coloritem_iterator_t  = ^xcb_coloritem_iterator_t;
Pxcb_coloritem_t  = ^xcb_coloritem_t;
Pxcb_colormap_alloc_t  = ^xcb_colormap_alloc_t;
Pxcb_colormap_enum_t  = ^xcb_colormap_enum_t;
Pxcb_colormap_error_t  = ^xcb_colormap_error_t;
Pxcb_colormap_iterator_t  = ^xcb_colormap_iterator_t;
Pxcb_colormap_notify_event_t  = ^xcb_colormap_notify_event_t;
Pxcb_colormap_state_t  = ^xcb_colormap_state_t;
Pxcb_colormap_t  = ^xcb_colormap_t;
Pxcb_config_window_t  = ^xcb_config_window_t;
Pxcb_configure_notify_event_t  = ^xcb_configure_notify_event_t;
Pxcb_configure_request_event_t  = ^xcb_configure_request_event_t;
Pxcb_configure_window_request_t  = ^xcb_configure_window_request_t;
Pxcb_configure_window_value_list_t  = ^xcb_configure_window_value_list_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_convert_selection_request_t  = ^xcb_convert_selection_request_t;
Pxcb_coord_mode_t  = ^xcb_coord_mode_t;
Pxcb_copy_area_request_t  = ^xcb_copy_area_request_t;
Pxcb_copy_colormap_and_free_request_t  = ^xcb_copy_colormap_and_free_request_t;
Pxcb_copy_gc_request_t  = ^xcb_copy_gc_request_t;
Pxcb_copy_plane_request_t  = ^xcb_copy_plane_request_t;
Pxcb_create_colormap_request_t  = ^xcb_create_colormap_request_t;
Pxcb_create_cursor_request_t  = ^xcb_create_cursor_request_t;
Pxcb_create_gc_request_t  = ^xcb_create_gc_request_t;
Pxcb_create_gc_value_list_t  = ^xcb_create_gc_value_list_t;
Pxcb_create_glyph_cursor_request_t  = ^xcb_create_glyph_cursor_request_t;
Pxcb_create_notify_event_t  = ^xcb_create_notify_event_t;
Pxcb_create_pixmap_request_t  = ^xcb_create_pixmap_request_t;
Pxcb_create_window_request_t  = ^xcb_create_window_request_t;
Pxcb_create_window_value_list_t  = ^xcb_create_window_value_list_t;
Pxcb_cursor_enum_t  = ^xcb_cursor_enum_t;
Pxcb_cursor_error_t  = ^xcb_cursor_error_t;
Pxcb_cursor_iterator_t  = ^xcb_cursor_iterator_t;
Pxcb_cursor_t  = ^xcb_cursor_t;
Pxcb_cw_t  = ^xcb_cw_t;
Pxcb_delete_property_request_t  = ^xcb_delete_property_request_t;
Pxcb_depth_iterator_t  = ^xcb_depth_iterator_t;
Pxcb_depth_t  = ^xcb_depth_t;
Pxcb_destroy_notify_event_t  = ^xcb_destroy_notify_event_t;
Pxcb_destroy_subwindows_request_t  = ^xcb_destroy_subwindows_request_t;
Pxcb_destroy_window_request_t  = ^xcb_destroy_window_request_t;
Pxcb_drawable_error_t  = ^xcb_drawable_error_t;
Pxcb_drawable_iterator_t  = ^xcb_drawable_iterator_t;
Pxcb_drawable_t  = ^xcb_drawable_t;
Pxcb_enter_notify_event_t  = ^xcb_enter_notify_event_t;
Pxcb_event_mask_t  = ^xcb_event_mask_t;
Pxcb_expose_event_t  = ^xcb_expose_event_t;
Pxcb_exposures_t  = ^xcb_exposures_t;
Pxcb_family_t  = ^xcb_family_t;
Pxcb_fill_poly_request_t  = ^xcb_fill_poly_request_t;
Pxcb_fill_rule_t  = ^xcb_fill_rule_t;
Pxcb_fill_style_t  = ^xcb_fill_style_t;
Pxcb_focus_in_event_t  = ^xcb_focus_in_event_t;
Pxcb_focus_out_event_t  = ^xcb_focus_out_event_t;
Pxcb_font_draw_t  = ^xcb_font_draw_t;
Pxcb_font_enum_t  = ^xcb_font_enum_t;
Pxcb_font_error_t  = ^xcb_font_error_t;
Pxcb_font_iterator_t  = ^xcb_font_iterator_t;
Pxcb_font_t  = ^xcb_font_t;
Pxcb_fontable_iterator_t  = ^xcb_fontable_iterator_t;
Pxcb_fontable_t  = ^xcb_fontable_t;
Pxcb_fontprop_iterator_t  = ^xcb_fontprop_iterator_t;
Pxcb_fontprop_t  = ^xcb_fontprop_t;
Pxcb_force_screen_saver_request_t  = ^xcb_force_screen_saver_request_t;
Pxcb_format_iterator_t  = ^xcb_format_iterator_t;
Pxcb_format_t  = ^xcb_format_t;
Pxcb_free_colormap_request_t  = ^xcb_free_colormap_request_t;
Pxcb_free_colors_request_t  = ^xcb_free_colors_request_t;
Pxcb_free_cursor_request_t  = ^xcb_free_cursor_request_t;
Pxcb_free_gc_request_t  = ^xcb_free_gc_request_t;
Pxcb_free_pixmap_request_t  = ^xcb_free_pixmap_request_t;
Pxcb_g_context_error_t  = ^xcb_g_context_error_t;
Pxcb_gc_t  = ^xcb_gc_t;
Pxcb_gcontext_iterator_t  = ^xcb_gcontext_iterator_t;
Pxcb_gcontext_t  = ^xcb_gcontext_t;
Pxcb_ge_generic_event_t  = ^xcb_ge_generic_event_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
Pxcb_get_atom_name_cookie_t  = ^xcb_get_atom_name_cookie_t;
Pxcb_get_atom_name_reply_t  = ^xcb_get_atom_name_reply_t;
Pxcb_get_atom_name_request_t  = ^xcb_get_atom_name_request_t;
Pxcb_get_font_path_cookie_t  = ^xcb_get_font_path_cookie_t;
Pxcb_get_font_path_reply_t  = ^xcb_get_font_path_reply_t;
Pxcb_get_font_path_request_t  = ^xcb_get_font_path_request_t;
Pxcb_get_geometry_cookie_t  = ^xcb_get_geometry_cookie_t;
Pxcb_get_geometry_reply_t  = ^xcb_get_geometry_reply_t;
Pxcb_get_geometry_request_t  = ^xcb_get_geometry_request_t;
Pxcb_get_image_cookie_t  = ^xcb_get_image_cookie_t;
Pxcb_get_image_reply_t  = ^xcb_get_image_reply_t;
Pxcb_get_image_request_t  = ^xcb_get_image_request_t;
Pxcb_get_input_focus_cookie_t  = ^xcb_get_input_focus_cookie_t;
Pxcb_get_input_focus_reply_t  = ^xcb_get_input_focus_reply_t;
Pxcb_get_input_focus_request_t  = ^xcb_get_input_focus_request_t;
Pxcb_get_keyboard_control_cookie_t  = ^xcb_get_keyboard_control_cookie_t;
Pxcb_get_keyboard_control_reply_t  = ^xcb_get_keyboard_control_reply_t;
Pxcb_get_keyboard_control_request_t  = ^xcb_get_keyboard_control_request_t;
Pxcb_get_keyboard_mapping_cookie_t  = ^xcb_get_keyboard_mapping_cookie_t;
Pxcb_get_keyboard_mapping_reply_t  = ^xcb_get_keyboard_mapping_reply_t;
Pxcb_get_keyboard_mapping_request_t  = ^xcb_get_keyboard_mapping_request_t;
Pxcb_get_modifier_mapping_cookie_t  = ^xcb_get_modifier_mapping_cookie_t;
Pxcb_get_modifier_mapping_reply_t  = ^xcb_get_modifier_mapping_reply_t;
Pxcb_get_modifier_mapping_request_t  = ^xcb_get_modifier_mapping_request_t;
Pxcb_get_motion_events_cookie_t  = ^xcb_get_motion_events_cookie_t;
Pxcb_get_motion_events_reply_t  = ^xcb_get_motion_events_reply_t;
Pxcb_get_motion_events_request_t  = ^xcb_get_motion_events_request_t;
Pxcb_get_pointer_control_cookie_t  = ^xcb_get_pointer_control_cookie_t;
Pxcb_get_pointer_control_reply_t  = ^xcb_get_pointer_control_reply_t;
Pxcb_get_pointer_control_request_t  = ^xcb_get_pointer_control_request_t;
Pxcb_get_pointer_mapping_cookie_t  = ^xcb_get_pointer_mapping_cookie_t;
Pxcb_get_pointer_mapping_reply_t  = ^xcb_get_pointer_mapping_reply_t;
Pxcb_get_pointer_mapping_request_t  = ^xcb_get_pointer_mapping_request_t;
Pxcb_get_property_cookie_t  = ^xcb_get_property_cookie_t;
Pxcb_get_property_reply_t  = ^xcb_get_property_reply_t;
Pxcb_get_property_request_t  = ^xcb_get_property_request_t;
Pxcb_get_property_type_t  = ^xcb_get_property_type_t;
Pxcb_get_screen_saver_cookie_t  = ^xcb_get_screen_saver_cookie_t;
Pxcb_get_screen_saver_reply_t  = ^xcb_get_screen_saver_reply_t;
Pxcb_get_screen_saver_request_t  = ^xcb_get_screen_saver_request_t;
Pxcb_get_selection_owner_cookie_t  = ^xcb_get_selection_owner_cookie_t;
Pxcb_get_selection_owner_reply_t  = ^xcb_get_selection_owner_reply_t;
Pxcb_get_selection_owner_request_t  = ^xcb_get_selection_owner_request_t;
Pxcb_get_window_attributes_cookie_t  = ^xcb_get_window_attributes_cookie_t;
Pxcb_get_window_attributes_reply_t  = ^xcb_get_window_attributes_reply_t;
Pxcb_get_window_attributes_request_t  = ^xcb_get_window_attributes_request_t;
Pxcb_grab_button_request_t  = ^xcb_grab_button_request_t;
Pxcb_grab_key_request_t  = ^xcb_grab_key_request_t;
Pxcb_grab_keyboard_cookie_t  = ^xcb_grab_keyboard_cookie_t;
Pxcb_grab_keyboard_reply_t  = ^xcb_grab_keyboard_reply_t;
Pxcb_grab_keyboard_request_t  = ^xcb_grab_keyboard_request_t;
Pxcb_grab_mode_t  = ^xcb_grab_mode_t;
Pxcb_grab_pointer_cookie_t  = ^xcb_grab_pointer_cookie_t;
Pxcb_grab_pointer_reply_t  = ^xcb_grab_pointer_reply_t;
Pxcb_grab_pointer_request_t  = ^xcb_grab_pointer_request_t;
Pxcb_grab_server_request_t  = ^xcb_grab_server_request_t;
Pxcb_grab_status_t  = ^xcb_grab_status_t;
Pxcb_grab_t  = ^xcb_grab_t;
Pxcb_graphics_exposure_event_t  = ^xcb_graphics_exposure_event_t;
Pxcb_gravity_notify_event_t  = ^xcb_gravity_notify_event_t;
Pxcb_gravity_t  = ^xcb_gravity_t;
Pxcb_gx_t  = ^xcb_gx_t;
Pxcb_host_iterator_t  = ^xcb_host_iterator_t;
Pxcb_host_mode_t  = ^xcb_host_mode_t;
Pxcb_host_t  = ^xcb_host_t;
Pxcb_id_choice_error_t  = ^xcb_id_choice_error_t;
Pxcb_image_format_t  = ^xcb_image_format_t;
Pxcb_image_order_t  = ^xcb_image_order_t;
Pxcb_image_text_16_request_t  = ^xcb_image_text_16_request_t;
Pxcb_image_text_8_request_t  = ^xcb_image_text_8_request_t;
Pxcb_implementation_error_t  = ^xcb_implementation_error_t;
Pxcb_input_focus_t  = ^xcb_input_focus_t;
Pxcb_install_colormap_request_t  = ^xcb_install_colormap_request_t;
Pxcb_intern_atom_cookie_t  = ^xcb_intern_atom_cookie_t;
Pxcb_intern_atom_reply_t  = ^xcb_intern_atom_reply_t;
Pxcb_intern_atom_request_t  = ^xcb_intern_atom_request_t;
Pxcb_join_style_t  = ^xcb_join_style_t;
Pxcb_kb_t  = ^xcb_kb_t;
Pxcb_key_but_mask_t  = ^xcb_key_but_mask_t;
Pxcb_key_press_event_t  = ^xcb_key_press_event_t;
Pxcb_key_release_event_t  = ^xcb_key_release_event_t;
Pxcb_keycode32_iterator_t  = ^xcb_keycode32_iterator_t;
Pxcb_keycode32_t  = ^xcb_keycode32_t;
Pxcb_keycode_iterator_t  = ^xcb_keycode_iterator_t;
Pxcb_keycode_t  = ^xcb_keycode_t;
Pxcb_keymap_notify_event_t  = ^xcb_keymap_notify_event_t;
Pxcb_keysym_iterator_t  = ^xcb_keysym_iterator_t;
Pxcb_keysym_t  = ^xcb_keysym_t;
Pxcb_kill_client_request_t  = ^xcb_kill_client_request_t;
Pxcb_kill_t  = ^xcb_kill_t;
Pxcb_leave_notify_event_t  = ^xcb_leave_notify_event_t;
Pxcb_led_mode_t  = ^xcb_led_mode_t;
Pxcb_length_error_t  = ^xcb_length_error_t;
Pxcb_line_style_t  = ^xcb_line_style_t;
Pxcb_list_extensions_cookie_t  = ^xcb_list_extensions_cookie_t;
Pxcb_list_extensions_reply_t  = ^xcb_list_extensions_reply_t;
Pxcb_list_extensions_request_t  = ^xcb_list_extensions_request_t;
Pxcb_list_fonts_cookie_t  = ^xcb_list_fonts_cookie_t;
Pxcb_list_fonts_reply_t  = ^xcb_list_fonts_reply_t;
Pxcb_list_fonts_request_t  = ^xcb_list_fonts_request_t;
Pxcb_list_fonts_with_info_cookie_t  = ^xcb_list_fonts_with_info_cookie_t;
Pxcb_list_fonts_with_info_reply_t  = ^xcb_list_fonts_with_info_reply_t;
Pxcb_list_fonts_with_info_request_t  = ^xcb_list_fonts_with_info_request_t;
Pxcb_list_hosts_cookie_t  = ^xcb_list_hosts_cookie_t;
Pxcb_list_hosts_reply_t  = ^xcb_list_hosts_reply_t;
Pxcb_list_hosts_request_t  = ^xcb_list_hosts_request_t;
Pxcb_list_installed_colormaps_cookie_t  = ^xcb_list_installed_colormaps_cookie_t;
Pxcb_list_installed_colormaps_reply_t  = ^xcb_list_installed_colormaps_reply_t;
Pxcb_list_installed_colormaps_request_t  = ^xcb_list_installed_colormaps_request_t;
Pxcb_list_properties_cookie_t  = ^xcb_list_properties_cookie_t;
Pxcb_list_properties_reply_t  = ^xcb_list_properties_reply_t;
Pxcb_list_properties_request_t  = ^xcb_list_properties_request_t;
Pxcb_lookup_color_cookie_t  = ^xcb_lookup_color_cookie_t;
Pxcb_lookup_color_reply_t  = ^xcb_lookup_color_reply_t;
Pxcb_lookup_color_request_t  = ^xcb_lookup_color_request_t;
Pxcb_map_index_t  = ^xcb_map_index_t;
Pxcb_map_notify_event_t  = ^xcb_map_notify_event_t;
Pxcb_map_request_event_t  = ^xcb_map_request_event_t;
Pxcb_map_state_t  = ^xcb_map_state_t;
Pxcb_map_subwindows_request_t  = ^xcb_map_subwindows_request_t;
Pxcb_map_window_request_t  = ^xcb_map_window_request_t;
Pxcb_mapping_notify_event_t  = ^xcb_mapping_notify_event_t;
Pxcb_mapping_status_t  = ^xcb_mapping_status_t;
Pxcb_mapping_t  = ^xcb_mapping_t;
Pxcb_match_error_t  = ^xcb_match_error_t;
Pxcb_mod_mask_t  = ^xcb_mod_mask_t;
Pxcb_motion_notify_event_t  = ^xcb_motion_notify_event_t;
Pxcb_motion_t  = ^xcb_motion_t;
Pxcb_name_error_t  = ^xcb_name_error_t;
Pxcb_no_exposure_event_t  = ^xcb_no_exposure_event_t;
Pxcb_no_operation_request_t  = ^xcb_no_operation_request_t;
Pxcb_notify_detail_t  = ^xcb_notify_detail_t;
Pxcb_notify_mode_t  = ^xcb_notify_mode_t;
Pxcb_open_font_request_t  = ^xcb_open_font_request_t;
Pxcb_pixmap_enum_t  = ^xcb_pixmap_enum_t;
Pxcb_pixmap_error_t  = ^xcb_pixmap_error_t;
Pxcb_pixmap_iterator_t  = ^xcb_pixmap_iterator_t;
Pxcb_pixmap_t  = ^xcb_pixmap_t;
Pxcb_place_t  = ^xcb_place_t;
Pxcb_point_iterator_t  = ^xcb_point_iterator_t;
Pxcb_point_t  = ^xcb_point_t;
Pxcb_poly_arc_request_t  = ^xcb_poly_arc_request_t;
Pxcb_poly_fill_arc_request_t  = ^xcb_poly_fill_arc_request_t;
Pxcb_poly_fill_rectangle_request_t  = ^xcb_poly_fill_rectangle_request_t;
Pxcb_poly_line_request_t  = ^xcb_poly_line_request_t;
Pxcb_poly_point_request_t  = ^xcb_poly_point_request_t;
Pxcb_poly_rectangle_request_t  = ^xcb_poly_rectangle_request_t;
Pxcb_poly_segment_request_t  = ^xcb_poly_segment_request_t;
Pxcb_poly_shape_t  = ^xcb_poly_shape_t;
Pxcb_poly_text_16_request_t  = ^xcb_poly_text_16_request_t;
Pxcb_poly_text_8_request_t  = ^xcb_poly_text_8_request_t;
Pxcb_prop_mode_t  = ^xcb_prop_mode_t;
Pxcb_property_notify_event_t  = ^xcb_property_notify_event_t;
Pxcb_property_t  = ^xcb_property_t;
Pxcb_put_image_request_t  = ^xcb_put_image_request_t;
Pxcb_query_best_size_cookie_t  = ^xcb_query_best_size_cookie_t;
Pxcb_query_best_size_reply_t  = ^xcb_query_best_size_reply_t;
Pxcb_query_best_size_request_t  = ^xcb_query_best_size_request_t;
Pxcb_query_colors_cookie_t  = ^xcb_query_colors_cookie_t;
Pxcb_query_colors_reply_t  = ^xcb_query_colors_reply_t;
Pxcb_query_colors_request_t  = ^xcb_query_colors_request_t;
Pxcb_query_extension_cookie_t  = ^xcb_query_extension_cookie_t;
Pxcb_query_extension_reply_t  = ^xcb_query_extension_reply_t;
Pxcb_query_extension_request_t  = ^xcb_query_extension_request_t;
Pxcb_query_font_cookie_t  = ^xcb_query_font_cookie_t;
Pxcb_query_font_reply_t  = ^xcb_query_font_reply_t;
Pxcb_query_font_request_t  = ^xcb_query_font_request_t;
Pxcb_query_keymap_cookie_t  = ^xcb_query_keymap_cookie_t;
Pxcb_query_keymap_reply_t  = ^xcb_query_keymap_reply_t;
Pxcb_query_keymap_request_t  = ^xcb_query_keymap_request_t;
Pxcb_query_pointer_cookie_t  = ^xcb_query_pointer_cookie_t;
Pxcb_query_pointer_reply_t  = ^xcb_query_pointer_reply_t;
Pxcb_query_pointer_request_t  = ^xcb_query_pointer_request_t;
Pxcb_query_shape_of_t  = ^xcb_query_shape_of_t;
Pxcb_query_text_extents_cookie_t  = ^xcb_query_text_extents_cookie_t;
Pxcb_query_text_extents_reply_t  = ^xcb_query_text_extents_reply_t;
Pxcb_query_text_extents_request_t  = ^xcb_query_text_extents_request_t;
Pxcb_query_tree_cookie_t  = ^xcb_query_tree_cookie_t;
Pxcb_query_tree_reply_t  = ^xcb_query_tree_reply_t;
Pxcb_query_tree_request_t  = ^xcb_query_tree_request_t;
Pxcb_recolor_cursor_request_t  = ^xcb_recolor_cursor_request_t;
Pxcb_rectangle_iterator_t  = ^xcb_rectangle_iterator_t;
Pxcb_rectangle_t  = ^xcb_rectangle_t;
Pxcb_reparent_notify_event_t  = ^xcb_reparent_notify_event_t;
Pxcb_reparent_window_request_t  = ^xcb_reparent_window_request_t;
Pxcb_request_error_t  = ^xcb_request_error_t;
Pxcb_resize_request_event_t  = ^xcb_resize_request_event_t;
Pxcb_rgb_iterator_t  = ^xcb_rgb_iterator_t;
Pxcb_rgb_t  = ^xcb_rgb_t;
Pxcb_rotate_properties_request_t  = ^xcb_rotate_properties_request_t;
Pxcb_screen_iterator_t  = ^xcb_screen_iterator_t;
Pxcb_screen_saver_t  = ^xcb_screen_saver_t;
Pxcb_screen_t  = ^xcb_screen_t;
Pxcb_segment_iterator_t  = ^xcb_segment_iterator_t;
Pxcb_segment_t  = ^xcb_segment_t;
Pxcb_selection_clear_event_t  = ^xcb_selection_clear_event_t;
Pxcb_selection_notify_event_t  = ^xcb_selection_notify_event_t;
Pxcb_selection_request_event_t  = ^xcb_selection_request_event_t;
Pxcb_send_event_dest_t  = ^xcb_send_event_dest_t;
Pxcb_send_event_request_t  = ^xcb_send_event_request_t;
Pxcb_set_access_control_request_t  = ^xcb_set_access_control_request_t;
Pxcb_set_clip_rectangles_request_t  = ^xcb_set_clip_rectangles_request_t;
Pxcb_set_close_down_mode_request_t  = ^xcb_set_close_down_mode_request_t;
Pxcb_set_dashes_request_t  = ^xcb_set_dashes_request_t;
Pxcb_set_font_path_request_t  = ^xcb_set_font_path_request_t;
Pxcb_set_input_focus_request_t  = ^xcb_set_input_focus_request_t;
Pxcb_set_mode_t  = ^xcb_set_mode_t;
Pxcb_set_modifier_mapping_cookie_t  = ^xcb_set_modifier_mapping_cookie_t;
Pxcb_set_modifier_mapping_reply_t  = ^xcb_set_modifier_mapping_reply_t;
Pxcb_set_modifier_mapping_request_t  = ^xcb_set_modifier_mapping_request_t;
Pxcb_set_pointer_mapping_cookie_t  = ^xcb_set_pointer_mapping_cookie_t;
Pxcb_set_pointer_mapping_reply_t  = ^xcb_set_pointer_mapping_reply_t;
Pxcb_set_pointer_mapping_request_t  = ^xcb_set_pointer_mapping_request_t;
Pxcb_set_screen_saver_request_t  = ^xcb_set_screen_saver_request_t;
Pxcb_set_selection_owner_request_t  = ^xcb_set_selection_owner_request_t;
Pxcb_setup_authenticate_iterator_t  = ^xcb_setup_authenticate_iterator_t;
Pxcb_setup_authenticate_t  = ^xcb_setup_authenticate_t;
Pxcb_setup_failed_iterator_t  = ^xcb_setup_failed_iterator_t;
Pxcb_setup_failed_t  = ^xcb_setup_failed_t;
Pxcb_setup_iterator_t  = ^xcb_setup_iterator_t;
Pxcb_setup_request_iterator_t  = ^xcb_setup_request_iterator_t;
Pxcb_setup_request_t  = ^xcb_setup_request_t;
Pxcb_setup_t  = ^xcb_setup_t;
Pxcb_stack_mode_t  = ^xcb_stack_mode_t;
Pxcb_store_colors_request_t  = ^xcb_store_colors_request_t;
Pxcb_store_named_color_request_t  = ^xcb_store_named_color_request_t;
Pxcb_str_iterator_t  = ^xcb_str_iterator_t;
Pxcb_str_t  = ^xcb_str_t;
Pxcb_subwindow_mode_t  = ^xcb_subwindow_mode_t;
Pxcb_time_t  = ^xcb_time_t;
Pxcb_timecoord_iterator_t  = ^xcb_timecoord_iterator_t;
Pxcb_timecoord_t  = ^xcb_timecoord_t;
Pxcb_timestamp_iterator_t  = ^xcb_timestamp_iterator_t;
Pxcb_timestamp_t  = ^xcb_timestamp_t;
Pxcb_translate_coordinates_cookie_t  = ^xcb_translate_coordinates_cookie_t;
Pxcb_translate_coordinates_reply_t  = ^xcb_translate_coordinates_reply_t;
Pxcb_translate_coordinates_request_t  = ^xcb_translate_coordinates_request_t;
Pxcb_ungrab_button_request_t  = ^xcb_ungrab_button_request_t;
Pxcb_ungrab_key_request_t  = ^xcb_ungrab_key_request_t;
Pxcb_ungrab_keyboard_request_t  = ^xcb_ungrab_keyboard_request_t;
Pxcb_ungrab_pointer_request_t  = ^xcb_ungrab_pointer_request_t;
Pxcb_ungrab_server_request_t  = ^xcb_ungrab_server_request_t;
Pxcb_uninstall_colormap_request_t  = ^xcb_uninstall_colormap_request_t;
Pxcb_unmap_notify_event_t  = ^xcb_unmap_notify_event_t;
Pxcb_unmap_subwindows_request_t  = ^xcb_unmap_subwindows_request_t;
Pxcb_unmap_window_request_t  = ^xcb_unmap_window_request_t;
Pxcb_value_error_t  = ^xcb_value_error_t;
Pxcb_visibility_notify_event_t  = ^xcb_visibility_notify_event_t;
Pxcb_visibility_t  = ^xcb_visibility_t;
Pxcb_visual_class_t  = ^xcb_visual_class_t;
Pxcb_visualid_iterator_t  = ^xcb_visualid_iterator_t;
Pxcb_visualid_t  = ^xcb_visualid_t;
Pxcb_visualtype_iterator_t  = ^xcb_visualtype_iterator_t;
Pxcb_visualtype_t  = ^xcb_visualtype_t;
Pxcb_warp_pointer_request_t  = ^xcb_warp_pointer_request_t;
Pxcb_window_class_t  = ^xcb_window_class_t;
Pxcb_window_enum_t  = ^xcb_window_enum_t;
Pxcb_window_error_t  = ^xcb_window_error_t;
Pxcb_window_iterator_t  = ^xcb_window_iterator_t;
Pxcb_window_t  = ^xcb_window_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from xproto.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB__API XCB  API
 * @brief  XCB Protocol Implementation.
 * @
 * }
{$ifndef __XPROTO_H}
{$define __XPROTO_H}
{$include "xcb.h"}
{ C++ extern C conditionnal removed }
{*
 * @brief xcb_char2b_t
 * }
type
  Pxcb_char2b_t = ^Txcb_char2b_t;
  Txcb_char2b_t = record
      byte1 : Tuint8_t;
      byte2 : Tuint8_t;
    end;
{*
 * @brief xcb_char2b_iterator_t
 * }

  Pxcb_char2b_iterator_t = ^Txcb_char2b_iterator_t;
  Txcb_char2b_iterator_t = record
      data : Pxcb_char2b_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_window_t = ^Txcb_window_t;
  Txcb_window_t = Tuint32_t;
{*
 * @brief xcb_window_iterator_t
 * }

  Pxcb_window_iterator_t = ^Txcb_window_iterator_t;
  Txcb_window_iterator_t = record
      data : Pxcb_window_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_pixmap_t = ^Txcb_pixmap_t;
  Txcb_pixmap_t = Tuint32_t;
{*
 * @brief xcb_pixmap_iterator_t
 * }

  Pxcb_pixmap_iterator_t = ^Txcb_pixmap_iterator_t;
  Txcb_pixmap_iterator_t = record
      data : Pxcb_pixmap_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_cursor_t = ^Txcb_cursor_t;
  Txcb_cursor_t = Tuint32_t;
{*
 * @brief xcb_cursor_iterator_t
 * }

  Pxcb_cursor_iterator_t = ^Txcb_cursor_iterator_t;
  Txcb_cursor_iterator_t = record
      data : Pxcb_cursor_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_font_t = ^Txcb_font_t;
  Txcb_font_t = Tuint32_t;
{*
 * @brief xcb_font_iterator_t
 * }

  Pxcb_font_iterator_t = ^Txcb_font_iterator_t;
  Txcb_font_iterator_t = record
      data : Pxcb_font_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_gcontext_t = ^Txcb_gcontext_t;
  Txcb_gcontext_t = Tuint32_t;
{*
 * @brief xcb_gcontext_iterator_t
 * }

  Pxcb_gcontext_iterator_t = ^Txcb_gcontext_iterator_t;
  Txcb_gcontext_iterator_t = record
      data : Pxcb_gcontext_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_colormap_t = ^Txcb_colormap_t;
  Txcb_colormap_t = Tuint32_t;
{*
 * @brief xcb_colormap_iterator_t
 * }

  Pxcb_colormap_iterator_t = ^Txcb_colormap_iterator_t;
  Txcb_colormap_iterator_t = record
      data : Pxcb_colormap_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_atom_t = ^Txcb_atom_t;
  Txcb_atom_t = Tuint32_t;
{*
 * @brief xcb_atom_iterator_t
 * }

  Pxcb_atom_iterator_t = ^Txcb_atom_iterator_t;
  Txcb_atom_iterator_t = record
      data : Pxcb_atom_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_drawable_t = ^Txcb_drawable_t;
  Txcb_drawable_t = Tuint32_t;
{*
 * @brief xcb_drawable_iterator_t
 * }

  Pxcb_drawable_iterator_t = ^Txcb_drawable_iterator_t;
  Txcb_drawable_iterator_t = record
      data : Pxcb_drawable_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_fontable_t = ^Txcb_fontable_t;
  Txcb_fontable_t = Tuint32_t;
{*
 * @brief xcb_fontable_iterator_t
 * }

  Pxcb_fontable_iterator_t = ^Txcb_fontable_iterator_t;
  Txcb_fontable_iterator_t = record
      data : Pxcb_fontable_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_bool32_t = ^Txcb_bool32_t;
  Txcb_bool32_t = Tuint32_t;
{*
 * @brief xcb_bool32_iterator_t
 * }

  Pxcb_bool32_iterator_t = ^Txcb_bool32_iterator_t;
  Txcb_bool32_iterator_t = record
      data : Pxcb_bool32_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_visualid_t = ^Txcb_visualid_t;
  Txcb_visualid_t = Tuint32_t;
{*
 * @brief xcb_visualid_iterator_t
 * }

  Pxcb_visualid_iterator_t = ^Txcb_visualid_iterator_t;
  Txcb_visualid_iterator_t = record
      data : Pxcb_visualid_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_timestamp_t = ^Txcb_timestamp_t;
  Txcb_timestamp_t = Tuint32_t;
{*
 * @brief xcb_timestamp_iterator_t
 * }

  Pxcb_timestamp_iterator_t = ^Txcb_timestamp_iterator_t;
  Txcb_timestamp_iterator_t = record
      data : Pxcb_timestamp_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_keysym_t = ^Txcb_keysym_t;
  Txcb_keysym_t = Tuint32_t;
{*
 * @brief xcb_keysym_iterator_t
 * }

  Pxcb_keysym_iterator_t = ^Txcb_keysym_iterator_t;
  Txcb_keysym_iterator_t = record
      data : Pxcb_keysym_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_keycode_t = ^Txcb_keycode_t;
  Txcb_keycode_t = Tuint8_t;
{*
 * @brief xcb_keycode_iterator_t
 * }

  Pxcb_keycode_iterator_t = ^Txcb_keycode_iterator_t;
  Txcb_keycode_iterator_t = record
      data : Pxcb_keycode_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_keycode32_t = ^Txcb_keycode32_t;
  Txcb_keycode32_t = Tuint32_t;
{*
 * @brief xcb_keycode32_iterator_t
 * }

  Pxcb_keycode32_iterator_t = ^Txcb_keycode32_iterator_t;
  Txcb_keycode32_iterator_t = record
      data : Pxcb_keycode32_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_button_t = ^Txcb_button_t;
  Txcb_button_t = Tuint8_t;
{*
 * @brief xcb_button_iterator_t
 * }

  Pxcb_button_iterator_t = ^Txcb_button_iterator_t;
  Txcb_button_iterator_t = record
      data : Pxcb_button_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_point_t
 * }

  Pxcb_point_t = ^Txcb_point_t;
  Txcb_point_t = record
      x : Tint16_t;
      y : Tint16_t;
    end;
{*
 * @brief xcb_point_iterator_t
 * }

  Pxcb_point_iterator_t = ^Txcb_point_iterator_t;
  Txcb_point_iterator_t = record
      data : Pxcb_point_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_rectangle_t
 * }

  Pxcb_rectangle_t = ^Txcb_rectangle_t;
  Txcb_rectangle_t = record
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
    end;
{*
 * @brief xcb_rectangle_iterator_t
 * }

  Pxcb_rectangle_iterator_t = ^Txcb_rectangle_iterator_t;
  Txcb_rectangle_iterator_t = record
      data : Pxcb_rectangle_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_arc_t
 * }

  Pxcb_arc_t = ^Txcb_arc_t;
  Txcb_arc_t = record
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      angle1 : Tint16_t;
      angle2 : Tint16_t;
    end;
{*
 * @brief xcb_arc_iterator_t
 * }

  Pxcb_arc_iterator_t = ^Txcb_arc_iterator_t;
  Txcb_arc_iterator_t = record
      data : Pxcb_arc_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_format_t
 * }

  Pxcb_format_t = ^Txcb_format_t;
  Txcb_format_t = record
      depth : Tuint8_t;
      bits_per_pixel : Tuint8_t;
      scanline_pad : Tuint8_t;
      pad0 : array[0..4] of Tuint8_t;
    end;
{*
 * @brief xcb_format_iterator_t
 * }

  Pxcb_format_iterator_t = ^Txcb_format_iterator_t;
  Txcb_format_iterator_t = record
      data : Pxcb_format_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_visual_class_t = ^Txcb_visual_class_t;
  Txcb_visual_class_t =  Longint;
  Const
    XCB_VISUAL_CLASS_STATIC_GRAY = 0;
    XCB_VISUAL_CLASS_GRAY_SCALE = 1;
    XCB_VISUAL_CLASS_STATIC_COLOR = 2;
    XCB_VISUAL_CLASS_PSEUDO_COLOR = 3;
    XCB_VISUAL_CLASS_TRUE_COLOR = 4;
    XCB_VISUAL_CLASS_DIRECT_COLOR = 5;
;
{*
 * @brief xcb_visualtype_t
 * }
type
  Pxcb_visualtype_t = ^Txcb_visualtype_t;
  Txcb_visualtype_t = record
      visual_id : Txcb_visualid_t;
      _class : Tuint8_t;
      bits_per_rgb_value : Tuint8_t;
      colormap_entries : Tuint16_t;
      red_mask : Tuint32_t;
      green_mask : Tuint32_t;
      blue_mask : Tuint32_t;
      pad0 : array[0..3] of Tuint8_t;
    end;
{*
 * @brief xcb_visualtype_iterator_t
 * }

  Pxcb_visualtype_iterator_t = ^Txcb_visualtype_iterator_t;
  Txcb_visualtype_iterator_t = record
      data : Pxcb_visualtype_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_depth_t
 * }

  Pxcb_depth_t = ^Txcb_depth_t;
  Txcb_depth_t = record
      depth : Tuint8_t;
      pad0 : Tuint8_t;
      visuals_len : Tuint16_t;
      pad1 : array[0..3] of Tuint8_t;
    end;
{*
 * @brief xcb_depth_iterator_t
 * }

  Pxcb_depth_iterator_t = ^Txcb_depth_iterator_t;
  Txcb_depth_iterator_t = record
      data : Pxcb_depth_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_event_mask_t = ^Txcb_event_mask_t;
  Txcb_event_mask_t =  Longint;
  Const
    XCB_EVENT_MASK_NO_EVENT = 0;
    XCB_EVENT_MASK_KEY_PRESS = 1;
    XCB_EVENT_MASK_KEY_RELEASE = 2;
    XCB_EVENT_MASK_BUTTON_PRESS = 4;
    XCB_EVENT_MASK_BUTTON_RELEASE = 8;
    XCB_EVENT_MASK_ENTER_WINDOW = 16;
    XCB_EVENT_MASK_LEAVE_WINDOW = 32;
    XCB_EVENT_MASK_POINTER_MOTION = 64;
    XCB_EVENT_MASK_POINTER_MOTION_HINT = 128;
    XCB_EVENT_MASK_BUTTON_1_MOTION = 256;
    XCB_EVENT_MASK_BUTTON_2_MOTION = 512;
    XCB_EVENT_MASK_BUTTON_3_MOTION = 1024;
    XCB_EVENT_MASK_BUTTON_4_MOTION = 2048;
    XCB_EVENT_MASK_BUTTON_5_MOTION = 4096;
    XCB_EVENT_MASK_BUTTON_MOTION = 8192;
    XCB_EVENT_MASK_KEYMAP_STATE = 16384;
    XCB_EVENT_MASK_EXPOSURE = 32768;
    XCB_EVENT_MASK_VISIBILITY_CHANGE = 65536;
    XCB_EVENT_MASK_STRUCTURE_NOTIFY = 131072;
    XCB_EVENT_MASK_RESIZE_REDIRECT = 262144;
    XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY = 524288;
    XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT = 1048576;
    XCB_EVENT_MASK_FOCUS_CHANGE = 2097152;
    XCB_EVENT_MASK_PROPERTY_CHANGE = 4194304;
    XCB_EVENT_MASK_COLOR_MAP_CHANGE = 8388608;
    XCB_EVENT_MASK_OWNER_GRAB_BUTTON = 16777216;
;
type
  Pxcb_backing_store_t = ^Txcb_backing_store_t;
  Txcb_backing_store_t =  Longint;
  Const
    XCB_BACKING_STORE_NOT_USEFUL = 0;
    XCB_BACKING_STORE_WHEN_MAPPED = 1;
    XCB_BACKING_STORE_ALWAYS = 2;
;
{*
 * @brief xcb_screen_t
 * }
type
  Pxcb_screen_t = ^Txcb_screen_t;
  Txcb_screen_t = record
      root : Txcb_window_t;
      default_colormap : Txcb_colormap_t;
      white_pixel : Tuint32_t;
      black_pixel : Tuint32_t;
      current_input_masks : Tuint32_t;
      width_in_pixels : Tuint16_t;
      height_in_pixels : Tuint16_t;
      width_in_millimeters : Tuint16_t;
      height_in_millimeters : Tuint16_t;
      min_installed_maps : Tuint16_t;
      max_installed_maps : Tuint16_t;
      root_visual : Txcb_visualid_t;
      backing_stores : Tuint8_t;
      save_unders : Tuint8_t;
      root_depth : Tuint8_t;
      allowed_depths_len : Tuint8_t;
    end;
{*
 * @brief xcb_screen_iterator_t
 * }

  Pxcb_screen_iterator_t = ^Txcb_screen_iterator_t;
  Txcb_screen_iterator_t = record
      data : Pxcb_screen_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_setup_request_t
 * }

  Pxcb_setup_request_t = ^Txcb_setup_request_t;
  Txcb_setup_request_t = record
      byte_order : Tuint8_t;
      pad0 : Tuint8_t;
      protocol_major_version : Tuint16_t;
      protocol_minor_version : Tuint16_t;
      authorization_protocol_name_len : Tuint16_t;
      authorization_protocol_data_len : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_setup_request_iterator_t
 * }

  Pxcb_setup_request_iterator_t = ^Txcb_setup_request_iterator_t;
  Txcb_setup_request_iterator_t = record
      data : Pxcb_setup_request_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_setup_failed_t
 * }

  Pxcb_setup_failed_t = ^Txcb_setup_failed_t;
  Txcb_setup_failed_t = record
      status : Tuint8_t;
      reason_len : Tuint8_t;
      protocol_major_version : Tuint16_t;
      protocol_minor_version : Tuint16_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_setup_failed_iterator_t
 * }

  Pxcb_setup_failed_iterator_t = ^Txcb_setup_failed_iterator_t;
  Txcb_setup_failed_iterator_t = record
      data : Pxcb_setup_failed_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_setup_authenticate_t
 * }

  Pxcb_setup_authenticate_t = ^Txcb_setup_authenticate_t;
  Txcb_setup_authenticate_t = record
      status : Tuint8_t;
      pad0 : array[0..4] of Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_setup_authenticate_iterator_t
 * }

  Pxcb_setup_authenticate_iterator_t = ^Txcb_setup_authenticate_iterator_t;
  Txcb_setup_authenticate_iterator_t = record
      data : Pxcb_setup_authenticate_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_image_order_t = ^Txcb_image_order_t;
  Txcb_image_order_t =  Longint;
  Const
    XCB_IMAGE_ORDER_LSB_FIRST = 0;
    XCB_IMAGE_ORDER_MSB_FIRST = 1;
;
{*
 * @brief xcb_setup_t
 * }
type
  Pxcb_setup_t = ^Txcb_setup_t;
  Txcb_setup_t = record
      status : Tuint8_t;
      pad0 : Tuint8_t;
      protocol_major_version : Tuint16_t;
      protocol_minor_version : Tuint16_t;
      length : Tuint16_t;
      release_number : Tuint32_t;
      resource_id_base : Tuint32_t;
      resource_id_mask : Tuint32_t;
      motion_buffer_size : Tuint32_t;
      vendor_len : Tuint16_t;
      maximum_request_length : Tuint16_t;
      roots_len : Tuint8_t;
      pixmap_formats_len : Tuint8_t;
      image_byte_order : Tuint8_t;
      bitmap_format_bit_order : Tuint8_t;
      bitmap_format_scanline_unit : Tuint8_t;
      bitmap_format_scanline_pad : Tuint8_t;
      min_keycode : Txcb_keycode_t;
      max_keycode : Txcb_keycode_t;
      pad1 : array[0..3] of Tuint8_t;
    end;
{*
 * @brief xcb_setup_iterator_t
 * }

  Pxcb_setup_iterator_t = ^Txcb_setup_iterator_t;
  Txcb_setup_iterator_t = record
      data : Pxcb_setup_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_mod_mask_t = ^Txcb_mod_mask_t;
  Txcb_mod_mask_t =  Longint;
  Const
    XCB_MOD_MASK_SHIFT = 1;
    XCB_MOD_MASK_LOCK = 2;
    XCB_MOD_MASK_CONTROL = 4;
    XCB_MOD_MASK_1 = 8;
    XCB_MOD_MASK_2 = 16;
    XCB_MOD_MASK_3 = 32;
    XCB_MOD_MASK_4 = 64;
    XCB_MOD_MASK_5 = 128;
    XCB_MOD_MASK_ANY = 32768;
;
type
  Pxcb_key_but_mask_t = ^Txcb_key_but_mask_t;
  Txcb_key_but_mask_t =  Longint;
  Const
    XCB_KEY_BUT_MASK_SHIFT = 1;
    XCB_KEY_BUT_MASK_LOCK = 2;
    XCB_KEY_BUT_MASK_CONTROL = 4;
    XCB_KEY_BUT_MASK_MOD_1 = 8;
    XCB_KEY_BUT_MASK_MOD_2 = 16;
    XCB_KEY_BUT_MASK_MOD_3 = 32;
    XCB_KEY_BUT_MASK_MOD_4 = 64;
    XCB_KEY_BUT_MASK_MOD_5 = 128;
    XCB_KEY_BUT_MASK_BUTTON_1 = 256;
    XCB_KEY_BUT_MASK_BUTTON_2 = 512;
    XCB_KEY_BUT_MASK_BUTTON_3 = 1024;
    XCB_KEY_BUT_MASK_BUTTON_4 = 2048;
    XCB_KEY_BUT_MASK_BUTTON_5 = 4096;
;
type
  Pxcb_window_enum_t = ^Txcb_window_enum_t;
  Txcb_window_enum_t =  Longint;
  Const
    XCB_WINDOW_NONE = 0;
;
{* Opcode for xcb_key_press.  }
  XCB_KEY_PRESS = 2;  
{*
 * @brief xcb_key_press_event_t
 * }
type
  Pxcb_key_press_event_t = ^Txcb_key_press_event_t;
  Txcb_key_press_event_t = record
      response_type : Tuint8_t;
      detail : Txcb_keycode_t;
      sequence : Tuint16_t;
      time : Txcb_timestamp_t;
      root : Txcb_window_t;
      event : Txcb_window_t;
      child : Txcb_window_t;
      root_x : Tint16_t;
      root_y : Tint16_t;
      event_x : Tint16_t;
      event_y : Tint16_t;
      state : Tuint16_t;
      same_screen : Tuint8_t;
      pad0 : Tuint8_t;
    end;
{* Opcode for xcb_key_release.  }

const
  XCB_KEY_RELEASE = 3;  
type
  Pxcb_key_release_event_t = ^Txcb_key_release_event_t;
  Txcb_key_release_event_t = Txcb_key_press_event_t;

  Pxcb_button_mask_t = ^Txcb_button_mask_t;
  Txcb_button_mask_t =  Longint;
  Const
    XCB_BUTTON_MASK_1 = 256;
    XCB_BUTTON_MASK_2 = 512;
    XCB_BUTTON_MASK_3 = 1024;
    XCB_BUTTON_MASK_4 = 2048;
    XCB_BUTTON_MASK_5 = 4096;
    XCB_BUTTON_MASK_ANY = 32768;
;
{* Opcode for xcb_button_press.  }
  XCB_BUTTON_PRESS = 4;  
{*
 * @brief xcb_button_press_event_t
 * }
type
  Pxcb_button_press_event_t = ^Txcb_button_press_event_t;
  Txcb_button_press_event_t = record
      response_type : Tuint8_t;
      detail : Txcb_button_t;
      sequence : Tuint16_t;
      time : Txcb_timestamp_t;
      root : Txcb_window_t;
      event : Txcb_window_t;
      child : Txcb_window_t;
      root_x : Tint16_t;
      root_y : Tint16_t;
      event_x : Tint16_t;
      event_y : Tint16_t;
      state : Tuint16_t;
      same_screen : Tuint8_t;
      pad0 : Tuint8_t;
    end;
{* Opcode for xcb_button_release.  }

const
  XCB_BUTTON_RELEASE = 5;  
type
  Pxcb_button_release_event_t = ^Txcb_button_release_event_t;
  Txcb_button_release_event_t = Txcb_button_press_event_t;

  Pxcb_motion_t = ^Txcb_motion_t;
  Txcb_motion_t =  Longint;
  Const
    XCB_MOTION_NORMAL = 0;
    XCB_MOTION_HINT = 1;
;
{* Opcode for xcb_motion_notify.  }
  XCB_MOTION_NOTIFY = 6;  
{*
 * @brief xcb_motion_notify_event_t
 * }
type
  Pxcb_motion_notify_event_t = ^Txcb_motion_notify_event_t;
  Txcb_motion_notify_event_t = record
      response_type : Tuint8_t;
      detail : Tuint8_t;
      sequence : Tuint16_t;
      time : Txcb_timestamp_t;
      root : Txcb_window_t;
      event : Txcb_window_t;
      child : Txcb_window_t;
      root_x : Tint16_t;
      root_y : Tint16_t;
      event_x : Tint16_t;
      event_y : Tint16_t;
      state : Tuint16_t;
      same_screen : Tuint8_t;
      pad0 : Tuint8_t;
    end;

  Pxcb_notify_detail_t = ^Txcb_notify_detail_t;
  Txcb_notify_detail_t =  Longint;
  Const
    XCB_NOTIFY_DETAIL_ANCESTOR = 0;
    XCB_NOTIFY_DETAIL_VIRTUAL = 1;
    XCB_NOTIFY_DETAIL_INFERIOR = 2;
    XCB_NOTIFY_DETAIL_NONLINEAR = 3;
    XCB_NOTIFY_DETAIL_NONLINEAR_VIRTUAL = 4;
    XCB_NOTIFY_DETAIL_POINTER = 5;
    XCB_NOTIFY_DETAIL_POINTER_ROOT = 6;
    XCB_NOTIFY_DETAIL_NONE = 7;
;
type
  Pxcb_notify_mode_t = ^Txcb_notify_mode_t;
  Txcb_notify_mode_t =  Longint;
  Const
    XCB_NOTIFY_MODE_NORMAL = 0;
    XCB_NOTIFY_MODE_GRAB = 1;
    XCB_NOTIFY_MODE_UNGRAB = 2;
    XCB_NOTIFY_MODE_WHILE_GRABBED = 3;
;
{* Opcode for xcb_enter_notify.  }
  XCB_ENTER_NOTIFY = 7;  
{*
 * @brief xcb_enter_notify_event_t
 * }
type
  Pxcb_enter_notify_event_t = ^Txcb_enter_notify_event_t;
  Txcb_enter_notify_event_t = record
      response_type : Tuint8_t;
      detail : Tuint8_t;
      sequence : Tuint16_t;
      time : Txcb_timestamp_t;
      root : Txcb_window_t;
      event : Txcb_window_t;
      child : Txcb_window_t;
      root_x : Tint16_t;
      root_y : Tint16_t;
      event_x : Tint16_t;
      event_y : Tint16_t;
      state : Tuint16_t;
      mode : Tuint8_t;
      same_screen_focus : Tuint8_t;
    end;
{* Opcode for xcb_leave_notify.  }

const
  XCB_LEAVE_NOTIFY = 8;  
type
  Pxcb_leave_notify_event_t = ^Txcb_leave_notify_event_t;
  Txcb_leave_notify_event_t = Txcb_enter_notify_event_t;
{* Opcode for xcb_focus_in.  }

const
  XCB_FOCUS_IN = 9;  
{*
 * @brief xcb_focus_in_event_t
 * }
type
  Pxcb_focus_in_event_t = ^Txcb_focus_in_event_t;
  Txcb_focus_in_event_t = record
      response_type : Tuint8_t;
      detail : Tuint8_t;
      sequence : Tuint16_t;
      event : Txcb_window_t;
      mode : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_focus_out.  }

const
  XCB_FOCUS_OUT = 10;  
type
  Pxcb_focus_out_event_t = ^Txcb_focus_out_event_t;
  Txcb_focus_out_event_t = Txcb_focus_in_event_t;
{* Opcode for xcb_keymap_notify.  }

const
  XCB_KEYMAP_NOTIFY = 11;  
{*
 * @brief xcb_keymap_notify_event_t
 * }
type
  Pxcb_keymap_notify_event_t = ^Txcb_keymap_notify_event_t;
  Txcb_keymap_notify_event_t = record
      response_type : Tuint8_t;
      keys : array[0..30] of Tuint8_t;
    end;
{* Opcode for xcb_expose.  }

const
  XCB_EXPOSE = 12;  
{*
 * @brief xcb_expose_event_t
 * }
type
  Pxcb_expose_event_t = ^Txcb_expose_event_t;
  Txcb_expose_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      window : Txcb_window_t;
      x : Tuint16_t;
      y : Tuint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      count : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
    end;
{* Opcode for xcb_graphics_exposure.  }

const
  XCB_GRAPHICS_EXPOSURE = 13;  
{*
 * @brief xcb_graphics_exposure_event_t
 * }
type
  Pxcb_graphics_exposure_event_t = ^Txcb_graphics_exposure_event_t;
  Txcb_graphics_exposure_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      drawable : Txcb_drawable_t;
      x : Tuint16_t;
      y : Tuint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      minor_opcode : Tuint16_t;
      count : Tuint16_t;
      major_opcode : Tuint8_t;
      pad1 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_no_exposure.  }

const
  XCB_NO_EXPOSURE = 14;  
{*
 * @brief xcb_no_exposure_event_t
 * }
type
  Pxcb_no_exposure_event_t = ^Txcb_no_exposure_event_t;
  Txcb_no_exposure_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      drawable : Txcb_drawable_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
      pad1 : Tuint8_t;
    end;

  Pxcb_visibility_t = ^Txcb_visibility_t;
  Txcb_visibility_t =  Longint;
  Const
    XCB_VISIBILITY_UNOBSCURED = 0;
    XCB_VISIBILITY_PARTIALLY_OBSCURED = 1;
    XCB_VISIBILITY_FULLY_OBSCURED = 2;
;
{* Opcode for xcb_visibility_notify.  }
  XCB_VISIBILITY_NOTIFY = 15;  
{*
 * @brief xcb_visibility_notify_event_t
 * }
type
  Pxcb_visibility_notify_event_t = ^Txcb_visibility_notify_event_t;
  Txcb_visibility_notify_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      window : Txcb_window_t;
      state : Tuint8_t;
      pad1 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_create_notify.  }

const
  XCB_CREATE_NOTIFY = 16;  
{*
 * @brief xcb_create_notify_event_t
 * }
type
  Pxcb_create_notify_event_t = ^Txcb_create_notify_event_t;
  Txcb_create_notify_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      parent : Txcb_window_t;
      window : Txcb_window_t;
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      border_width : Tuint16_t;
      override_redirect : Tuint8_t;
      pad1 : Tuint8_t;
    end;
{* Opcode for xcb_destroy_notify.  }

const
  XCB_DESTROY_NOTIFY = 17;  
{*
 * @brief xcb_destroy_notify_event_t
 * }
type
  Pxcb_destroy_notify_event_t = ^Txcb_destroy_notify_event_t;
  Txcb_destroy_notify_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      event : Txcb_window_t;
      window : Txcb_window_t;
    end;
{* Opcode for xcb_unmap_notify.  }

const
  XCB_UNMAP_NOTIFY = 18;  
{*
 * @brief xcb_unmap_notify_event_t
 * }
type
  Pxcb_unmap_notify_event_t = ^Txcb_unmap_notify_event_t;
  Txcb_unmap_notify_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      event : Txcb_window_t;
      window : Txcb_window_t;
      from_configure : Tuint8_t;
      pad1 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_map_notify.  }

const
  XCB_MAP_NOTIFY = 19;  
{*
 * @brief xcb_map_notify_event_t
 * }
type
  Pxcb_map_notify_event_t = ^Txcb_map_notify_event_t;
  Txcb_map_notify_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      event : Txcb_window_t;
      window : Txcb_window_t;
      override_redirect : Tuint8_t;
      pad1 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_map_request.  }

const
  XCB_MAP_REQUEST = 20;  
{*
 * @brief xcb_map_request_event_t
 * }
type
  Pxcb_map_request_event_t = ^Txcb_map_request_event_t;
  Txcb_map_request_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      parent : Txcb_window_t;
      window : Txcb_window_t;
    end;
{* Opcode for xcb_reparent_notify.  }

const
  XCB_REPARENT_NOTIFY = 21;  
{*
 * @brief xcb_reparent_notify_event_t
 * }
type
  Pxcb_reparent_notify_event_t = ^Txcb_reparent_notify_event_t;
  Txcb_reparent_notify_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      event : Txcb_window_t;
      window : Txcb_window_t;
      parent : Txcb_window_t;
      x : Tint16_t;
      y : Tint16_t;
      override_redirect : Tuint8_t;
      pad1 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_configure_notify.  }

const
  XCB_CONFIGURE_NOTIFY = 22;  
{*
 * @brief xcb_configure_notify_event_t
 * }
type
  Pxcb_configure_notify_event_t = ^Txcb_configure_notify_event_t;
  Txcb_configure_notify_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      event : Txcb_window_t;
      window : Txcb_window_t;
      above_sibling : Txcb_window_t;
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      border_width : Tuint16_t;
      override_redirect : Tuint8_t;
      pad1 : Tuint8_t;
    end;
{* Opcode for xcb_configure_request.  }

const
  XCB_CONFIGURE_REQUEST = 23;  
{*
 * @brief xcb_configure_request_event_t
 * }
type
  Pxcb_configure_request_event_t = ^Txcb_configure_request_event_t;
  Txcb_configure_request_event_t = record
      response_type : Tuint8_t;
      stack_mode : Tuint8_t;
      sequence : Tuint16_t;
      parent : Txcb_window_t;
      window : Txcb_window_t;
      sibling : Txcb_window_t;
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      border_width : Tuint16_t;
      value_mask : Tuint16_t;
    end;
{* Opcode for xcb_gravity_notify.  }

const
  XCB_GRAVITY_NOTIFY = 24;  
{*
 * @brief xcb_gravity_notify_event_t
 * }
type
  Pxcb_gravity_notify_event_t = ^Txcb_gravity_notify_event_t;
  Txcb_gravity_notify_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      event : Txcb_window_t;
      window : Txcb_window_t;
      x : Tint16_t;
      y : Tint16_t;
    end;
{* Opcode for xcb_resize_request.  }

const
  XCB_RESIZE_REQUEST = 25;  
{*
 * @brief xcb_resize_request_event_t
 * }
type
  Pxcb_resize_request_event_t = ^Txcb_resize_request_event_t;
  Txcb_resize_request_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      window : Txcb_window_t;
      width : Tuint16_t;
      height : Tuint16_t;
    end;
{*< The window is now on top of all siblings.  }
{*< The window is now below all siblings.  }

  Pxcb_place_t = ^Txcb_place_t;
  Txcb_place_t =  Longint;
  Const
    XCB_PLACE_ON_TOP = 0;
    XCB_PLACE_ON_BOTTOM = 1;
;
{* Opcode for xcb_circulate_notify.  }
  XCB_CIRCULATE_NOTIFY = 26;  
{*
 * @brief xcb_circulate_notify_event_t
 * }
type
  Pxcb_circulate_notify_event_t = ^Txcb_circulate_notify_event_t;
  Txcb_circulate_notify_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      event : Txcb_window_t;
      window : Txcb_window_t;
      pad1 : array[0..3] of Tuint8_t;
      place : Tuint8_t;
      pad2 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_circulate_request.  }

const
  XCB_CIRCULATE_REQUEST = 27;  
type
  Pxcb_circulate_request_event_t = ^Txcb_circulate_request_event_t;
  Txcb_circulate_request_event_t = Txcb_circulate_notify_event_t;

  Pxcb_property_t = ^Txcb_property_t;
  Txcb_property_t =  Longint;
  Const
    XCB_PROPERTY_NEW_VALUE = 0;
    XCB_PROPERTY_DELETE = 1;
;
{* Opcode for xcb_property_notify.  }
  XCB_PROPERTY_NOTIFY = 28;  
{*
 * @brief xcb_property_notify_event_t
 * }
type
  Pxcb_property_notify_event_t = ^Txcb_property_notify_event_t;
  Txcb_property_notify_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      window : Txcb_window_t;
      atom : Txcb_atom_t;
      time : Txcb_timestamp_t;
      state : Tuint8_t;
      pad1 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_selection_clear.  }

const
  XCB_SELECTION_CLEAR = 29;  
{*
 * @brief xcb_selection_clear_event_t
 * }
type
  Pxcb_selection_clear_event_t = ^Txcb_selection_clear_event_t;
  Txcb_selection_clear_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      time : Txcb_timestamp_t;
      owner : Txcb_window_t;
      selection : Txcb_atom_t;
    end;

  Pxcb_time_t = ^Txcb_time_t;
  Txcb_time_t =  Longint;
  Const
    XCB_TIME_CURRENT_TIME = 0;
;
type
  Pxcb_atom_enum_t = ^Txcb_atom_enum_t;
  Txcb_atom_enum_t =  Longint;
  Const
    XCB_ATOM_NONE = 0;
    XCB_ATOM_ANY = 0;
    XCB_ATOM_PRIMARY = 1;
    XCB_ATOM_SECONDARY = 2;
    XCB_ATOM_ARC = 3;
    XCB_ATOM_ATOM = 4;
    XCB_ATOM_BITMAP = 5;
    XCB_ATOM_CARDINAL = 6;
    XCB_ATOM_COLORMAP = 7;
    XCB_ATOM_CURSOR = 8;
    XCB_ATOM_CUT_BUFFER0 = 9;
    XCB_ATOM_CUT_BUFFER1 = 10;
    XCB_ATOM_CUT_BUFFER2 = 11;
    XCB_ATOM_CUT_BUFFER3 = 12;
    XCB_ATOM_CUT_BUFFER4 = 13;
    XCB_ATOM_CUT_BUFFER5 = 14;
    XCB_ATOM_CUT_BUFFER6 = 15;
    XCB_ATOM_CUT_BUFFER7 = 16;
    XCB_ATOM_DRAWABLE = 17;
    XCB_ATOM_FONT = 18;
    XCB_ATOM_INTEGER = 19;
    XCB_ATOM_PIXMAP = 20;
    XCB_ATOM_POINT = 21;
    XCB_ATOM_RECTANGLE = 22;
    XCB_ATOM_RESOURCE_MANAGER = 23;
    XCB_ATOM_RGB_COLOR_MAP = 24;
    XCB_ATOM_RGB_BEST_MAP = 25;
    XCB_ATOM_RGB_BLUE_MAP = 26;
    XCB_ATOM_RGB_DEFAULT_MAP = 27;
    XCB_ATOM_RGB_GRAY_MAP = 28;
    XCB_ATOM_RGB_GREEN_MAP = 29;
    XCB_ATOM_RGB_RED_MAP = 30;
    XCB_ATOM_STRING = 31;
    XCB_ATOM_VISUALID = 32;
    XCB_ATOM_WINDOW = 33;
    XCB_ATOM_WM_COMMAND = 34;
    XCB_ATOM_WM_HINTS = 35;
    XCB_ATOM_WM_CLIENT_MACHINE = 36;
    XCB_ATOM_WM_ICON_NAME = 37;
    XCB_ATOM_WM_ICON_SIZE = 38;
    XCB_ATOM_WM_NAME = 39;
    XCB_ATOM_WM_NORMAL_HINTS = 40;
    XCB_ATOM_WM_SIZE_HINTS = 41;
    XCB_ATOM_WM_ZOOM_HINTS = 42;
    XCB_ATOM_MIN_SPACE = 43;
    XCB_ATOM_NORM_SPACE = 44;
    XCB_ATOM_MAX_SPACE = 45;
    XCB_ATOM_END_SPACE = 46;
    XCB_ATOM_SUPERSCRIPT_X = 47;
    XCB_ATOM_SUPERSCRIPT_Y = 48;
    XCB_ATOM_SUBSCRIPT_X = 49;
    XCB_ATOM_SUBSCRIPT_Y = 50;
    XCB_ATOM_UNDERLINE_POSITION = 51;
    XCB_ATOM_UNDERLINE_THICKNESS = 52;
    XCB_ATOM_STRIKEOUT_ASCENT = 53;
    XCB_ATOM_STRIKEOUT_DESCENT = 54;
    XCB_ATOM_ITALIC_ANGLE = 55;
    XCB_ATOM_X_HEIGHT = 56;
    XCB_ATOM_QUAD_WIDTH = 57;
    XCB_ATOM_WEIGHT = 58;
    XCB_ATOM_POINT_SIZE = 59;
    XCB_ATOM_RESOLUTION = 60;
    XCB_ATOM_COPYRIGHT = 61;
    XCB_ATOM_NOTICE = 62;
    XCB_ATOM_FONT_NAME = 63;
    XCB_ATOM_FAMILY_NAME = 64;
    XCB_ATOM_FULL_NAME = 65;
    XCB_ATOM_CAP_HEIGHT = 66;
    XCB_ATOM_WM_CLASS = 67;
    XCB_ATOM_WM_TRANSIENT_FOR = 68;
;
{* Opcode for xcb_selection_request.  }
  XCB_SELECTION_REQUEST = 30;  
{*
 * @brief xcb_selection_request_event_t
 * }
type
  Pxcb_selection_request_event_t = ^Txcb_selection_request_event_t;
  Txcb_selection_request_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      time : Txcb_timestamp_t;
      owner : Txcb_window_t;
      requestor : Txcb_window_t;
      selection : Txcb_atom_t;
      target : Txcb_atom_t;
      _property : Txcb_atom_t;
    end;
{* Opcode for xcb_selection_notify.  }

const
  XCB_SELECTION_NOTIFY = 31;  
{*
 * @brief xcb_selection_notify_event_t
 * }
type
  Pxcb_selection_notify_event_t = ^Txcb_selection_notify_event_t;
  Txcb_selection_notify_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      time : Txcb_timestamp_t;
      requestor : Txcb_window_t;
      selection : Txcb_atom_t;
      target : Txcb_atom_t;
      _property : Txcb_atom_t;
    end;
{*< The colormap was uninstalled.  }
{*< The colormap was installed.  }

  Pxcb_colormap_state_t = ^Txcb_colormap_state_t;
  Txcb_colormap_state_t =  Longint;
  Const
    XCB_COLORMAP_STATE_UNINSTALLED = 0;
    XCB_COLORMAP_STATE_INSTALLED = 1;
;
type
  Pxcb_colormap_enum_t = ^Txcb_colormap_enum_t;
  Txcb_colormap_enum_t =  Longint;
  Const
    XCB_COLORMAP_NONE = 0;
;
{* Opcode for xcb_colormap_notify.  }
  XCB_COLORMAP_NOTIFY = 32;  
{*
 * @brief xcb_colormap_notify_event_t
 * }
type
  Pxcb_colormap_notify_event_t = ^Txcb_colormap_notify_event_t;
  Txcb_colormap_notify_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      window : Txcb_window_t;
      colormap : Txcb_colormap_t;
      _new : Tuint8_t;
      state : Tuint8_t;
      pad1 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_client_message_data_t
 * }

  Pxcb_client_message_data_t = ^Txcb_client_message_data_t;
  Txcb_client_message_data_t = record
      case longint of
        0 : ( data8 : array[0..19] of Tuint8_t );
        1 : ( data16 : array[0..9] of Tuint16_t );
        2 : ( data32 : array[0..4] of Tuint32_t );
      end;
{*
 * @brief xcb_client_message_data_iterator_t
 * }

  Pxcb_client_message_data_iterator_t = ^Txcb_client_message_data_iterator_t;
  Txcb_client_message_data_iterator_t = record
      data : Pxcb_client_message_data_t;
      rem : longint;
      index : longint;
    end;
{* Opcode for xcb_client_message.  }

const
  XCB_CLIENT_MESSAGE = 33;  
{*
 * @brief xcb_client_message_event_t
 * }
type
  Pxcb_client_message_event_t = ^Txcb_client_message_event_t;
  Txcb_client_message_event_t = record
      response_type : Tuint8_t;
      format : Tuint8_t;
      sequence : Tuint16_t;
      window : Txcb_window_t;
      _type : Txcb_atom_t;
      data : Txcb_client_message_data_t;
    end;

  Pxcb_mapping_t = ^Txcb_mapping_t;
  Txcb_mapping_t =  Longint;
  Const
    XCB_MAPPING_MODIFIER = 0;
    XCB_MAPPING_KEYBOARD = 1;
    XCB_MAPPING_POINTER = 2;
;
{* Opcode for xcb_mapping_notify.  }
  XCB_MAPPING_NOTIFY = 34;  
{*
 * @brief xcb_mapping_notify_event_t
 * }
type
  Pxcb_mapping_notify_event_t = ^Txcb_mapping_notify_event_t;
  Txcb_mapping_notify_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      request : Tuint8_t;
      first_keycode : Txcb_keycode_t;
      count : Tuint8_t;
      pad1 : Tuint8_t;
    end;
{* Opcode for xcb_ge_generic.  }

const
  XCB_GE_GENERIC = 35;  
{*
 * @brief xcb_ge_generic_event_t
 * }
type
  Pxcb_ge_generic_event_t = ^Txcb_ge_generic_event_t;
  Txcb_ge_generic_event_t = record
      response_type : Tuint8_t;
      extension : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      event_type : Tuint16_t;
      pad0 : array[0..21] of Tuint8_t;
      full_sequence : Tuint32_t;
    end;
{* Opcode for xcb_request.  }

const
  XCB_REQUEST = 1;  
{*
 * @brief xcb_request_error_t
 * }
type
  Pxcb_request_error_t = ^Txcb_request_error_t;
  Txcb_request_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      bad_value : Tuint32_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
    end;
{* Opcode for xcb_value.  }

const
  XCB_VALUE = 2;  
{*
 * @brief xcb_value_error_t
 * }
type
  Pxcb_value_error_t = ^Txcb_value_error_t;
  Txcb_value_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      bad_value : Tuint32_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
    end;
{* Opcode for xcb_window.  }

const
  XCB_WINDOW = 3;  
type
  Pxcb_window_error_t = ^Txcb_window_error_t;
  Txcb_window_error_t = Txcb_value_error_t;
{* Opcode for xcb_pixmap.  }

const
  XCB_PIXMAP = 4;  
type
  Pxcb_pixmap_error_t = ^Txcb_pixmap_error_t;
  Txcb_pixmap_error_t = Txcb_value_error_t;
{* Opcode for xcb_atom.  }

const
  XCB_ATOM = 5;  
type
  Pxcb_atom_error_t = ^Txcb_atom_error_t;
  Txcb_atom_error_t = Txcb_value_error_t;
{* Opcode for xcb_cursor.  }

const
  XCB_CURSOR = 6;  
type
  Pxcb_cursor_error_t = ^Txcb_cursor_error_t;
  Txcb_cursor_error_t = Txcb_value_error_t;
{* Opcode for xcb_font.  }

const
  XCB_FONT = 7;  
type
  Pxcb_font_error_t = ^Txcb_font_error_t;
  Txcb_font_error_t = Txcb_value_error_t;
{* Opcode for xcb_match.  }

const
  XCB_MATCH = 8;  
type
  Pxcb_match_error_t = ^Txcb_match_error_t;
  Txcb_match_error_t = Txcb_request_error_t;
{* Opcode for xcb_drawable.  }

const
  XCB_DRAWABLE = 9;  
type
  Pxcb_drawable_error_t = ^Txcb_drawable_error_t;
  Txcb_drawable_error_t = Txcb_value_error_t;
{* Opcode for xcb_access.  }

const
  XCB_ACCESS = 10;  
type
  Pxcb_access_error_t = ^Txcb_access_error_t;
  Txcb_access_error_t = Txcb_request_error_t;
{* Opcode for xcb_alloc.  }

const
  XCB_ALLOC = 11;  
type
  Pxcb_alloc_error_t = ^Txcb_alloc_error_t;
  Txcb_alloc_error_t = Txcb_request_error_t;
{* Opcode for xcb_colormap.  }

const
  XCB_COLORMAP = 12;  
type
  Pxcb_colormap_error_t = ^Txcb_colormap_error_t;
  Txcb_colormap_error_t = Txcb_value_error_t;
{* Opcode for xcb_g_context.  }

const
  XCB_G_CONTEXT = 13;  
type
  Pxcb_g_context_error_t = ^Txcb_g_context_error_t;
  Txcb_g_context_error_t = Txcb_value_error_t;
{* Opcode for xcb_id_choice.  }

const
  XCB_ID_CHOICE = 14;  
type
  Pxcb_id_choice_error_t = ^Txcb_id_choice_error_t;
  Txcb_id_choice_error_t = Txcb_value_error_t;
{* Opcode for xcb_name.  }

const
  XCB_NAME = 15;  
type
  Pxcb_name_error_t = ^Txcb_name_error_t;
  Txcb_name_error_t = Txcb_request_error_t;
{* Opcode for xcb_length.  }

const
  XCB_LENGTH = 16;  
type
  Pxcb_length_error_t = ^Txcb_length_error_t;
  Txcb_length_error_t = Txcb_request_error_t;
{* Opcode for xcb_implementation.  }

const
  XCB_IMPLEMENTATION = 17;  
type
  Pxcb_implementation_error_t = ^Txcb_implementation_error_t;
  Txcb_implementation_error_t = Txcb_request_error_t;

  Pxcb_window_class_t = ^Txcb_window_class_t;
  Txcb_window_class_t =  Longint;
  Const
    XCB_WINDOW_CLASS_COPY_FROM_PARENT = 0;
    XCB_WINDOW_CLASS_INPUT_OUTPUT = 1;
    XCB_WINDOW_CLASS_INPUT_ONLY = 2;
;
{*< Overrides the default background-pixmap. The background pixmap and window must
have the same root and same depth. Any size pixmap can be used, although some
sizes may be faster than others.

If `XCB_BACK_PIXMAP_NONE` is specified, the window has no defined background.
The server may fill the contents with the previous screen contents or with
contents of its own choosing.

If `XCB_BACK_PIXMAP_PARENT_RELATIVE` is specified, the parent's background is
used, but the window must have the same depth as the parent (or a Match error
results).   The parent's background is tracked, and the current version is
used each time the window background is required.  }
{*< Overrides `BackPixmap`. A pixmap of undefined size filled with the specified
background pixel is used for the background. Range-checking is not performed,
the background pixel is truncated to the appropriate number of bits.  }
{*< Overrides the default border-pixmap. The border pixmap and window must have the
same root and the same depth. Any size pixmap can be used, although some sizes
may be faster than others.

The special value `XCB_COPY_FROM_PARENT` means the parent's border pixmap is
copied (subsequent changes to the parent's border attribute do not affect the
child), but the window must have the same depth as the parent.  }
{*< Overrides `BorderPixmap`. A pixmap of undefined size filled with the specified
border pixel is used for the border. Range checking is not performed on the
border-pixel value, it is truncated to the appropriate number of bits.  }
{*< Defines which region of the window should be retained if the window is resized.  }
{*< Defines how the window should be repositioned if the parent is resized (see
`ConfigureWindow`).  }
{*< A backing-store of `WhenMapped` advises the server that maintaining contents of
obscured regions when the window is mapped would be beneficial. A backing-store
of `Always` advises the server that maintaining contents even when the window
is unmapped would be beneficial. In this case, the server may generate an
exposure event when the window is created. A value of `NotUseful` advises the
server that maintaining contents is unnecessary, although a server may still
choose to maintain contents while the window is mapped. Note that if the server
maintains contents, then the server should maintain complete contents not just
the region within the parent boundaries, even if the window is larger than its
parent. While the server maintains contents, exposure events will not normally
be generated, but the server may stop maintaining contents at any time.  }
{*< The backing-planes indicates (with bits set to 1) which bit planes of the
window hold dynamic data that must be preserved in backing-stores and during
save-unders.  }
{*< The backing-pixel specifies what value to use in planes not covered by
backing-planes. The server is free to save only the specified bit planes in the
backing-store or save-under and regenerate the remaining planes with the
specified pixel value. Any bits beyond the specified depth of the window in
these values are simply ignored.  }
{*< The override-redirect specifies whether map and configure requests on this
window should override a SubstructureRedirect on the parent, typically to
inform a window manager not to tamper with the window.  }
{*< If 1, the server is advised that when this window is mapped, saving the
contents of windows it obscures would be beneficial.  }
{*< The event-mask defines which events the client is interested in for this window
(or for some event types, inferiors of the window).  }
{*< The do-not-propagate-mask defines which events should not be propagated to
ancestor windows when no client has the event type selected in this window.  }
{*< The colormap specifies the colormap that best reflects the true colors of the window. Servers
capable of supporting multiple hardware colormaps may use this information, and window man-
agers may use it for InstallColormap requests. The colormap must have the same visual type
and root as the window (or a Match error results). If CopyFromParent is specified, the parent's
colormap is copied (subsequent changes to the parent's colormap attribute do not affect the child).
However, the window must have the same visual type as the parent (or a Match error results),
and the parent must not have a colormap of None (or a Match error results). For an explanation
of None, see FreeColormap request. The colormap is copied by sharing the colormap object
between the child and the parent, not by making a complete copy of the colormap contents.  }
{*< If a cursor is specified, it will be used whenever the pointer is in the window. If None is speci-
fied, the parent's cursor will be used when the pointer is in the window, and any change in the
parent's cursor will cause an immediate change in the displayed cursor.  }
type
  Pxcb_cw_t = ^Txcb_cw_t;
  Txcb_cw_t =  Longint;
  Const
    XCB_CW_BACK_PIXMAP = 1;
    XCB_CW_BACK_PIXEL = 2;
    XCB_CW_BORDER_PIXMAP = 4;
    XCB_CW_BORDER_PIXEL = 8;
    XCB_CW_BIT_GRAVITY = 16;
    XCB_CW_WIN_GRAVITY = 32;
    XCB_CW_BACKING_STORE = 64;
    XCB_CW_BACKING_PLANES = 128;
    XCB_CW_BACKING_PIXEL = 256;
    XCB_CW_OVERRIDE_REDIRECT = 512;
    XCB_CW_SAVE_UNDER = 1024;
    XCB_CW_EVENT_MASK = 2048;
    XCB_CW_DONT_PROPAGATE = 4096;
    XCB_CW_COLORMAP = 8192;
    XCB_CW_CURSOR = 16384;
;
type
  Pxcb_back_pixmap_t = ^Txcb_back_pixmap_t;
  Txcb_back_pixmap_t =  Longint;
  Const
    XCB_BACK_PIXMAP_NONE = 0;
    XCB_BACK_PIXMAP_PARENT_RELATIVE = 1;
;
type
  Pxcb_gravity_t = ^Txcb_gravity_t;
  Txcb_gravity_t =  Longint;
  Const
    XCB_GRAVITY_BIT_FORGET = 0;
    XCB_GRAVITY_WIN_UNMAP = 0;
    XCB_GRAVITY_NORTH_WEST = 1;
    XCB_GRAVITY_NORTH = 2;
    XCB_GRAVITY_NORTH_EAST = 3;
    XCB_GRAVITY_WEST = 4;
    XCB_GRAVITY_CENTER = 5;
    XCB_GRAVITY_EAST = 6;
    XCB_GRAVITY_SOUTH_WEST = 7;
    XCB_GRAVITY_SOUTH = 8;
    XCB_GRAVITY_SOUTH_EAST = 9;
    XCB_GRAVITY_STATIC = 10;
;
{*
 * @brief xcb_create_window_value_list_t
 * }
type
  Pxcb_create_window_value_list_t = ^Txcb_create_window_value_list_t;
  Txcb_create_window_value_list_t = record
      background_pixmap : Txcb_pixmap_t;
      background_pixel : Tuint32_t;
      border_pixmap : Txcb_pixmap_t;
      border_pixel : Tuint32_t;
      bit_gravity : Tuint32_t;
      win_gravity : Tuint32_t;
      backing_store : Tuint32_t;
      backing_planes : Tuint32_t;
      backing_pixel : Tuint32_t;
      override_redirect : Txcb_bool32_t;
      save_under : Txcb_bool32_t;
      event_mask : Tuint32_t;
      do_not_propogate_mask : Tuint32_t;
      colormap : Txcb_colormap_t;
      cursor : Txcb_cursor_t;
    end;
{* Opcode for xcb_create_window.  }

const
  XCB_CREATE_WINDOW = 1;  
{*
 * @brief xcb_create_window_request_t
 * }
type
  Pxcb_create_window_request_t = ^Txcb_create_window_request_t;
  Txcb_create_window_request_t = record
      major_opcode : Tuint8_t;
      depth : Tuint8_t;
      length : Tuint16_t;
      wid : Txcb_window_t;
      parent : Txcb_window_t;
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      border_width : Tuint16_t;
      _class : Tuint16_t;
      visual : Txcb_visualid_t;
      value_mask : Tuint32_t;
    end;
{*
 * @brief xcb_change_window_attributes_value_list_t
 * }

  Pxcb_change_window_attributes_value_list_t = ^Txcb_change_window_attributes_value_list_t;
  Txcb_change_window_attributes_value_list_t = record
      background_pixmap : Txcb_pixmap_t;
      background_pixel : Tuint32_t;
      border_pixmap : Txcb_pixmap_t;
      border_pixel : Tuint32_t;
      bit_gravity : Tuint32_t;
      win_gravity : Tuint32_t;
      backing_store : Tuint32_t;
      backing_planes : Tuint32_t;
      backing_pixel : Tuint32_t;
      override_redirect : Txcb_bool32_t;
      save_under : Txcb_bool32_t;
      event_mask : Tuint32_t;
      do_not_propogate_mask : Tuint32_t;
      colormap : Txcb_colormap_t;
      cursor : Txcb_cursor_t;
    end;
{* Opcode for xcb_change_window_attributes.  }

const
  XCB_CHANGE_WINDOW_ATTRIBUTES = 2;  
{*
 * @brief xcb_change_window_attributes_request_t
 * }
type
  Pxcb_change_window_attributes_request_t = ^Txcb_change_window_attributes_request_t;
  Txcb_change_window_attributes_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      value_mask : Tuint32_t;
    end;

  Pxcb_map_state_t = ^Txcb_map_state_t;
  Txcb_map_state_t =  Longint;
  Const
    XCB_MAP_STATE_UNMAPPED = 0;
    XCB_MAP_STATE_UNVIEWABLE = 1;
    XCB_MAP_STATE_VIEWABLE = 2;
;
{*
 * @brief xcb_get_window_attributes_cookie_t
 * }
type
  Pxcb_get_window_attributes_cookie_t = ^Txcb_get_window_attributes_cookie_t;
  Txcb_get_window_attributes_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_window_attributes.  }

const
  XCB_GET_WINDOW_ATTRIBUTES = 3;  
{*
 * @brief xcb_get_window_attributes_request_t
 * }
type
  Pxcb_get_window_attributes_request_t = ^Txcb_get_window_attributes_request_t;
  Txcb_get_window_attributes_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{*
 * @brief xcb_get_window_attributes_reply_t
 * }

  Pxcb_get_window_attributes_reply_t = ^Txcb_get_window_attributes_reply_t;
  Txcb_get_window_attributes_reply_t = record
      response_type : Tuint8_t;
      backing_store : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      visual : Txcb_visualid_t;
      _class : Tuint16_t;
      bit_gravity : Tuint8_t;
      win_gravity : Tuint8_t;
      backing_planes : Tuint32_t;
      backing_pixel : Tuint32_t;
      save_under : Tuint8_t;
      map_is_installed : Tuint8_t;
      map_state : Tuint8_t;
      override_redirect : Tuint8_t;
      colormap : Txcb_colormap_t;
      all_event_masks : Tuint32_t;
      your_event_mask : Tuint32_t;
      do_not_propagate_mask : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{* Opcode for xcb_destroy_window.  }

const
  XCB_DESTROY_WINDOW = 4;  
{*
 * @brief xcb_destroy_window_request_t
 * }
type
  Pxcb_destroy_window_request_t = ^Txcb_destroy_window_request_t;
  Txcb_destroy_window_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{* Opcode for xcb_destroy_subwindows.  }

const
  XCB_DESTROY_SUBWINDOWS = 5;  
{*
 * @brief xcb_destroy_subwindows_request_t
 * }
type
  Pxcb_destroy_subwindows_request_t = ^Txcb_destroy_subwindows_request_t;
  Txcb_destroy_subwindows_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;

  Pxcb_set_mode_t = ^Txcb_set_mode_t;
  Txcb_set_mode_t =  Longint;
  Const
    XCB_SET_MODE_INSERT = 0;
    XCB_SET_MODE_DELETE = 1;
;
{* Opcode for xcb_change_save_set.  }
  XCB_CHANGE_SAVE_SET = 6;  
{*
 * @brief xcb_change_save_set_request_t
 * }
type
  Pxcb_change_save_set_request_t = ^Txcb_change_save_set_request_t;
  Txcb_change_save_set_request_t = record
      major_opcode : Tuint8_t;
      mode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{* Opcode for xcb_reparent_window.  }

const
  XCB_REPARENT_WINDOW = 7;  
{*
 * @brief xcb_reparent_window_request_t
 * }
type
  Pxcb_reparent_window_request_t = ^Txcb_reparent_window_request_t;
  Txcb_reparent_window_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      parent : Txcb_window_t;
      x : Tint16_t;
      y : Tint16_t;
    end;
{* Opcode for xcb_map_window.  }

const
  XCB_MAP_WINDOW = 8;  
{*
 * @brief xcb_map_window_request_t
 * }
type
  Pxcb_map_window_request_t = ^Txcb_map_window_request_t;
  Txcb_map_window_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{* Opcode for xcb_map_subwindows.  }

const
  XCB_MAP_SUBWINDOWS = 9;  
{*
 * @brief xcb_map_subwindows_request_t
 * }
type
  Pxcb_map_subwindows_request_t = ^Txcb_map_subwindows_request_t;
  Txcb_map_subwindows_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{* Opcode for xcb_unmap_window.  }

const
  XCB_UNMAP_WINDOW = 10;  
{*
 * @brief xcb_unmap_window_request_t
 * }
type
  Pxcb_unmap_window_request_t = ^Txcb_unmap_window_request_t;
  Txcb_unmap_window_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{* Opcode for xcb_unmap_subwindows.  }

const
  XCB_UNMAP_SUBWINDOWS = 11;  
{*
 * @brief xcb_unmap_subwindows_request_t
 * }
type
  Pxcb_unmap_subwindows_request_t = ^Txcb_unmap_subwindows_request_t;
  Txcb_unmap_subwindows_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;

  Pxcb_config_window_t = ^Txcb_config_window_t;
  Txcb_config_window_t =  Longint;
  Const
    XCB_CONFIG_WINDOW_X = 1;
    XCB_CONFIG_WINDOW_Y = 2;
    XCB_CONFIG_WINDOW_WIDTH = 4;
    XCB_CONFIG_WINDOW_HEIGHT = 8;
    XCB_CONFIG_WINDOW_BORDER_WIDTH = 16;
    XCB_CONFIG_WINDOW_SIBLING = 32;
    XCB_CONFIG_WINDOW_STACK_MODE = 64;
;
type
  Pxcb_stack_mode_t = ^Txcb_stack_mode_t;
  Txcb_stack_mode_t =  Longint;
  Const
    XCB_STACK_MODE_ABOVE = 0;
    XCB_STACK_MODE_BELOW = 1;
    XCB_STACK_MODE_TOP_IF = 2;
    XCB_STACK_MODE_BOTTOM_IF = 3;
    XCB_STACK_MODE_OPPOSITE = 4;
;
{*
 * @brief xcb_configure_window_value_list_t
 * }
type
  Pxcb_configure_window_value_list_t = ^Txcb_configure_window_value_list_t;
  Txcb_configure_window_value_list_t = record
      x : Tint32_t;
      y : Tint32_t;
      width : Tuint32_t;
      height : Tuint32_t;
      border_width : Tuint32_t;
      sibling : Txcb_window_t;
      stack_mode : Tuint32_t;
    end;
{* Opcode for xcb_configure_window.  }

const
  XCB_CONFIGURE_WINDOW = 12;  
{*
 * @brief xcb_configure_window_request_t
 * }
type
  Pxcb_configure_window_request_t = ^Txcb_configure_window_request_t;
  Txcb_configure_window_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      value_mask : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
    end;

  Pxcb_circulate_t = ^Txcb_circulate_t;
  Txcb_circulate_t =  Longint;
  Const
    XCB_CIRCULATE_RAISE_LOWEST = 0;
    XCB_CIRCULATE_LOWER_HIGHEST = 1;
;
{* Opcode for xcb_circulate_window.  }
  XCB_CIRCULATE_WINDOW = 13;  
{*
 * @brief xcb_circulate_window_request_t
 * }
type
  Pxcb_circulate_window_request_t = ^Txcb_circulate_window_request_t;
  Txcb_circulate_window_request_t = record
      major_opcode : Tuint8_t;
      direction : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{*
 * @brief xcb_get_geometry_cookie_t
 * }

  Pxcb_get_geometry_cookie_t = ^Txcb_get_geometry_cookie_t;
  Txcb_get_geometry_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_geometry.  }

const
  XCB_GET_GEOMETRY = 14;  
{*
 * @brief xcb_get_geometry_request_t
 * }
type
  Pxcb_get_geometry_request_t = ^Txcb_get_geometry_request_t;
  Txcb_get_geometry_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
    end;
{*
 * @brief xcb_get_geometry_reply_t
 * }

  Pxcb_get_geometry_reply_t = ^Txcb_get_geometry_reply_t;
  Txcb_get_geometry_reply_t = record
      response_type : Tuint8_t;
      depth : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      root : Txcb_window_t;
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      border_width : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_query_tree_cookie_t
 * }

  Pxcb_query_tree_cookie_t = ^Txcb_query_tree_cookie_t;
  Txcb_query_tree_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_query_tree.  }

const
  XCB_QUERY_TREE = 15;  
{*
 * @brief xcb_query_tree_request_t
 * }
type
  Pxcb_query_tree_request_t = ^Txcb_query_tree_request_t;
  Txcb_query_tree_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{*
 * @brief xcb_query_tree_reply_t
 * }

  Pxcb_query_tree_reply_t = ^Txcb_query_tree_reply_t;
  Txcb_query_tree_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      root : Txcb_window_t;
      parent : Txcb_window_t;
      children_len : Tuint16_t;
      pad1 : array[0..13] of Tuint8_t;
    end;
{*
 * @brief xcb_intern_atom_cookie_t
 * }

  Pxcb_intern_atom_cookie_t = ^Txcb_intern_atom_cookie_t;
  Txcb_intern_atom_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_intern_atom.  }

const
  XCB_INTERN_ATOM = 16;  
{*
 * @brief xcb_intern_atom_request_t
 * }
type
  Pxcb_intern_atom_request_t = ^Txcb_intern_atom_request_t;
  Txcb_intern_atom_request_t = record
      major_opcode : Tuint8_t;
      only_if_exists : Tuint8_t;
      length : Tuint16_t;
      name_len : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_intern_atom_reply_t
 * }

  Pxcb_intern_atom_reply_t = ^Txcb_intern_atom_reply_t;
  Txcb_intern_atom_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      atom : Txcb_atom_t;
    end;
{*
 * @brief xcb_get_atom_name_cookie_t
 * }

  Pxcb_get_atom_name_cookie_t = ^Txcb_get_atom_name_cookie_t;
  Txcb_get_atom_name_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_atom_name.  }

const
  XCB_GET_ATOM_NAME = 17;  
{*
 * @brief xcb_get_atom_name_request_t
 * }
type
  Pxcb_get_atom_name_request_t = ^Txcb_get_atom_name_request_t;
  Txcb_get_atom_name_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      atom : Txcb_atom_t;
    end;
{*
 * @brief xcb_get_atom_name_reply_t
 * }

  Pxcb_get_atom_name_reply_t = ^Txcb_get_atom_name_reply_t;
  Txcb_get_atom_name_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      name_len : Tuint16_t;
      pad1 : array[0..21] of Tuint8_t;
    end;
{*< Discard the previous property value and store the new data.  }
{*< Insert the new data before the beginning of existing data. The `format` must
match existing property value. If the property is undefined, it is treated as
defined with the correct type and format with zero-length data.  }
{*< Insert the new data after the beginning of existing data. The `format` must
match existing property value. If the property is undefined, it is treated as
defined with the correct type and format with zero-length data.  }

  Pxcb_prop_mode_t = ^Txcb_prop_mode_t;
  Txcb_prop_mode_t =  Longint;
  Const
    XCB_PROP_MODE_REPLACE = 0;
    XCB_PROP_MODE_PREPEND = 1;
    XCB_PROP_MODE_APPEND = 2;
;
{* Opcode for xcb_change_property.  }
  XCB_CHANGE_PROPERTY = 18;  
{*
 * @brief xcb_change_property_request_t
 * }
type
  Pxcb_change_property_request_t = ^Txcb_change_property_request_t;
  Txcb_change_property_request_t = record
      major_opcode : Tuint8_t;
      mode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      _property : Txcb_atom_t;
      _type : Txcb_atom_t;
      format : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      data_len : Tuint32_t;
    end;
{* Opcode for xcb_delete_property.  }

const
  XCB_DELETE_PROPERTY = 19;  
{*
 * @brief xcb_delete_property_request_t
 * }
type
  Pxcb_delete_property_request_t = ^Txcb_delete_property_request_t;
  Txcb_delete_property_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      _property : Txcb_atom_t;
    end;

  Pxcb_get_property_type_t = ^Txcb_get_property_type_t;
  Txcb_get_property_type_t =  Longint;
  Const
    XCB_GET_PROPERTY_TYPE_ANY = 0;
;
{*
 * @brief xcb_get_property_cookie_t
 * }
type
  Pxcb_get_property_cookie_t = ^Txcb_get_property_cookie_t;
  Txcb_get_property_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_property.  }

const
  XCB_GET_PROPERTY = 20;  
{*
 * @brief xcb_get_property_request_t
 * }
type
  Pxcb_get_property_request_t = ^Txcb_get_property_request_t;
  Txcb_get_property_request_t = record
      major_opcode : Tuint8_t;
      _delete : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      _property : Txcb_atom_t;
      _type : Txcb_atom_t;
      long_offset : Tuint32_t;
      long_length : Tuint32_t;
    end;
{*
 * @brief xcb_get_property_reply_t
 * }

  Pxcb_get_property_reply_t = ^Txcb_get_property_reply_t;
  Txcb_get_property_reply_t = record
      response_type : Tuint8_t;
      format : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      _type : Txcb_atom_t;
      bytes_after : Tuint32_t;
      value_len : Tuint32_t;
      pad0 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_list_properties_cookie_t
 * }

  Pxcb_list_properties_cookie_t = ^Txcb_list_properties_cookie_t;
  Txcb_list_properties_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_list_properties.  }

const
  XCB_LIST_PROPERTIES = 21;  
{*
 * @brief xcb_list_properties_request_t
 * }
type
  Pxcb_list_properties_request_t = ^Txcb_list_properties_request_t;
  Txcb_list_properties_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{*
 * @brief xcb_list_properties_reply_t
 * }

  Pxcb_list_properties_reply_t = ^Txcb_list_properties_reply_t;
  Txcb_list_properties_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      atoms_len : Tuint16_t;
      pad1 : array[0..21] of Tuint8_t;
    end;
{* Opcode for xcb_set_selection_owner.  }

const
  XCB_SET_SELECTION_OWNER = 22;  
{*
 * @brief xcb_set_selection_owner_request_t
 * }
type
  Pxcb_set_selection_owner_request_t = ^Txcb_set_selection_owner_request_t;
  Txcb_set_selection_owner_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      owner : Txcb_window_t;
      selection : Txcb_atom_t;
      time : Txcb_timestamp_t;
    end;
{*
 * @brief xcb_get_selection_owner_cookie_t
 * }

  Pxcb_get_selection_owner_cookie_t = ^Txcb_get_selection_owner_cookie_t;
  Txcb_get_selection_owner_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_selection_owner.  }

const
  XCB_GET_SELECTION_OWNER = 23;  
{*
 * @brief xcb_get_selection_owner_request_t
 * }
type
  Pxcb_get_selection_owner_request_t = ^Txcb_get_selection_owner_request_t;
  Txcb_get_selection_owner_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      selection : Txcb_atom_t;
    end;
{*
 * @brief xcb_get_selection_owner_reply_t
 * }

  Pxcb_get_selection_owner_reply_t = ^Txcb_get_selection_owner_reply_t;
  Txcb_get_selection_owner_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      owner : Txcb_window_t;
    end;
{* Opcode for xcb_convert_selection.  }

const
  XCB_CONVERT_SELECTION = 24;  
{*
 * @brief xcb_convert_selection_request_t
 * }
type
  Pxcb_convert_selection_request_t = ^Txcb_convert_selection_request_t;
  Txcb_convert_selection_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      requestor : Txcb_window_t;
      selection : Txcb_atom_t;
      target : Txcb_atom_t;
      _property : Txcb_atom_t;
      time : Txcb_timestamp_t;
    end;

  Pxcb_send_event_dest_t = ^Txcb_send_event_dest_t;
  Txcb_send_event_dest_t =  Longint;
  Const
    XCB_SEND_EVENT_DEST_POINTER_WINDOW = 0;
    XCB_SEND_EVENT_DEST_ITEM_FOCUS = 1;
;
{* Opcode for xcb_send_event.  }
  XCB_SEND_EVENT = 25;  
{*
 * @brief xcb_send_event_request_t
 * }
type
  Pxcb_send_event_request_t = ^Txcb_send_event_request_t;
  Txcb_send_event_request_t = record
      major_opcode : Tuint8_t;
      propagate : Tuint8_t;
      length : Tuint16_t;
      destination : Txcb_window_t;
      event_mask : Tuint32_t;
      event : array[0..31] of char;
    end;
{*< The state of the keyboard appears to freeze: No further keyboard events are
generated by the server until the grabbing client issues a releasing
`AllowEvents` request or until the keyboard grab is released.  }
{*< Keyboard event processing continues normally.  }

  Pxcb_grab_mode_t = ^Txcb_grab_mode_t;
  Txcb_grab_mode_t =  Longint;
  Const
    XCB_GRAB_MODE_SYNC = 0;
    XCB_GRAB_MODE_ASYNC = 1;
;
type
  Pxcb_grab_status_t = ^Txcb_grab_status_t;
  Txcb_grab_status_t =  Longint;
  Const
    XCB_GRAB_STATUS_SUCCESS = 0;
    XCB_GRAB_STATUS_ALREADY_GRABBED = 1;
    XCB_GRAB_STATUS_INVALID_TIME = 2;
    XCB_GRAB_STATUS_NOT_VIEWABLE = 3;
    XCB_GRAB_STATUS_FROZEN = 4;
;
type
  Pxcb_cursor_enum_t = ^Txcb_cursor_enum_t;
  Txcb_cursor_enum_t =  Longint;
  Const
    XCB_CURSOR_NONE = 0;
;
{*
 * @brief xcb_grab_pointer_cookie_t
 * }
type
  Pxcb_grab_pointer_cookie_t = ^Txcb_grab_pointer_cookie_t;
  Txcb_grab_pointer_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_grab_pointer.  }

const
  XCB_GRAB_POINTER = 26;  
{*
 * @brief xcb_grab_pointer_request_t
 * }
type
  Pxcb_grab_pointer_request_t = ^Txcb_grab_pointer_request_t;
  Txcb_grab_pointer_request_t = record
      major_opcode : Tuint8_t;
      owner_events : Tuint8_t;
      length : Tuint16_t;
      grab_window : Txcb_window_t;
      event_mask : Tuint16_t;
      pointer_mode : Tuint8_t;
      keyboard_mode : Tuint8_t;
      confine_to : Txcb_window_t;
      cursor : Txcb_cursor_t;
      time : Txcb_timestamp_t;
    end;
{*
 * @brief xcb_grab_pointer_reply_t
 * }

  Pxcb_grab_pointer_reply_t = ^Txcb_grab_pointer_reply_t;
  Txcb_grab_pointer_reply_t = record
      response_type : Tuint8_t;
      status : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
    end;
{* Opcode for xcb_ungrab_pointer.  }

const
  XCB_UNGRAB_POINTER = 27;  
{*
 * @brief xcb_ungrab_pointer_request_t
 * }
type
  Pxcb_ungrab_pointer_request_t = ^Txcb_ungrab_pointer_request_t;
  Txcb_ungrab_pointer_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      time : Txcb_timestamp_t;
    end;
{*< Any of the following (or none):  }
{*< The left mouse button.  }
{*< The right mouse button.  }
{*< The middle mouse button.  }
{*< Scroll wheel. TODO: direction?  }
{*< Scroll wheel. TODO: direction?  }

  Pxcb_button_index_t = ^Txcb_button_index_t;
  Txcb_button_index_t =  Longint;
  Const
    XCB_BUTTON_INDEX_ANY = 0;
    XCB_BUTTON_INDEX_1 = 1;
    XCB_BUTTON_INDEX_2 = 2;
    XCB_BUTTON_INDEX_3 = 3;
    XCB_BUTTON_INDEX_4 = 4;
    XCB_BUTTON_INDEX_5 = 5;
;
{* Opcode for xcb_grab_button.  }
  XCB_GRAB_BUTTON = 28;  
{*
 * @brief xcb_grab_button_request_t
 * }
type
  Pxcb_grab_button_request_t = ^Txcb_grab_button_request_t;
  Txcb_grab_button_request_t = record
      major_opcode : Tuint8_t;
      owner_events : Tuint8_t;
      length : Tuint16_t;
      grab_window : Txcb_window_t;
      event_mask : Tuint16_t;
      pointer_mode : Tuint8_t;
      keyboard_mode : Tuint8_t;
      confine_to : Txcb_window_t;
      cursor : Txcb_cursor_t;
      button : Tuint8_t;
      pad0 : Tuint8_t;
      modifiers : Tuint16_t;
    end;
{* Opcode for xcb_ungrab_button.  }

const
  XCB_UNGRAB_BUTTON = 29;  
{*
 * @brief xcb_ungrab_button_request_t
 * }
type
  Pxcb_ungrab_button_request_t = ^Txcb_ungrab_button_request_t;
  Txcb_ungrab_button_request_t = record
      major_opcode : Tuint8_t;
      button : Tuint8_t;
      length : Tuint16_t;
      grab_window : Txcb_window_t;
      modifiers : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{* Opcode for xcb_change_active_pointer_grab.  }

const
  XCB_CHANGE_ACTIVE_POINTER_GRAB = 30;  
{*
 * @brief xcb_change_active_pointer_grab_request_t
 * }
type
  Pxcb_change_active_pointer_grab_request_t = ^Txcb_change_active_pointer_grab_request_t;
  Txcb_change_active_pointer_grab_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cursor : Txcb_cursor_t;
      time : Txcb_timestamp_t;
      event_mask : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_grab_keyboard_cookie_t
 * }

  Pxcb_grab_keyboard_cookie_t = ^Txcb_grab_keyboard_cookie_t;
  Txcb_grab_keyboard_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_grab_keyboard.  }

const
  XCB_GRAB_KEYBOARD = 31;  
{*
 * @brief xcb_grab_keyboard_request_t
 * }
type
  Pxcb_grab_keyboard_request_t = ^Txcb_grab_keyboard_request_t;
  Txcb_grab_keyboard_request_t = record
      major_opcode : Tuint8_t;
      owner_events : Tuint8_t;
      length : Tuint16_t;
      grab_window : Txcb_window_t;
      time : Txcb_timestamp_t;
      pointer_mode : Tuint8_t;
      keyboard_mode : Tuint8_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_grab_keyboard_reply_t
 * }

  Pxcb_grab_keyboard_reply_t = ^Txcb_grab_keyboard_reply_t;
  Txcb_grab_keyboard_reply_t = record
      response_type : Tuint8_t;
      status : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
    end;
{* Opcode for xcb_ungrab_keyboard.  }

const
  XCB_UNGRAB_KEYBOARD = 32;  
{*
 * @brief xcb_ungrab_keyboard_request_t
 * }
type
  Pxcb_ungrab_keyboard_request_t = ^Txcb_ungrab_keyboard_request_t;
  Txcb_ungrab_keyboard_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      time : Txcb_timestamp_t;
    end;

  Pxcb_grab_t = ^Txcb_grab_t;
  Txcb_grab_t =  Longint;
  Const
    XCB_GRAB_ANY = 0;
;
{* Opcode for xcb_grab_key.  }
  XCB_GRAB_KEY = 33;  
{*
 * @brief xcb_grab_key_request_t
 * }
type
  Pxcb_grab_key_request_t = ^Txcb_grab_key_request_t;
  Txcb_grab_key_request_t = record
      major_opcode : Tuint8_t;
      owner_events : Tuint8_t;
      length : Tuint16_t;
      grab_window : Txcb_window_t;
      modifiers : Tuint16_t;
      key : Txcb_keycode_t;
      pointer_mode : Tuint8_t;
      keyboard_mode : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_ungrab_key.  }

const
  XCB_UNGRAB_KEY = 34;  
{*
 * @brief xcb_ungrab_key_request_t
 * }
type
  Pxcb_ungrab_key_request_t = ^Txcb_ungrab_key_request_t;
  Txcb_ungrab_key_request_t = record
      major_opcode : Tuint8_t;
      key : Txcb_keycode_t;
      length : Tuint16_t;
      grab_window : Txcb_window_t;
      modifiers : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{*< For AsyncPointer, if the pointer is frozen by the client, pointer event
processing continues normally. If the pointer is frozen twice by the client on
behalf of two separate grabs, AsyncPointer thaws for both. AsyncPointer has no
effect if the pointer is not frozen by the client, but the pointer need not be
grabbed by the client.

TODO: rewrite this in more understandable terms.  }
{*< For SyncPointer, if the pointer is frozen and actively grabbed by the client,
pointer event processing continues normally until the next ButtonPress or
ButtonRelease event is reported to the client, at which time the pointer again
appears to freeze. However, if the reported event causes the pointer grab to be
released, then the pointer does not freeze. SyncPointer has no effect if the
pointer is not frozen by the client or if the pointer is not grabbed by the
client.  }
{*< For ReplayPointer, if the pointer is actively grabbed by the client and is
frozen as the result of an event having been sent to the client (either from
the activation of a GrabButton or from a previous AllowEvents with mode
SyncPointer but not from a GrabPointer), then the pointer grab is released and
that event is completely reprocessed, this time ignoring any passive grabs at
or above (towards the root) the grab-window of the grab just released. The
request has no effect if the pointer is not grabbed by the client or if the
pointer is not frozen as the result of an event.  }
{*< For AsyncKeyboard, if the keyboard is frozen by the client, keyboard event
processing continues normally. If the keyboard is frozen twice by the client on
behalf of two separate grabs, AsyncKeyboard thaws for both. AsyncKeyboard has
no effect if the keyboard is not frozen by the client, but the keyboard need
not be grabbed by the client.  }
{*< For SyncKeyboard, if the keyboard is frozen and actively grabbed by the client,
keyboard event processing continues normally until the next KeyPress or
KeyRelease event is reported to the client, at which time the keyboard again
appears to freeze. However, if the reported event causes the keyboard grab to
be released, then the keyboard does not freeze. SyncKeyboard has no effect if
the keyboard is not frozen by the client or if the keyboard is not grabbed by
the client.  }
{*< For ReplayKeyboard, if the keyboard is actively grabbed by the client and is
frozen as the result of an event having been sent to the client (either from
the activation of a GrabKey or from a previous AllowEvents with mode
SyncKeyboard but not from a GrabKeyboard), then the keyboard grab is released
and that event is completely reprocessed, this time ignoring any passive grabs
at or above (towards the root) the grab-window of the grab just released. The
request has no effect if the keyboard is not grabbed by the client or if the
keyboard is not frozen as the result of an event.  }
{*< For AsyncBoth, if the pointer and the keyboard are frozen by the client, event
processing for both devices continues normally. If a device is frozen twice by
the client on behalf of two separate grabs, AsyncBoth thaws for both. AsyncBoth
has no effect unless both pointer and keyboard are frozen by the client.  }
{*< For SyncBoth, if both pointer and keyboard are frozen by the client, event
processing (for both devices) continues normally until the next ButtonPress,
ButtonRelease, KeyPress, or KeyRelease event is reported to the client for a
grabbed device (button event for the pointer, key event for the keyboard), at
which time the devices again appear to freeze. However, if the reported event
causes the grab to be released, then the devices do not freeze (but if the
other device is still grabbed, then a subsequent event for it will still cause
both devices to freeze). SyncBoth has no effect unless both pointer and
keyboard are frozen by the client. If the pointer or keyboard is frozen twice
by the client on behalf of two separate grabs, SyncBoth thaws for both (but a
subsequent freeze for SyncBoth will only freeze each device once).  }

  Pxcb_allow_t = ^Txcb_allow_t;
  Txcb_allow_t =  Longint;
  Const
    XCB_ALLOW_ASYNC_POINTER = 0;
    XCB_ALLOW_SYNC_POINTER = 1;
    XCB_ALLOW_REPLAY_POINTER = 2;
    XCB_ALLOW_ASYNC_KEYBOARD = 3;
    XCB_ALLOW_SYNC_KEYBOARD = 4;
    XCB_ALLOW_REPLAY_KEYBOARD = 5;
    XCB_ALLOW_ASYNC_BOTH = 6;
    XCB_ALLOW_SYNC_BOTH = 7;
;
{* Opcode for xcb_allow_events.  }
  XCB_ALLOW_EVENTS = 35;  
{*
 * @brief xcb_allow_events_request_t
 * }
type
  Pxcb_allow_events_request_t = ^Txcb_allow_events_request_t;
  Txcb_allow_events_request_t = record
      major_opcode : Tuint8_t;
      mode : Tuint8_t;
      length : Tuint16_t;
      time : Txcb_timestamp_t;
    end;
{* Opcode for xcb_grab_server.  }

const
  XCB_GRAB_SERVER = 36;  
{*
 * @brief xcb_grab_server_request_t
 * }
type
  Pxcb_grab_server_request_t = ^Txcb_grab_server_request_t;
  Txcb_grab_server_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
    end;
{* Opcode for xcb_ungrab_server.  }

const
  XCB_UNGRAB_SERVER = 37;  
{*
 * @brief xcb_ungrab_server_request_t
 * }
type
  Pxcb_ungrab_server_request_t = ^Txcb_ungrab_server_request_t;
  Txcb_ungrab_server_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_query_pointer_cookie_t
 * }

  Pxcb_query_pointer_cookie_t = ^Txcb_query_pointer_cookie_t;
  Txcb_query_pointer_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_query_pointer.  }

const
  XCB_QUERY_POINTER = 38;  
{*
 * @brief xcb_query_pointer_request_t
 * }
type
  Pxcb_query_pointer_request_t = ^Txcb_query_pointer_request_t;
  Txcb_query_pointer_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{*
 * @brief xcb_query_pointer_reply_t
 * }

  Pxcb_query_pointer_reply_t = ^Txcb_query_pointer_reply_t;
  Txcb_query_pointer_reply_t = record
      response_type : Tuint8_t;
      same_screen : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      root : Txcb_window_t;
      child : Txcb_window_t;
      root_x : Tint16_t;
      root_y : Tint16_t;
      win_x : Tint16_t;
      win_y : Tint16_t;
      mask : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_timecoord_t
 * }

  Pxcb_timecoord_t = ^Txcb_timecoord_t;
  Txcb_timecoord_t = record
      time : Txcb_timestamp_t;
      x : Tint16_t;
      y : Tint16_t;
    end;
{*
 * @brief xcb_timecoord_iterator_t
 * }

  Pxcb_timecoord_iterator_t = ^Txcb_timecoord_iterator_t;
  Txcb_timecoord_iterator_t = record
      data : Pxcb_timecoord_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_get_motion_events_cookie_t
 * }

  Pxcb_get_motion_events_cookie_t = ^Txcb_get_motion_events_cookie_t;
  Txcb_get_motion_events_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_motion_events.  }

const
  XCB_GET_MOTION_EVENTS = 39;  
{*
 * @brief xcb_get_motion_events_request_t
 * }
type
  Pxcb_get_motion_events_request_t = ^Txcb_get_motion_events_request_t;
  Txcb_get_motion_events_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      start : Txcb_timestamp_t;
      stop : Txcb_timestamp_t;
    end;
{*
 * @brief xcb_get_motion_events_reply_t
 * }

  Pxcb_get_motion_events_reply_t = ^Txcb_get_motion_events_reply_t;
  Txcb_get_motion_events_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      events_len : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 * @brief xcb_translate_coordinates_cookie_t
 * }

  Pxcb_translate_coordinates_cookie_t = ^Txcb_translate_coordinates_cookie_t;
  Txcb_translate_coordinates_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_translate_coordinates.  }

const
  XCB_TRANSLATE_COORDINATES = 40;  
{*
 * @brief xcb_translate_coordinates_request_t
 * }
type
  Pxcb_translate_coordinates_request_t = ^Txcb_translate_coordinates_request_t;
  Txcb_translate_coordinates_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      src_window : Txcb_window_t;
      dst_window : Txcb_window_t;
      src_x : Tint16_t;
      src_y : Tint16_t;
    end;
{*
 * @brief xcb_translate_coordinates_reply_t
 * }

  Pxcb_translate_coordinates_reply_t = ^Txcb_translate_coordinates_reply_t;
  Txcb_translate_coordinates_reply_t = record
      response_type : Tuint8_t;
      same_screen : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      child : Txcb_window_t;
      dst_x : Tint16_t;
      dst_y : Tint16_t;
    end;
{* Opcode for xcb_warp_pointer.  }

const
  XCB_WARP_POINTER = 41;  
{*
 * @brief xcb_warp_pointer_request_t
 * }
type
  Pxcb_warp_pointer_request_t = ^Txcb_warp_pointer_request_t;
  Txcb_warp_pointer_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      src_window : Txcb_window_t;
      dst_window : Txcb_window_t;
      src_x : Tint16_t;
      src_y : Tint16_t;
      src_width : Tuint16_t;
      src_height : Tuint16_t;
      dst_x : Tint16_t;
      dst_y : Tint16_t;
    end;
{*< The focus reverts to `XCB_NONE`, so no window will have the input focus.  }
{*< The focus reverts to `XCB_POINTER_ROOT` respectively. When the focus reverts,
FocusIn and FocusOut events are generated, but the last-focus-change time is
not changed.  }
{*< The focus reverts to the parent (or closest viewable ancestor) and the new
revert_to value is `XCB_INPUT_FOCUS_NONE`.  }
{*< NOT YET DOCUMENTED. Only relevant for the xinput extension.  }

  Pxcb_input_focus_t = ^Txcb_input_focus_t;
  Txcb_input_focus_t =  Longint;
  Const
    XCB_INPUT_FOCUS_NONE = 0;
    XCB_INPUT_FOCUS_POINTER_ROOT = 1;
    XCB_INPUT_FOCUS_PARENT = 2;
    XCB_INPUT_FOCUS_FOLLOW_KEYBOARD = 3;
;
{* Opcode for xcb_set_input_focus.  }
  XCB_SET_INPUT_FOCUS = 42;  
{*
 * @brief xcb_set_input_focus_request_t
 * }
type
  Pxcb_set_input_focus_request_t = ^Txcb_set_input_focus_request_t;
  Txcb_set_input_focus_request_t = record
      major_opcode : Tuint8_t;
      revert_to : Tuint8_t;
      length : Tuint16_t;
      focus : Txcb_window_t;
      time : Txcb_timestamp_t;
    end;
{*
 * @brief xcb_get_input_focus_cookie_t
 * }

  Pxcb_get_input_focus_cookie_t = ^Txcb_get_input_focus_cookie_t;
  Txcb_get_input_focus_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_input_focus.  }

const
  XCB_GET_INPUT_FOCUS = 43;  
{*
 * @brief xcb_get_input_focus_request_t
 * }
type
  Pxcb_get_input_focus_request_t = ^Txcb_get_input_focus_request_t;
  Txcb_get_input_focus_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_get_input_focus_reply_t
 * }

  Pxcb_get_input_focus_reply_t = ^Txcb_get_input_focus_reply_t;
  Txcb_get_input_focus_reply_t = record
      response_type : Tuint8_t;
      revert_to : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      focus : Txcb_window_t;
    end;
{*
 * @brief xcb_query_keymap_cookie_t
 * }

  Pxcb_query_keymap_cookie_t = ^Txcb_query_keymap_cookie_t;
  Txcb_query_keymap_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_query_keymap.  }

const
  XCB_QUERY_KEYMAP = 44;  
{*
 * @brief xcb_query_keymap_request_t
 * }
type
  Pxcb_query_keymap_request_t = ^Txcb_query_keymap_request_t;
  Txcb_query_keymap_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_query_keymap_reply_t
 * }

  Pxcb_query_keymap_reply_t = ^Txcb_query_keymap_reply_t;
  Txcb_query_keymap_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      keys : array[0..31] of Tuint8_t;
    end;
{* Opcode for xcb_open_font.  }

const
  XCB_OPEN_FONT = 45;  
{*
 * @brief xcb_open_font_request_t
 * }
type
  Pxcb_open_font_request_t = ^Txcb_open_font_request_t;
  Txcb_open_font_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      fid : Txcb_font_t;
      name_len : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
    end;
{* Opcode for xcb_close_font.  }

const
  XCB_CLOSE_FONT = 46;  
{*
 * @brief xcb_close_font_request_t
 * }
type
  Pxcb_close_font_request_t = ^Txcb_close_font_request_t;
  Txcb_close_font_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      font : Txcb_font_t;
    end;

  Pxcb_font_draw_t = ^Txcb_font_draw_t;
  Txcb_font_draw_t =  Longint;
  Const
    XCB_FONT_DRAW_LEFT_TO_RIGHT = 0;
    XCB_FONT_DRAW_RIGHT_TO_LEFT = 1;
;
{*
 * @brief xcb_fontprop_t
 * }
type
  Pxcb_fontprop_t = ^Txcb_fontprop_t;
  Txcb_fontprop_t = record
      name : Txcb_atom_t;
      value : Tuint32_t;
    end;
{*
 * @brief xcb_fontprop_iterator_t
 * }

  Pxcb_fontprop_iterator_t = ^Txcb_fontprop_iterator_t;
  Txcb_fontprop_iterator_t = record
      data : Pxcb_fontprop_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_charinfo_t
 * }

  Pxcb_charinfo_t = ^Txcb_charinfo_t;
  Txcb_charinfo_t = record
      left_side_bearing : Tint16_t;
      right_side_bearing : Tint16_t;
      character_width : Tint16_t;
      ascent : Tint16_t;
      descent : Tint16_t;
      attributes : Tuint16_t;
    end;
{*
 * @brief xcb_charinfo_iterator_t
 * }

  Pxcb_charinfo_iterator_t = ^Txcb_charinfo_iterator_t;
  Txcb_charinfo_iterator_t = record
      data : Pxcb_charinfo_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_query_font_cookie_t
 * }

  Pxcb_query_font_cookie_t = ^Txcb_query_font_cookie_t;
  Txcb_query_font_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_query_font.  }

const
  XCB_QUERY_FONT = 47;  
{*
 * @brief xcb_query_font_request_t
 * }
type
  Pxcb_query_font_request_t = ^Txcb_query_font_request_t;
  Txcb_query_font_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      font : Txcb_fontable_t;
    end;
{*
 * @brief xcb_query_font_reply_t
 * }

  Pxcb_query_font_reply_t = ^Txcb_query_font_reply_t;
  Txcb_query_font_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      min_bounds : Txcb_charinfo_t;
      pad1 : array[0..3] of Tuint8_t;
      max_bounds : Txcb_charinfo_t;
      pad2 : array[0..3] of Tuint8_t;
      min_char_or_byte2 : Tuint16_t;
      max_char_or_byte2 : Tuint16_t;
      default_char : Tuint16_t;
      properties_len : Tuint16_t;
      draw_direction : Tuint8_t;
      min_byte1 : Tuint8_t;
      max_byte1 : Tuint8_t;
      all_chars_exist : Tuint8_t;
      font_ascent : Tint16_t;
      font_descent : Tint16_t;
      char_infos_len : Tuint32_t;
    end;
{*
 * @brief xcb_query_text_extents_cookie_t
 * }

  Pxcb_query_text_extents_cookie_t = ^Txcb_query_text_extents_cookie_t;
  Txcb_query_text_extents_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_query_text_extents.  }

const
  XCB_QUERY_TEXT_EXTENTS = 48;  
{*
 * @brief xcb_query_text_extents_request_t
 * }
type
  Pxcb_query_text_extents_request_t = ^Txcb_query_text_extents_request_t;
  Txcb_query_text_extents_request_t = record
      major_opcode : Tuint8_t;
      odd_length : Tuint8_t;
      length : Tuint16_t;
      font : Txcb_fontable_t;
    end;
{*
 * @brief xcb_query_text_extents_reply_t
 * }

  Pxcb_query_text_extents_reply_t = ^Txcb_query_text_extents_reply_t;
  Txcb_query_text_extents_reply_t = record
      response_type : Tuint8_t;
      draw_direction : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      font_ascent : Tint16_t;
      font_descent : Tint16_t;
      overall_ascent : Tint16_t;
      overall_descent : Tint16_t;
      overall_width : Tint32_t;
      overall_left : Tint32_t;
      overall_right : Tint32_t;
    end;
{*
 * @brief xcb_str_t
 * }

  Pxcb_str_t = ^Txcb_str_t;
  Txcb_str_t = record
      name_len : Tuint8_t;
    end;
{*
 * @brief xcb_str_iterator_t
 * }

  Pxcb_str_iterator_t = ^Txcb_str_iterator_t;
  Txcb_str_iterator_t = record
      data : Pxcb_str_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_list_fonts_cookie_t
 * }

  Pxcb_list_fonts_cookie_t = ^Txcb_list_fonts_cookie_t;
  Txcb_list_fonts_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_list_fonts.  }

const
  XCB_LIST_FONTS = 49;  
{*
 * @brief xcb_list_fonts_request_t
 * }
type
  Pxcb_list_fonts_request_t = ^Txcb_list_fonts_request_t;
  Txcb_list_fonts_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      max_names : Tuint16_t;
      pattern_len : Tuint16_t;
    end;
{*
 * @brief xcb_list_fonts_reply_t
 * }

  Pxcb_list_fonts_reply_t = ^Txcb_list_fonts_reply_t;
  Txcb_list_fonts_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      names_len : Tuint16_t;
      pad1 : array[0..21] of Tuint8_t;
    end;
{*
 * @brief xcb_list_fonts_with_info_cookie_t
 * }

  Pxcb_list_fonts_with_info_cookie_t = ^Txcb_list_fonts_with_info_cookie_t;
  Txcb_list_fonts_with_info_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_list_fonts_with_info.  }

const
  XCB_LIST_FONTS_WITH_INFO = 50;  
{*
 * @brief xcb_list_fonts_with_info_request_t
 * }
type
  Pxcb_list_fonts_with_info_request_t = ^Txcb_list_fonts_with_info_request_t;
  Txcb_list_fonts_with_info_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      max_names : Tuint16_t;
      pattern_len : Tuint16_t;
    end;
{*
 * @brief xcb_list_fonts_with_info_reply_t
 * }

  Pxcb_list_fonts_with_info_reply_t = ^Txcb_list_fonts_with_info_reply_t;
  Txcb_list_fonts_with_info_reply_t = record
      response_type : Tuint8_t;
      name_len : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      min_bounds : Txcb_charinfo_t;
      pad0 : array[0..3] of Tuint8_t;
      max_bounds : Txcb_charinfo_t;
      pad1 : array[0..3] of Tuint8_t;
      min_char_or_byte2 : Tuint16_t;
      max_char_or_byte2 : Tuint16_t;
      default_char : Tuint16_t;
      properties_len : Tuint16_t;
      draw_direction : Tuint8_t;
      min_byte1 : Tuint8_t;
      max_byte1 : Tuint8_t;
      all_chars_exist : Tuint8_t;
      font_ascent : Tint16_t;
      font_descent : Tint16_t;
      replies_hint : Tuint32_t;
    end;
{* Opcode for xcb_set_font_path.  }

const
  XCB_SET_FONT_PATH = 51;  
{*
 * @brief xcb_set_font_path_request_t
 * }
type
  Pxcb_set_font_path_request_t = ^Txcb_set_font_path_request_t;
  Txcb_set_font_path_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      font_qty : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_get_font_path_cookie_t
 * }

  Pxcb_get_font_path_cookie_t = ^Txcb_get_font_path_cookie_t;
  Txcb_get_font_path_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_font_path.  }

const
  XCB_GET_FONT_PATH = 52;  
{*
 * @brief xcb_get_font_path_request_t
 * }
type
  Pxcb_get_font_path_request_t = ^Txcb_get_font_path_request_t;
  Txcb_get_font_path_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_get_font_path_reply_t
 * }

  Pxcb_get_font_path_reply_t = ^Txcb_get_font_path_reply_t;
  Txcb_get_font_path_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      path_len : Tuint16_t;
      pad1 : array[0..21] of Tuint8_t;
    end;
{* Opcode for xcb_create_pixmap.  }

const
  XCB_CREATE_PIXMAP = 53;  
{*
 * @brief xcb_create_pixmap_request_t
 * }
type
  Pxcb_create_pixmap_request_t = ^Txcb_create_pixmap_request_t;
  Txcb_create_pixmap_request_t = record
      major_opcode : Tuint8_t;
      depth : Tuint8_t;
      length : Tuint16_t;
      pid : Txcb_pixmap_t;
      drawable : Txcb_drawable_t;
      width : Tuint16_t;
      height : Tuint16_t;
    end;
{* Opcode for xcb_free_pixmap.  }

const
  XCB_FREE_PIXMAP = 54;  
{*
 * @brief xcb_free_pixmap_request_t
 * }
type
  Pxcb_free_pixmap_request_t = ^Txcb_free_pixmap_request_t;
  Txcb_free_pixmap_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      pixmap : Txcb_pixmap_t;
    end;
{*< TODO: Refer to GX  }
{*< In graphics operations, given a source and destination pixel, the result is
computed bitwise on corresponding bits of the pixels; that is, a Boolean
operation is performed in each bit plane. The plane-mask restricts the
operation to a subset of planes, so the result is:

        ((src FUNC dst) AND plane-mask) OR (dst AND (NOT plane-mask))  }
{*< Foreground colorpixel.  }
{*< Background colorpixel.  }
{*< The line-width is measured in pixels and can be greater than or equal to one, a wide line, or the
special value zero, a thin line.  }
{*< The line-style defines which sections of a line are drawn:
Solid                The full path of the line is drawn.
DoubleDash           The full path of the line is drawn, but the even dashes are filled differently
                     than the odd dashes (see fill-style), with Butt cap-style used where even and
                     odd dashes meet.
OnOffDash            Only the even dashes are drawn, and cap-style applies to all internal ends of
                     the individual dashes (except NotLast is treated as Butt).  }
{*< The cap-style defines how the endpoints of a path are drawn:
NotLast    The result is equivalent to Butt, except that for a line-width of zero the final
           endpoint is not drawn.
Butt       The result is square at the endpoint (perpendicular to the slope of the line)
           with no projection beyond.
Round      The result is a circular arc with its diameter equal to the line-width, centered
           on the endpoint; it is equivalent to Butt for line-width zero.
Projecting The result is square at the end, but the path continues beyond the endpoint for
           a distance equal to half the line-width; it is equivalent to Butt for line-width
           zero.  }
{*< The join-style defines how corners are drawn for wide lines:
Miter               The outer edges of the two lines extend to meet at an angle. However, if the
                    angle is less than 11 degrees, a Bevel join-style is used instead.
Round               The result is a circular arc with a diameter equal to the line-width, centered
                    on the joinpoint.
Bevel               The result is Butt endpoint styles, and then the triangular notch is filled.  }
{*< The fill-style defines the contents of the source for line, text, and fill requests. For all text and fill
requests (for example, PolyText8, PolyText16, PolyFillRectangle, FillPoly, and PolyFillArc)
as well as for line requests with line-style Solid, (for example, PolyLine, PolySegment,
PolyRectangle, PolyArc) and for the even dashes for line requests with line-style OnOffDash
or DoubleDash:
Solid                     Foreground
Tiled                     Tile
OpaqueStippled            A tile with the same width and height as stipple but with background
                          everywhere stipple has a zero and with foreground everywhere stipple
                          has a one
Stippled                  Foreground masked by stipple
For the odd dashes for line requests with line-style DoubleDash:
Solid                     Background
Tiled                     Same as for even dashes
OpaqueStippled            Same as for even dashes
Stippled                  Background masked by stipple  }
{*<   }
{*< The tile/stipple represents an infinite two-dimensional plane with the tile/stipple replicated in all
dimensions. When that plane is superimposed on the drawable for use in a graphics operation,
the upper-left corner of some instance of the tile/stipple is at the coordinates within the drawable
specified by the tile/stipple origin. The tile/stipple and clip origins are interpreted relative to the
origin of whatever destination drawable is specified in a graphics request.
The tile pixmap must have the same root and depth as the gcontext (or a Match error results).
The stipple pixmap must have depth one and must have the same root as the gcontext (or a
Match error results). For fill-style Stippled (but not fill-style
OpaqueStippled), the stipple pattern is tiled in a single plane and acts as an
additional clip mask to be ANDed with the clip-mask.
Any size pixmap can be used for tiling or stippling, although some sizes may be faster to use than
others.  }
{*< The tile/stipple represents an infinite two-dimensional plane with the tile/stipple replicated in all
dimensions. When that plane is superimposed on the drawable for use in a graphics operation,
the upper-left corner of some instance of the tile/stipple is at the coordinates within the drawable
specified by the tile/stipple origin. The tile/stipple and clip origins are interpreted relative to the
origin of whatever destination drawable is specified in a graphics request.
The tile pixmap must have the same root and depth as the gcontext (or a Match error results).
The stipple pixmap must have depth one and must have the same root as the gcontext (or a
Match error results). For fill-style Stippled (but not fill-style
OpaqueStippled), the stipple pattern is tiled in a single plane and acts as an
additional clip mask to be ANDed with the clip-mask.
Any size pixmap can be used for tiling or stippling, although some sizes may be faster to use than
others.  }
{*< TODO  }
{*< TODO  }
{*< Which font to use for the `ImageText8` and `ImageText16` requests.  }
{*< For ClipByChildren, both source and destination windows are additionally
clipped by all viewable InputOutput children. For IncludeInferiors, neither
source nor destination window is
clipped by inferiors. This will result in including subwindow contents in the source and drawing
through subwindow boundaries of the destination. The use of IncludeInferiors with a source or
destination window of one depth with mapped inferiors of differing depth is not illegal, but the
semantics is undefined by the core protocol.  }
{*< Whether ExposureEvents should be generated (1) or not (0).

The default is 1.  }
{*< TODO  }
{*< TODO  }
{*< The clip-mask restricts writes to the destination drawable. Only pixels where the clip-mask has
bits set to 1 are drawn. Pixels are not drawn outside the area covered by the clip-mask or where
the clip-mask has bits set to 0. The clip-mask affects all graphics requests, but it does not clip
sources. The clip-mask origin is interpreted relative to the origin of whatever destination drawable is specified in a graphics request. If a pixmap is specified as the clip-mask, it must have
depth 1 and have the same root as the gcontext (or a Match error results). If clip-mask is None,
then pixels are always drawn, regardless of the clip origin. The clip-mask can also be set with the
SetClipRectangles request.  }
{*< TODO  }
{*< TODO  }
{*< TODO  }

  Pxcb_gc_t = ^Txcb_gc_t;
  Txcb_gc_t =  Longint;
  Const
    XCB_GC_FUNCTION = 1;
    XCB_GC_PLANE_MASK = 2;
    XCB_GC_FOREGROUND = 4;
    XCB_GC_BACKGROUND = 8;
    XCB_GC_LINE_WIDTH = 16;
    XCB_GC_LINE_STYLE = 32;
    XCB_GC_CAP_STYLE = 64;
    XCB_GC_JOIN_STYLE = 128;
    XCB_GC_FILL_STYLE = 256;
    XCB_GC_FILL_RULE = 512;
    XCB_GC_TILE = 1024;
    XCB_GC_STIPPLE = 2048;
    XCB_GC_TILE_STIPPLE_ORIGIN_X = 4096;
    XCB_GC_TILE_STIPPLE_ORIGIN_Y = 8192;
    XCB_GC_FONT = 16384;
    XCB_GC_SUBWINDOW_MODE = 32768;
    XCB_GC_GRAPHICS_EXPOSURES = 65536;
    XCB_GC_CLIP_ORIGIN_X = 131072;
    XCB_GC_CLIP_ORIGIN_Y = 262144;
    XCB_GC_CLIP_MASK = 524288;
    XCB_GC_DASH_OFFSET = 1048576;
    XCB_GC_DASH_LIST = 2097152;
    XCB_GC_ARC_MODE = 4194304;
;
type
  Pxcb_gx_t = ^Txcb_gx_t;
  Txcb_gx_t =  Longint;
  Const
    XCB_GX_CLEAR = 0;
    XCB_GX_AND = 1;
    XCB_GX_AND_REVERSE = 2;
    XCB_GX_COPY = 3;
    XCB_GX_AND_INVERTED = 4;
    XCB_GX_NOOP = 5;
    XCB_GX_XOR = 6;
    XCB_GX_OR = 7;
    XCB_GX_NOR = 8;
    XCB_GX_EQUIV = 9;
    XCB_GX_INVERT = 10;
    XCB_GX_OR_REVERSE = 11;
    XCB_GX_COPY_INVERTED = 12;
    XCB_GX_OR_INVERTED = 13;
    XCB_GX_NAND = 14;
    XCB_GX_SET = 15;
;
type
  Pxcb_line_style_t = ^Txcb_line_style_t;
  Txcb_line_style_t =  Longint;
  Const
    XCB_LINE_STYLE_SOLID = 0;
    XCB_LINE_STYLE_ON_OFF_DASH = 1;
    XCB_LINE_STYLE_DOUBLE_DASH = 2;
;
type
  Pxcb_cap_style_t = ^Txcb_cap_style_t;
  Txcb_cap_style_t =  Longint;
  Const
    XCB_CAP_STYLE_NOT_LAST = 0;
    XCB_CAP_STYLE_BUTT = 1;
    XCB_CAP_STYLE_ROUND = 2;
    XCB_CAP_STYLE_PROJECTING = 3;
;
type
  Pxcb_join_style_t = ^Txcb_join_style_t;
  Txcb_join_style_t =  Longint;
  Const
    XCB_JOIN_STYLE_MITER = 0;
    XCB_JOIN_STYLE_ROUND = 1;
    XCB_JOIN_STYLE_BEVEL = 2;
;
type
  Pxcb_fill_style_t = ^Txcb_fill_style_t;
  Txcb_fill_style_t =  Longint;
  Const
    XCB_FILL_STYLE_SOLID = 0;
    XCB_FILL_STYLE_TILED = 1;
    XCB_FILL_STYLE_STIPPLED = 2;
    XCB_FILL_STYLE_OPAQUE_STIPPLED = 3;
;
type
  Pxcb_fill_rule_t = ^Txcb_fill_rule_t;
  Txcb_fill_rule_t =  Longint;
  Const
    XCB_FILL_RULE_EVEN_ODD = 0;
    XCB_FILL_RULE_WINDING = 1;
;
type
  Pxcb_subwindow_mode_t = ^Txcb_subwindow_mode_t;
  Txcb_subwindow_mode_t =  Longint;
  Const
    XCB_SUBWINDOW_MODE_CLIP_BY_CHILDREN = 0;
    XCB_SUBWINDOW_MODE_INCLUDE_INFERIORS = 1;
;
type
  Pxcb_arc_mode_t = ^Txcb_arc_mode_t;
  Txcb_arc_mode_t =  Longint;
  Const
    XCB_ARC_MODE_CHORD = 0;
    XCB_ARC_MODE_PIE_SLICE = 1;
;
{*
 * @brief xcb_create_gc_value_list_t
 * }
type
  Pxcb_create_gc_value_list_t = ^Txcb_create_gc_value_list_t;
  Txcb_create_gc_value_list_t = record
      _function : Tuint32_t;
      plane_mask : Tuint32_t;
      foreground : Tuint32_t;
      background : Tuint32_t;
      line_width : Tuint32_t;
      line_style : Tuint32_t;
      cap_style : Tuint32_t;
      join_style : Tuint32_t;
      fill_style : Tuint32_t;
      fill_rule : Tuint32_t;
      tile : Txcb_pixmap_t;
      stipple : Txcb_pixmap_t;
      tile_stipple_x_origin : Tint32_t;
      tile_stipple_y_origin : Tint32_t;
      font : Txcb_font_t;
      subwindow_mode : Tuint32_t;
      graphics_exposures : Txcb_bool32_t;
      clip_x_origin : Tint32_t;
      clip_y_origin : Tint32_t;
      clip_mask : Txcb_pixmap_t;
      dash_offset : Tuint32_t;
      dashes : Tuint32_t;
      arc_mode : Tuint32_t;
    end;
{* Opcode for xcb_create_gc.  }

const
  XCB_CREATE_GC = 55;  
{*
 * @brief xcb_create_gc_request_t
 * }
type
  Pxcb_create_gc_request_t = ^Txcb_create_gc_request_t;
  Txcb_create_gc_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cid : Txcb_gcontext_t;
      drawable : Txcb_drawable_t;
      value_mask : Tuint32_t;
    end;
{*
 * @brief xcb_change_gc_value_list_t
 * }

  Pxcb_change_gc_value_list_t = ^Txcb_change_gc_value_list_t;
  Txcb_change_gc_value_list_t = record
      _function : Tuint32_t;
      plane_mask : Tuint32_t;
      foreground : Tuint32_t;
      background : Tuint32_t;
      line_width : Tuint32_t;
      line_style : Tuint32_t;
      cap_style : Tuint32_t;
      join_style : Tuint32_t;
      fill_style : Tuint32_t;
      fill_rule : Tuint32_t;
      tile : Txcb_pixmap_t;
      stipple : Txcb_pixmap_t;
      tile_stipple_x_origin : Tint32_t;
      tile_stipple_y_origin : Tint32_t;
      font : Txcb_font_t;
      subwindow_mode : Tuint32_t;
      graphics_exposures : Txcb_bool32_t;
      clip_x_origin : Tint32_t;
      clip_y_origin : Tint32_t;
      clip_mask : Txcb_pixmap_t;
      dash_offset : Tuint32_t;
      dashes : Tuint32_t;
      arc_mode : Tuint32_t;
    end;
{* Opcode for xcb_change_gc.  }

const
  XCB_CHANGE_GC = 56;  
{*
 * @brief xcb_change_gc_request_t
 * }
type
  Pxcb_change_gc_request_t = ^Txcb_change_gc_request_t;
  Txcb_change_gc_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      gc : Txcb_gcontext_t;
      value_mask : Tuint32_t;
    end;
{* Opcode for xcb_copy_gc.  }

const
  XCB_COPY_GC = 57;  
{*
 * @brief xcb_copy_gc_request_t
 * }
type
  Pxcb_copy_gc_request_t = ^Txcb_copy_gc_request_t;
  Txcb_copy_gc_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      src_gc : Txcb_gcontext_t;
      dst_gc : Txcb_gcontext_t;
      value_mask : Tuint32_t;
    end;
{* Opcode for xcb_set_dashes.  }

const
  XCB_SET_DASHES = 58;  
{*
 * @brief xcb_set_dashes_request_t
 * }
type
  Pxcb_set_dashes_request_t = ^Txcb_set_dashes_request_t;
  Txcb_set_dashes_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      gc : Txcb_gcontext_t;
      dash_offset : Tuint16_t;
      dashes_len : Tuint16_t;
    end;

  Pxcb_clip_ordering_t = ^Txcb_clip_ordering_t;
  Txcb_clip_ordering_t =  Longint;
  Const
    XCB_CLIP_ORDERING_UNSORTED = 0;
    XCB_CLIP_ORDERING_Y_SORTED = 1;
    XCB_CLIP_ORDERING_YX_SORTED = 2;
    XCB_CLIP_ORDERING_YX_BANDED = 3;
;
{* Opcode for xcb_set_clip_rectangles.  }
  XCB_SET_CLIP_RECTANGLES = 59;  
{*
 * @brief xcb_set_clip_rectangles_request_t
 * }
type
  Pxcb_set_clip_rectangles_request_t = ^Txcb_set_clip_rectangles_request_t;
  Txcb_set_clip_rectangles_request_t = record
      major_opcode : Tuint8_t;
      ordering : Tuint8_t;
      length : Tuint16_t;
      gc : Txcb_gcontext_t;
      clip_x_origin : Tint16_t;
      clip_y_origin : Tint16_t;
    end;
{* Opcode for xcb_free_gc.  }

const
  XCB_FREE_GC = 60;  
{*
 * @brief xcb_free_gc_request_t
 * }
type
  Pxcb_free_gc_request_t = ^Txcb_free_gc_request_t;
  Txcb_free_gc_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      gc : Txcb_gcontext_t;
    end;
{* Opcode for xcb_clear_area.  }

const
  XCB_CLEAR_AREA = 61;  
{*
 * @brief xcb_clear_area_request_t
 * }
type
  Pxcb_clear_area_request_t = ^Txcb_clear_area_request_t;
  Txcb_clear_area_request_t = record
      major_opcode : Tuint8_t;
      exposures : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
    end;
{* Opcode for xcb_copy_area.  }

const
  XCB_COPY_AREA = 62;  
{*
 * @brief xcb_copy_area_request_t
 * }
type
  Pxcb_copy_area_request_t = ^Txcb_copy_area_request_t;
  Txcb_copy_area_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      src_drawable : Txcb_drawable_t;
      dst_drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
      src_x : Tint16_t;
      src_y : Tint16_t;
      dst_x : Tint16_t;
      dst_y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
    end;
{* Opcode for xcb_copy_plane.  }

const
  XCB_COPY_PLANE = 63;  
{*
 * @brief xcb_copy_plane_request_t
 * }
type
  Pxcb_copy_plane_request_t = ^Txcb_copy_plane_request_t;
  Txcb_copy_plane_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      src_drawable : Txcb_drawable_t;
      dst_drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
      src_x : Tint16_t;
      src_y : Tint16_t;
      dst_x : Tint16_t;
      dst_y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      bit_plane : Tuint32_t;
    end;
{*< Treats all coordinates as relative to the origin.  }
{*< Treats all coordinates after the first as relative to the previous coordinate.  }

  Pxcb_coord_mode_t = ^Txcb_coord_mode_t;
  Txcb_coord_mode_t =  Longint;
  Const
    XCB_COORD_MODE_ORIGIN = 0;
    XCB_COORD_MODE_PREVIOUS = 1;
;
{* Opcode for xcb_poly_point.  }
  XCB_POLY_POINT = 64;  
{*
 * @brief xcb_poly_point_request_t
 * }
type
  Pxcb_poly_point_request_t = ^Txcb_poly_point_request_t;
  Txcb_poly_point_request_t = record
      major_opcode : Tuint8_t;
      coordinate_mode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
    end;
{* Opcode for xcb_poly_line.  }

const
  XCB_POLY_LINE = 65;  
{*
 * @brief xcb_poly_line_request_t
 * }
type
  Pxcb_poly_line_request_t = ^Txcb_poly_line_request_t;
  Txcb_poly_line_request_t = record
      major_opcode : Tuint8_t;
      coordinate_mode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
    end;
{*
 * @brief xcb_segment_t
 * }

  Pxcb_segment_t = ^Txcb_segment_t;
  Txcb_segment_t = record
      x1 : Tint16_t;
      y1 : Tint16_t;
      x2 : Tint16_t;
      y2 : Tint16_t;
    end;
{*
 * @brief xcb_segment_iterator_t
 * }

  Pxcb_segment_iterator_t = ^Txcb_segment_iterator_t;
  Txcb_segment_iterator_t = record
      data : Pxcb_segment_t;
      rem : longint;
      index : longint;
    end;
{* Opcode for xcb_poly_segment.  }

const
  XCB_POLY_SEGMENT = 66;  
{*
 * @brief xcb_poly_segment_request_t
 * }
type
  Pxcb_poly_segment_request_t = ^Txcb_poly_segment_request_t;
  Txcb_poly_segment_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
    end;
{* Opcode for xcb_poly_rectangle.  }

const
  XCB_POLY_RECTANGLE = 67;  
{*
 * @brief xcb_poly_rectangle_request_t
 * }
type
  Pxcb_poly_rectangle_request_t = ^Txcb_poly_rectangle_request_t;
  Txcb_poly_rectangle_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
    end;
{* Opcode for xcb_poly_arc.  }

const
  XCB_POLY_ARC = 68;  
{*
 * @brief xcb_poly_arc_request_t
 * }
type
  Pxcb_poly_arc_request_t = ^Txcb_poly_arc_request_t;
  Txcb_poly_arc_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
    end;

  Pxcb_poly_shape_t = ^Txcb_poly_shape_t;
  Txcb_poly_shape_t =  Longint;
  Const
    XCB_POLY_SHAPE_COMPLEX = 0;
    XCB_POLY_SHAPE_NONCONVEX = 1;
    XCB_POLY_SHAPE_CONVEX = 2;
;
{* Opcode for xcb_fill_poly.  }
  XCB_FILL_POLY = 69;  
{*
 * @brief xcb_fill_poly_request_t
 * }
type
  Pxcb_fill_poly_request_t = ^Txcb_fill_poly_request_t;
  Txcb_fill_poly_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
      shape : Tuint8_t;
      coordinate_mode : Tuint8_t;
      pad1 : array[0..1] of Tuint8_t;
    end;
{* Opcode for xcb_poly_fill_rectangle.  }

const
  XCB_POLY_FILL_RECTANGLE = 70;  
{*
 * @brief xcb_poly_fill_rectangle_request_t
 * }
type
  Pxcb_poly_fill_rectangle_request_t = ^Txcb_poly_fill_rectangle_request_t;
  Txcb_poly_fill_rectangle_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
    end;
{* Opcode for xcb_poly_fill_arc.  }

const
  XCB_POLY_FILL_ARC = 71;  
{*
 * @brief xcb_poly_fill_arc_request_t
 * }
type
  Pxcb_poly_fill_arc_request_t = ^Txcb_poly_fill_arc_request_t;
  Txcb_poly_fill_arc_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
    end;

  Pxcb_image_format_t = ^Txcb_image_format_t;
  Txcb_image_format_t =  Longint;
  Const
    XCB_IMAGE_FORMAT_XY_BITMAP = 0;
    XCB_IMAGE_FORMAT_XY_PIXMAP = 1;
    XCB_IMAGE_FORMAT_Z_PIXMAP = 2;
;
{* Opcode for xcb_put_image.  }
  XCB_PUT_IMAGE = 72;  
{*
 * @brief xcb_put_image_request_t
 * }
type
  Pxcb_put_image_request_t = ^Txcb_put_image_request_t;
  Txcb_put_image_request_t = record
      major_opcode : Tuint8_t;
      format : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
      width : Tuint16_t;
      height : Tuint16_t;
      dst_x : Tint16_t;
      dst_y : Tint16_t;
      left_pad : Tuint8_t;
      depth : Tuint8_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_get_image_cookie_t
 * }

  Pxcb_get_image_cookie_t = ^Txcb_get_image_cookie_t;
  Txcb_get_image_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_image.  }

const
  XCB_GET_IMAGE = 73;  
{*
 * @brief xcb_get_image_request_t
 * }
type
  Pxcb_get_image_request_t = ^Txcb_get_image_request_t;
  Txcb_get_image_request_t = record
      major_opcode : Tuint8_t;
      format : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      plane_mask : Tuint32_t;
    end;
{*
 * @brief xcb_get_image_reply_t
 * }

  Pxcb_get_image_reply_t = ^Txcb_get_image_reply_t;
  Txcb_get_image_reply_t = record
      response_type : Tuint8_t;
      depth : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      visual : Txcb_visualid_t;
      pad0 : array[0..19] of Tuint8_t;
    end;
{* Opcode for xcb_poly_text_8.  }

const
  XCB_POLY_TEXT_8 = 74;  
{*
 * @brief xcb_poly_text_8_request_t
 * }
type
  Pxcb_poly_text_8_request_t = ^Txcb_poly_text_8_request_t;
  Txcb_poly_text_8_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
      x : Tint16_t;
      y : Tint16_t;
    end;
{* Opcode for xcb_poly_text_16.  }

const
  XCB_POLY_TEXT_16 = 75;  
{*
 * @brief xcb_poly_text_16_request_t
 * }
type
  Pxcb_poly_text_16_request_t = ^Txcb_poly_text_16_request_t;
  Txcb_poly_text_16_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
      x : Tint16_t;
      y : Tint16_t;
    end;
{* Opcode for xcb_image_text_8.  }

const
  XCB_IMAGE_TEXT_8 = 76;  
{*
 * @brief xcb_image_text_8_request_t
 * }
type
  Pxcb_image_text_8_request_t = ^Txcb_image_text_8_request_t;
  Txcb_image_text_8_request_t = record
      major_opcode : Tuint8_t;
      string_len : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
      x : Tint16_t;
      y : Tint16_t;
    end;
{* Opcode for xcb_image_text_16.  }

const
  XCB_IMAGE_TEXT_16 = 77;  
{*
 * @brief xcb_image_text_16_request_t
 * }
type
  Pxcb_image_text_16_request_t = ^Txcb_image_text_16_request_t;
  Txcb_image_text_16_request_t = record
      major_opcode : Tuint8_t;
      string_len : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
      x : Tint16_t;
      y : Tint16_t;
    end;

  Pxcb_colormap_alloc_t = ^Txcb_colormap_alloc_t;
  Txcb_colormap_alloc_t =  Longint;
  Const
    XCB_COLORMAP_ALLOC_NONE = 0;
    XCB_COLORMAP_ALLOC_ALL = 1;
;
{* Opcode for xcb_create_colormap.  }
  XCB_CREATE_COLORMAP = 78;  
{*
 * @brief xcb_create_colormap_request_t
 * }
type
  Pxcb_create_colormap_request_t = ^Txcb_create_colormap_request_t;
  Txcb_create_colormap_request_t = record
      major_opcode : Tuint8_t;
      alloc : Tuint8_t;
      length : Tuint16_t;
      mid : Txcb_colormap_t;
      window : Txcb_window_t;
      visual : Txcb_visualid_t;
    end;
{* Opcode for xcb_free_colormap.  }

const
  XCB_FREE_COLORMAP = 79;  
{*
 * @brief xcb_free_colormap_request_t
 * }
type
  Pxcb_free_colormap_request_t = ^Txcb_free_colormap_request_t;
  Txcb_free_colormap_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cmap : Txcb_colormap_t;
    end;
{* Opcode for xcb_copy_colormap_and_free.  }

const
  XCB_COPY_COLORMAP_AND_FREE = 80;  
{*
 * @brief xcb_copy_colormap_and_free_request_t
 * }
type
  Pxcb_copy_colormap_and_free_request_t = ^Txcb_copy_colormap_and_free_request_t;
  Txcb_copy_colormap_and_free_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      mid : Txcb_colormap_t;
      src_cmap : Txcb_colormap_t;
    end;
{* Opcode for xcb_install_colormap.  }

const
  XCB_INSTALL_COLORMAP = 81;  
{*
 * @brief xcb_install_colormap_request_t
 * }
type
  Pxcb_install_colormap_request_t = ^Txcb_install_colormap_request_t;
  Txcb_install_colormap_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cmap : Txcb_colormap_t;
    end;
{* Opcode for xcb_uninstall_colormap.  }

const
  XCB_UNINSTALL_COLORMAP = 82;  
{*
 * @brief xcb_uninstall_colormap_request_t
 * }
type
  Pxcb_uninstall_colormap_request_t = ^Txcb_uninstall_colormap_request_t;
  Txcb_uninstall_colormap_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cmap : Txcb_colormap_t;
    end;
{*
 * @brief xcb_list_installed_colormaps_cookie_t
 * }

  Pxcb_list_installed_colormaps_cookie_t = ^Txcb_list_installed_colormaps_cookie_t;
  Txcb_list_installed_colormaps_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_list_installed_colormaps.  }

const
  XCB_LIST_INSTALLED_COLORMAPS = 83;  
{*
 * @brief xcb_list_installed_colormaps_request_t
 * }
type
  Pxcb_list_installed_colormaps_request_t = ^Txcb_list_installed_colormaps_request_t;
  Txcb_list_installed_colormaps_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{*
 * @brief xcb_list_installed_colormaps_reply_t
 * }

  Pxcb_list_installed_colormaps_reply_t = ^Txcb_list_installed_colormaps_reply_t;
  Txcb_list_installed_colormaps_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      cmaps_len : Tuint16_t;
      pad1 : array[0..21] of Tuint8_t;
    end;
{*
 * @brief xcb_alloc_color_cookie_t
 * }

  Pxcb_alloc_color_cookie_t = ^Txcb_alloc_color_cookie_t;
  Txcb_alloc_color_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_alloc_color.  }

const
  XCB_ALLOC_COLOR = 84;  
{*
 * @brief xcb_alloc_color_request_t
 * }
type
  Pxcb_alloc_color_request_t = ^Txcb_alloc_color_request_t;
  Txcb_alloc_color_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cmap : Txcb_colormap_t;
      red : Tuint16_t;
      green : Tuint16_t;
      blue : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_alloc_color_reply_t
 * }

  Pxcb_alloc_color_reply_t = ^Txcb_alloc_color_reply_t;
  Txcb_alloc_color_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      red : Tuint16_t;
      green : Tuint16_t;
      blue : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
      pixel : Tuint32_t;
    end;
{*
 * @brief xcb_alloc_named_color_cookie_t
 * }

  Pxcb_alloc_named_color_cookie_t = ^Txcb_alloc_named_color_cookie_t;
  Txcb_alloc_named_color_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_alloc_named_color.  }

const
  XCB_ALLOC_NAMED_COLOR = 85;  
{*
 * @brief xcb_alloc_named_color_request_t
 * }
type
  Pxcb_alloc_named_color_request_t = ^Txcb_alloc_named_color_request_t;
  Txcb_alloc_named_color_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cmap : Txcb_colormap_t;
      name_len : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_alloc_named_color_reply_t
 * }

  Pxcb_alloc_named_color_reply_t = ^Txcb_alloc_named_color_reply_t;
  Txcb_alloc_named_color_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pixel : Tuint32_t;
      exact_red : Tuint16_t;
      exact_green : Tuint16_t;
      exact_blue : Tuint16_t;
      visual_red : Tuint16_t;
      visual_green : Tuint16_t;
      visual_blue : Tuint16_t;
    end;
{*
 * @brief xcb_alloc_color_cells_cookie_t
 * }

  Pxcb_alloc_color_cells_cookie_t = ^Txcb_alloc_color_cells_cookie_t;
  Txcb_alloc_color_cells_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_alloc_color_cells.  }

const
  XCB_ALLOC_COLOR_CELLS = 86;  
{*
 * @brief xcb_alloc_color_cells_request_t
 * }
type
  Pxcb_alloc_color_cells_request_t = ^Txcb_alloc_color_cells_request_t;
  Txcb_alloc_color_cells_request_t = record
      major_opcode : Tuint8_t;
      contiguous : Tuint8_t;
      length : Tuint16_t;
      cmap : Txcb_colormap_t;
      colors : Tuint16_t;
      planes : Tuint16_t;
    end;
{*
 * @brief xcb_alloc_color_cells_reply_t
 * }

  Pxcb_alloc_color_cells_reply_t = ^Txcb_alloc_color_cells_reply_t;
  Txcb_alloc_color_cells_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pixels_len : Tuint16_t;
      masks_len : Tuint16_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 * @brief xcb_alloc_color_planes_cookie_t
 * }

  Pxcb_alloc_color_planes_cookie_t = ^Txcb_alloc_color_planes_cookie_t;
  Txcb_alloc_color_planes_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_alloc_color_planes.  }

const
  XCB_ALLOC_COLOR_PLANES = 87;  
{*
 * @brief xcb_alloc_color_planes_request_t
 * }
type
  Pxcb_alloc_color_planes_request_t = ^Txcb_alloc_color_planes_request_t;
  Txcb_alloc_color_planes_request_t = record
      major_opcode : Tuint8_t;
      contiguous : Tuint8_t;
      length : Tuint16_t;
      cmap : Txcb_colormap_t;
      colors : Tuint16_t;
      reds : Tuint16_t;
      greens : Tuint16_t;
      blues : Tuint16_t;
    end;
{*
 * @brief xcb_alloc_color_planes_reply_t
 * }

  Pxcb_alloc_color_planes_reply_t = ^Txcb_alloc_color_planes_reply_t;
  Txcb_alloc_color_planes_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pixels_len : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
      red_mask : Tuint32_t;
      green_mask : Tuint32_t;
      blue_mask : Tuint32_t;
      pad2 : array[0..7] of Tuint8_t;
    end;
{* Opcode for xcb_free_colors.  }

const
  XCB_FREE_COLORS = 88;  
{*
 * @brief xcb_free_colors_request_t
 * }
type
  Pxcb_free_colors_request_t = ^Txcb_free_colors_request_t;
  Txcb_free_colors_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cmap : Txcb_colormap_t;
      plane_mask : Tuint32_t;
    end;

  Pxcb_color_flag_t = ^Txcb_color_flag_t;
  Txcb_color_flag_t =  Longint;
  Const
    XCB_COLOR_FLAG_RED = 1;
    XCB_COLOR_FLAG_GREEN = 2;
    XCB_COLOR_FLAG_BLUE = 4;
;
{*
 * @brief xcb_coloritem_t
 * }
type
  Pxcb_coloritem_t = ^Txcb_coloritem_t;
  Txcb_coloritem_t = record
      pixel : Tuint32_t;
      red : Tuint16_t;
      green : Tuint16_t;
      blue : Tuint16_t;
      flags : Tuint8_t;
      pad0 : Tuint8_t;
    end;
{*
 * @brief xcb_coloritem_iterator_t
 * }

  Pxcb_coloritem_iterator_t = ^Txcb_coloritem_iterator_t;
  Txcb_coloritem_iterator_t = record
      data : Pxcb_coloritem_t;
      rem : longint;
      index : longint;
    end;
{* Opcode for xcb_store_colors.  }

const
  XCB_STORE_COLORS = 89;  
{*
 * @brief xcb_store_colors_request_t
 * }
type
  Pxcb_store_colors_request_t = ^Txcb_store_colors_request_t;
  Txcb_store_colors_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cmap : Txcb_colormap_t;
    end;
{* Opcode for xcb_store_named_color.  }

const
  XCB_STORE_NAMED_COLOR = 90;  
{*
 * @brief xcb_store_named_color_request_t
 * }
type
  Pxcb_store_named_color_request_t = ^Txcb_store_named_color_request_t;
  Txcb_store_named_color_request_t = record
      major_opcode : Tuint8_t;
      flags : Tuint8_t;
      length : Tuint16_t;
      cmap : Txcb_colormap_t;
      pixel : Tuint32_t;
      name_len : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_rgb_t
 * }

  Pxcb_rgb_t = ^Txcb_rgb_t;
  Txcb_rgb_t = record
      red : Tuint16_t;
      green : Tuint16_t;
      blue : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_rgb_iterator_t
 * }

  Pxcb_rgb_iterator_t = ^Txcb_rgb_iterator_t;
  Txcb_rgb_iterator_t = record
      data : Pxcb_rgb_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_query_colors_cookie_t
 * }

  Pxcb_query_colors_cookie_t = ^Txcb_query_colors_cookie_t;
  Txcb_query_colors_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_query_colors.  }

const
  XCB_QUERY_COLORS = 91;  
{*
 * @brief xcb_query_colors_request_t
 * }
type
  Pxcb_query_colors_request_t = ^Txcb_query_colors_request_t;
  Txcb_query_colors_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cmap : Txcb_colormap_t;
    end;
{*
 * @brief xcb_query_colors_reply_t
 * }

  Pxcb_query_colors_reply_t = ^Txcb_query_colors_reply_t;
  Txcb_query_colors_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      colors_len : Tuint16_t;
      pad1 : array[0..21] of Tuint8_t;
    end;
{*
 * @brief xcb_lookup_color_cookie_t
 * }

  Pxcb_lookup_color_cookie_t = ^Txcb_lookup_color_cookie_t;
  Txcb_lookup_color_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_lookup_color.  }

const
  XCB_LOOKUP_COLOR = 92;  
{*
 * @brief xcb_lookup_color_request_t
 * }
type
  Pxcb_lookup_color_request_t = ^Txcb_lookup_color_request_t;
  Txcb_lookup_color_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cmap : Txcb_colormap_t;
      name_len : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_lookup_color_reply_t
 * }

  Pxcb_lookup_color_reply_t = ^Txcb_lookup_color_reply_t;
  Txcb_lookup_color_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      exact_red : Tuint16_t;
      exact_green : Tuint16_t;
      exact_blue : Tuint16_t;
      visual_red : Tuint16_t;
      visual_green : Tuint16_t;
      visual_blue : Tuint16_t;
    end;

  Pxcb_pixmap_enum_t = ^Txcb_pixmap_enum_t;
  Txcb_pixmap_enum_t =  Longint;
  Const
    XCB_PIXMAP_NONE = 0;
;
{* Opcode for xcb_create_cursor.  }
  XCB_CREATE_CURSOR = 93;  
{*
 * @brief xcb_create_cursor_request_t
 * }
type
  Pxcb_create_cursor_request_t = ^Txcb_create_cursor_request_t;
  Txcb_create_cursor_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cid : Txcb_cursor_t;
      source : Txcb_pixmap_t;
      mask : Txcb_pixmap_t;
      fore_red : Tuint16_t;
      fore_green : Tuint16_t;
      fore_blue : Tuint16_t;
      back_red : Tuint16_t;
      back_green : Tuint16_t;
      back_blue : Tuint16_t;
      x : Tuint16_t;
      y : Tuint16_t;
    end;

  Pxcb_font_enum_t = ^Txcb_font_enum_t;
  Txcb_font_enum_t =  Longint;
  Const
    XCB_FONT_NONE = 0;
;
{* Opcode for xcb_create_glyph_cursor.  }
  XCB_CREATE_GLYPH_CURSOR = 94;  
{*
 * @brief xcb_create_glyph_cursor_request_t
 * }
type
  Pxcb_create_glyph_cursor_request_t = ^Txcb_create_glyph_cursor_request_t;
  Txcb_create_glyph_cursor_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cid : Txcb_cursor_t;
      source_font : Txcb_font_t;
      mask_font : Txcb_font_t;
      source_char : Tuint16_t;
      mask_char : Tuint16_t;
      fore_red : Tuint16_t;
      fore_green : Tuint16_t;
      fore_blue : Tuint16_t;
      back_red : Tuint16_t;
      back_green : Tuint16_t;
      back_blue : Tuint16_t;
    end;
{* Opcode for xcb_free_cursor.  }

const
  XCB_FREE_CURSOR = 95;  
{*
 * @brief xcb_free_cursor_request_t
 * }
type
  Pxcb_free_cursor_request_t = ^Txcb_free_cursor_request_t;
  Txcb_free_cursor_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cursor : Txcb_cursor_t;
    end;
{* Opcode for xcb_recolor_cursor.  }

const
  XCB_RECOLOR_CURSOR = 96;  
{*
 * @brief xcb_recolor_cursor_request_t
 * }
type
  Pxcb_recolor_cursor_request_t = ^Txcb_recolor_cursor_request_t;
  Txcb_recolor_cursor_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      cursor : Txcb_cursor_t;
      fore_red : Tuint16_t;
      fore_green : Tuint16_t;
      fore_blue : Tuint16_t;
      back_red : Tuint16_t;
      back_green : Tuint16_t;
      back_blue : Tuint16_t;
    end;

  Pxcb_query_shape_of_t = ^Txcb_query_shape_of_t;
  Txcb_query_shape_of_t =  Longint;
  Const
    XCB_QUERY_SHAPE_OF_LARGEST_CURSOR = 0;
    XCB_QUERY_SHAPE_OF_FASTEST_TILE = 1;
    XCB_QUERY_SHAPE_OF_FASTEST_STIPPLE = 2;
;
{*
 * @brief xcb_query_best_size_cookie_t
 * }
type
  Pxcb_query_best_size_cookie_t = ^Txcb_query_best_size_cookie_t;
  Txcb_query_best_size_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_query_best_size.  }

const
  XCB_QUERY_BEST_SIZE = 97;  
{*
 * @brief xcb_query_best_size_request_t
 * }
type
  Pxcb_query_best_size_request_t = ^Txcb_query_best_size_request_t;
  Txcb_query_best_size_request_t = record
      major_opcode : Tuint8_t;
      _class : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      width : Tuint16_t;
      height : Tuint16_t;
    end;
{*
 * @brief xcb_query_best_size_reply_t
 * }

  Pxcb_query_best_size_reply_t = ^Txcb_query_best_size_reply_t;
  Txcb_query_best_size_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      width : Tuint16_t;
      height : Tuint16_t;
    end;
{*
 * @brief xcb_query_extension_cookie_t
 * }

  Pxcb_query_extension_cookie_t = ^Txcb_query_extension_cookie_t;
  Txcb_query_extension_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_query_extension.  }

const
  XCB_QUERY_EXTENSION = 98;  
{*
 * @brief xcb_query_extension_request_t
 * }
type
  Pxcb_query_extension_request_t = ^Txcb_query_extension_request_t;
  Txcb_query_extension_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      name_len : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_query_extension_reply_t
 * }

  Pxcb_query_extension_reply_t = ^Txcb_query_extension_reply_t;
  Txcb_query_extension_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      present : Tuint8_t;
      major_opcode : Tuint8_t;
      first_event : Tuint8_t;
      first_error : Tuint8_t;
    end;
{*
 * @brief xcb_list_extensions_cookie_t
 * }

  Pxcb_list_extensions_cookie_t = ^Txcb_list_extensions_cookie_t;
  Txcb_list_extensions_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_list_extensions.  }

const
  XCB_LIST_EXTENSIONS = 99;  
{*
 * @brief xcb_list_extensions_request_t
 * }
type
  Pxcb_list_extensions_request_t = ^Txcb_list_extensions_request_t;
  Txcb_list_extensions_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_list_extensions_reply_t
 * }

  Pxcb_list_extensions_reply_t = ^Txcb_list_extensions_reply_t;
  Txcb_list_extensions_reply_t = record
      response_type : Tuint8_t;
      names_len : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad0 : array[0..23] of Tuint8_t;
    end;
{* Opcode for xcb_change_keyboard_mapping.  }

const
  XCB_CHANGE_KEYBOARD_MAPPING = 100;  
{*
 * @brief xcb_change_keyboard_mapping_request_t
 * }
type
  Pxcb_change_keyboard_mapping_request_t = ^Txcb_change_keyboard_mapping_request_t;
  Txcb_change_keyboard_mapping_request_t = record
      major_opcode : Tuint8_t;
      keycode_count : Tuint8_t;
      length : Tuint16_t;
      first_keycode : Txcb_keycode_t;
      keysyms_per_keycode : Tuint8_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_get_keyboard_mapping_cookie_t
 * }

  Pxcb_get_keyboard_mapping_cookie_t = ^Txcb_get_keyboard_mapping_cookie_t;
  Txcb_get_keyboard_mapping_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_keyboard_mapping.  }

const
  XCB_GET_KEYBOARD_MAPPING = 101;  
{*
 * @brief xcb_get_keyboard_mapping_request_t
 * }
type
  Pxcb_get_keyboard_mapping_request_t = ^Txcb_get_keyboard_mapping_request_t;
  Txcb_get_keyboard_mapping_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      first_keycode : Txcb_keycode_t;
      count : Tuint8_t;
    end;
{*
 * @brief xcb_get_keyboard_mapping_reply_t
 * }

  Pxcb_get_keyboard_mapping_reply_t = ^Txcb_get_keyboard_mapping_reply_t;
  Txcb_get_keyboard_mapping_reply_t = record
      response_type : Tuint8_t;
      keysyms_per_keycode : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad0 : array[0..23] of Tuint8_t;
    end;

  Pxcb_kb_t = ^Txcb_kb_t;
  Txcb_kb_t =  Longint;
  Const
    XCB_KB_KEY_CLICK_PERCENT = 1;
    XCB_KB_BELL_PERCENT = 2;
    XCB_KB_BELL_PITCH = 4;
    XCB_KB_BELL_DURATION = 8;
    XCB_KB_LED = 16;
    XCB_KB_LED_MODE = 32;
    XCB_KB_KEY = 64;
    XCB_KB_AUTO_REPEAT_MODE = 128;
;
type
  Pxcb_led_mode_t = ^Txcb_led_mode_t;
  Txcb_led_mode_t =  Longint;
  Const
    XCB_LED_MODE_OFF = 0;
    XCB_LED_MODE_ON = 1;
;
type
  Pxcb_auto_repeat_mode_t = ^Txcb_auto_repeat_mode_t;
  Txcb_auto_repeat_mode_t =  Longint;
  Const
    XCB_AUTO_REPEAT_MODE_OFF = 0;
    XCB_AUTO_REPEAT_MODE_ON = 1;
    XCB_AUTO_REPEAT_MODE_DEFAULT = 2;
;
{*
 * @brief xcb_change_keyboard_control_value_list_t
 * }
type
  Pxcb_change_keyboard_control_value_list_t = ^Txcb_change_keyboard_control_value_list_t;
  Txcb_change_keyboard_control_value_list_t = record
      key_click_percent : Tint32_t;
      bell_percent : Tint32_t;
      bell_pitch : Tint32_t;
      bell_duration : Tint32_t;
      led : Tuint32_t;
      led_mode : Tuint32_t;
      key : Txcb_keycode32_t;
      auto_repeat_mode : Tuint32_t;
    end;
{* Opcode for xcb_change_keyboard_control.  }

const
  XCB_CHANGE_KEYBOARD_CONTROL = 102;  
{*
 * @brief xcb_change_keyboard_control_request_t
 * }
type
  Pxcb_change_keyboard_control_request_t = ^Txcb_change_keyboard_control_request_t;
  Txcb_change_keyboard_control_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      value_mask : Tuint32_t;
    end;
{*
 * @brief xcb_get_keyboard_control_cookie_t
 * }

  Pxcb_get_keyboard_control_cookie_t = ^Txcb_get_keyboard_control_cookie_t;
  Txcb_get_keyboard_control_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_keyboard_control.  }

const
  XCB_GET_KEYBOARD_CONTROL = 103;  
{*
 * @brief xcb_get_keyboard_control_request_t
 * }
type
  Pxcb_get_keyboard_control_request_t = ^Txcb_get_keyboard_control_request_t;
  Txcb_get_keyboard_control_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_get_keyboard_control_reply_t
 * }

  Pxcb_get_keyboard_control_reply_t = ^Txcb_get_keyboard_control_reply_t;
  Txcb_get_keyboard_control_reply_t = record
      response_type : Tuint8_t;
      global_auto_repeat : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      led_mask : Tuint32_t;
      key_click_percent : Tuint8_t;
      bell_percent : Tuint8_t;
      bell_pitch : Tuint16_t;
      bell_duration : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
      auto_repeats : array[0..31] of Tuint8_t;
    end;
{* Opcode for xcb_bell.  }

const
  XCB_BELL = 104;  
{*
 * @brief xcb_bell_request_t
 * }
type
  Pxcb_bell_request_t = ^Txcb_bell_request_t;
  Txcb_bell_request_t = record
      major_opcode : Tuint8_t;
      percent : Tint8_t;
      length : Tuint16_t;
    end;
{* Opcode for xcb_change_pointer_control.  }

const
  XCB_CHANGE_POINTER_CONTROL = 105;  
{*
 * @brief xcb_change_pointer_control_request_t
 * }
type
  Pxcb_change_pointer_control_request_t = ^Txcb_change_pointer_control_request_t;
  Txcb_change_pointer_control_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      acceleration_numerator : Tint16_t;
      acceleration_denominator : Tint16_t;
      threshold : Tint16_t;
      do_acceleration : Tuint8_t;
      do_threshold : Tuint8_t;
    end;
{*
 * @brief xcb_get_pointer_control_cookie_t
 * }

  Pxcb_get_pointer_control_cookie_t = ^Txcb_get_pointer_control_cookie_t;
  Txcb_get_pointer_control_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_pointer_control.  }

const
  XCB_GET_POINTER_CONTROL = 106;  
{*
 * @brief xcb_get_pointer_control_request_t
 * }
type
  Pxcb_get_pointer_control_request_t = ^Txcb_get_pointer_control_request_t;
  Txcb_get_pointer_control_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_get_pointer_control_reply_t
 * }

  Pxcb_get_pointer_control_reply_t = ^Txcb_get_pointer_control_reply_t;
  Txcb_get_pointer_control_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      acceleration_numerator : Tuint16_t;
      acceleration_denominator : Tuint16_t;
      threshold : Tuint16_t;
      pad1 : array[0..17] of Tuint8_t;
    end;

  Pxcb_blanking_t = ^Txcb_blanking_t;
  Txcb_blanking_t =  Longint;
  Const
    XCB_BLANKING_NOT_PREFERRED = 0;
    XCB_BLANKING_PREFERRED = 1;
    XCB_BLANKING_DEFAULT = 2;
;
type
  Pxcb_exposures_t = ^Txcb_exposures_t;
  Txcb_exposures_t =  Longint;
  Const
    XCB_EXPOSURES_NOT_ALLOWED = 0;
    XCB_EXPOSURES_ALLOWED = 1;
    XCB_EXPOSURES_DEFAULT = 2;
;
{* Opcode for xcb_set_screen_saver.  }
  XCB_SET_SCREEN_SAVER = 107;  
{*
 * @brief xcb_set_screen_saver_request_t
 * }
type
  Pxcb_set_screen_saver_request_t = ^Txcb_set_screen_saver_request_t;
  Txcb_set_screen_saver_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      timeout : Tint16_t;
      interval : Tint16_t;
      prefer_blanking : Tuint8_t;
      allow_exposures : Tuint8_t;
    end;
{*
 * @brief xcb_get_screen_saver_cookie_t
 * }

  Pxcb_get_screen_saver_cookie_t = ^Txcb_get_screen_saver_cookie_t;
  Txcb_get_screen_saver_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_screen_saver.  }

const
  XCB_GET_SCREEN_SAVER = 108;  
{*
 * @brief xcb_get_screen_saver_request_t
 * }
type
  Pxcb_get_screen_saver_request_t = ^Txcb_get_screen_saver_request_t;
  Txcb_get_screen_saver_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_get_screen_saver_reply_t
 * }

  Pxcb_get_screen_saver_reply_t = ^Txcb_get_screen_saver_reply_t;
  Txcb_get_screen_saver_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      timeout : Tuint16_t;
      interval : Tuint16_t;
      prefer_blanking : Tuint8_t;
      allow_exposures : Tuint8_t;
      pad1 : array[0..17] of Tuint8_t;
    end;

  Pxcb_host_mode_t = ^Txcb_host_mode_t;
  Txcb_host_mode_t =  Longint;
  Const
    XCB_HOST_MODE_INSERT = 0;
    XCB_HOST_MODE_DELETE = 1;
;
type
  Pxcb_family_t = ^Txcb_family_t;
  Txcb_family_t =  Longint;
  Const
    XCB_FAMILY_INTERNET = 0;
    XCB_FAMILY_DECNET = 1;
    XCB_FAMILY_CHAOS = 2;
    XCB_FAMILY_SERVER_INTERPRETED = 5;
    XCB_FAMILY_INTERNET_6 = 6;
;
{* Opcode for xcb_change_hosts.  }
  XCB_CHANGE_HOSTS = 109;  
{*
 * @brief xcb_change_hosts_request_t
 * }
type
  Pxcb_change_hosts_request_t = ^Txcb_change_hosts_request_t;
  Txcb_change_hosts_request_t = record
      major_opcode : Tuint8_t;
      mode : Tuint8_t;
      length : Tuint16_t;
      family : Tuint8_t;
      pad0 : Tuint8_t;
      address_len : Tuint16_t;
    end;
{*
 * @brief xcb_host_t
 * }

  Pxcb_host_t = ^Txcb_host_t;
  Txcb_host_t = record
      family : Tuint8_t;
      pad0 : Tuint8_t;
      address_len : Tuint16_t;
    end;
{*
 * @brief xcb_host_iterator_t
 * }

  Pxcb_host_iterator_t = ^Txcb_host_iterator_t;
  Txcb_host_iterator_t = record
      data : Pxcb_host_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_list_hosts_cookie_t
 * }

  Pxcb_list_hosts_cookie_t = ^Txcb_list_hosts_cookie_t;
  Txcb_list_hosts_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_list_hosts.  }

const
  XCB_LIST_HOSTS = 110;  
{*
 * @brief xcb_list_hosts_request_t
 * }
type
  Pxcb_list_hosts_request_t = ^Txcb_list_hosts_request_t;
  Txcb_list_hosts_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_list_hosts_reply_t
 * }

  Pxcb_list_hosts_reply_t = ^Txcb_list_hosts_reply_t;
  Txcb_list_hosts_reply_t = record
      response_type : Tuint8_t;
      mode : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      hosts_len : Tuint16_t;
      pad0 : array[0..21] of Tuint8_t;
    end;

  Pxcb_access_control_t = ^Txcb_access_control_t;
  Txcb_access_control_t =  Longint;
  Const
    XCB_ACCESS_CONTROL_DISABLE = 0;
    XCB_ACCESS_CONTROL_ENABLE = 1;
;
{* Opcode for xcb_set_access_control.  }
  XCB_SET_ACCESS_CONTROL = 111;  
{*
 * @brief xcb_set_access_control_request_t
 * }
type
  Pxcb_set_access_control_request_t = ^Txcb_set_access_control_request_t;
  Txcb_set_access_control_request_t = record
      major_opcode : Tuint8_t;
      mode : Tuint8_t;
      length : Tuint16_t;
    end;

  Pxcb_close_down_t = ^Txcb_close_down_t;
  Txcb_close_down_t =  Longint;
  Const
    XCB_CLOSE_DOWN_DESTROY_ALL = 0;
    XCB_CLOSE_DOWN_RETAIN_PERMANENT = 1;
    XCB_CLOSE_DOWN_RETAIN_TEMPORARY = 2;
;
{* Opcode for xcb_set_close_down_mode.  }
  XCB_SET_CLOSE_DOWN_MODE = 112;  
{*
 * @brief xcb_set_close_down_mode_request_t
 * }
type
  Pxcb_set_close_down_mode_request_t = ^Txcb_set_close_down_mode_request_t;
  Txcb_set_close_down_mode_request_t = record
      major_opcode : Tuint8_t;
      mode : Tuint8_t;
      length : Tuint16_t;
    end;

  Pxcb_kill_t = ^Txcb_kill_t;
  Txcb_kill_t =  Longint;
  Const
    XCB_KILL_ALL_TEMPORARY = 0;
;
{* Opcode for xcb_kill_client.  }
  XCB_KILL_CLIENT = 113;  
{*
 * @brief xcb_kill_client_request_t
 * }
type
  Pxcb_kill_client_request_t = ^Txcb_kill_client_request_t;
  Txcb_kill_client_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      resource : Tuint32_t;
    end;
{* Opcode for xcb_rotate_properties.  }

const
  XCB_ROTATE_PROPERTIES = 114;  
{*
 * @brief xcb_rotate_properties_request_t
 * }
type
  Pxcb_rotate_properties_request_t = ^Txcb_rotate_properties_request_t;
  Txcb_rotate_properties_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      atoms_len : Tuint16_t;
      delta : Tint16_t;
    end;

  Pxcb_screen_saver_t = ^Txcb_screen_saver_t;
  Txcb_screen_saver_t =  Longint;
  Const
    XCB_SCREEN_SAVER_RESET = 0;
    XCB_SCREEN_SAVER_ACTIVE = 1;
;
{* Opcode for xcb_force_screen_saver.  }
  XCB_FORCE_SCREEN_SAVER = 115;  
{*
 * @brief xcb_force_screen_saver_request_t
 * }
type
  Pxcb_force_screen_saver_request_t = ^Txcb_force_screen_saver_request_t;
  Txcb_force_screen_saver_request_t = record
      major_opcode : Tuint8_t;
      mode : Tuint8_t;
      length : Tuint16_t;
    end;

  Pxcb_mapping_status_t = ^Txcb_mapping_status_t;
  Txcb_mapping_status_t =  Longint;
  Const
    XCB_MAPPING_STATUS_SUCCESS = 0;
    XCB_MAPPING_STATUS_BUSY = 1;
    XCB_MAPPING_STATUS_FAILURE = 2;
;
{*
 * @brief xcb_set_pointer_mapping_cookie_t
 * }
type
  Pxcb_set_pointer_mapping_cookie_t = ^Txcb_set_pointer_mapping_cookie_t;
  Txcb_set_pointer_mapping_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_set_pointer_mapping.  }

const
  XCB_SET_POINTER_MAPPING = 116;  
{*
 * @brief xcb_set_pointer_mapping_request_t
 * }
type
  Pxcb_set_pointer_mapping_request_t = ^Txcb_set_pointer_mapping_request_t;
  Txcb_set_pointer_mapping_request_t = record
      major_opcode : Tuint8_t;
      map_len : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_set_pointer_mapping_reply_t
 * }

  Pxcb_set_pointer_mapping_reply_t = ^Txcb_set_pointer_mapping_reply_t;
  Txcb_set_pointer_mapping_reply_t = record
      response_type : Tuint8_t;
      status : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
    end;
{*
 * @brief xcb_get_pointer_mapping_cookie_t
 * }

  Pxcb_get_pointer_mapping_cookie_t = ^Txcb_get_pointer_mapping_cookie_t;
  Txcb_get_pointer_mapping_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_pointer_mapping.  }

const
  XCB_GET_POINTER_MAPPING = 117;  
{*
 * @brief xcb_get_pointer_mapping_request_t
 * }
type
  Pxcb_get_pointer_mapping_request_t = ^Txcb_get_pointer_mapping_request_t;
  Txcb_get_pointer_mapping_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_get_pointer_mapping_reply_t
 * }

  Pxcb_get_pointer_mapping_reply_t = ^Txcb_get_pointer_mapping_reply_t;
  Txcb_get_pointer_mapping_reply_t = record
      response_type : Tuint8_t;
      map_len : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad0 : array[0..23] of Tuint8_t;
    end;

  Pxcb_map_index_t = ^Txcb_map_index_t;
  Txcb_map_index_t =  Longint;
  Const
    XCB_MAP_INDEX_SHIFT = 0;
    XCB_MAP_INDEX_LOCK = 1;
    XCB_MAP_INDEX_CONTROL = 2;
    XCB_MAP_INDEX_1 = 3;
    XCB_MAP_INDEX_2 = 4;
    XCB_MAP_INDEX_3 = 5;
    XCB_MAP_INDEX_4 = 6;
    XCB_MAP_INDEX_5 = 7;
;
{*
 * @brief xcb_set_modifier_mapping_cookie_t
 * }
type
  Pxcb_set_modifier_mapping_cookie_t = ^Txcb_set_modifier_mapping_cookie_t;
  Txcb_set_modifier_mapping_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_set_modifier_mapping.  }

const
  XCB_SET_MODIFIER_MAPPING = 118;  
{*
 * @brief xcb_set_modifier_mapping_request_t
 * }
type
  Pxcb_set_modifier_mapping_request_t = ^Txcb_set_modifier_mapping_request_t;
  Txcb_set_modifier_mapping_request_t = record
      major_opcode : Tuint8_t;
      keycodes_per_modifier : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_set_modifier_mapping_reply_t
 * }

  Pxcb_set_modifier_mapping_reply_t = ^Txcb_set_modifier_mapping_reply_t;
  Txcb_set_modifier_mapping_reply_t = record
      response_type : Tuint8_t;
      status : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
    end;
{*
 * @brief xcb_get_modifier_mapping_cookie_t
 * }

  Pxcb_get_modifier_mapping_cookie_t = ^Txcb_get_modifier_mapping_cookie_t;
  Txcb_get_modifier_mapping_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_get_modifier_mapping.  }

const
  XCB_GET_MODIFIER_MAPPING = 119;  
{*
 * @brief xcb_get_modifier_mapping_request_t
 * }
type
  Pxcb_get_modifier_mapping_request_t = ^Txcb_get_modifier_mapping_request_t;
  Txcb_get_modifier_mapping_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_get_modifier_mapping_reply_t
 * }

  Pxcb_get_modifier_mapping_reply_t = ^Txcb_get_modifier_mapping_reply_t;
  Txcb_get_modifier_mapping_reply_t = record
      response_type : Tuint8_t;
      keycodes_per_modifier : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad0 : array[0..23] of Tuint8_t;
    end;
{* Opcode for xcb_no_operation.  }

const
  XCB_NO_OPERATION = 127;  
{*
 * @brief xcb_no_operation_request_t
 * }
type
  Pxcb_no_operation_request_t = ^Txcb_no_operation_request_t;
  Txcb_no_operation_request_t = record
      major_opcode : Tuint8_t;
      pad0 : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_char2b_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_char2b_t)
  }

procedure xcb_char2b_next(i:Pxcb_char2b_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_char2b_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_char2b_end(i:Txcb_char2b_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_window_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_window_t)
  }
procedure xcb_window_next(i:Pxcb_window_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_window_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_window_end(i:Txcb_window_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_pixmap_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_pixmap_t)
  }
procedure xcb_pixmap_next(i:Pxcb_pixmap_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_pixmap_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_pixmap_end(i:Txcb_pixmap_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_cursor_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_cursor_t)
  }
procedure xcb_cursor_next(i:Pxcb_cursor_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_cursor_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_cursor_end(i:Txcb_cursor_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_font_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_font_t)
  }
procedure xcb_font_next(i:Pxcb_font_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_font_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_font_end(i:Txcb_font_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_gcontext_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_gcontext_t)
  }
procedure xcb_gcontext_next(i:Pxcb_gcontext_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_gcontext_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_gcontext_end(i:Txcb_gcontext_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_colormap_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_colormap_t)
  }
procedure xcb_colormap_next(i:Pxcb_colormap_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_colormap_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_colormap_end(i:Txcb_colormap_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_atom_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_atom_t)
  }
procedure xcb_atom_next(i:Pxcb_atom_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_atom_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_atom_end(i:Txcb_atom_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_drawable_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_drawable_t)
  }
procedure xcb_drawable_next(i:Pxcb_drawable_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_drawable_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_drawable_end(i:Txcb_drawable_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_fontable_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_fontable_t)
  }
procedure xcb_fontable_next(i:Pxcb_fontable_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_fontable_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_fontable_end(i:Txcb_fontable_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_bool32_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_bool32_t)
  }
procedure xcb_bool32_next(i:Pxcb_bool32_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_bool32_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_bool32_end(i:Txcb_bool32_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_visualid_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_visualid_t)
  }
procedure xcb_visualid_next(i:Pxcb_visualid_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_visualid_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_visualid_end(i:Txcb_visualid_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_timestamp_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_timestamp_t)
  }
procedure xcb_timestamp_next(i:Pxcb_timestamp_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_timestamp_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_timestamp_end(i:Txcb_timestamp_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_keysym_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_keysym_t)
  }
procedure xcb_keysym_next(i:Pxcb_keysym_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_keysym_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_keysym_end(i:Txcb_keysym_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_keycode_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_keycode_t)
  }
procedure xcb_keycode_next(i:Pxcb_keycode_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_keycode_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_keycode_end(i:Txcb_keycode_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_keycode32_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_keycode32_t)
  }
procedure xcb_keycode32_next(i:Pxcb_keycode32_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_keycode32_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_keycode32_end(i:Txcb_keycode32_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_button_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_button_t)
  }
procedure xcb_button_next(i:Pxcb_button_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_button_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_button_end(i:Txcb_button_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_point_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_point_t)
  }
procedure xcb_point_next(i:Pxcb_point_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_point_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_point_end(i:Txcb_point_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_rectangle_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_rectangle_t)
  }
procedure xcb_rectangle_next(i:Pxcb_rectangle_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_rectangle_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_rectangle_end(i:Txcb_rectangle_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_arc_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_arc_t)
  }
procedure xcb_arc_next(i:Pxcb_arc_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_arc_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_arc_end(i:Txcb_arc_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_format_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_format_t)
  }
procedure xcb_format_next(i:Pxcb_format_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_format_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_format_end(i:Txcb_format_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_visualtype_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_visualtype_t)
  }
procedure xcb_visualtype_next(i:Pxcb_visualtype_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_visualtype_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_visualtype_end(i:Txcb_visualtype_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_depth_sizeof(_buffer:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xcb_depth_visuals(R:Pxcb_depth_t):Pxcb_visualtype_t;cdecl;external;
(* Const before type ignored *)
function xcb_depth_visuals_length(R:Pxcb_depth_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_depth_visuals_iterator(R:Pxcb_depth_t):Txcb_visualtype_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_depth_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_depth_t)
  }
procedure xcb_depth_next(i:Pxcb_depth_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_depth_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_depth_end(i:Txcb_depth_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_screen_sizeof(_buffer:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xcb_screen_allowed_depths_length(R:Pxcb_screen_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_screen_allowed_depths_iterator(R:Pxcb_screen_t):Txcb_depth_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_screen_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_screen_t)
  }
procedure xcb_screen_next(i:Pxcb_screen_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_screen_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_screen_end(i:Txcb_screen_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_setup_request_sizeof(_buffer:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xcb_setup_request_authorization_protocol_name(R:Pxcb_setup_request_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_setup_request_authorization_protocol_name_length(R:Pxcb_setup_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_setup_request_authorization_protocol_name_end(R:Pxcb_setup_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_setup_request_authorization_protocol_data(R:Pxcb_setup_request_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_setup_request_authorization_protocol_data_length(R:Pxcb_setup_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_setup_request_authorization_protocol_data_end(R:Pxcb_setup_request_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_setup_request_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_setup_request_t)
  }
procedure xcb_setup_request_next(i:Pxcb_setup_request_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_setup_request_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_setup_request_end(i:Txcb_setup_request_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_setup_failed_sizeof(_buffer:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xcb_setup_failed_reason(R:Pxcb_setup_failed_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_setup_failed_reason_length(R:Pxcb_setup_failed_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_setup_failed_reason_end(R:Pxcb_setup_failed_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_setup_failed_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_setup_failed_t)
  }
procedure xcb_setup_failed_next(i:Pxcb_setup_failed_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_setup_failed_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_setup_failed_end(i:Txcb_setup_failed_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_setup_authenticate_sizeof(_buffer:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xcb_setup_authenticate_reason(R:Pxcb_setup_authenticate_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_setup_authenticate_reason_length(R:Pxcb_setup_authenticate_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_setup_authenticate_reason_end(R:Pxcb_setup_authenticate_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_setup_authenticate_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_setup_authenticate_t)
  }
procedure xcb_setup_authenticate_next(i:Pxcb_setup_authenticate_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_setup_authenticate_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_setup_authenticate_end(i:Txcb_setup_authenticate_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_setup_sizeof(_buffer:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xcb_setup_vendor(R:Pxcb_setup_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_setup_vendor_length(R:Pxcb_setup_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_setup_vendor_end(R:Pxcb_setup_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_setup_pixmap_formats(R:Pxcb_setup_t):Pxcb_format_t;cdecl;external;
(* Const before type ignored *)
function xcb_setup_pixmap_formats_length(R:Pxcb_setup_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_setup_pixmap_formats_iterator(R:Pxcb_setup_t):Txcb_format_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_setup_roots_length(R:Pxcb_setup_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_setup_roots_iterator(R:Pxcb_setup_t):Txcb_screen_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_setup_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_setup_t)
  }
procedure xcb_setup_next(i:Pxcb_setup_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_setup_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_setup_end(i:Txcb_setup_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_client_message_data_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_client_message_data_t)
  }
procedure xcb_client_message_data_next(i:Pxcb_client_message_data_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_client_message_data_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_client_message_data_end(i:Txcb_client_message_data_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_create_window_value_list_serialize(_buffer:Ppointer; value_mask:Tuint32_t; _aux:Pxcb_create_window_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_create_window_value_list_unpack(_buffer:pointer; value_mask:Tuint32_t; _aux:Pxcb_create_window_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_create_window_value_list_sizeof(_buffer:pointer; value_mask:Tuint32_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_create_window_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief Creates a window
 *
 * @param c The connection
 * @param depth Specifies the new window's depth (TODO: what unit?).
 * \n
 * The special value `XCB_COPY_FROM_PARENT` means the depth is taken from the
 * \a parent window.
 * @param wid The ID with which you will refer to the new window, created by
 * `xcb_generate_id`.
 * @param parent The parent window of the new window.
 * @param x The X coordinate of the new window.
 * @param y The Y coordinate of the new window.
 * @param width The width of the new window.
 * @param height The height of the new window.
 * @param border_width TODO:
 * \n
 * Must be zero if the `class` is `InputOnly` or a `xcb_match_error_t` occurs.
 * @param _class A bitmask of #xcb_window_class_t values.
 * @param _class \n
 * @param visual Specifies the id for the new window's visual.
 * \n
 * The special value `XCB_COPY_FROM_PARENT` means the visual is taken from the
 * \a parent window.
 * @param value_mask A bitmask of #xcb_cw_t values.
 * @return A cookie
 *
 * Creates an unmapped window as child of the specified \a parent window. A
 * CreateNotify event will be generated. The new window is placed on top in the
 * stacking order with respect to siblings.
 * 
 * The coordinate system has the X axis horizontal and the Y axis vertical with
 * the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms
 * of pixels, and coincide with pixel centers. Each window and pixmap has its own
 * coordinate system. For a window, the origin is inside the border at the inside,
 * upper-left corner.
 * 
 * The created window is not yet displayed (mapped), call `xcb_map_window` to
 * display it.
 * 
 * The created window will initially use the same cursor as its parent.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_create_window_checked(c:Pxcb_connection_t; depth:Tuint8_t; wid:Txcb_window_t; parent:Txcb_window_t; x:Tint16_t; 
           y:Tint16_t; width:Tuint16_t; height:Tuint16_t; border_width:Tuint16_t; _class:Tuint16_t; 
           visual:Txcb_visualid_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Creates a window
 *
 * @param c The connection
 * @param depth Specifies the new window's depth (TODO: what unit?).
 * \n
 * The special value `XCB_COPY_FROM_PARENT` means the depth is taken from the
 * \a parent window.
 * @param wid The ID with which you will refer to the new window, created by
 * `xcb_generate_id`.
 * @param parent The parent window of the new window.
 * @param x The X coordinate of the new window.
 * @param y The Y coordinate of the new window.
 * @param width The width of the new window.
 * @param height The height of the new window.
 * @param border_width TODO:
 * \n
 * Must be zero if the `class` is `InputOnly` or a `xcb_match_error_t` occurs.
 * @param _class A bitmask of #xcb_window_class_t values.
 * @param _class \n
 * @param visual Specifies the id for the new window's visual.
 * \n
 * The special value `XCB_COPY_FROM_PARENT` means the visual is taken from the
 * \a parent window.
 * @param value_mask A bitmask of #xcb_cw_t values.
 * @return A cookie
 *
 * Creates an unmapped window as child of the specified \a parent window. A
 * CreateNotify event will be generated. The new window is placed on top in the
 * stacking order with respect to siblings.
 * 
 * The coordinate system has the X axis horizontal and the Y axis vertical with
 * the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms
 * of pixels, and coincide with pixel centers. Each window and pixmap has its own
 * coordinate system. For a window, the origin is inside the border at the inside,
 * upper-left corner.
 * 
 * The created window is not yet displayed (mapped), call `xcb_map_window` to
 * display it.
 * 
 * The created window will initially use the same cursor as its parent.
 *
  }
(* Const before type ignored *)
function xcb_create_window(c:Pxcb_connection_t; depth:Tuint8_t; wid:Txcb_window_t; parent:Txcb_window_t; x:Tint16_t; 
           y:Tint16_t; width:Tuint16_t; height:Tuint16_t; border_width:Tuint16_t; _class:Tuint16_t; 
           visual:Txcb_visualid_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Creates a window
 *
 * @param c The connection
 * @param depth Specifies the new window's depth (TODO: what unit?).
 * \n
 * The special value `XCB_COPY_FROM_PARENT` means the depth is taken from the
 * \a parent window.
 * @param wid The ID with which you will refer to the new window, created by
 * `xcb_generate_id`.
 * @param parent The parent window of the new window.
 * @param x The X coordinate of the new window.
 * @param y The Y coordinate of the new window.
 * @param width The width of the new window.
 * @param height The height of the new window.
 * @param border_width TODO:
 * \n
 * Must be zero if the `class` is `InputOnly` or a `xcb_match_error_t` occurs.
 * @param _class A bitmask of #xcb_window_class_t values.
 * @param _class \n
 * @param visual Specifies the id for the new window's visual.
 * \n
 * The special value `XCB_COPY_FROM_PARENT` means the visual is taken from the
 * \a parent window.
 * @param value_mask A bitmask of #xcb_cw_t values.
 * @return A cookie
 *
 * Creates an unmapped window as child of the specified \a parent window. A
 * CreateNotify event will be generated. The new window is placed on top in the
 * stacking order with respect to siblings.
 * 
 * The coordinate system has the X axis horizontal and the Y axis vertical with
 * the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms
 * of pixels, and coincide with pixel centers. Each window and pixmap has its own
 * coordinate system. For a window, the origin is inside the border at the inside,
 * upper-left corner.
 * 
 * The created window is not yet displayed (mapped), call `xcb_map_window` to
 * display it.
 * 
 * The created window will initially use the same cursor as its parent.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_create_window_aux_checked(c:Pxcb_connection_t; depth:Tuint8_t; wid:Txcb_window_t; parent:Txcb_window_t; x:Tint16_t; 
           y:Tint16_t; width:Tuint16_t; height:Tuint16_t; border_width:Tuint16_t; _class:Tuint16_t; 
           visual:Txcb_visualid_t; value_mask:Tuint32_t; value_list:Pxcb_create_window_value_list_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Creates a window
 *
 * @param c The connection
 * @param depth Specifies the new window's depth (TODO: what unit?).
 * \n
 * The special value `XCB_COPY_FROM_PARENT` means the depth is taken from the
 * \a parent window.
 * @param wid The ID with which you will refer to the new window, created by
 * `xcb_generate_id`.
 * @param parent The parent window of the new window.
 * @param x The X coordinate of the new window.
 * @param y The Y coordinate of the new window.
 * @param width The width of the new window.
 * @param height The height of the new window.
 * @param border_width TODO:
 * \n
 * Must be zero if the `class` is `InputOnly` or a `xcb_match_error_t` occurs.
 * @param _class A bitmask of #xcb_window_class_t values.
 * @param _class \n
 * @param visual Specifies the id for the new window's visual.
 * \n
 * The special value `XCB_COPY_FROM_PARENT` means the visual is taken from the
 * \a parent window.
 * @param value_mask A bitmask of #xcb_cw_t values.
 * @return A cookie
 *
 * Creates an unmapped window as child of the specified \a parent window. A
 * CreateNotify event will be generated. The new window is placed on top in the
 * stacking order with respect to siblings.
 * 
 * The coordinate system has the X axis horizontal and the Y axis vertical with
 * the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms
 * of pixels, and coincide with pixel centers. Each window and pixmap has its own
 * coordinate system. For a window, the origin is inside the border at the inside,
 * upper-left corner.
 * 
 * The created window is not yet displayed (mapped), call `xcb_map_window` to
 * display it.
 * 
 * The created window will initially use the same cursor as its parent.
 *
  }
(* Const before type ignored *)
function xcb_create_window_aux(c:Pxcb_connection_t; depth:Tuint8_t; wid:Txcb_window_t; parent:Txcb_window_t; x:Tint16_t; 
           y:Tint16_t; width:Tuint16_t; height:Tuint16_t; border_width:Tuint16_t; _class:Tuint16_t; 
           visual:Txcb_visualid_t; value_mask:Tuint32_t; value_list:Pxcb_create_window_value_list_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_create_window_value_list(R:Pxcb_create_window_request_t):pointer;cdecl;external;
(* Const before type ignored *)
function xcb_change_window_attributes_value_list_serialize(_buffer:Ppointer; value_mask:Tuint32_t; _aux:Pxcb_change_window_attributes_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_change_window_attributes_value_list_unpack(_buffer:pointer; value_mask:Tuint32_t; _aux:Pxcb_change_window_attributes_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_change_window_attributes_value_list_sizeof(_buffer:pointer; value_mask:Tuint32_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_change_window_attributes_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief change window attributes
 *
 * @param c The connection
 * @param window The window to change.
 * @param value_mask A bitmask of #xcb_cw_t values.
 * @param value_mask \n
 * @param value_list Values for each of the attributes specified in the bitmask \a value_mask. The
 * order has to correspond to the order of possible \a value_mask bits. See the
 * example.
 * @return A cookie
 *
 * Changes the attributes specified by \a value_mask for the specified \a window.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_change_window_attributes_checked(c:Pxcb_connection_t; window:Txcb_window_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief change window attributes
 *
 * @param c The connection
 * @param window The window to change.
 * @param value_mask A bitmask of #xcb_cw_t values.
 * @param value_mask \n
 * @param value_list Values for each of the attributes specified in the bitmask \a value_mask. The
 * order has to correspond to the order of possible \a value_mask bits. See the
 * example.
 * @return A cookie
 *
 * Changes the attributes specified by \a value_mask for the specified \a window.
 *
  }
(* Const before type ignored *)
function xcb_change_window_attributes(c:Pxcb_connection_t; window:Txcb_window_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief change window attributes
 *
 * @param c The connection
 * @param window The window to change.
 * @param value_mask A bitmask of #xcb_cw_t values.
 * @param value_mask \n
 * @param value_list Values for each of the attributes specified in the bitmask \a value_mask. The
 * order has to correspond to the order of possible \a value_mask bits. See the
 * example.
 * @return A cookie
 *
 * Changes the attributes specified by \a value_mask for the specified \a window.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_change_window_attributes_aux_checked(c:Pxcb_connection_t; window:Txcb_window_t; value_mask:Tuint32_t; value_list:Pxcb_change_window_attributes_value_list_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief change window attributes
 *
 * @param c The connection
 * @param window The window to change.
 * @param value_mask A bitmask of #xcb_cw_t values.
 * @param value_mask \n
 * @param value_list Values for each of the attributes specified in the bitmask \a value_mask. The
 * order has to correspond to the order of possible \a value_mask bits. See the
 * example.
 * @return A cookie
 *
 * Changes the attributes specified by \a value_mask for the specified \a window.
 *
  }
(* Const before type ignored *)
function xcb_change_window_attributes_aux(c:Pxcb_connection_t; window:Txcb_window_t; value_mask:Tuint32_t; value_list:Pxcb_change_window_attributes_value_list_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_change_window_attributes_value_list(R:Pxcb_change_window_attributes_request_t):pointer;cdecl;external;
{*
 * @brief Gets window attributes
 *
 * @param c The connection
 * @param window The window to get the attributes from.
 * @return A cookie
 *
 * Gets the current attributes for the specified \a window.
 *
  }
function xcb_get_window_attributes(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_window_attributes_cookie_t;cdecl;external;
{*
 * @brief Gets window attributes
 *
 * @param c The connection
 * @param window The window to get the attributes from.
 * @return A cookie
 *
 * Gets the current attributes for the specified \a window.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_window_attributes_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_window_attributes_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_window_attributes_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_window_attributes_reply(c:Pxcb_connection_t; cookie:Txcb_get_window_attributes_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_window_attributes_reply_t;cdecl;external;
{*
 * @brief Destroys a window
 *
 * @param c The connection
 * @param window The window to destroy.
 * @return A cookie
 *
 * Destroys the specified window and all of its subwindows. A DestroyNotify event
 * is generated for each destroyed window (a DestroyNotify event is first generated
 * for any given window's inferiors). If the window was mapped, it will be
 * automatically unmapped before destroying.
 * 
 * Calling DestroyWindow on the root window will do nothing.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_destroy_window_checked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Destroys a window
 *
 * @param c The connection
 * @param window The window to destroy.
 * @return A cookie
 *
 * Destroys the specified window and all of its subwindows. A DestroyNotify event
 * is generated for each destroyed window (a DestroyNotify event is first generated
 * for any given window's inferiors). If the window was mapped, it will be
 * automatically unmapped before destroying.
 * 
 * Calling DestroyWindow on the root window will do nothing.
 *
  }
function xcb_destroy_window(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_destroy_subwindows_checked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_destroy_subwindows(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Changes a client's save set
 *
 * @param c The connection
 * @param mode A bitmask of #xcb_set_mode_t values.
 * @param mode Insert to add the specified window to the save set or Delete to delete it from the save set.
 * @param window The window to add or delete to/from your save set.
 * @return A cookie
 *
 * TODO: explain what the save set is for.
 * 
 * This function either adds or removes the specified window to the client's (your
 * application's) save set.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_change_save_set_checked(c:Pxcb_connection_t; mode:Tuint8_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Changes a client's save set
 *
 * @param c The connection
 * @param mode A bitmask of #xcb_set_mode_t values.
 * @param mode Insert to add the specified window to the save set or Delete to delete it from the save set.
 * @param window The window to add or delete to/from your save set.
 * @return A cookie
 *
 * TODO: explain what the save set is for.
 * 
 * This function either adds or removes the specified window to the client's (your
 * application's) save set.
 *
  }
function xcb_change_save_set(c:Pxcb_connection_t; mode:Tuint8_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Reparents a window
 *
 * @param c The connection
 * @param window The window to reparent.
 * @param parent The new parent of the window.
 * @param x The X position of the window within its new parent.
 * @param y The Y position of the window within its new parent.
 * @return A cookie
 *
 * Makes the specified window a child of the specified parent window. If the
 * window is mapped, it will automatically be unmapped before reparenting and
 * re-mapped after reparenting. The window is placed in the stacking order on top
 * with respect to sibling windows.
 * 
 * After reparenting, a ReparentNotify event is generated.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_reparent_window_checked(c:Pxcb_connection_t; window:Txcb_window_t; parent:Txcb_window_t; x:Tint16_t; y:Tint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Reparents a window
 *
 * @param c The connection
 * @param window The window to reparent.
 * @param parent The new parent of the window.
 * @param x The X position of the window within its new parent.
 * @param y The Y position of the window within its new parent.
 * @return A cookie
 *
 * Makes the specified window a child of the specified parent window. If the
 * window is mapped, it will automatically be unmapped before reparenting and
 * re-mapped after reparenting. The window is placed in the stacking order on top
 * with respect to sibling windows.
 * 
 * After reparenting, a ReparentNotify event is generated.
 *
  }
function xcb_reparent_window(c:Pxcb_connection_t; window:Txcb_window_t; parent:Txcb_window_t; x:Tint16_t; y:Tint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Makes a window visible
 *
 * @param c The connection
 * @param window The window to make visible.
 * @return A cookie
 *
 * Maps the specified window. This means making the window visible (as long as its
 * parent is visible).
 * 
 * This MapWindow request will be translated to a MapRequest request if a window
 * manager is running. The window manager then decides to either map the window or
 * not. Set the override-redirect window attribute to true if you want to bypass
 * this mechanism.
 * 
 * If the window manager decides to map the window (or if no window manager is
 * running), a MapNotify event is generated.
 * 
 * If the window becomes viewable and no earlier contents for it are remembered,
 * the X server tiles the window with its background. If the window's background
 * is undefined, the existing screen contents are not altered, and the X server
 * generates zero or more Expose events.
 * 
 * If the window type is InputOutput, an Expose event will be generated when the
 * window becomes visible. The normal response to an Expose event should be to
 * repaint the window.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_map_window_checked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Makes a window visible
 *
 * @param c The connection
 * @param window The window to make visible.
 * @return A cookie
 *
 * Maps the specified window. This means making the window visible (as long as its
 * parent is visible).
 * 
 * This MapWindow request will be translated to a MapRequest request if a window
 * manager is running. The window manager then decides to either map the window or
 * not. Set the override-redirect window attribute to true if you want to bypass
 * this mechanism.
 * 
 * If the window manager decides to map the window (or if no window manager is
 * running), a MapNotify event is generated.
 * 
 * If the window becomes viewable and no earlier contents for it are remembered,
 * the X server tiles the window with its background. If the window's background
 * is undefined, the existing screen contents are not altered, and the X server
 * generates zero or more Expose events.
 * 
 * If the window type is InputOutput, an Expose event will be generated when the
 * window becomes visible. The normal response to an Expose event should be to
 * repaint the window.
 *
  }
function xcb_map_window(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_map_subwindows_checked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_map_subwindows(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Makes a window invisible
 *
 * @param c The connection
 * @param window The window to make invisible.
 * @return A cookie
 *
 * Unmaps the specified window. This means making the window invisible (and all
 * its child windows).
 * 
 * Unmapping a window leads to the `UnmapNotify` event being generated. Also,
 * `Expose` events are generated for formerly obscured windows.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_unmap_window_checked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Makes a window invisible
 *
 * @param c The connection
 * @param window The window to make invisible.
 * @return A cookie
 *
 * Unmaps the specified window. This means making the window invisible (and all
 * its child windows).
 * 
 * Unmapping a window leads to the `UnmapNotify` event being generated. Also,
 * `Expose` events are generated for formerly obscured windows.
 *
  }
function xcb_unmap_window(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_unmap_subwindows_checked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_unmap_subwindows(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_configure_window_value_list_serialize(_buffer:Ppointer; value_mask:Tuint16_t; _aux:Pxcb_configure_window_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_configure_window_value_list_unpack(_buffer:pointer; value_mask:Tuint16_t; _aux:Pxcb_configure_window_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_configure_window_value_list_sizeof(_buffer:pointer; value_mask:Tuint16_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_configure_window_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief Configures window attributes
 *
 * @param c The connection
 * @param window The window to configure.
 * @param value_mask Bitmask of attributes to change.
 * @param value_list New values, corresponding to the attributes in value_mask. The order has to
 * correspond to the order of possible \a value_mask bits. See the example.
 * @return A cookie
 *
 * Configures a window's size, position, border width and stacking order.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_configure_window_checked(c:Pxcb_connection_t; window:Txcb_window_t; value_mask:Tuint16_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Configures window attributes
 *
 * @param c The connection
 * @param window The window to configure.
 * @param value_mask Bitmask of attributes to change.
 * @param value_list New values, corresponding to the attributes in value_mask. The order has to
 * correspond to the order of possible \a value_mask bits. See the example.
 * @return A cookie
 *
 * Configures a window's size, position, border width and stacking order.
 *
  }
(* Const before type ignored *)
function xcb_configure_window(c:Pxcb_connection_t; window:Txcb_window_t; value_mask:Tuint16_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Configures window attributes
 *
 * @param c The connection
 * @param window The window to configure.
 * @param value_mask Bitmask of attributes to change.
 * @param value_list New values, corresponding to the attributes in value_mask. The order has to
 * correspond to the order of possible \a value_mask bits. See the example.
 * @return A cookie
 *
 * Configures a window's size, position, border width and stacking order.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_configure_window_aux_checked(c:Pxcb_connection_t; window:Txcb_window_t; value_mask:Tuint16_t; value_list:Pxcb_configure_window_value_list_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Configures window attributes
 *
 * @param c The connection
 * @param window The window to configure.
 * @param value_mask Bitmask of attributes to change.
 * @param value_list New values, corresponding to the attributes in value_mask. The order has to
 * correspond to the order of possible \a value_mask bits. See the example.
 * @return A cookie
 *
 * Configures a window's size, position, border width and stacking order.
 *
  }
(* Const before type ignored *)
function xcb_configure_window_aux(c:Pxcb_connection_t; window:Txcb_window_t; value_mask:Tuint16_t; value_list:Pxcb_configure_window_value_list_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_configure_window_value_list(R:Pxcb_configure_window_request_t):pointer;cdecl;external;
{*
 * @brief Change window stacking order
 *
 * @param c The connection
 * @param direction A bitmask of #xcb_circulate_t values.
 * @param direction \n
 * @param window The window to raise/lower (depending on \a direction).
 * @return A cookie
 *
 * If \a direction is `XCB_CIRCULATE_RAISE_LOWEST`, the lowest mapped child (if
 * any) will be raised to the top of the stack.
 * 
 * If \a direction is `XCB_CIRCULATE_LOWER_HIGHEST`, the highest mapped child will
 * be lowered to the bottom of the stack.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_circulate_window_checked(c:Pxcb_connection_t; direction:Tuint8_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Change window stacking order
 *
 * @param c The connection
 * @param direction A bitmask of #xcb_circulate_t values.
 * @param direction \n
 * @param window The window to raise/lower (depending on \a direction).
 * @return A cookie
 *
 * If \a direction is `XCB_CIRCULATE_RAISE_LOWEST`, the lowest mapped child (if
 * any) will be raised to the top of the stack.
 * 
 * If \a direction is `XCB_CIRCULATE_LOWER_HIGHEST`, the highest mapped child will
 * be lowered to the bottom of the stack.
 *
  }
function xcb_circulate_window(c:Pxcb_connection_t; direction:Tuint8_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Get current window geometry
 *
 * @param c The connection
 * @param drawable The drawable (`Window` or `Pixmap`) of which the geometry will be received.
 * @return A cookie
 *
 * Gets the current geometry of the specified drawable (either `Window` or `Pixmap`).
 *
  }
function xcb_get_geometry(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_get_geometry_cookie_t;cdecl;external;
{*
 * @brief Get current window geometry
 *
 * @param c The connection
 * @param drawable The drawable (`Window` or `Pixmap`) of which the geometry will be received.
 * @return A cookie
 *
 * Gets the current geometry of the specified drawable (either `Window` or `Pixmap`).
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_geometry_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_get_geometry_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_geometry_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_geometry_reply(c:Pxcb_connection_t; cookie:Txcb_get_geometry_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_geometry_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_query_tree_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief query the window tree
 *
 * @param c The connection
 * @param window The \a window to query.
 * @return A cookie
 *
 * Gets the root window ID, parent window ID and list of children windows for the
 * specified \a window. The children are listed in bottom-to-top stacking order.
 *
  }
function xcb_query_tree(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_query_tree_cookie_t;cdecl;external;
{*
 * @brief query the window tree
 *
 * @param c The connection
 * @param window The \a window to query.
 * @return A cookie
 *
 * Gets the root window ID, parent window ID and list of children windows for the
 * specified \a window. The children are listed in bottom-to-top stacking order.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_query_tree_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_query_tree_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_query_tree_children(R:Pxcb_query_tree_reply_t):Pxcb_window_t;cdecl;external;
(* Const before type ignored *)
function xcb_query_tree_children_length(R:Pxcb_query_tree_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_query_tree_children_end(R:Pxcb_query_tree_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_query_tree_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_query_tree_reply(c:Pxcb_connection_t; cookie:Txcb_query_tree_cookie_t; e:PPxcb_generic_error_t):Pxcb_query_tree_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_intern_atom_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief Get atom identifier by name
 *
 * @param c The connection
 * @param only_if_exists Return a valid atom id only if the atom already exists.
 * @param name_len The length of the following \a name.
 * @param name The name of the atom.
 * @return A cookie
 *
 * Retrieves the identifier (xcb_atom_t TODO) for the atom with the specified
 * name. Atoms are used in protocols like EWMH, for example to store window titles
 * (`_NET_WM_NAME` atom) as property of a window.
 * 
 * If \a only_if_exists is 0, the atom will be created if it does not already exist.
 * If \a only_if_exists is 1, `XCB_ATOM_NONE` will be returned if the atom does
 * not yet exist.
 *
  }
(* Const before type ignored *)
function xcb_intern_atom(c:Pxcb_connection_t; only_if_exists:Tuint8_t; name_len:Tuint16_t; name:Pchar):Txcb_intern_atom_cookie_t;cdecl;external;
{*
 * @brief Get atom identifier by name
 *
 * @param c The connection
 * @param only_if_exists Return a valid atom id only if the atom already exists.
 * @param name_len The length of the following \a name.
 * @param name The name of the atom.
 * @return A cookie
 *
 * Retrieves the identifier (xcb_atom_t TODO) for the atom with the specified
 * name. Atoms are used in protocols like EWMH, for example to store window titles
 * (`_NET_WM_NAME` atom) as property of a window.
 * 
 * If \a only_if_exists is 0, the atom will be created if it does not already exist.
 * If \a only_if_exists is 1, `XCB_ATOM_NONE` will be returned if the atom does
 * not yet exist.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
(* Const before type ignored *)
function xcb_intern_atom_unchecked(c:Pxcb_connection_t; only_if_exists:Tuint8_t; name_len:Tuint16_t; name:Pchar):Txcb_intern_atom_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_intern_atom_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_intern_atom_reply(c:Pxcb_connection_t; cookie:Txcb_intern_atom_cookie_t; e:PPxcb_generic_error_t):Pxcb_intern_atom_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_atom_name_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_get_atom_name(c:Pxcb_connection_t; atom:Txcb_atom_t):Txcb_get_atom_name_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_atom_name_unchecked(c:Pxcb_connection_t; atom:Txcb_atom_t):Txcb_get_atom_name_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_atom_name_name(R:Pxcb_get_atom_name_reply_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_get_atom_name_name_length(R:Pxcb_get_atom_name_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_get_atom_name_name_end(R:Pxcb_get_atom_name_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_atom_name_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_atom_name_reply(c:Pxcb_connection_t; cookie:Txcb_get_atom_name_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_atom_name_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_change_property_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief Changes a window property
 *
 * @param c The connection
 * @param mode A bitmask of #xcb_prop_mode_t values.
 * @param mode \n
 * @param window The window whose property you want to change.
 * @param property The property you want to change (an atom).
 * @param type The type of the property you want to change (an atom).
 * @param format Specifies whether the data should be viewed as a list of 8-bit, 16-bit or
 * 32-bit quantities. Possible values are 8, 16 and 32. This information allows
 * the X server to correctly perform byte-swap operations as necessary.
 * @param data_len Specifies the number of elements (see \a format).
 * @param data The property data.
 * @return A cookie
 *
 * Sets or updates a property on the specified \a window. Properties are for
 * example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
 * Protocols such as EWMH also use properties - for example EWMH defines the
 * window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_change_property_checked(c:Pxcb_connection_t; mode:Tuint8_t; window:Txcb_window_t; _property:Txcb_atom_t; _type:Txcb_atom_t; 
           format:Tuint8_t; data_len:Tuint32_t; data:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Changes a window property
 *
 * @param c The connection
 * @param mode A bitmask of #xcb_prop_mode_t values.
 * @param mode \n
 * @param window The window whose property you want to change.
 * @param property The property you want to change (an atom).
 * @param type The type of the property you want to change (an atom).
 * @param format Specifies whether the data should be viewed as a list of 8-bit, 16-bit or
 * 32-bit quantities. Possible values are 8, 16 and 32. This information allows
 * the X server to correctly perform byte-swap operations as necessary.
 * @param data_len Specifies the number of elements (see \a format).
 * @param data The property data.
 * @return A cookie
 *
 * Sets or updates a property on the specified \a window. Properties are for
 * example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
 * Protocols such as EWMH also use properties - for example EWMH defines the
 * window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.
 *
  }
(* Const before type ignored *)
function xcb_change_property(c:Pxcb_connection_t; mode:Tuint8_t; window:Txcb_window_t; _property:Txcb_atom_t; _type:Txcb_atom_t; 
           format:Tuint8_t; data_len:Tuint32_t; data:pointer):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_change_property_data(R:Pxcb_change_property_request_t):pointer;cdecl;external;
(* Const before type ignored *)
function xcb_change_property_data_length(R:Pxcb_change_property_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_change_property_data_end(R:Pxcb_change_property_request_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_delete_property_checked(c:Pxcb_connection_t; window:Txcb_window_t; _property:Txcb_atom_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_delete_property(c:Pxcb_connection_t; window:Txcb_window_t; _property:Txcb_atom_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_property_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief Gets a window property
 *
 * @param c The connection
 * @param _delete Whether the property should actually be deleted. For deleting a property, the
 * specified \a type has to match the actual property type.
 * @param window The window whose property you want to get.
 * @param property The property you want to get (an atom).
 * @param type The type of the property you want to get (an atom).
 * @param long_offset Specifies the offset (in 32-bit multiples) in the specified property where the
 * data is to be retrieved.
 * @param long_length Specifies how many 32-bit multiples of data should be retrieved (e.g. if you
 * set \a long_length to 4, you will receive 16 bytes of data).
 * @return A cookie
 *
 * Gets the specified \a property from the specified \a window. Properties are for
 * example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
 * Protocols such as EWMH also use properties - for example EWMH defines the
 * window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.
 * 
 * TODO: talk about \a type
 * 
 * TODO: talk about `delete`
 * 
 * TODO: talk about the offset/length thing. what's a valid use case?
 *
  }
function xcb_get_property(c:Pxcb_connection_t; _delete:Tuint8_t; window:Txcb_window_t; _property:Txcb_atom_t; _type:Txcb_atom_t; 
           long_offset:Tuint32_t; long_length:Tuint32_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Gets a window property
 *
 * @param c The connection
 * @param _delete Whether the property should actually be deleted. For deleting a property, the
 * specified \a type has to match the actual property type.
 * @param window The window whose property you want to get.
 * @param property The property you want to get (an atom).
 * @param type The type of the property you want to get (an atom).
 * @param long_offset Specifies the offset (in 32-bit multiples) in the specified property where the
 * data is to be retrieved.
 * @param long_length Specifies how many 32-bit multiples of data should be retrieved (e.g. if you
 * set \a long_length to 4, you will receive 16 bytes of data).
 * @return A cookie
 *
 * Gets the specified \a property from the specified \a window. Properties are for
 * example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
 * Protocols such as EWMH also use properties - for example EWMH defines the
 * window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.
 * 
 * TODO: talk about \a type
 * 
 * TODO: talk about `delete`
 * 
 * TODO: talk about the offset/length thing. what's a valid use case?
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_property_unchecked(c:Pxcb_connection_t; _delete:Tuint8_t; window:Txcb_window_t; _property:Txcb_atom_t; _type:Txcb_atom_t; 
           long_offset:Tuint32_t; long_length:Tuint32_t):Txcb_get_property_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_property_value(R:Pxcb_get_property_reply_t):pointer;cdecl;external;
(* Const before type ignored *)
function xcb_get_property_value_length(R:Pxcb_get_property_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_get_property_value_end(R:Pxcb_get_property_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_property_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_property_reply(c:Pxcb_connection_t; cookie:Txcb_get_property_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_property_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_properties_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_list_properties(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_list_properties_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_list_properties_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_list_properties_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_properties_atoms(R:Pxcb_list_properties_reply_t):Pxcb_atom_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_properties_atoms_length(R:Pxcb_list_properties_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_list_properties_atoms_end(R:Pxcb_list_properties_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_list_properties_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_list_properties_reply(c:Pxcb_connection_t; cookie:Txcb_list_properties_cookie_t; e:PPxcb_generic_error_t):Pxcb_list_properties_reply_t;cdecl;external;
{*
 * @brief Sets the owner of a selection
 *
 * @param c The connection
 * @param owner The new owner of the selection.
 * \n
 * The special value `XCB_NONE` means that the selection will have no owner.
 * @param selection The selection.
 * @param time Timestamp to avoid race conditions when running X over the network.
 * \n
 * The selection will not be changed if \a time is earlier than the current
 * last-change time of the \a selection or is later than the current X server time.
 * Otherwise, the last-change time is set to the specified time.
 * \n
 * The special value `XCB_CURRENT_TIME` will be replaced with the current server
 * time.
 * @return A cookie
 *
 * Makes `window` the owner of the selection \a selection and updates the
 * last-change time of the specified selection.
 * 
 * TODO: briefly explain what a selection is.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_set_selection_owner_checked(c:Pxcb_connection_t; owner:Txcb_window_t; selection:Txcb_atom_t; time:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Sets the owner of a selection
 *
 * @param c The connection
 * @param owner The new owner of the selection.
 * \n
 * The special value `XCB_NONE` means that the selection will have no owner.
 * @param selection The selection.
 * @param time Timestamp to avoid race conditions when running X over the network.
 * \n
 * The selection will not be changed if \a time is earlier than the current
 * last-change time of the \a selection or is later than the current X server time.
 * Otherwise, the last-change time is set to the specified time.
 * \n
 * The special value `XCB_CURRENT_TIME` will be replaced with the current server
 * time.
 * @return A cookie
 *
 * Makes `window` the owner of the selection \a selection and updates the
 * last-change time of the specified selection.
 * 
 * TODO: briefly explain what a selection is.
 *
  }
function xcb_set_selection_owner(c:Pxcb_connection_t; owner:Txcb_window_t; selection:Txcb_atom_t; time:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Gets the owner of a selection
 *
 * @param c The connection
 * @param selection The selection.
 * @return A cookie
 *
 * Gets the owner of the specified selection.
 * 
 * TODO: briefly explain what a selection is.
 *
  }
function xcb_get_selection_owner(c:Pxcb_connection_t; selection:Txcb_atom_t):Txcb_get_selection_owner_cookie_t;cdecl;external;
{*
 * @brief Gets the owner of a selection
 *
 * @param c The connection
 * @param selection The selection.
 * @return A cookie
 *
 * Gets the owner of the specified selection.
 * 
 * TODO: briefly explain what a selection is.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_selection_owner_unchecked(c:Pxcb_connection_t; selection:Txcb_atom_t):Txcb_get_selection_owner_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_selection_owner_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_selection_owner_reply(c:Pxcb_connection_t; cookie:Txcb_get_selection_owner_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_selection_owner_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_convert_selection_checked(c:Pxcb_connection_t; requestor:Txcb_window_t; selection:Txcb_atom_t; target:Txcb_atom_t; _property:Txcb_atom_t; 
           time:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_convert_selection(c:Pxcb_connection_t; requestor:Txcb_window_t; selection:Txcb_atom_t; target:Txcb_atom_t; _property:Txcb_atom_t; 
           time:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief send an event
 *
 * @param c The connection
 * @param propagate If \a propagate is true and no clients have selected any event on \a destination,
 * the destination is replaced with the closest ancestor of \a destination for
 * which some client has selected a type in \a event_mask and for which no
 * intervening window has that type in its do-not-propagate-mask. If no such
 * window exists or if the window is an ancestor of the focus window and
 * `InputFocus` was originally specified as the destination, the event is not sent
 * to any clients. Otherwise, the event is reported to every client selecting on
 * the final destination any of the types specified in \a event_mask.
 * @param destination The window to send this event to. Every client which selects any event within
 * \a event_mask on \a destination will get the event.
 * \n
 * The special value `XCB_SEND_EVENT_DEST_POINTER_WINDOW` refers to the window
 * that contains the mouse pointer.
 * \n
 * The special value `XCB_SEND_EVENT_DEST_ITEM_FOCUS` refers to the window which
 * has the keyboard focus.
 * @param event_mask Event_mask for determining which clients should receive the specified event.
 * See \a destination and \a propagate.
 * @param event The event to send to the specified \a destination.
 * @return A cookie
 *
 * Identifies the \a destination window, determines which clients should receive
 * the specified event and ignores any active grabs.
 * 
 * The \a event must be one of the core events or an event defined by an extension,
 * so that the X server can correctly byte-swap the contents as necessary. The
 * contents of \a event are otherwise unaltered and unchecked except for the
 * `send_event` field which is forced to 'true'.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_send_event_checked(c:Pxcb_connection_t; propagate:Tuint8_t; destination:Txcb_window_t; event_mask:Tuint32_t; event:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief send an event
 *
 * @param c The connection
 * @param propagate If \a propagate is true and no clients have selected any event on \a destination,
 * the destination is replaced with the closest ancestor of \a destination for
 * which some client has selected a type in \a event_mask and for which no
 * intervening window has that type in its do-not-propagate-mask. If no such
 * window exists or if the window is an ancestor of the focus window and
 * `InputFocus` was originally specified as the destination, the event is not sent
 * to any clients. Otherwise, the event is reported to every client selecting on
 * the final destination any of the types specified in \a event_mask.
 * @param destination The window to send this event to. Every client which selects any event within
 * \a event_mask on \a destination will get the event.
 * \n
 * The special value `XCB_SEND_EVENT_DEST_POINTER_WINDOW` refers to the window
 * that contains the mouse pointer.
 * \n
 * The special value `XCB_SEND_EVENT_DEST_ITEM_FOCUS` refers to the window which
 * has the keyboard focus.
 * @param event_mask Event_mask for determining which clients should receive the specified event.
 * See \a destination and \a propagate.
 * @param event The event to send to the specified \a destination.
 * @return A cookie
 *
 * Identifies the \a destination window, determines which clients should receive
 * the specified event and ignores any active grabs.
 * 
 * The \a event must be one of the core events or an event defined by an extension,
 * so that the X server can correctly byte-swap the contents as necessary. The
 * contents of \a event are otherwise unaltered and unchecked except for the
 * `send_event` field which is forced to 'true'.
 *
  }
(* Const before type ignored *)
function xcb_send_event(c:Pxcb_connection_t; propagate:Tuint8_t; destination:Txcb_window_t; event_mask:Tuint32_t; event:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Grab the pointer
 *
 * @param c The connection
 * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
 * reported to the \a grab_window.
 * @param grab_window Specifies the window on which the pointer should be grabbed.
 * @param event_mask Specifies which pointer events are reported to the client.
 * \n
 * TODO: which values?
 * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
 * @param pointer_mode \n
 * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
 * @param keyboard_mode \n
 * @param confine_to Specifies the window to confine the pointer in (the user will not be able to
 * move the pointer out of that window).
 * \n
 * The special value `XCB_NONE` means don't confine the pointer.
 * @param cursor Specifies the cursor that should be displayed or `XCB_NONE` to not change the
 * cursor.
 * @param time The time argument allows you to avoid certain circumstances that come up if
 * applications take a long time to respond or if there are long network delays.
 * Consider a situation where you have two applications, both of which normally
 * grab the pointer when clicked on. If both applications specify the timestamp
 * from the event, the second application may wake up faster and successfully grab
 * the pointer before the first application. The first application then will get
 * an indication that the other application grabbed the pointer before its request
 * was processed.
 * \n
 * The special value `XCB_CURRENT_TIME` will be replaced with the current server
 * time.
 * @return A cookie
 *
 * Actively grabs control of the pointer. Further pointer events are reported only to the grabbing client. Overrides any active pointer grab by this client.
 *
  }
function xcb_grab_pointer(c:Pxcb_connection_t; owner_events:Tuint8_t; grab_window:Txcb_window_t; event_mask:Tuint16_t; pointer_mode:Tuint8_t; 
           keyboard_mode:Tuint8_t; confine_to:Txcb_window_t; cursor:Txcb_cursor_t; time:Txcb_timestamp_t):Txcb_grab_pointer_cookie_t;cdecl;external;
{*
 * @brief Grab the pointer
 *
 * @param c The connection
 * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
 * reported to the \a grab_window.
 * @param grab_window Specifies the window on which the pointer should be grabbed.
 * @param event_mask Specifies which pointer events are reported to the client.
 * \n
 * TODO: which values?
 * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
 * @param pointer_mode \n
 * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
 * @param keyboard_mode \n
 * @param confine_to Specifies the window to confine the pointer in (the user will not be able to
 * move the pointer out of that window).
 * \n
 * The special value `XCB_NONE` means don't confine the pointer.
 * @param cursor Specifies the cursor that should be displayed or `XCB_NONE` to not change the
 * cursor.
 * @param time The time argument allows you to avoid certain circumstances that come up if
 * applications take a long time to respond or if there are long network delays.
 * Consider a situation where you have two applications, both of which normally
 * grab the pointer when clicked on. If both applications specify the timestamp
 * from the event, the second application may wake up faster and successfully grab
 * the pointer before the first application. The first application then will get
 * an indication that the other application grabbed the pointer before its request
 * was processed.
 * \n
 * The special value `XCB_CURRENT_TIME` will be replaced with the current server
 * time.
 * @return A cookie
 *
 * Actively grabs control of the pointer. Further pointer events are reported only to the grabbing client. Overrides any active pointer grab by this client.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_grab_pointer_unchecked(c:Pxcb_connection_t; owner_events:Tuint8_t; grab_window:Txcb_window_t; event_mask:Tuint16_t; pointer_mode:Tuint8_t; 
           keyboard_mode:Tuint8_t; confine_to:Txcb_window_t; cursor:Txcb_cursor_t; time:Txcb_timestamp_t):Txcb_grab_pointer_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_grab_pointer_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_grab_pointer_reply(c:Pxcb_connection_t; cookie:Txcb_grab_pointer_cookie_t; e:PPxcb_generic_error_t):Pxcb_grab_pointer_reply_t;cdecl;external;
{*
 * @brief release the pointer
 *
 * @param c The connection
 * @param time Timestamp to avoid race conditions when running X over the network.
 * \n
 * The pointer will not be released if \a time is earlier than the
 * last-pointer-grab time or later than the current X server time.
 * @return A cookie
 *
 * Releases the pointer and any queued events if you actively grabbed the pointer
 * before using `xcb_grab_pointer`, `xcb_grab_button` or within a normal button
 * press.
 * 
 * EnterNotify and LeaveNotify events are generated.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_ungrab_pointer_checked(c:Pxcb_connection_t; time:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief release the pointer
 *
 * @param c The connection
 * @param time Timestamp to avoid race conditions when running X over the network.
 * \n
 * The pointer will not be released if \a time is earlier than the
 * last-pointer-grab time or later than the current X server time.
 * @return A cookie
 *
 * Releases the pointer and any queued events if you actively grabbed the pointer
 * before using `xcb_grab_pointer`, `xcb_grab_button` or within a normal button
 * press.
 * 
 * EnterNotify and LeaveNotify events are generated.
 *
  }
function xcb_ungrab_pointer(c:Pxcb_connection_t; time:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Grab pointer button(s)
 *
 * @param c The connection
 * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
 * reported to the \a grab_window.
 * @param grab_window Specifies the window on which the pointer should be grabbed.
 * @param event_mask Specifies which pointer events are reported to the client.
 * \n
 * TODO: which values?
 * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
 * @param pointer_mode \n
 * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
 * @param keyboard_mode \n
 * @param confine_to Specifies the window to confine the pointer in (the user will not be able to
 * move the pointer out of that window).
 * \n
 * The special value `XCB_NONE` means don't confine the pointer.
 * @param cursor Specifies the cursor that should be displayed or `XCB_NONE` to not change the
 * cursor.
 * @param button A bitmask of #xcb_button_index_t values.
 * @param button \n
 * @param modifiers The modifiers to grab.
 * \n
 * Using the special value `XCB_MOD_MASK_ANY` means grab the pointer with all
 * possible modifier combinations.
 * @return A cookie
 *
 * This request establishes a passive grab. The pointer is actively grabbed as
 * described in GrabPointer, the last-pointer-grab time is set to the time at
 * which the button was pressed (as transmitted in the ButtonPress event), and the
 * ButtonPress event is reported if all of the following conditions are true:
 * 
 * The pointer is not grabbed and the specified button is logically pressed when
 * the specified modifier keys are logically down, and no other buttons or
 * modifier keys are logically down.
 * 
 * The grab-window contains the pointer.
 * 
 * The confine-to window (if any) is viewable.
 * 
 * A passive grab on the same button/key combination does not exist on any
 * ancestor of grab-window.
 * 
 * The interpretation of the remaining arguments is the same as for GrabPointer.
 * The active grab is terminated automatically when the logical state of the
 * pointer has all buttons released, independent of the logical state of modifier
 * keys. Note that the logical state of a device (as seen by means of the
 * protocol) may lag the physical state if device event processing is frozen. This
 * request overrides all previous passive grabs by the same client on the same
 * button/key combinations on the same window. A modifier of AnyModifier is
 * equivalent to issuing the request for all possible modifier combinations
 * (including the combination of no modifiers). It is not required that all
 * specified modifiers have currently assigned keycodes. A button of AnyButton is
 * equivalent to issuing the request for all possible buttons. Otherwise, it is
 * not required that the button specified currently be assigned to a physical
 * button.
 * 
 * An Access error is generated if some other client has already issued a
 * GrabButton request with the same button/key combination on the same window.
 * When using AnyModifier or AnyButton, the request fails completely (no grabs are
 * established), and an Access error is generated if there is a conflicting grab
 * for any combination. The request has no effect on an active grab.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_grab_button_checked(c:Pxcb_connection_t; owner_events:Tuint8_t; grab_window:Txcb_window_t; event_mask:Tuint16_t; pointer_mode:Tuint8_t; 
           keyboard_mode:Tuint8_t; confine_to:Txcb_window_t; cursor:Txcb_cursor_t; button:Tuint8_t; modifiers:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Grab pointer button(s)
 *
 * @param c The connection
 * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
 * reported to the \a grab_window.
 * @param grab_window Specifies the window on which the pointer should be grabbed.
 * @param event_mask Specifies which pointer events are reported to the client.
 * \n
 * TODO: which values?
 * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
 * @param pointer_mode \n
 * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
 * @param keyboard_mode \n
 * @param confine_to Specifies the window to confine the pointer in (the user will not be able to
 * move the pointer out of that window).
 * \n
 * The special value `XCB_NONE` means don't confine the pointer.
 * @param cursor Specifies the cursor that should be displayed or `XCB_NONE` to not change the
 * cursor.
 * @param button A bitmask of #xcb_button_index_t values.
 * @param button \n
 * @param modifiers The modifiers to grab.
 * \n
 * Using the special value `XCB_MOD_MASK_ANY` means grab the pointer with all
 * possible modifier combinations.
 * @return A cookie
 *
 * This request establishes a passive grab. The pointer is actively grabbed as
 * described in GrabPointer, the last-pointer-grab time is set to the time at
 * which the button was pressed (as transmitted in the ButtonPress event), and the
 * ButtonPress event is reported if all of the following conditions are true:
 * 
 * The pointer is not grabbed and the specified button is logically pressed when
 * the specified modifier keys are logically down, and no other buttons or
 * modifier keys are logically down.
 * 
 * The grab-window contains the pointer.
 * 
 * The confine-to window (if any) is viewable.
 * 
 * A passive grab on the same button/key combination does not exist on any
 * ancestor of grab-window.
 * 
 * The interpretation of the remaining arguments is the same as for GrabPointer.
 * The active grab is terminated automatically when the logical state of the
 * pointer has all buttons released, independent of the logical state of modifier
 * keys. Note that the logical state of a device (as seen by means of the
 * protocol) may lag the physical state if device event processing is frozen. This
 * request overrides all previous passive grabs by the same client on the same
 * button/key combinations on the same window. A modifier of AnyModifier is
 * equivalent to issuing the request for all possible modifier combinations
 * (including the combination of no modifiers). It is not required that all
 * specified modifiers have currently assigned keycodes. A button of AnyButton is
 * equivalent to issuing the request for all possible buttons. Otherwise, it is
 * not required that the button specified currently be assigned to a physical
 * button.
 * 
 * An Access error is generated if some other client has already issued a
 * GrabButton request with the same button/key combination on the same window.
 * When using AnyModifier or AnyButton, the request fails completely (no grabs are
 * established), and an Access error is generated if there is a conflicting grab
 * for any combination. The request has no effect on an active grab.
 *
  }
function xcb_grab_button(c:Pxcb_connection_t; owner_events:Tuint8_t; grab_window:Txcb_window_t; event_mask:Tuint16_t; pointer_mode:Tuint8_t; 
           keyboard_mode:Tuint8_t; confine_to:Txcb_window_t; cursor:Txcb_cursor_t; button:Tuint8_t; modifiers:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_ungrab_button_checked(c:Pxcb_connection_t; button:Tuint8_t; grab_window:Txcb_window_t; modifiers:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_ungrab_button(c:Pxcb_connection_t; button:Tuint8_t; grab_window:Txcb_window_t; modifiers:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_change_active_pointer_grab_checked(c:Pxcb_connection_t; cursor:Txcb_cursor_t; time:Txcb_timestamp_t; event_mask:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_change_active_pointer_grab(c:Pxcb_connection_t; cursor:Txcb_cursor_t; time:Txcb_timestamp_t; event_mask:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Grab the keyboard
 *
 * @param c The connection
 * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
 * reported to the \a grab_window.
 * @param grab_window Specifies the window on which the pointer should be grabbed.
 * @param time Timestamp to avoid race conditions when running X over the network.
 * \n
 * The special value `XCB_CURRENT_TIME` will be replaced with the current server
 * time.
 * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
 * @param pointer_mode \n
 * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
 * @param keyboard_mode \n
 * @return A cookie
 *
 * Actively grabs control of the keyboard and generates FocusIn and FocusOut
 * events. Further key events are reported only to the grabbing client.
 * 
 * Any active keyboard grab by this client is overridden. If the keyboard is
 * actively grabbed by some other client, `AlreadyGrabbed` is returned. If
 * \a grab_window is not viewable, `GrabNotViewable` is returned. If the keyboard
 * is frozen by an active grab of another client, `GrabFrozen` is returned. If the
 * specified \a time is earlier than the last-keyboard-grab time or later than the
 * current X server time, `GrabInvalidTime` is returned. Otherwise, the
 * last-keyboard-grab time is set to the specified time.
 *
  }
function xcb_grab_keyboard(c:Pxcb_connection_t; owner_events:Tuint8_t; grab_window:Txcb_window_t; time:Txcb_timestamp_t; pointer_mode:Tuint8_t; 
           keyboard_mode:Tuint8_t):Txcb_grab_keyboard_cookie_t;cdecl;external;
{*
 * @brief Grab the keyboard
 *
 * @param c The connection
 * @param owner_events If 1, the \a grab_window will still get the pointer events. If 0, events are not
 * reported to the \a grab_window.
 * @param grab_window Specifies the window on which the pointer should be grabbed.
 * @param time Timestamp to avoid race conditions when running X over the network.
 * \n
 * The special value `XCB_CURRENT_TIME` will be replaced with the current server
 * time.
 * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
 * @param pointer_mode \n
 * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
 * @param keyboard_mode \n
 * @return A cookie
 *
 * Actively grabs control of the keyboard and generates FocusIn and FocusOut
 * events. Further key events are reported only to the grabbing client.
 * 
 * Any active keyboard grab by this client is overridden. If the keyboard is
 * actively grabbed by some other client, `AlreadyGrabbed` is returned. If
 * \a grab_window is not viewable, `GrabNotViewable` is returned. If the keyboard
 * is frozen by an active grab of another client, `GrabFrozen` is returned. If the
 * specified \a time is earlier than the last-keyboard-grab time or later than the
 * current X server time, `GrabInvalidTime` is returned. Otherwise, the
 * last-keyboard-grab time is set to the specified time.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_grab_keyboard_unchecked(c:Pxcb_connection_t; owner_events:Tuint8_t; grab_window:Txcb_window_t; time:Txcb_timestamp_t; pointer_mode:Tuint8_t; 
           keyboard_mode:Tuint8_t):Txcb_grab_keyboard_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_grab_keyboard_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_grab_keyboard_reply(c:Pxcb_connection_t; cookie:Txcb_grab_keyboard_cookie_t; e:PPxcb_generic_error_t):Pxcb_grab_keyboard_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_ungrab_keyboard_checked(c:Pxcb_connection_t; time:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_ungrab_keyboard(c:Pxcb_connection_t; time:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Grab keyboard key(s)
 *
 * @param c The connection
 * @param owner_events If 1, the \a grab_window will still get the key events. If 0, events are not
 * reported to the \a grab_window.
 * @param grab_window Specifies the window on which the key should be grabbed.
 * @param modifiers The modifiers to grab.
 * \n
 * Using the special value `XCB_MOD_MASK_ANY` means grab the key with all
 * possible modifier combinations.
 * @param key The keycode of the key to grab.
 * \n
 * The special value `XCB_GRAB_ANY` means grab any key.
 * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
 * @param pointer_mode \n
 * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
 * @param keyboard_mode \n
 * @return A cookie
 *
 * Establishes a passive grab on the keyboard. In the future, the keyboard is
 * actively grabbed (as for `GrabKeyboard`), the last-keyboard-grab time is set to
 * the time at which the key was pressed (as transmitted in the KeyPress event),
 * and the KeyPress event is reported if all of the following conditions are true:
 * 
 * The keyboard is not grabbed and the specified key (which can itself be a
 * modifier key) is logically pressed when the specified modifier keys are
 * logically down, and no other modifier keys are logically down.
 * 
 * Either the grab_window is an ancestor of (or is) the focus window, or the
 * grab_window is a descendant of the focus window and contains the pointer.
 * 
 * A passive grab on the same key combination does not exist on any ancestor of
 * grab_window.
 * 
 * The interpretation of the remaining arguments is as for XGrabKeyboard.  The active grab is terminated
 * automatically when the logical state of the keyboard has the specified key released (independent of the
 * logical state of the modifier keys), at which point a KeyRelease event is reported to the grabbing window.
 * 
 * Note that the logical state of a device (as seen by client applications) may lag the physical state if
 * device event processing is frozen.
 * 
 * A modifiers argument of AnyModifier is equivalent to issuing the request for all possible modifier combinations (including the combination of no modifiers).  It is not required that all modifiers specified
 * have currently assigned KeyCodes.  A keycode argument of AnyKey is equivalent to issuing the request for
 * all possible KeyCodes.  Otherwise, the specified keycode must be in the range specified by min_keycode
 * and max_keycode in the connection setup, or a BadValue error results.
 * 
 * If some other client has issued a XGrabKey with the same key combination on the same window, a BadAccess
 * error results.  When using AnyModifier or AnyKey, the request fails completely, and a BadAccess error
 * results (no grabs are established) if there is a conflicting grab for any combination.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_grab_key_checked(c:Pxcb_connection_t; owner_events:Tuint8_t; grab_window:Txcb_window_t; modifiers:Tuint16_t; key:Txcb_keycode_t; 
           pointer_mode:Tuint8_t; keyboard_mode:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Grab keyboard key(s)
 *
 * @param c The connection
 * @param owner_events If 1, the \a grab_window will still get the key events. If 0, events are not
 * reported to the \a grab_window.
 * @param grab_window Specifies the window on which the key should be grabbed.
 * @param modifiers The modifiers to grab.
 * \n
 * Using the special value `XCB_MOD_MASK_ANY` means grab the key with all
 * possible modifier combinations.
 * @param key The keycode of the key to grab.
 * \n
 * The special value `XCB_GRAB_ANY` means grab any key.
 * @param pointer_mode A bitmask of #xcb_grab_mode_t values.
 * @param pointer_mode \n
 * @param keyboard_mode A bitmask of #xcb_grab_mode_t values.
 * @param keyboard_mode \n
 * @return A cookie
 *
 * Establishes a passive grab on the keyboard. In the future, the keyboard is
 * actively grabbed (as for `GrabKeyboard`), the last-keyboard-grab time is set to
 * the time at which the key was pressed (as transmitted in the KeyPress event),
 * and the KeyPress event is reported if all of the following conditions are true:
 * 
 * The keyboard is not grabbed and the specified key (which can itself be a
 * modifier key) is logically pressed when the specified modifier keys are
 * logically down, and no other modifier keys are logically down.
 * 
 * Either the grab_window is an ancestor of (or is) the focus window, or the
 * grab_window is a descendant of the focus window and contains the pointer.
 * 
 * A passive grab on the same key combination does not exist on any ancestor of
 * grab_window.
 * 
 * The interpretation of the remaining arguments is as for XGrabKeyboard.  The active grab is terminated
 * automatically when the logical state of the keyboard has the specified key released (independent of the
 * logical state of the modifier keys), at which point a KeyRelease event is reported to the grabbing window.
 * 
 * Note that the logical state of a device (as seen by client applications) may lag the physical state if
 * device event processing is frozen.
 * 
 * A modifiers argument of AnyModifier is equivalent to issuing the request for all possible modifier combinations (including the combination of no modifiers).  It is not required that all modifiers specified
 * have currently assigned KeyCodes.  A keycode argument of AnyKey is equivalent to issuing the request for
 * all possible KeyCodes.  Otherwise, the specified keycode must be in the range specified by min_keycode
 * and max_keycode in the connection setup, or a BadValue error results.
 * 
 * If some other client has issued a XGrabKey with the same key combination on the same window, a BadAccess
 * error results.  When using AnyModifier or AnyKey, the request fails completely, and a BadAccess error
 * results (no grabs are established) if there is a conflicting grab for any combination.
 *
  }
function xcb_grab_key(c:Pxcb_connection_t; owner_events:Tuint8_t; grab_window:Txcb_window_t; modifiers:Tuint16_t; key:Txcb_keycode_t; 
           pointer_mode:Tuint8_t; keyboard_mode:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief release a key combination
 *
 * @param c The connection
 * @param key The keycode of the specified key combination.
 * \n
 * Using the special value `XCB_GRAB_ANY` means releasing all possible key codes.
 * @param grab_window The window on which the grabbed key combination will be released.
 * @param modifiers The modifiers of the specified key combination.
 * \n
 * Using the special value `XCB_MOD_MASK_ANY` means releasing the key combination
 * with every possible modifier combination.
 * @return A cookie
 *
 * Releases the key combination on \a grab_window if you grabbed it using
 * `xcb_grab_key` before.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_ungrab_key_checked(c:Pxcb_connection_t; key:Txcb_keycode_t; grab_window:Txcb_window_t; modifiers:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief release a key combination
 *
 * @param c The connection
 * @param key The keycode of the specified key combination.
 * \n
 * Using the special value `XCB_GRAB_ANY` means releasing all possible key codes.
 * @param grab_window The window on which the grabbed key combination will be released.
 * @param modifiers The modifiers of the specified key combination.
 * \n
 * Using the special value `XCB_MOD_MASK_ANY` means releasing the key combination
 * with every possible modifier combination.
 * @return A cookie
 *
 * Releases the key combination on \a grab_window if you grabbed it using
 * `xcb_grab_key` before.
 *
  }
function xcb_ungrab_key(c:Pxcb_connection_t; key:Txcb_keycode_t; grab_window:Txcb_window_t; modifiers:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief release queued events
 *
 * @param c The connection
 * @param mode A bitmask of #xcb_allow_t values.
 * @param mode \n
 * @param time Timestamp to avoid race conditions when running X over the network.
 * \n
 * The special value `XCB_CURRENT_TIME` will be replaced with the current server
 * time.
 * @return A cookie
 *
 * Releases queued events if the client has caused a device (pointer/keyboard) to
 * freeze due to grabbing it actively. This request has no effect if \a time is
 * earlier than the last-grab time of the most recent active grab for this client
 * or if \a time is later than the current X server time.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_allow_events_checked(c:Pxcb_connection_t; mode:Tuint8_t; time:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief release queued events
 *
 * @param c The connection
 * @param mode A bitmask of #xcb_allow_t values.
 * @param mode \n
 * @param time Timestamp to avoid race conditions when running X over the network.
 * \n
 * The special value `XCB_CURRENT_TIME` will be replaced with the current server
 * time.
 * @return A cookie
 *
 * Releases queued events if the client has caused a device (pointer/keyboard) to
 * freeze due to grabbing it actively. This request has no effect if \a time is
 * earlier than the last-grab time of the most recent active grab for this client
 * or if \a time is later than the current X server time.
 *
  }
function xcb_allow_events(c:Pxcb_connection_t; mode:Tuint8_t; time:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_grab_server_checked(c:Pxcb_connection_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_grab_server(c:Pxcb_connection_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_ungrab_server_checked(c:Pxcb_connection_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_ungrab_server(c:Pxcb_connection_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief get pointer coordinates
 *
 * @param c The connection
 * @param window A window to check if the pointer is on the same screen as \a window (see the
 * `same_screen` field in the reply).
 * @return A cookie
 *
 * Gets the root window the pointer is logically on and the pointer coordinates
 * relative to the root window's origin.
 *
  }
function xcb_query_pointer(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_query_pointer_cookie_t;cdecl;external;
{*
 * @brief get pointer coordinates
 *
 * @param c The connection
 * @param window A window to check if the pointer is on the same screen as \a window (see the
 * `same_screen` field in the reply).
 * @return A cookie
 *
 * Gets the root window the pointer is logically on and the pointer coordinates
 * relative to the root window's origin.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_query_pointer_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_query_pointer_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_query_pointer_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_query_pointer_reply(c:Pxcb_connection_t; cookie:Txcb_query_pointer_cookie_t; e:PPxcb_generic_error_t):Pxcb_query_pointer_reply_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_timecoord_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_timecoord_t)
  }
procedure xcb_timecoord_next(i:Pxcb_timecoord_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_timecoord_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_timecoord_end(i:Txcb_timecoord_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_motion_events_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_get_motion_events(c:Pxcb_connection_t; window:Txcb_window_t; start:Txcb_timestamp_t; stop:Txcb_timestamp_t):Txcb_get_motion_events_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_motion_events_unchecked(c:Pxcb_connection_t; window:Txcb_window_t; start:Txcb_timestamp_t; stop:Txcb_timestamp_t):Txcb_get_motion_events_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_motion_events_events(R:Pxcb_get_motion_events_reply_t):Pxcb_timecoord_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_motion_events_events_length(R:Pxcb_get_motion_events_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_get_motion_events_events_iterator(R:Pxcb_get_motion_events_reply_t):Txcb_timecoord_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_motion_events_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_motion_events_reply(c:Pxcb_connection_t; cookie:Txcb_get_motion_events_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_motion_events_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_translate_coordinates(c:Pxcb_connection_t; src_window:Txcb_window_t; dst_window:Txcb_window_t; src_x:Tint16_t; src_y:Tint16_t):Txcb_translate_coordinates_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_translate_coordinates_unchecked(c:Pxcb_connection_t; src_window:Txcb_window_t; dst_window:Txcb_window_t; src_x:Tint16_t; src_y:Tint16_t):Txcb_translate_coordinates_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_translate_coordinates_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_translate_coordinates_reply(c:Pxcb_connection_t; cookie:Txcb_translate_coordinates_cookie_t; e:PPxcb_generic_error_t):Pxcb_translate_coordinates_reply_t;cdecl;external;
{*
 * @brief move mouse pointer
 *
 * @param c The connection
 * @param src_window If \a src_window is not `XCB_NONE` (TODO), the move will only take place if the
 * pointer is inside \a src_window and within the rectangle specified by (\a src_x,
 * \a src_y, \a src_width, \a src_height). The rectangle coordinates are relative to
 * \a src_window.
 * @param dst_window If \a dst_window is not `XCB_NONE` (TODO), the pointer will be moved to the
 * offsets (\a dst_x, \a dst_y) relative to \a dst_window. If \a dst_window is
 * `XCB_NONE` (TODO), the pointer will be moved by the offsets (\a dst_x, \a dst_y)
 * relative to the current position of the pointer.
 * @return A cookie
 *
 * Moves the mouse pointer to the specified position.
 * 
 * If \a src_window is not `XCB_NONE` (TODO), the move will only take place if the
 * pointer is inside \a src_window and within the rectangle specified by (\a src_x,
 * \a src_y, \a src_width, \a src_height). The rectangle coordinates are relative to
 * \a src_window.
 * 
 * If \a dst_window is not `XCB_NONE` (TODO), the pointer will be moved to the
 * offsets (\a dst_x, \a dst_y) relative to \a dst_window. If \a dst_window is
 * `XCB_NONE` (TODO), the pointer will be moved by the offsets (\a dst_x, \a dst_y)
 * relative to the current position of the pointer.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_warp_pointer_checked(c:Pxcb_connection_t; src_window:Txcb_window_t; dst_window:Txcb_window_t; src_x:Tint16_t; src_y:Tint16_t; 
           src_width:Tuint16_t; src_height:Tuint16_t; dst_x:Tint16_t; dst_y:Tint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief move mouse pointer
 *
 * @param c The connection
 * @param src_window If \a src_window is not `XCB_NONE` (TODO), the move will only take place if the
 * pointer is inside \a src_window and within the rectangle specified by (\a src_x,
 * \a src_y, \a src_width, \a src_height). The rectangle coordinates are relative to
 * \a src_window.
 * @param dst_window If \a dst_window is not `XCB_NONE` (TODO), the pointer will be moved to the
 * offsets (\a dst_x, \a dst_y) relative to \a dst_window. If \a dst_window is
 * `XCB_NONE` (TODO), the pointer will be moved by the offsets (\a dst_x, \a dst_y)
 * relative to the current position of the pointer.
 * @return A cookie
 *
 * Moves the mouse pointer to the specified position.
 * 
 * If \a src_window is not `XCB_NONE` (TODO), the move will only take place if the
 * pointer is inside \a src_window and within the rectangle specified by (\a src_x,
 * \a src_y, \a src_width, \a src_height). The rectangle coordinates are relative to
 * \a src_window.
 * 
 * If \a dst_window is not `XCB_NONE` (TODO), the pointer will be moved to the
 * offsets (\a dst_x, \a dst_y) relative to \a dst_window. If \a dst_window is
 * `XCB_NONE` (TODO), the pointer will be moved by the offsets (\a dst_x, \a dst_y)
 * relative to the current position of the pointer.
 *
  }
function xcb_warp_pointer(c:Pxcb_connection_t; src_window:Txcb_window_t; dst_window:Txcb_window_t; src_x:Tint16_t; src_y:Tint16_t; 
           src_width:Tuint16_t; src_height:Tuint16_t; dst_x:Tint16_t; dst_y:Tint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Sets input focus
 *
 * @param c The connection
 * @param revert_to A bitmask of #xcb_input_focus_t values.
 * @param revert_to Specifies what happens when the \a focus window becomes unviewable (if \a focus
 * is neither `XCB_NONE` nor `XCB_POINTER_ROOT`).
 * @param focus The window to focus. All keyboard events will be reported to this window. The
 * window must be viewable (TODO), or a `xcb_match_error_t` occurs (TODO).
 * \n
 * If \a focus is `XCB_NONE` (TODO), all keyboard events are
 * discarded until a new focus window is set.
 * \n
 * If \a focus is `XCB_POINTER_ROOT` (TODO), focus is on the root window of the
 * screen on which the pointer is on currently.
 * @param time Timestamp to avoid race conditions when running X over the network.
 * \n
 * The special value `XCB_CURRENT_TIME` will be replaced with the current server
 * time.
 * @return A cookie
 *
 * Changes the input focus and the last-focus-change time. If the specified \a time
 * is earlier than the current last-focus-change time, the request is ignored (to
 * avoid race conditions when running X over the network).
 * 
 * A FocusIn and FocusOut event is generated when focus is changed.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_set_input_focus_checked(c:Pxcb_connection_t; revert_to:Tuint8_t; focus:Txcb_window_t; time:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Sets input focus
 *
 * @param c The connection
 * @param revert_to A bitmask of #xcb_input_focus_t values.
 * @param revert_to Specifies what happens when the \a focus window becomes unviewable (if \a focus
 * is neither `XCB_NONE` nor `XCB_POINTER_ROOT`).
 * @param focus The window to focus. All keyboard events will be reported to this window. The
 * window must be viewable (TODO), or a `xcb_match_error_t` occurs (TODO).
 * \n
 * If \a focus is `XCB_NONE` (TODO), all keyboard events are
 * discarded until a new focus window is set.
 * \n
 * If \a focus is `XCB_POINTER_ROOT` (TODO), focus is on the root window of the
 * screen on which the pointer is on currently.
 * @param time Timestamp to avoid race conditions when running X over the network.
 * \n
 * The special value `XCB_CURRENT_TIME` will be replaced with the current server
 * time.
 * @return A cookie
 *
 * Changes the input focus and the last-focus-change time. If the specified \a time
 * is earlier than the current last-focus-change time, the request is ignored (to
 * avoid race conditions when running X over the network).
 * 
 * A FocusIn and FocusOut event is generated when focus is changed.
 *
  }
function xcb_set_input_focus(c:Pxcb_connection_t; revert_to:Tuint8_t; focus:Txcb_window_t; time:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_get_input_focus(c:Pxcb_connection_t):Txcb_get_input_focus_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_input_focus_unchecked(c:Pxcb_connection_t):Txcb_get_input_focus_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_input_focus_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_input_focus_reply(c:Pxcb_connection_t; cookie:Txcb_get_input_focus_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_input_focus_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_query_keymap(c:Pxcb_connection_t):Txcb_query_keymap_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_query_keymap_unchecked(c:Pxcb_connection_t):Txcb_query_keymap_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_query_keymap_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_query_keymap_reply(c:Pxcb_connection_t; cookie:Txcb_query_keymap_cookie_t; e:PPxcb_generic_error_t):Pxcb_query_keymap_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_open_font_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief opens a font
 *
 * @param c The connection
 * @param fid The ID with which you will refer to the font, created by `xcb_generate_id`.
 * @param name_len Length (in bytes) of \a name.
 * @param name A pattern describing an X core font.
 * @return A cookie
 *
 * Opens any X core font matching the given \a name (for example "-misc-fixed-*").
 * 
 * Note that X core fonts are deprecated (but still supported) in favor of
 * client-side rendering using Xft.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_open_font_checked(c:Pxcb_connection_t; fid:Txcb_font_t; name_len:Tuint16_t; name:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief opens a font
 *
 * @param c The connection
 * @param fid The ID with which you will refer to the font, created by `xcb_generate_id`.
 * @param name_len Length (in bytes) of \a name.
 * @param name A pattern describing an X core font.
 * @return A cookie
 *
 * Opens any X core font matching the given \a name (for example "-misc-fixed-*").
 * 
 * Note that X core fonts are deprecated (but still supported) in favor of
 * client-side rendering using Xft.
 *
  }
(* Const before type ignored *)
function xcb_open_font(c:Pxcb_connection_t; fid:Txcb_font_t; name_len:Tuint16_t; name:Pchar):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_open_font_name(R:Pxcb_open_font_request_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_open_font_name_length(R:Pxcb_open_font_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_open_font_name_end(R:Pxcb_open_font_request_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_close_font_checked(c:Pxcb_connection_t; font:Txcb_font_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_close_font(c:Pxcb_connection_t; font:Txcb_font_t):Txcb_void_cookie_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_fontprop_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_fontprop_t)
  }
procedure xcb_fontprop_next(i:Pxcb_fontprop_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_fontprop_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_fontprop_end(i:Txcb_fontprop_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_charinfo_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_charinfo_t)
  }
procedure xcb_charinfo_next(i:Pxcb_charinfo_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_charinfo_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_charinfo_end(i:Txcb_charinfo_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_query_font_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief query font metrics
 *
 * @param c The connection
 * @param font The fontable (Font or Graphics Context) to query.
 * @return A cookie
 *
 * Queries information associated with the font.
 *
  }
function xcb_query_font(c:Pxcb_connection_t; font:Txcb_fontable_t):Txcb_query_font_cookie_t;cdecl;external;
{*
 * @brief query font metrics
 *
 * @param c The connection
 * @param font The fontable (Font or Graphics Context) to query.
 * @return A cookie
 *
 * Queries information associated with the font.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_query_font_unchecked(c:Pxcb_connection_t; font:Txcb_fontable_t):Txcb_query_font_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_query_font_properties(R:Pxcb_query_font_reply_t):Pxcb_fontprop_t;cdecl;external;
(* Const before type ignored *)
function xcb_query_font_properties_length(R:Pxcb_query_font_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_query_font_properties_iterator(R:Pxcb_query_font_reply_t):Txcb_fontprop_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_query_font_char_infos(R:Pxcb_query_font_reply_t):Pxcb_charinfo_t;cdecl;external;
(* Const before type ignored *)
function xcb_query_font_char_infos_length(R:Pxcb_query_font_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_query_font_char_infos_iterator(R:Pxcb_query_font_reply_t):Txcb_charinfo_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_query_font_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_query_font_reply(c:Pxcb_connection_t; cookie:Txcb_query_font_cookie_t; e:PPxcb_generic_error_t):Pxcb_query_font_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_query_text_extents_sizeof(_buffer:pointer; string_len:Tuint32_t):longint;cdecl;external;
{*
 * @brief get text extents
 *
 * @param c The connection
 * @param font The \a font to calculate text extents in. You can also pass a graphics context.
 * @param string_len The number of characters in \a string.
 * @param string The text to get text extents for.
 * @return A cookie
 *
 * Query text extents from the X11 server. This request returns the bounding box
 * of the specified 16-bit character string in the specified \a font or the font
 * contained in the specified graphics context.
 * 
 * `font_ascent` is set to the maximum of the ascent metrics of all characters in
 * the string. `font_descent` is set to the maximum of the descent metrics.
 * `overall_width` is set to the sum of the character-width metrics of all
 * characters in the string. For each character in the string, let W be the sum of
 * the character-width metrics of all characters preceding it in the string. Let L
 * be the left-side-bearing metric of the character plus W. Let R be the
 * right-side-bearing metric of the character plus W. The lbearing member is set
 * to the minimum L of all characters in the string. The rbearing member is set to
 * the maximum R.
 * 
 * For fonts defined with linear indexing rather than 2-byte matrix indexing, each
 * `xcb_char2b_t` structure is interpreted as a 16-bit number with byte1 as the
 * most significant byte. If the font has no defined default character, undefined
 * characters in the string are taken to have all zero metrics.
 * 
 * Characters with all zero metrics are ignored. If the font has no defined
 * default_char, the undefined characters in the string are also ignored.
 *
  }
(* Const before type ignored *)
function xcb_query_text_extents(c:Pxcb_connection_t; font:Txcb_fontable_t; string_len:Tuint32_t; _string:Pxcb_char2b_t):Txcb_query_text_extents_cookie_t;cdecl;external;
{*
 * @brief get text extents
 *
 * @param c The connection
 * @param font The \a font to calculate text extents in. You can also pass a graphics context.
 * @param string_len The number of characters in \a string.
 * @param string The text to get text extents for.
 * @return A cookie
 *
 * Query text extents from the X11 server. This request returns the bounding box
 * of the specified 16-bit character string in the specified \a font or the font
 * contained in the specified graphics context.
 * 
 * `font_ascent` is set to the maximum of the ascent metrics of all characters in
 * the string. `font_descent` is set to the maximum of the descent metrics.
 * `overall_width` is set to the sum of the character-width metrics of all
 * characters in the string. For each character in the string, let W be the sum of
 * the character-width metrics of all characters preceding it in the string. Let L
 * be the left-side-bearing metric of the character plus W. Let R be the
 * right-side-bearing metric of the character plus W. The lbearing member is set
 * to the minimum L of all characters in the string. The rbearing member is set to
 * the maximum R.
 * 
 * For fonts defined with linear indexing rather than 2-byte matrix indexing, each
 * `xcb_char2b_t` structure is interpreted as a 16-bit number with byte1 as the
 * most significant byte. If the font has no defined default character, undefined
 * characters in the string are taken to have all zero metrics.
 * 
 * Characters with all zero metrics are ignored. If the font has no defined
 * default_char, the undefined characters in the string are also ignored.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
(* Const before type ignored *)
function xcb_query_text_extents_unchecked(c:Pxcb_connection_t; font:Txcb_fontable_t; string_len:Tuint32_t; _string:Pxcb_char2b_t):Txcb_query_text_extents_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_query_text_extents_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_query_text_extents_reply(c:Pxcb_connection_t; cookie:Txcb_query_text_extents_cookie_t; e:PPxcb_generic_error_t):Pxcb_query_text_extents_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_str_sizeof(_buffer:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xcb_str_name(R:Pxcb_str_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_str_name_length(R:Pxcb_str_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_str_name_end(R:Pxcb_str_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_str_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_str_t)
  }
procedure xcb_str_next(i:Pxcb_str_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_str_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_str_end(i:Txcb_str_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_fonts_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief get matching font names
 *
 * @param c The connection
 * @param max_names The maximum number of fonts to be returned.
 * @param pattern_len The length (in bytes) of \a pattern.
 * @param pattern A font pattern, for example "-misc-fixed-*".
 * \n
 * The asterisk (*) is a wildcard for any number of characters. The question mark
 * (?) is a wildcard for a single character. Use of uppercase or lowercase does
 * not matter.
 * @return A cookie
 *
 * Gets a list of available font names which match the given \a pattern.
 *
  }
(* Const before type ignored *)
function xcb_list_fonts(c:Pxcb_connection_t; max_names:Tuint16_t; pattern_len:Tuint16_t; pattern:Pchar):Txcb_list_fonts_cookie_t;cdecl;external;
{*
 * @brief get matching font names
 *
 * @param c The connection
 * @param max_names The maximum number of fonts to be returned.
 * @param pattern_len The length (in bytes) of \a pattern.
 * @param pattern A font pattern, for example "-misc-fixed-*".
 * \n
 * The asterisk (*) is a wildcard for any number of characters. The question mark
 * (?) is a wildcard for a single character. Use of uppercase or lowercase does
 * not matter.
 * @return A cookie
 *
 * Gets a list of available font names which match the given \a pattern.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
(* Const before type ignored *)
function xcb_list_fonts_unchecked(c:Pxcb_connection_t; max_names:Tuint16_t; pattern_len:Tuint16_t; pattern:Pchar):Txcb_list_fonts_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_fonts_names_length(R:Pxcb_list_fonts_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_list_fonts_names_iterator(R:Pxcb_list_fonts_reply_t):Txcb_str_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_list_fonts_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_list_fonts_reply(c:Pxcb_connection_t; cookie:Txcb_list_fonts_cookie_t; e:PPxcb_generic_error_t):Pxcb_list_fonts_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_fonts_with_info_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief get matching font names and information
 *
 * @param c The connection
 * @param max_names The maximum number of fonts to be returned.
 * @param pattern_len The length (in bytes) of \a pattern.
 * @param pattern A font pattern, for example "-misc-fixed-*".
 * \n
 * The asterisk (*) is a wildcard for any number of characters. The question mark
 * (?) is a wildcard for a single character. Use of uppercase or lowercase does
 * not matter.
 * @return A cookie
 *
 * Gets a list of available font names which match the given \a pattern.
 *
  }
(* Const before type ignored *)
function xcb_list_fonts_with_info(c:Pxcb_connection_t; max_names:Tuint16_t; pattern_len:Tuint16_t; pattern:Pchar):Txcb_list_fonts_with_info_cookie_t;cdecl;external;
{*
 * @brief get matching font names and information
 *
 * @param c The connection
 * @param max_names The maximum number of fonts to be returned.
 * @param pattern_len The length (in bytes) of \a pattern.
 * @param pattern A font pattern, for example "-misc-fixed-*".
 * \n
 * The asterisk (*) is a wildcard for any number of characters. The question mark
 * (?) is a wildcard for a single character. Use of uppercase or lowercase does
 * not matter.
 * @return A cookie
 *
 * Gets a list of available font names which match the given \a pattern.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
(* Const before type ignored *)
function xcb_list_fonts_with_info_unchecked(c:Pxcb_connection_t; max_names:Tuint16_t; pattern_len:Tuint16_t; pattern:Pchar):Txcb_list_fonts_with_info_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_fonts_with_info_properties(R:Pxcb_list_fonts_with_info_reply_t):Pxcb_fontprop_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_fonts_with_info_properties_length(R:Pxcb_list_fonts_with_info_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_list_fonts_with_info_properties_iterator(R:Pxcb_list_fonts_with_info_reply_t):Txcb_fontprop_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_fonts_with_info_name(R:Pxcb_list_fonts_with_info_reply_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_list_fonts_with_info_name_length(R:Pxcb_list_fonts_with_info_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_list_fonts_with_info_name_end(R:Pxcb_list_fonts_with_info_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_list_fonts_with_info_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_list_fonts_with_info_reply(c:Pxcb_connection_t; cookie:Txcb_list_fonts_with_info_cookie_t; e:PPxcb_generic_error_t):Pxcb_list_fonts_with_info_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_set_font_path_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_set_font_path_checked(c:Pxcb_connection_t; font_qty:Tuint16_t; font:Pxcb_str_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_set_font_path(c:Pxcb_connection_t; font_qty:Tuint16_t; font:Pxcb_str_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_set_font_path_font_length(R:Pxcb_set_font_path_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_set_font_path_font_iterator(R:Pxcb_set_font_path_request_t):Txcb_str_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_font_path_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_get_font_path(c:Pxcb_connection_t):Txcb_get_font_path_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_font_path_unchecked(c:Pxcb_connection_t):Txcb_get_font_path_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_font_path_path_length(R:Pxcb_get_font_path_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_get_font_path_path_iterator(R:Pxcb_get_font_path_reply_t):Txcb_str_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_font_path_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_font_path_reply(c:Pxcb_connection_t; cookie:Txcb_get_font_path_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_font_path_reply_t;cdecl;external;
{*
 * @brief Creates a pixmap
 *
 * @param c The connection
 * @param depth TODO
 * @param pid The ID with which you will refer to the new pixmap, created by
 * `xcb_generate_id`.
 * @param drawable Drawable to get the screen from.
 * @param width The width of the new pixmap.
 * @param height The height of the new pixmap.
 * @return A cookie
 *
 * Creates a pixmap. The pixmap can only be used on the same screen as \a drawable
 * is on and only with drawables of the same \a depth.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_create_pixmap_checked(c:Pxcb_connection_t; depth:Tuint8_t; pid:Txcb_pixmap_t; drawable:Txcb_drawable_t; width:Tuint16_t; 
           height:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Creates a pixmap
 *
 * @param c The connection
 * @param depth TODO
 * @param pid The ID with which you will refer to the new pixmap, created by
 * `xcb_generate_id`.
 * @param drawable Drawable to get the screen from.
 * @param width The width of the new pixmap.
 * @param height The height of the new pixmap.
 * @return A cookie
 *
 * Creates a pixmap. The pixmap can only be used on the same screen as \a drawable
 * is on and only with drawables of the same \a depth.
 *
  }
function xcb_create_pixmap(c:Pxcb_connection_t; depth:Tuint8_t; pid:Txcb_pixmap_t; drawable:Txcb_drawable_t; width:Tuint16_t; 
           height:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Destroys a pixmap
 *
 * @param c The connection
 * @param pixmap The pixmap to destroy.
 * @return A cookie
 *
 * Deletes the association between the pixmap ID and the pixmap. The pixmap
 * storage will be freed when there are no more references to it.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_free_pixmap_checked(c:Pxcb_connection_t; pixmap:Txcb_pixmap_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Destroys a pixmap
 *
 * @param c The connection
 * @param pixmap The pixmap to destroy.
 * @return A cookie
 *
 * Deletes the association between the pixmap ID and the pixmap. The pixmap
 * storage will be freed when there are no more references to it.
 *
  }
function xcb_free_pixmap(c:Pxcb_connection_t; pixmap:Txcb_pixmap_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_create_gc_value_list_serialize(_buffer:Ppointer; value_mask:Tuint32_t; _aux:Pxcb_create_gc_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_create_gc_value_list_unpack(_buffer:pointer; value_mask:Tuint32_t; _aux:Pxcb_create_gc_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_create_gc_value_list_sizeof(_buffer:pointer; value_mask:Tuint32_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_create_gc_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief Creates a graphics context
 *
 * @param c The connection
 * @param cid The ID with which you will refer to the graphics context, created by
 * `xcb_generate_id`.
 * @param drawable Drawable to get the root/depth from.
 * @return A cookie
 *
 * Creates a graphics context. The graphics context can be used with any drawable
 * that has the same root and depth as the specified drawable.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_create_gc_checked(c:Pxcb_connection_t; cid:Txcb_gcontext_t; drawable:Txcb_drawable_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Creates a graphics context
 *
 * @param c The connection
 * @param cid The ID with which you will refer to the graphics context, created by
 * `xcb_generate_id`.
 * @param drawable Drawable to get the root/depth from.
 * @return A cookie
 *
 * Creates a graphics context. The graphics context can be used with any drawable
 * that has the same root and depth as the specified drawable.
 *
  }
(* Const before type ignored *)
function xcb_create_gc(c:Pxcb_connection_t; cid:Txcb_gcontext_t; drawable:Txcb_drawable_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Creates a graphics context
 *
 * @param c The connection
 * @param cid The ID with which you will refer to the graphics context, created by
 * `xcb_generate_id`.
 * @param drawable Drawable to get the root/depth from.
 * @return A cookie
 *
 * Creates a graphics context. The graphics context can be used with any drawable
 * that has the same root and depth as the specified drawable.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_create_gc_aux_checked(c:Pxcb_connection_t; cid:Txcb_gcontext_t; drawable:Txcb_drawable_t; value_mask:Tuint32_t; value_list:Pxcb_create_gc_value_list_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Creates a graphics context
 *
 * @param c The connection
 * @param cid The ID with which you will refer to the graphics context, created by
 * `xcb_generate_id`.
 * @param drawable Drawable to get the root/depth from.
 * @return A cookie
 *
 * Creates a graphics context. The graphics context can be used with any drawable
 * that has the same root and depth as the specified drawable.
 *
  }
(* Const before type ignored *)
function xcb_create_gc_aux(c:Pxcb_connection_t; cid:Txcb_gcontext_t; drawable:Txcb_drawable_t; value_mask:Tuint32_t; value_list:Pxcb_create_gc_value_list_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_create_gc_value_list(R:Pxcb_create_gc_request_t):pointer;cdecl;external;
(* Const before type ignored *)
function xcb_change_gc_value_list_serialize(_buffer:Ppointer; value_mask:Tuint32_t; _aux:Pxcb_change_gc_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_change_gc_value_list_unpack(_buffer:pointer; value_mask:Tuint32_t; _aux:Pxcb_change_gc_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_change_gc_value_list_sizeof(_buffer:pointer; value_mask:Tuint32_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_change_gc_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief change graphics context components
 *
 * @param c The connection
 * @param gc The graphics context to change.
 * @param value_mask A bitmask of #xcb_gc_t values.
 * @param value_mask \n
 * @param value_list Values for each of the components specified in the bitmask \a value_mask. The
 * order has to correspond to the order of possible \a value_mask bits. See the
 * example.
 * @return A cookie
 *
 * Changes the components specified by \a value_mask for the specified graphics context.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_change_gc_checked(c:Pxcb_connection_t; gc:Txcb_gcontext_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief change graphics context components
 *
 * @param c The connection
 * @param gc The graphics context to change.
 * @param value_mask A bitmask of #xcb_gc_t values.
 * @param value_mask \n
 * @param value_list Values for each of the components specified in the bitmask \a value_mask. The
 * order has to correspond to the order of possible \a value_mask bits. See the
 * example.
 * @return A cookie
 *
 * Changes the components specified by \a value_mask for the specified graphics context.
 *
  }
(* Const before type ignored *)
function xcb_change_gc(c:Pxcb_connection_t; gc:Txcb_gcontext_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief change graphics context components
 *
 * @param c The connection
 * @param gc The graphics context to change.
 * @param value_mask A bitmask of #xcb_gc_t values.
 * @param value_mask \n
 * @param value_list Values for each of the components specified in the bitmask \a value_mask. The
 * order has to correspond to the order of possible \a value_mask bits. See the
 * example.
 * @return A cookie
 *
 * Changes the components specified by \a value_mask for the specified graphics context.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_change_gc_aux_checked(c:Pxcb_connection_t; gc:Txcb_gcontext_t; value_mask:Tuint32_t; value_list:Pxcb_change_gc_value_list_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief change graphics context components
 *
 * @param c The connection
 * @param gc The graphics context to change.
 * @param value_mask A bitmask of #xcb_gc_t values.
 * @param value_mask \n
 * @param value_list Values for each of the components specified in the bitmask \a value_mask. The
 * order has to correspond to the order of possible \a value_mask bits. See the
 * example.
 * @return A cookie
 *
 * Changes the components specified by \a value_mask for the specified graphics context.
 *
  }
(* Const before type ignored *)
function xcb_change_gc_aux(c:Pxcb_connection_t; gc:Txcb_gcontext_t; value_mask:Tuint32_t; value_list:Pxcb_change_gc_value_list_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_change_gc_value_list(R:Pxcb_change_gc_request_t):pointer;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_copy_gc_checked(c:Pxcb_connection_t; src_gc:Txcb_gcontext_t; dst_gc:Txcb_gcontext_t; value_mask:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_copy_gc(c:Pxcb_connection_t; src_gc:Txcb_gcontext_t; dst_gc:Txcb_gcontext_t; value_mask:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_set_dashes_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_set_dashes_checked(c:Pxcb_connection_t; gc:Txcb_gcontext_t; dash_offset:Tuint16_t; dashes_len:Tuint16_t; dashes:Puint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_set_dashes(c:Pxcb_connection_t; gc:Txcb_gcontext_t; dash_offset:Tuint16_t; dashes_len:Tuint16_t; dashes:Puint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_set_dashes_dashes(R:Pxcb_set_dashes_request_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_set_dashes_dashes_length(R:Pxcb_set_dashes_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_set_dashes_dashes_end(R:Pxcb_set_dashes_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_set_clip_rectangles_sizeof(_buffer:pointer; rectangles_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_set_clip_rectangles_checked(c:Pxcb_connection_t; ordering:Tuint8_t; gc:Txcb_gcontext_t; clip_x_origin:Tint16_t; clip_y_origin:Tint16_t; 
           rectangles_len:Tuint32_t; rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_set_clip_rectangles(c:Pxcb_connection_t; ordering:Tuint8_t; gc:Txcb_gcontext_t; clip_x_origin:Tint16_t; clip_y_origin:Tint16_t; 
           rectangles_len:Tuint32_t; rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_set_clip_rectangles_rectangles(R:Pxcb_set_clip_rectangles_request_t):Pxcb_rectangle_t;cdecl;external;
(* Const before type ignored *)
function xcb_set_clip_rectangles_rectangles_length(R:Pxcb_set_clip_rectangles_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_set_clip_rectangles_rectangles_iterator(R:Pxcb_set_clip_rectangles_request_t):Txcb_rectangle_iterator_t;cdecl;external;
{*
 * @brief Destroys a graphics context
 *
 * @param c The connection
 * @param gc The graphics context to destroy.
 * @return A cookie
 *
 * Destroys the specified \a gc and all associated storage.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_free_gc_checked(c:Pxcb_connection_t; gc:Txcb_gcontext_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Destroys a graphics context
 *
 * @param c The connection
 * @param gc The graphics context to destroy.
 * @return A cookie
 *
 * Destroys the specified \a gc and all associated storage.
 *
  }
function xcb_free_gc(c:Pxcb_connection_t; gc:Txcb_gcontext_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_clear_area_checked(c:Pxcb_connection_t; exposures:Tuint8_t; window:Txcb_window_t; x:Tint16_t; y:Tint16_t; 
           width:Tuint16_t; height:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_clear_area(c:Pxcb_connection_t; exposures:Tuint8_t; window:Txcb_window_t; x:Tint16_t; y:Tint16_t; 
           width:Tuint16_t; height:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief copy areas
 *
 * @param c The connection
 * @param src_drawable The source drawable (Window or Pixmap).
 * @param dst_drawable The destination drawable (Window or Pixmap).
 * @param gc The graphics context to use.
 * @param src_x The source X coordinate.
 * @param src_y The source Y coordinate.
 * @param dst_x The destination X coordinate.
 * @param dst_y The destination Y coordinate.
 * @param width The width of the area to copy (in pixels).
 * @param height The height of the area to copy (in pixels).
 * @return A cookie
 *
 * Copies the specified rectangle from \a src_drawable to \a dst_drawable.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_copy_area_checked(c:Pxcb_connection_t; src_drawable:Txcb_drawable_t; dst_drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; src_x:Tint16_t; 
           src_y:Tint16_t; dst_x:Tint16_t; dst_y:Tint16_t; width:Tuint16_t; height:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief copy areas
 *
 * @param c The connection
 * @param src_drawable The source drawable (Window or Pixmap).
 * @param dst_drawable The destination drawable (Window or Pixmap).
 * @param gc The graphics context to use.
 * @param src_x The source X coordinate.
 * @param src_y The source Y coordinate.
 * @param dst_x The destination X coordinate.
 * @param dst_y The destination Y coordinate.
 * @param width The width of the area to copy (in pixels).
 * @param height The height of the area to copy (in pixels).
 * @return A cookie
 *
 * Copies the specified rectangle from \a src_drawable to \a dst_drawable.
 *
  }
function xcb_copy_area(c:Pxcb_connection_t; src_drawable:Txcb_drawable_t; dst_drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; src_x:Tint16_t; 
           src_y:Tint16_t; dst_x:Tint16_t; dst_y:Tint16_t; width:Tuint16_t; height:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_copy_plane_checked(c:Pxcb_connection_t; src_drawable:Txcb_drawable_t; dst_drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; src_x:Tint16_t; 
           src_y:Tint16_t; dst_x:Tint16_t; dst_y:Tint16_t; width:Tuint16_t; height:Tuint16_t; 
           bit_plane:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_copy_plane(c:Pxcb_connection_t; src_drawable:Txcb_drawable_t; dst_drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; src_x:Tint16_t; 
           src_y:Tint16_t; dst_x:Tint16_t; dst_y:Tint16_t; width:Tuint16_t; height:Tuint16_t; 
           bit_plane:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_point_sizeof(_buffer:pointer; points_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_poly_point_checked(c:Pxcb_connection_t; coordinate_mode:Tuint8_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; points_len:Tuint32_t; 
           points:Pxcb_point_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_poly_point(c:Pxcb_connection_t; coordinate_mode:Tuint8_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; points_len:Tuint32_t; 
           points:Pxcb_point_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_point_points(R:Pxcb_poly_point_request_t):Pxcb_point_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_point_points_length(R:Pxcb_poly_point_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_poly_point_points_iterator(R:Pxcb_poly_point_request_t):Txcb_point_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_line_sizeof(_buffer:pointer; points_len:Tuint32_t):longint;cdecl;external;
{*
 * @brief draw lines
 *
 * @param c The connection
 * @param coordinate_mode A bitmask of #xcb_coord_mode_t values.
 * @param coordinate_mode \n
 * @param drawable The drawable to draw the line(s) on.
 * @param gc The graphics context to use.
 * @param points_len The number of `xcb_point_t` structures in \a points.
 * @param points An array of points.
 * @return A cookie
 *
 * Draws \a points_len-1 lines between each pair of points (point[i], point[i+1])
 * in the \a points array. The lines are drawn in the order listed in the array.
 * They join correctly at all intermediate points, and if the first and last
 * points coincide, the first and last lines also join correctly. For any given
 * line, a pixel is not drawn more than once. If thin (zero line-width) lines
 * intersect, the intersecting pixels are drawn multiple times. If wide lines
 * intersect, the intersecting pixels are drawn only once, as though the entire
 * request were a single, filled shape.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_poly_line_checked(c:Pxcb_connection_t; coordinate_mode:Tuint8_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; points_len:Tuint32_t; 
           points:Pxcb_point_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief draw lines
 *
 * @param c The connection
 * @param coordinate_mode A bitmask of #xcb_coord_mode_t values.
 * @param coordinate_mode \n
 * @param drawable The drawable to draw the line(s) on.
 * @param gc The graphics context to use.
 * @param points_len The number of `xcb_point_t` structures in \a points.
 * @param points An array of points.
 * @return A cookie
 *
 * Draws \a points_len-1 lines between each pair of points (point[i], point[i+1])
 * in the \a points array. The lines are drawn in the order listed in the array.
 * They join correctly at all intermediate points, and if the first and last
 * points coincide, the first and last lines also join correctly. For any given
 * line, a pixel is not drawn more than once. If thin (zero line-width) lines
 * intersect, the intersecting pixels are drawn multiple times. If wide lines
 * intersect, the intersecting pixels are drawn only once, as though the entire
 * request were a single, filled shape.
 *
  }
(* Const before type ignored *)
function xcb_poly_line(c:Pxcb_connection_t; coordinate_mode:Tuint8_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; points_len:Tuint32_t; 
           points:Pxcb_point_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_line_points(R:Pxcb_poly_line_request_t):Pxcb_point_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_line_points_length(R:Pxcb_poly_line_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_poly_line_points_iterator(R:Pxcb_poly_line_request_t):Txcb_point_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_segment_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_segment_t)
  }
procedure xcb_segment_next(i:Pxcb_segment_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_segment_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_segment_end(i:Txcb_segment_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_segment_sizeof(_buffer:pointer; segments_len:Tuint32_t):longint;cdecl;external;
{*
 * @brief draw lines
 *
 * @param c The connection
 * @param drawable A drawable (Window or Pixmap) to draw on.
 * @param gc The graphics context to use.
 * \n
 * TODO: document which attributes of a gc are used
 * @param segments_len The number of `xcb_segment_t` structures in \a segments.
 * @param segments An array of `xcb_segment_t` structures.
 * @return A cookie
 *
 * Draws multiple, unconnected lines. For each segment, a line is drawn between
 * (x1, y1) and (x2, y2). The lines are drawn in the order listed in the array of
 * `xcb_segment_t` structures and does not perform joining at coincident
 * endpoints. For any given line, a pixel is not drawn more than once. If lines
 * intersect, the intersecting pixels are drawn multiple times.
 * 
 * TODO: include the xcb_segment_t data structure
 * 
 * TODO: an example
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_poly_segment_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; segments_len:Tuint32_t; segments:Pxcb_segment_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief draw lines
 *
 * @param c The connection
 * @param drawable A drawable (Window or Pixmap) to draw on.
 * @param gc The graphics context to use.
 * \n
 * TODO: document which attributes of a gc are used
 * @param segments_len The number of `xcb_segment_t` structures in \a segments.
 * @param segments An array of `xcb_segment_t` structures.
 * @return A cookie
 *
 * Draws multiple, unconnected lines. For each segment, a line is drawn between
 * (x1, y1) and (x2, y2). The lines are drawn in the order listed in the array of
 * `xcb_segment_t` structures and does not perform joining at coincident
 * endpoints. For any given line, a pixel is not drawn more than once. If lines
 * intersect, the intersecting pixels are drawn multiple times.
 * 
 * TODO: include the xcb_segment_t data structure
 * 
 * TODO: an example
 *
  }
(* Const before type ignored *)
function xcb_poly_segment(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; segments_len:Tuint32_t; segments:Pxcb_segment_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_segment_segments(R:Pxcb_poly_segment_request_t):Pxcb_segment_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_segment_segments_length(R:Pxcb_poly_segment_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_poly_segment_segments_iterator(R:Pxcb_poly_segment_request_t):Txcb_segment_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_rectangle_sizeof(_buffer:pointer; rectangles_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_poly_rectangle_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; rectangles_len:Tuint32_t; rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_poly_rectangle(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; rectangles_len:Tuint32_t; rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_rectangle_rectangles(R:Pxcb_poly_rectangle_request_t):Pxcb_rectangle_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_rectangle_rectangles_length(R:Pxcb_poly_rectangle_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_poly_rectangle_rectangles_iterator(R:Pxcb_poly_rectangle_request_t):Txcb_rectangle_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_arc_sizeof(_buffer:pointer; arcs_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_poly_arc_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; arcs_len:Tuint32_t; arcs:Pxcb_arc_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_poly_arc(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; arcs_len:Tuint32_t; arcs:Pxcb_arc_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_arc_arcs(R:Pxcb_poly_arc_request_t):Pxcb_arc_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_arc_arcs_length(R:Pxcb_poly_arc_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_poly_arc_arcs_iterator(R:Pxcb_poly_arc_request_t):Txcb_arc_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_fill_poly_sizeof(_buffer:pointer; points_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_fill_poly_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; shape:Tuint8_t; coordinate_mode:Tuint8_t; 
           points_len:Tuint32_t; points:Pxcb_point_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_fill_poly(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; shape:Tuint8_t; coordinate_mode:Tuint8_t; 
           points_len:Tuint32_t; points:Pxcb_point_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_fill_poly_points(R:Pxcb_fill_poly_request_t):Pxcb_point_t;cdecl;external;
(* Const before type ignored *)
function xcb_fill_poly_points_length(R:Pxcb_fill_poly_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_fill_poly_points_iterator(R:Pxcb_fill_poly_request_t):Txcb_point_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_fill_rectangle_sizeof(_buffer:pointer; rectangles_len:Tuint32_t):longint;cdecl;external;
{*
 * @brief Fills rectangles
 *
 * @param c The connection
 * @param drawable The drawable (Window or Pixmap) to draw on.
 * @param gc The graphics context to use.
 * \n
 * The following graphics context components are used: function, plane-mask,
 * fill-style, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
 * \n
 * The following graphics context mode-dependent components are used:
 * foreground, background, tile, stipple, tile-stipple-x-origin, and
 * tile-stipple-y-origin.
 * @param rectangles_len The number of `xcb_rectangle_t` structures in \a rectangles.
 * @param rectangles The rectangles to fill.
 * @return A cookie
 *
 * Fills the specified rectangle(s) in the order listed in the array. For any
 * given rectangle, each pixel is not drawn more than once. If rectangles
 * intersect, the intersecting pixels are drawn multiple times.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_poly_fill_rectangle_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; rectangles_len:Tuint32_t; rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Fills rectangles
 *
 * @param c The connection
 * @param drawable The drawable (Window or Pixmap) to draw on.
 * @param gc The graphics context to use.
 * \n
 * The following graphics context components are used: function, plane-mask,
 * fill-style, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
 * \n
 * The following graphics context mode-dependent components are used:
 * foreground, background, tile, stipple, tile-stipple-x-origin, and
 * tile-stipple-y-origin.
 * @param rectangles_len The number of `xcb_rectangle_t` structures in \a rectangles.
 * @param rectangles The rectangles to fill.
 * @return A cookie
 *
 * Fills the specified rectangle(s) in the order listed in the array. For any
 * given rectangle, each pixel is not drawn more than once. If rectangles
 * intersect, the intersecting pixels are drawn multiple times.
 *
  }
(* Const before type ignored *)
function xcb_poly_fill_rectangle(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; rectangles_len:Tuint32_t; rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_fill_rectangle_rectangles(R:Pxcb_poly_fill_rectangle_request_t):Pxcb_rectangle_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_fill_rectangle_rectangles_length(R:Pxcb_poly_fill_rectangle_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_poly_fill_rectangle_rectangles_iterator(R:Pxcb_poly_fill_rectangle_request_t):Txcb_rectangle_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_fill_arc_sizeof(_buffer:pointer; arcs_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_poly_fill_arc_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; arcs_len:Tuint32_t; arcs:Pxcb_arc_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_poly_fill_arc(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; arcs_len:Tuint32_t; arcs:Pxcb_arc_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_fill_arc_arcs(R:Pxcb_poly_fill_arc_request_t):Pxcb_arc_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_fill_arc_arcs_length(R:Pxcb_poly_fill_arc_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_poly_fill_arc_arcs_iterator(R:Pxcb_poly_fill_arc_request_t):Txcb_arc_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_put_image_sizeof(_buffer:pointer; data_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_put_image_checked(c:Pxcb_connection_t; format:Tuint8_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; width:Tuint16_t; 
           height:Tuint16_t; dst_x:Tint16_t; dst_y:Tint16_t; left_pad:Tuint8_t; depth:Tuint8_t; 
           data_len:Tuint32_t; data:Puint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_put_image(c:Pxcb_connection_t; format:Tuint8_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; width:Tuint16_t; 
           height:Tuint16_t; dst_x:Tint16_t; dst_y:Tint16_t; left_pad:Tuint8_t; depth:Tuint8_t; 
           data_len:Tuint32_t; data:Puint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_put_image_data(R:Pxcb_put_image_request_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_put_image_data_length(R:Pxcb_put_image_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_put_image_data_end(R:Pxcb_put_image_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_image_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_get_image(c:Pxcb_connection_t; format:Tuint8_t; drawable:Txcb_drawable_t; x:Tint16_t; y:Tint16_t; 
           width:Tuint16_t; height:Tuint16_t; plane_mask:Tuint32_t):Txcb_get_image_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_image_unchecked(c:Pxcb_connection_t; format:Tuint8_t; drawable:Txcb_drawable_t; x:Tint16_t; y:Tint16_t; 
           width:Tuint16_t; height:Tuint16_t; plane_mask:Tuint32_t):Txcb_get_image_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_image_data(R:Pxcb_get_image_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_image_data_length(R:Pxcb_get_image_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_get_image_data_end(R:Pxcb_get_image_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_image_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_image_reply(c:Pxcb_connection_t; cookie:Txcb_get_image_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_image_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_text_8_sizeof(_buffer:pointer; items_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_poly_text_8_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; x:Tint16_t; y:Tint16_t; 
           items_len:Tuint32_t; items:Puint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_poly_text_8(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; x:Tint16_t; y:Tint16_t; 
           items_len:Tuint32_t; items:Puint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_text_8_items(R:Pxcb_poly_text_8_request_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_text_8_items_length(R:Pxcb_poly_text_8_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_poly_text_8_items_end(R:Pxcb_poly_text_8_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_text_16_sizeof(_buffer:pointer; items_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_poly_text_16_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; x:Tint16_t; y:Tint16_t; 
           items_len:Tuint32_t; items:Puint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_poly_text_16(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; x:Tint16_t; y:Tint16_t; 
           items_len:Tuint32_t; items:Puint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_text_16_items(R:Pxcb_poly_text_16_request_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_poly_text_16_items_length(R:Pxcb_poly_text_16_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_poly_text_16_items_end(R:Pxcb_poly_text_16_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_image_text_8_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief Draws text
 *
 * @param c The connection
 * @param string_len The length of the \a string. Note that this parameter limited by 255 due to
 * using 8 bits!
 * @param drawable The drawable (Window or Pixmap) to draw text on.
 * @param gc The graphics context to use.
 * \n
 * The following graphics context components are used: plane-mask, foreground,
 * background, font, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
 * @param x The x coordinate of the first character, relative to the origin of \a drawable.
 * @param y The y coordinate of the first character, relative to the origin of \a drawable.
 * @param string The string to draw. Only the first 255 characters are relevant due to the data
 * type of \a string_len.
 * @return A cookie
 *
 * Fills the destination rectangle with the background pixel from \a gc, then
 * paints the text with the foreground pixel from \a gc. The upper-left corner of
 * the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
 * the height is font-ascent + font-descent. The overall-width, font-ascent and
 * font-descent are as returned by `xcb_query_text_extents` (TODO).
 * 
 * Note that using X core fonts is deprecated (but still supported) in favor of
 * client-side rendering using Xft.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_image_text_8_checked(c:Pxcb_connection_t; string_len:Tuint8_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; x:Tint16_t; 
           y:Tint16_t; _string:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Draws text
 *
 * @param c The connection
 * @param string_len The length of the \a string. Note that this parameter limited by 255 due to
 * using 8 bits!
 * @param drawable The drawable (Window or Pixmap) to draw text on.
 * @param gc The graphics context to use.
 * \n
 * The following graphics context components are used: plane-mask, foreground,
 * background, font, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
 * @param x The x coordinate of the first character, relative to the origin of \a drawable.
 * @param y The y coordinate of the first character, relative to the origin of \a drawable.
 * @param string The string to draw. Only the first 255 characters are relevant due to the data
 * type of \a string_len.
 * @return A cookie
 *
 * Fills the destination rectangle with the background pixel from \a gc, then
 * paints the text with the foreground pixel from \a gc. The upper-left corner of
 * the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
 * the height is font-ascent + font-descent. The overall-width, font-ascent and
 * font-descent are as returned by `xcb_query_text_extents` (TODO).
 * 
 * Note that using X core fonts is deprecated (but still supported) in favor of
 * client-side rendering using Xft.
 *
  }
(* Const before type ignored *)
function xcb_image_text_8(c:Pxcb_connection_t; string_len:Tuint8_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; x:Tint16_t; 
           y:Tint16_t; _string:Pchar):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_image_text_8_string(R:Pxcb_image_text_8_request_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_image_text_8_string_length(R:Pxcb_image_text_8_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_image_text_8_string_end(R:Pxcb_image_text_8_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_image_text_16_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief Draws text
 *
 * @param c The connection
 * @param string_len The length of the \a string in characters. Note that this parameter limited by
 * 255 due to using 8 bits!
 * @param drawable The drawable (Window or Pixmap) to draw text on.
 * @param gc The graphics context to use.
 * \n
 * The following graphics context components are used: plane-mask, foreground,
 * background, font, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
 * @param x The x coordinate of the first character, relative to the origin of \a drawable.
 * @param y The y coordinate of the first character, relative to the origin of \a drawable.
 * @param string The string to draw. Only the first 255 characters are relevant due to the data
 * type of \a string_len. Every character uses 2 bytes (hence the 16 in this
 * request's name).
 * @return A cookie
 *
 * Fills the destination rectangle with the background pixel from \a gc, then
 * paints the text with the foreground pixel from \a gc. The upper-left corner of
 * the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
 * the height is font-ascent + font-descent. The overall-width, font-ascent and
 * font-descent are as returned by `xcb_query_text_extents` (TODO).
 * 
 * Note that using X core fonts is deprecated (but still supported) in favor of
 * client-side rendering using Xft.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_image_text_16_checked(c:Pxcb_connection_t; string_len:Tuint8_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; x:Tint16_t; 
           y:Tint16_t; _string:Pxcb_char2b_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Draws text
 *
 * @param c The connection
 * @param string_len The length of the \a string in characters. Note that this parameter limited by
 * 255 due to using 8 bits!
 * @param drawable The drawable (Window or Pixmap) to draw text on.
 * @param gc The graphics context to use.
 * \n
 * The following graphics context components are used: plane-mask, foreground,
 * background, font, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
 * @param x The x coordinate of the first character, relative to the origin of \a drawable.
 * @param y The y coordinate of the first character, relative to the origin of \a drawable.
 * @param string The string to draw. Only the first 255 characters are relevant due to the data
 * type of \a string_len. Every character uses 2 bytes (hence the 16 in this
 * request's name).
 * @return A cookie
 *
 * Fills the destination rectangle with the background pixel from \a gc, then
 * paints the text with the foreground pixel from \a gc. The upper-left corner of
 * the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
 * the height is font-ascent + font-descent. The overall-width, font-ascent and
 * font-descent are as returned by `xcb_query_text_extents` (TODO).
 * 
 * Note that using X core fonts is deprecated (but still supported) in favor of
 * client-side rendering using Xft.
 *
  }
(* Const before type ignored *)
function xcb_image_text_16(c:Pxcb_connection_t; string_len:Tuint8_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; x:Tint16_t; 
           y:Tint16_t; _string:Pxcb_char2b_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_image_text_16_string(R:Pxcb_image_text_16_request_t):Pxcb_char2b_t;cdecl;external;
(* Const before type ignored *)
function xcb_image_text_16_string_length(R:Pxcb_image_text_16_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_image_text_16_string_iterator(R:Pxcb_image_text_16_request_t):Txcb_char2b_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_create_colormap_checked(c:Pxcb_connection_t; alloc:Tuint8_t; mid:Txcb_colormap_t; window:Txcb_window_t; visual:Txcb_visualid_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_create_colormap(c:Pxcb_connection_t; alloc:Tuint8_t; mid:Txcb_colormap_t; window:Txcb_window_t; visual:Txcb_visualid_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_free_colormap_checked(c:Pxcb_connection_t; cmap:Txcb_colormap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_free_colormap(c:Pxcb_connection_t; cmap:Txcb_colormap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_copy_colormap_and_free_checked(c:Pxcb_connection_t; mid:Txcb_colormap_t; src_cmap:Txcb_colormap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_copy_colormap_and_free(c:Pxcb_connection_t; mid:Txcb_colormap_t; src_cmap:Txcb_colormap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_install_colormap_checked(c:Pxcb_connection_t; cmap:Txcb_colormap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_install_colormap(c:Pxcb_connection_t; cmap:Txcb_colormap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_uninstall_colormap_checked(c:Pxcb_connection_t; cmap:Txcb_colormap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_uninstall_colormap(c:Pxcb_connection_t; cmap:Txcb_colormap_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_installed_colormaps_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_list_installed_colormaps(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_list_installed_colormaps_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_list_installed_colormaps_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_list_installed_colormaps_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_installed_colormaps_cmaps(R:Pxcb_list_installed_colormaps_reply_t):Pxcb_colormap_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_installed_colormaps_cmaps_length(R:Pxcb_list_installed_colormaps_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_list_installed_colormaps_cmaps_end(R:Pxcb_list_installed_colormaps_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_list_installed_colormaps_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_list_installed_colormaps_reply(c:Pxcb_connection_t; cookie:Txcb_list_installed_colormaps_cookie_t; e:PPxcb_generic_error_t):Pxcb_list_installed_colormaps_reply_t;cdecl;external;
{*
 * @brief Allocate a color
 *
 * @param c The connection
 * @param cmap TODO
 * @param red The red value of your color.
 * @param green The green value of your color.
 * @param blue The blue value of your color.
 * @return A cookie
 *
 * Allocates a read-only colormap entry corresponding to the closest RGB value
 * supported by the hardware. If you are using TrueColor, you can take a shortcut
 * and directly calculate the color pixel value to avoid the round trip. But, for
 * example, on 16-bit color setups (VNC), you can easily get the closest supported
 * RGB value to the RGB value you are specifying.
 *
  }
function xcb_alloc_color(c:Pxcb_connection_t; cmap:Txcb_colormap_t; red:Tuint16_t; green:Tuint16_t; blue:Tuint16_t):Txcb_alloc_color_cookie_t;cdecl;external;
{*
 * @brief Allocate a color
 *
 * @param c The connection
 * @param cmap TODO
 * @param red The red value of your color.
 * @param green The green value of your color.
 * @param blue The blue value of your color.
 * @return A cookie
 *
 * Allocates a read-only colormap entry corresponding to the closest RGB value
 * supported by the hardware. If you are using TrueColor, you can take a shortcut
 * and directly calculate the color pixel value to avoid the round trip. But, for
 * example, on 16-bit color setups (VNC), you can easily get the closest supported
 * RGB value to the RGB value you are specifying.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_alloc_color_unchecked(c:Pxcb_connection_t; cmap:Txcb_colormap_t; red:Tuint16_t; green:Tuint16_t; blue:Tuint16_t):Txcb_alloc_color_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_alloc_color_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_alloc_color_reply(c:Pxcb_connection_t; cookie:Txcb_alloc_color_cookie_t; e:PPxcb_generic_error_t):Pxcb_alloc_color_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_alloc_named_color_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_alloc_named_color(c:Pxcb_connection_t; cmap:Txcb_colormap_t; name_len:Tuint16_t; name:Pchar):Txcb_alloc_named_color_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
(* Const before type ignored *)
function xcb_alloc_named_color_unchecked(c:Pxcb_connection_t; cmap:Txcb_colormap_t; name_len:Tuint16_t; name:Pchar):Txcb_alloc_named_color_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_alloc_named_color_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_alloc_named_color_reply(c:Pxcb_connection_t; cookie:Txcb_alloc_named_color_cookie_t; e:PPxcb_generic_error_t):Pxcb_alloc_named_color_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_alloc_color_cells_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_alloc_color_cells(c:Pxcb_connection_t; contiguous:Tuint8_t; cmap:Txcb_colormap_t; colors:Tuint16_t; planes:Tuint16_t):Txcb_alloc_color_cells_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_alloc_color_cells_unchecked(c:Pxcb_connection_t; contiguous:Tuint8_t; cmap:Txcb_colormap_t; colors:Tuint16_t; planes:Tuint16_t):Txcb_alloc_color_cells_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_alloc_color_cells_pixels(R:Pxcb_alloc_color_cells_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_alloc_color_cells_pixels_length(R:Pxcb_alloc_color_cells_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_alloc_color_cells_pixels_end(R:Pxcb_alloc_color_cells_reply_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_alloc_color_cells_masks(R:Pxcb_alloc_color_cells_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_alloc_color_cells_masks_length(R:Pxcb_alloc_color_cells_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_alloc_color_cells_masks_end(R:Pxcb_alloc_color_cells_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_alloc_color_cells_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_alloc_color_cells_reply(c:Pxcb_connection_t; cookie:Txcb_alloc_color_cells_cookie_t; e:PPxcb_generic_error_t):Pxcb_alloc_color_cells_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_alloc_color_planes_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_alloc_color_planes(c:Pxcb_connection_t; contiguous:Tuint8_t; cmap:Txcb_colormap_t; colors:Tuint16_t; reds:Tuint16_t; 
           greens:Tuint16_t; blues:Tuint16_t):Txcb_alloc_color_planes_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_alloc_color_planes_unchecked(c:Pxcb_connection_t; contiguous:Tuint8_t; cmap:Txcb_colormap_t; colors:Tuint16_t; reds:Tuint16_t; 
           greens:Tuint16_t; blues:Tuint16_t):Txcb_alloc_color_planes_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_alloc_color_planes_pixels(R:Pxcb_alloc_color_planes_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_alloc_color_planes_pixels_length(R:Pxcb_alloc_color_planes_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_alloc_color_planes_pixels_end(R:Pxcb_alloc_color_planes_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_alloc_color_planes_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_alloc_color_planes_reply(c:Pxcb_connection_t; cookie:Txcb_alloc_color_planes_cookie_t; e:PPxcb_generic_error_t):Pxcb_alloc_color_planes_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_free_colors_sizeof(_buffer:pointer; pixels_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_free_colors_checked(c:Pxcb_connection_t; cmap:Txcb_colormap_t; plane_mask:Tuint32_t; pixels_len:Tuint32_t; pixels:Puint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_free_colors(c:Pxcb_connection_t; cmap:Txcb_colormap_t; plane_mask:Tuint32_t; pixels_len:Tuint32_t; pixels:Puint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_free_colors_pixels(R:Pxcb_free_colors_request_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_free_colors_pixels_length(R:Pxcb_free_colors_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_free_colors_pixels_end(R:Pxcb_free_colors_request_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_coloritem_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_coloritem_t)
  }
procedure xcb_coloritem_next(i:Pxcb_coloritem_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_coloritem_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_coloritem_end(i:Txcb_coloritem_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_store_colors_sizeof(_buffer:pointer; items_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_store_colors_checked(c:Pxcb_connection_t; cmap:Txcb_colormap_t; items_len:Tuint32_t; items:Pxcb_coloritem_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_store_colors(c:Pxcb_connection_t; cmap:Txcb_colormap_t; items_len:Tuint32_t; items:Pxcb_coloritem_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_store_colors_items(R:Pxcb_store_colors_request_t):Pxcb_coloritem_t;cdecl;external;
(* Const before type ignored *)
function xcb_store_colors_items_length(R:Pxcb_store_colors_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_store_colors_items_iterator(R:Pxcb_store_colors_request_t):Txcb_coloritem_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_store_named_color_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_store_named_color_checked(c:Pxcb_connection_t; flags:Tuint8_t; cmap:Txcb_colormap_t; pixel:Tuint32_t; name_len:Tuint16_t; 
           name:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_store_named_color(c:Pxcb_connection_t; flags:Tuint8_t; cmap:Txcb_colormap_t; pixel:Tuint32_t; name_len:Tuint16_t; 
           name:Pchar):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_store_named_color_name(R:Pxcb_store_named_color_request_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_store_named_color_name_length(R:Pxcb_store_named_color_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_store_named_color_name_end(R:Pxcb_store_named_color_request_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_rgb_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_rgb_t)
  }
procedure xcb_rgb_next(i:Pxcb_rgb_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_rgb_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_rgb_end(i:Txcb_rgb_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_query_colors_sizeof(_buffer:pointer; pixels_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_query_colors(c:Pxcb_connection_t; cmap:Txcb_colormap_t; pixels_len:Tuint32_t; pixels:Puint32_t):Txcb_query_colors_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
(* Const before type ignored *)
function xcb_query_colors_unchecked(c:Pxcb_connection_t; cmap:Txcb_colormap_t; pixels_len:Tuint32_t; pixels:Puint32_t):Txcb_query_colors_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_query_colors_colors(R:Pxcb_query_colors_reply_t):Pxcb_rgb_t;cdecl;external;
(* Const before type ignored *)
function xcb_query_colors_colors_length(R:Pxcb_query_colors_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_query_colors_colors_iterator(R:Pxcb_query_colors_reply_t):Txcb_rgb_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_query_colors_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_query_colors_reply(c:Pxcb_connection_t; cookie:Txcb_query_colors_cookie_t; e:PPxcb_generic_error_t):Pxcb_query_colors_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_lookup_color_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_lookup_color(c:Pxcb_connection_t; cmap:Txcb_colormap_t; name_len:Tuint16_t; name:Pchar):Txcb_lookup_color_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
(* Const before type ignored *)
function xcb_lookup_color_unchecked(c:Pxcb_connection_t; cmap:Txcb_colormap_t; name_len:Tuint16_t; name:Pchar):Txcb_lookup_color_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_lookup_color_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_lookup_color_reply(c:Pxcb_connection_t; cookie:Txcb_lookup_color_cookie_t; e:PPxcb_generic_error_t):Pxcb_lookup_color_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_create_cursor_checked(c:Pxcb_connection_t; cid:Txcb_cursor_t; source:Txcb_pixmap_t; mask:Txcb_pixmap_t; fore_red:Tuint16_t; 
           fore_green:Tuint16_t; fore_blue:Tuint16_t; back_red:Tuint16_t; back_green:Tuint16_t; back_blue:Tuint16_t; 
           x:Tuint16_t; y:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_create_cursor(c:Pxcb_connection_t; cid:Txcb_cursor_t; source:Txcb_pixmap_t; mask:Txcb_pixmap_t; fore_red:Tuint16_t; 
           fore_green:Tuint16_t; fore_blue:Tuint16_t; back_red:Tuint16_t; back_green:Tuint16_t; back_blue:Tuint16_t; 
           x:Tuint16_t; y:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief create cursor
 *
 * @param c The connection
 * @param cid The ID with which you will refer to the cursor, created by `xcb_generate_id`.
 * @param source_font In which font to look for the cursor glyph.
 * @param mask_font In which font to look for the mask glyph.
 * @param source_char The glyph of \a source_font to use.
 * @param mask_char The glyph of \a mask_font to use as a mask: Pixels which are set to 1 define
 * which source pixels are displayed. All pixels which are set to 0 are not
 * displayed.
 * @param fore_red The red value of the foreground color.
 * @param fore_green The green value of the foreground color.
 * @param fore_blue The blue value of the foreground color.
 * @param back_red The red value of the background color.
 * @param back_green The green value of the background color.
 * @param back_blue The blue value of the background color.
 * @return A cookie
 *
 * Creates a cursor from a font glyph. X provides a set of standard cursor shapes
 * in a special font named cursor. Applications are encouraged to use this
 * interface for their cursors because the font can be customized for the
 * individual display type.
 * 
 * All pixels which are set to 1 in the source will use the foreground color (as
 * specified by \a fore_red, \a fore_green and \a fore_blue). All pixels set to 0
 * will use the background color (as specified by \a back_red, \a back_green and
 * \a back_blue).
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_create_glyph_cursor_checked(c:Pxcb_connection_t; cid:Txcb_cursor_t; source_font:Txcb_font_t; mask_font:Txcb_font_t; source_char:Tuint16_t; 
           mask_char:Tuint16_t; fore_red:Tuint16_t; fore_green:Tuint16_t; fore_blue:Tuint16_t; back_red:Tuint16_t; 
           back_green:Tuint16_t; back_blue:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief create cursor
 *
 * @param c The connection
 * @param cid The ID with which you will refer to the cursor, created by `xcb_generate_id`.
 * @param source_font In which font to look for the cursor glyph.
 * @param mask_font In which font to look for the mask glyph.
 * @param source_char The glyph of \a source_font to use.
 * @param mask_char The glyph of \a mask_font to use as a mask: Pixels which are set to 1 define
 * which source pixels are displayed. All pixels which are set to 0 are not
 * displayed.
 * @param fore_red The red value of the foreground color.
 * @param fore_green The green value of the foreground color.
 * @param fore_blue The blue value of the foreground color.
 * @param back_red The red value of the background color.
 * @param back_green The green value of the background color.
 * @param back_blue The blue value of the background color.
 * @return A cookie
 *
 * Creates a cursor from a font glyph. X provides a set of standard cursor shapes
 * in a special font named cursor. Applications are encouraged to use this
 * interface for their cursors because the font can be customized for the
 * individual display type.
 * 
 * All pixels which are set to 1 in the source will use the foreground color (as
 * specified by \a fore_red, \a fore_green and \a fore_blue). All pixels set to 0
 * will use the background color (as specified by \a back_red, \a back_green and
 * \a back_blue).
 *
  }
function xcb_create_glyph_cursor(c:Pxcb_connection_t; cid:Txcb_cursor_t; source_font:Txcb_font_t; mask_font:Txcb_font_t; source_char:Tuint16_t; 
           mask_char:Tuint16_t; fore_red:Tuint16_t; fore_green:Tuint16_t; fore_blue:Tuint16_t; back_red:Tuint16_t; 
           back_green:Tuint16_t; back_blue:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Deletes a cursor
 *
 * @param c The connection
 * @param cursor The cursor to destroy.
 * @return A cookie
 *
 * Deletes the association between the cursor resource ID and the specified
 * cursor. The cursor is freed when no other resource references it.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_free_cursor_checked(c:Pxcb_connection_t; cursor:Txcb_cursor_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Deletes a cursor
 *
 * @param c The connection
 * @param cursor The cursor to destroy.
 * @return A cookie
 *
 * Deletes the association between the cursor resource ID and the specified
 * cursor. The cursor is freed when no other resource references it.
 *
  }
function xcb_free_cursor(c:Pxcb_connection_t; cursor:Txcb_cursor_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_recolor_cursor_checked(c:Pxcb_connection_t; cursor:Txcb_cursor_t; fore_red:Tuint16_t; fore_green:Tuint16_t; fore_blue:Tuint16_t; 
           back_red:Tuint16_t; back_green:Tuint16_t; back_blue:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_recolor_cursor(c:Pxcb_connection_t; cursor:Txcb_cursor_t; fore_red:Tuint16_t; fore_green:Tuint16_t; fore_blue:Tuint16_t; 
           back_red:Tuint16_t; back_green:Tuint16_t; back_blue:Tuint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_query_best_size(c:Pxcb_connection_t; _class:Tuint8_t; drawable:Txcb_drawable_t; width:Tuint16_t; height:Tuint16_t):Txcb_query_best_size_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_query_best_size_unchecked(c:Pxcb_connection_t; _class:Tuint8_t; drawable:Txcb_drawable_t; width:Tuint16_t; height:Tuint16_t):Txcb_query_best_size_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_query_best_size_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_query_best_size_reply(c:Pxcb_connection_t; cookie:Txcb_query_best_size_cookie_t; e:PPxcb_generic_error_t):Pxcb_query_best_size_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_query_extension_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 * @brief check if extension is present
 *
 * @param c The connection
 * @param name_len The length of \a name in bytes.
 * @param name The name of the extension to query, for example "RANDR". This is case
 * sensitive!
 * @return A cookie
 *
 * Determines if the specified extension is present on this X11 server.
 * 
 * Every extension has a unique `major_opcode` to identify requests, the minor
 * opcodes and request formats are extension-specific. If the extension provides
 * events and errors, the `first_event` and `first_error` fields in the reply are
 * set accordingly.
 * 
 * There should rarely be a need to use this request directly, XCB provides the
 * `xcb_get_extension_data` function instead.
 *
  }
(* Const before type ignored *)
function xcb_query_extension(c:Pxcb_connection_t; name_len:Tuint16_t; name:Pchar):Txcb_query_extension_cookie_t;cdecl;external;
{*
 * @brief check if extension is present
 *
 * @param c The connection
 * @param name_len The length of \a name in bytes.
 * @param name The name of the extension to query, for example "RANDR". This is case
 * sensitive!
 * @return A cookie
 *
 * Determines if the specified extension is present on this X11 server.
 * 
 * Every extension has a unique `major_opcode` to identify requests, the minor
 * opcodes and request formats are extension-specific. If the extension provides
 * events and errors, the `first_event` and `first_error` fields in the reply are
 * set accordingly.
 * 
 * There should rarely be a need to use this request directly, XCB provides the
 * `xcb_get_extension_data` function instead.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
(* Const before type ignored *)
function xcb_query_extension_unchecked(c:Pxcb_connection_t; name_len:Tuint16_t; name:Pchar):Txcb_query_extension_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_query_extension_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_query_extension_reply(c:Pxcb_connection_t; cookie:Txcb_query_extension_cookie_t; e:PPxcb_generic_error_t):Pxcb_query_extension_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_extensions_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_list_extensions(c:Pxcb_connection_t):Txcb_list_extensions_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_list_extensions_unchecked(c:Pxcb_connection_t):Txcb_list_extensions_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_extensions_names_length(R:Pxcb_list_extensions_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_list_extensions_names_iterator(R:Pxcb_list_extensions_reply_t):Txcb_str_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_list_extensions_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_list_extensions_reply(c:Pxcb_connection_t; cookie:Txcb_list_extensions_cookie_t; e:PPxcb_generic_error_t):Pxcb_list_extensions_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_change_keyboard_mapping_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_change_keyboard_mapping_checked(c:Pxcb_connection_t; keycode_count:Tuint8_t; first_keycode:Txcb_keycode_t; keysyms_per_keycode:Tuint8_t; keysyms:Pxcb_keysym_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_change_keyboard_mapping(c:Pxcb_connection_t; keycode_count:Tuint8_t; first_keycode:Txcb_keycode_t; keysyms_per_keycode:Tuint8_t; keysyms:Pxcb_keysym_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_change_keyboard_mapping_keysyms(R:Pxcb_change_keyboard_mapping_request_t):Pxcb_keysym_t;cdecl;external;
(* Const before type ignored *)
function xcb_change_keyboard_mapping_keysyms_length(R:Pxcb_change_keyboard_mapping_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_change_keyboard_mapping_keysyms_end(R:Pxcb_change_keyboard_mapping_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_keyboard_mapping_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_get_keyboard_mapping(c:Pxcb_connection_t; first_keycode:Txcb_keycode_t; count:Tuint8_t):Txcb_get_keyboard_mapping_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_keyboard_mapping_unchecked(c:Pxcb_connection_t; first_keycode:Txcb_keycode_t; count:Tuint8_t):Txcb_get_keyboard_mapping_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_keyboard_mapping_keysyms(R:Pxcb_get_keyboard_mapping_reply_t):Pxcb_keysym_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_keyboard_mapping_keysyms_length(R:Pxcb_get_keyboard_mapping_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_get_keyboard_mapping_keysyms_end(R:Pxcb_get_keyboard_mapping_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_keyboard_mapping_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_keyboard_mapping_reply(c:Pxcb_connection_t; cookie:Txcb_get_keyboard_mapping_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_keyboard_mapping_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_change_keyboard_control_value_list_serialize(_buffer:Ppointer; value_mask:Tuint32_t; _aux:Pxcb_change_keyboard_control_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_change_keyboard_control_value_list_unpack(_buffer:pointer; value_mask:Tuint32_t; _aux:Pxcb_change_keyboard_control_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_change_keyboard_control_value_list_sizeof(_buffer:pointer; value_mask:Tuint32_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_change_keyboard_control_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_change_keyboard_control_checked(c:Pxcb_connection_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_change_keyboard_control(c:Pxcb_connection_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_change_keyboard_control_aux_checked(c:Pxcb_connection_t; value_mask:Tuint32_t; value_list:Pxcb_change_keyboard_control_value_list_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_change_keyboard_control_aux(c:Pxcb_connection_t; value_mask:Tuint32_t; value_list:Pxcb_change_keyboard_control_value_list_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_change_keyboard_control_value_list(R:Pxcb_change_keyboard_control_request_t):pointer;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_get_keyboard_control(c:Pxcb_connection_t):Txcb_get_keyboard_control_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_keyboard_control_unchecked(c:Pxcb_connection_t):Txcb_get_keyboard_control_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_keyboard_control_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_keyboard_control_reply(c:Pxcb_connection_t; cookie:Txcb_get_keyboard_control_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_keyboard_control_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_bell_checked(c:Pxcb_connection_t; percent:Tint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_bell(c:Pxcb_connection_t; percent:Tint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_change_pointer_control_checked(c:Pxcb_connection_t; acceleration_numerator:Tint16_t; acceleration_denominator:Tint16_t; threshold:Tint16_t; do_acceleration:Tuint8_t; 
           do_threshold:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_change_pointer_control(c:Pxcb_connection_t; acceleration_numerator:Tint16_t; acceleration_denominator:Tint16_t; threshold:Tint16_t; do_acceleration:Tuint8_t; 
           do_threshold:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_get_pointer_control(c:Pxcb_connection_t):Txcb_get_pointer_control_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_pointer_control_unchecked(c:Pxcb_connection_t):Txcb_get_pointer_control_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_pointer_control_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_pointer_control_reply(c:Pxcb_connection_t; cookie:Txcb_get_pointer_control_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_pointer_control_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_set_screen_saver_checked(c:Pxcb_connection_t; timeout:Tint16_t; interval:Tint16_t; prefer_blanking:Tuint8_t; allow_exposures:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_set_screen_saver(c:Pxcb_connection_t; timeout:Tint16_t; interval:Tint16_t; prefer_blanking:Tuint8_t; allow_exposures:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_get_screen_saver(c:Pxcb_connection_t):Txcb_get_screen_saver_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_screen_saver_unchecked(c:Pxcb_connection_t):Txcb_get_screen_saver_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_screen_saver_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_screen_saver_reply(c:Pxcb_connection_t; cookie:Txcb_get_screen_saver_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_screen_saver_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_change_hosts_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_change_hosts_checked(c:Pxcb_connection_t; mode:Tuint8_t; family:Tuint8_t; address_len:Tuint16_t; address:Puint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_change_hosts(c:Pxcb_connection_t; mode:Tuint8_t; family:Tuint8_t; address_len:Tuint16_t; address:Puint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_change_hosts_address(R:Pxcb_change_hosts_request_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_change_hosts_address_length(R:Pxcb_change_hosts_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_change_hosts_address_end(R:Pxcb_change_hosts_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_host_sizeof(_buffer:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xcb_host_address(R:Pxcb_host_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_host_address_length(R:Pxcb_host_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_host_address_end(R:Pxcb_host_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_host_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_host_t)
  }
procedure xcb_host_next(i:Pxcb_host_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_host_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_host_end(i:Txcb_host_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_hosts_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_list_hosts(c:Pxcb_connection_t):Txcb_list_hosts_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_list_hosts_unchecked(c:Pxcb_connection_t):Txcb_list_hosts_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_list_hosts_hosts_length(R:Pxcb_list_hosts_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_list_hosts_hosts_iterator(R:Pxcb_list_hosts_reply_t):Txcb_host_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_list_hosts_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_list_hosts_reply(c:Pxcb_connection_t; cookie:Txcb_list_hosts_cookie_t; e:PPxcb_generic_error_t):Pxcb_list_hosts_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_set_access_control_checked(c:Pxcb_connection_t; mode:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_set_access_control(c:Pxcb_connection_t; mode:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_set_close_down_mode_checked(c:Pxcb_connection_t; mode:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_set_close_down_mode(c:Pxcb_connection_t; mode:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief kills a client
 *
 * @param c The connection
 * @param resource Any resource belonging to the client (for example a Window), used to identify
 * the client connection.
 * \n
 * The special value of `XCB_KILL_ALL_TEMPORARY`, the resources of all clients
 * that have terminated in `RetainTemporary` (TODO) are destroyed.
 * @return A cookie
 *
 * Forces a close down of the client that created the specified \a resource.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_kill_client_checked(c:Pxcb_connection_t; resource:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief kills a client
 *
 * @param c The connection
 * @param resource Any resource belonging to the client (for example a Window), used to identify
 * the client connection.
 * \n
 * The special value of `XCB_KILL_ALL_TEMPORARY`, the resources of all clients
 * that have terminated in `RetainTemporary` (TODO) are destroyed.
 * @return A cookie
 *
 * Forces a close down of the client that created the specified \a resource.
 *
  }
function xcb_kill_client(c:Pxcb_connection_t; resource:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_rotate_properties_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_rotate_properties_checked(c:Pxcb_connection_t; window:Txcb_window_t; atoms_len:Tuint16_t; delta:Tint16_t; atoms:Pxcb_atom_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_rotate_properties(c:Pxcb_connection_t; window:Txcb_window_t; atoms_len:Tuint16_t; delta:Tint16_t; atoms:Pxcb_atom_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_rotate_properties_atoms(R:Pxcb_rotate_properties_request_t):Pxcb_atom_t;cdecl;external;
(* Const before type ignored *)
function xcb_rotate_properties_atoms_length(R:Pxcb_rotate_properties_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_rotate_properties_atoms_end(R:Pxcb_rotate_properties_request_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_force_screen_saver_checked(c:Pxcb_connection_t; mode:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_force_screen_saver(c:Pxcb_connection_t; mode:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_set_pointer_mapping_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_set_pointer_mapping(c:Pxcb_connection_t; map_len:Tuint8_t; map:Puint8_t):Txcb_set_pointer_mapping_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
(* Const before type ignored *)
function xcb_set_pointer_mapping_unchecked(c:Pxcb_connection_t; map_len:Tuint8_t; map:Puint8_t):Txcb_set_pointer_mapping_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_set_pointer_mapping_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_set_pointer_mapping_reply(c:Pxcb_connection_t; cookie:Txcb_set_pointer_mapping_cookie_t; e:PPxcb_generic_error_t):Pxcb_set_pointer_mapping_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_pointer_mapping_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_get_pointer_mapping(c:Pxcb_connection_t):Txcb_get_pointer_mapping_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_pointer_mapping_unchecked(c:Pxcb_connection_t):Txcb_get_pointer_mapping_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_pointer_mapping_map(R:Pxcb_get_pointer_mapping_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_pointer_mapping_map_length(R:Pxcb_get_pointer_mapping_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_get_pointer_mapping_map_end(R:Pxcb_get_pointer_mapping_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_pointer_mapping_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_pointer_mapping_reply(c:Pxcb_connection_t; cookie:Txcb_get_pointer_mapping_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_pointer_mapping_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_set_modifier_mapping_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_set_modifier_mapping(c:Pxcb_connection_t; keycodes_per_modifier:Tuint8_t; keycodes:Pxcb_keycode_t):Txcb_set_modifier_mapping_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
(* Const before type ignored *)
function xcb_set_modifier_mapping_unchecked(c:Pxcb_connection_t; keycodes_per_modifier:Tuint8_t; keycodes:Pxcb_keycode_t):Txcb_set_modifier_mapping_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_set_modifier_mapping_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_set_modifier_mapping_reply(c:Pxcb_connection_t; cookie:Txcb_set_modifier_mapping_cookie_t; e:PPxcb_generic_error_t):Pxcb_set_modifier_mapping_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_modifier_mapping_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_get_modifier_mapping(c:Pxcb_connection_t):Txcb_get_modifier_mapping_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_get_modifier_mapping_unchecked(c:Pxcb_connection_t):Txcb_get_modifier_mapping_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_modifier_mapping_keycodes(R:Pxcb_get_modifier_mapping_reply_t):Pxcb_keycode_t;cdecl;external;
(* Const before type ignored *)
function xcb_get_modifier_mapping_keycodes_length(R:Pxcb_get_modifier_mapping_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_get_modifier_mapping_keycodes_end(R:Pxcb_get_modifier_mapping_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_get_modifier_mapping_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_get_modifier_mapping_reply(c:Pxcb_connection_t; cookie:Txcb_get_modifier_mapping_cookie_t; e:PPxcb_generic_error_t):Pxcb_get_modifier_mapping_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_no_operation_checked(c:Pxcb_connection_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_no_operation(c:Pxcb_connection_t):Txcb_void_cookie_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.

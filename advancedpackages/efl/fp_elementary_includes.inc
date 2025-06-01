



{$include elementary-1/elm_general.inc}                                         // io.     ( makro ELM_MAIN entfernt )
{$include elementary-1/elm_win_legacy.inc}                                      // io.     ( Doppelt Methoden evtl. Bug in C-Hedader )
{$include elementary-1/elm_box_legacy.inc}                                      // io.
{$include elementary-1/elm_box_eo_legacy.inc}                                   // io.
{$include elementary-1/elm_button_legacy.inc}                                   // io.
{$include elementary-1/elm_entry_common.inc}                                    // io. -> elm_general
{$include elementary-1/elm_entry_eo_legacy.inc}                                 // io. -> elm_general, elm_entry_common
{$include elementary-1/elm_entry_legacy.inc}                                    // io. -> elm_general
{$include elementary-1/elm_object.inc}                                          // io. -> elm_general
{$include elementary-1/elm_config.inc}                                          // io. -> elm_general
{$include elementary-1/elm_scroller_legacy.inc}                                 // io.
{$include elementary-1/elm_widget_map.inc}                                      // io. -> elm_map_common, elm_map_eo_legacy
{$include elementary-1/elm_map_legacy.inc}                                      // io.
{$include elementary-1/elm_map_eo_legacy.inc}                                   // io. -> elm_map_common
{$include elementary-1/elm_map_common.inc}                                      // io.
{$include elementary-1/elm_tooltip.inc}                                         // io.
{$include elementary-1/elm_widget_item_eo_legacy.inc}                           // io. -> elm_general, elm_tooltip
{$include elementary-1/elm_object_item.inc}                                     // io. -> elm_widget_item_eo_legacy
{$include elementary-1/elm_access.inc}                                          // io. -> elm_object_item, elm_widget_item_eo_legacy
{$include elementary-1/elm_entry_eo.inc}                                        // io. -> elm_general, elm_entry_common
{$include elementary-1/elm_pan_eo_legacy.inc}                                   // io.
{$include elementary-1/elm_interface_scrollable.inc}                            // io. -> elm_scroller_legacy, elm_pan_eo_legacy
{$include elementary-1/elm_interface_scrollable_eo.inc}                         // io. -> elm_interface_scrollable
{$include elementary-1/elm_transit.inc}                                         // io.
{$include elementary-1/elm_theme.inc}                                           // io.
{$include elementary-1/elm_gen.inc}                                             // io. -> elm_general
{$include elementary-1/elm_genlist_eo_legacy.inc}                               // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen
{$include elementary-1/elm_layout_legacy.inc}                                   // io.
{$include elementary-1/elm_cnp.inc}                                             // io. -> elm_widget_item_eo_legacy
{$include elementary-1/elm_code_common.inc}                                     // io.
{$include elementary-1/elm_code_line.inc}                                       // io. -> elm_code_common
{$include elementary-1/elm_code.inc}                                            // io. -> elm_code_common
{$include elementary-1/elm_code_diff_widget.inc}                                // io. -> elm_code_common
{$include elementary-1/elm_code_widget_legacy.inc}                              // io. -> elm_code_common
{$include elementary-1/elm_code_text.inc}                                       // io. -> elm_code_line
{$include elementary-1/elm_code_indent.inc}                                     // io. -> elm_code_line
{$include elementary-1/elm_code_widget_eo.inc}                                  // io. -> elm_code_common, elm_code_line
{$include elementary-1/elm_code_file.inc}                                       // io. -> elm_code_common, elm_code_line
{$include elementary-1/elm_code_parse.inc}                                      // io. -> elm_code_common, elm_code_line
{$include elementary-1/elm_code_syntax.inc}                                     // io. -> elm_code_common, elm_code_line
{$include elementary-1/elm_code_widget_eo_legacy.inc}                           // io. -> elm_code_common, elm_code_line, elm_scroller_legacy
{$include elementary-1/elm_code_widget_selection.inc}                           // io.
{$include elementary-1/elm_code_widget_legacy_eo_legacy.inc}                    // io.
{$include elementary-1/elm_genlist_item_eo_legacy.inc}                          // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen
{$include elementary-1/elm_widget_genlist.inc}                                  // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen
{$include elementary-1/elm_list_eo_legacy.inc}                                  // io. -> elm_general, elm_widget_item_eo_legacy
{$include elementary-1/elm_image_legacy.inc}                                    // io.
{$include elementary-1/elm_icon_eo_legacy.inc}                                  // io.
{$include elementary-1/elm_icon_legacy.inc}                                     // io.
{$include elementary-1/elm_store.inc}                                           // io. -> elm_widget_item_eo_legacy, elm_icon_legacy, elm_gen
{$include elementary-1/elm_toolbar_eo.inc}                                      // io. -> elm_general, elm_widget_item_eo_legacy
{$include elementary-1/elm_toolbar_eo_legacy.inc}                               // io. -> elm_general, elm_widget_item_eo_legacy
{$include elementary-1/elm_toolbar_common.inc}                                  // io. -> elm_widget_item_eo_legacy
{$include elementary-1/elm_toolbar_item_eo_legacy.inc}                          // io. -> elm_widget_item_eo_legacy
{$include elementary-1/elm_toolbar_legacy.inc}                                  // io. -> elm_icon_legacy
{$include elementary-1/elm_web_common.inc}                                      // io.
{$include elementary-1/elm_web_eo.inc}                                          // io. -> elm_web_common
{$include elementary-1/elm_web_eo_legacy.inc}                                   // io. -> elm_web_common
{$include elementary-1/efl_ui_textpath_eo_legacy.inc}                           // io.
{$include elementary-1/efl_ui_win_eo.inc}                                       // io.
{$include elementary-1/efl_ui_eot.inc}                                          // io.
{$include elementary-1/efl_ui_focus_object_eo.inc}                              // io.
{$include elementary-1/efl_ui_widget_eo.inc}                                    // io. -> efl_ui_focus_object_eo, efl_ui_eot
{$include elementary-1/efl_ui_widget_eo_legacy.inc}                             // io. -> efl_ui_focus_object_eo
{$include elementary-1/efl_ui_focus_composition_eo.inc}                         // io.
{$include elementary-1/efl_ui_focus_layer_eo.inc}                               // io.
{$include elementary-1/efl_ui_focus_manager_calc_eo.inc}                        // io. -> efl_ui_focus_object_eo
{$include elementary-1/efl_ui_focus_manager_root_focus_eo.inc}                  // io.
{$include elementary-1/efl_ui_focus_manager_sub_eo.inc}                         // io.
{$include elementary-1/efl_ui_focus_manager_window_root_eo.inc}                 // io.
{$include elementary-1/efl_ui_focus_util_eo.inc}                                // io. -> efl_ui_focus_object_eo, efl_ui_eot
{$include elementary-1/efl_ui_focus_manager_eo.inc}                             // io. -> efl_ui_focus_object_eo, efl_ui_eot
{$include elementary-1/efl_ui_flip_eo.inc}                                      // io.
{$include elementary-1/efl_ui_clock_eo.inc}                                     // io.
{$include elementary-1/efl_ui_spotlight_animation_manager_eo.inc}               // io.
{$include elementary-1/efl_ui_spotlight_fade_manager_eo.inc}                    // io.
{$include elementary-1/efl_ui_spotlight_icon_indicator_eo.inc}                  // io.
{$include elementary-1/efl_ui_spotlight_manager_eo.inc}                         // io.
{$include elementary-1/efl_ui_spotlight_indicator_eo.inc}                       // io. -> efl_ui_spotlight_manager_eo
{$include elementary-1/efl_ui_spotlight_container_eo.inc}                       // io. -> efl_ui_widget_eo, efl_ui_spotlight_manager_eo, efl_ui_spotlight_indicator_eo
{$include elementary-1/efl_ui_spotlight_scroll_manager_eo.inc}                  // io.
{$include elementary-1/efl_ui_spotlight_util_eo.inc}                            // io. -> efl_ui_widget_eo, efl_ui_spotlight_manager_eo
{$include elementary-1/efl_ui_format_eo.inc}                                    // io.
{$include elementary-1/efl_ui_popup_eo.inc}                                     // io.
{$include elementary-1/efl_ui_relative_container_eo.inc}                        // io.
{$include elementary-1/efl_ui_vg_animation_eo.inc}                              // io.
{$include elementary-1/efl_ui_layout_base_eo.inc}                               // io.
{$include elementary-1/efl_ui_textbox_eo.inc}                                   // io.
{$include elementary-1/efl_ui_view_model_eo.inc}                                // io.
{$include elementary-1/efl_ui_dnd_eo.inc}                                       // io.
{$include elementary-1/efl_ui_flip_legacy.inc}                                  // io.
{$include elementary-1/efl_ui_flip_legacy_eo_legacy.inc}                        // io.
{$include elementary-1/efl_ui_flip_part_eo.inc}                                 // io.
{$include elementary-1/efl_ui_flip_eo_legacy.inc}                               // io. -> efl_ui_flip_legacy
{$include elementary-1/efl_ui_image_zoomable_private.inc}                       // io.
{$include elementary-1/efl_ui_relative_container_private.inc}                   // io.
{$include elementary-1/efl_ui_calendar_eo.inc}                                  // io.
{$include elementary-1/efl_ui_image_zoomable_eo.inc}                            // io.
{$include elementary-1/efl_ui_selection_eo.inc}                                 // io.
{$include elementary-1/efl_ui_spin_button_eo.inc}                               // io.
{$include elementary-1/efl_ui_tags_eo.inc}                                      // io.
{$include elementary-1/efl_ui_widget_image.inc}                                 // io.
{$include elementary-1/efl_ui_widget_scroll_manager.inc}                        // io.
{$include elementary-1/efl_ui_widget_scrollable_content_eo.inc}                 // io.
{$include elementary-1/efl_ui_widget_flip.inc}                                  // io.
{$include elementary-1/efl_ui_datepicker_eo.inc}                                // io.
{$include elementary-1/efl_ui_video_legacy.inc}                                 // io.
{$include elementary-1/efl_ui_item_eo.inc}                                      // io.
{$include elementary-1/efl_ui_item_clickable_eo.inc}                            // io. -> efl_ui_item_eo
{$include elementary-1/efl_ui_position_manager_data_access_v1_eo.inc}           // io. -> efl_ui_item_eo
{$include elementary-1/efl_ui_position_manager_entity_eo.inc}                   // io.
{$include elementary-1/efl_ui_position_manager_grid_eo.inc}                     // io.
{$include elementary-1/efl_ui_position_manager_list_eo.inc}                     // io.
{$include elementary-1/efl_ui_collection_view_eo.inc}                           // io. -> efl_ui_position_manager_entity_eo
{$include elementary-1/efl_ui_collection_eo.inc}                                // io. -> efl_ui_item_eo, efl_ui_position_manager_entity_eo
{$include elementary-1/efl_ui_image_eo.inc}                                     // io.
{$include elementary-1/efl_ui_pan_eo.inc}                                       // io.
{$include elementary-1/efl_ui_multi_selectable_index_range_eo.inc}              // io.
{$include elementary-1/efl_ui_panel_eo.inc}                                     // io.
{$include elementary-1/efl_ui_progressbar_eo.inc}                               // io.
{$include elementary-1/efl_ui_radio_box_eo.inc}                                 // io.
{$include elementary-1/efl_ui_radio_eo.inc}                                     // io.
{$include elementary-1/efl_ui_radio_group_impl_eo.inc}                          // io.
{$include elementary-1/efl_ui_radio_legacy_eo_legacy.inc}                       // io.
{$include elementary-1/efl_ui_radio_legacy_part_eo.inc}                         // io.
{$include elementary-1/efl_ui_radio_private.inc}                                // io.
{$include elementary-1/efl_ui_radio_eo_legacy.inc}                              // io.
{$include elementary-1/efl_ui_radio_group_eo.inc}                               // io. -> efl_ui_radio_eo_legacy
{$include elementary-1/efl_ui_select_model_eo.inc}                              // io.
{$include elementary-1/efl_ui_separator_eo.inc}                                 // io.
{$include elementary-1/efl_ui_selectable_eo.inc}                                // io.
{$include elementary-1/efl_ui_multi_selectable_object_range_eo.inc}             // io. -> efl_ui_selectable_eo
{$include elementary-1/efl_ui_single_selectable_eo.inc}                         // io. -> efl_ui_selectable_eo
{$include elementary-1/efl_ui_alert_popup_eo.inc}                               // io.
{$include elementary-1/efl_ui_caching_factory_eo.inc}                           // io.
{$include elementary-1/efl_ui_text_factory_images_eo.inc}                       // io.
{$include elementary-1/efl_ui_panes_eo.inc}                                     // io.
{$include elementary-1/efl_ui_theme_eo.inc}                                     // io.
{$include elementary-1/efl_ui_action_connector_eo.inc}                          // io.
{$include elementary-1/efl_ui_alert_popup_part_title_eo.inc}                    // io.
{$include elementary-1/efl_ui_alert_popup_private.inc}                          // io.
{$include elementary-1/efl_ui_bg_eo.inc}                                        // io.
{$include elementary-1/efl_ui_bg_legacy_eo_legacy.inc}                          // io.
{$include elementary-1/efl_ui_bg_private.inc}                                   // io.
{$include elementary-1/efl_ui_box_eo.inc}                                       // io.
{$include elementary-1/efl_ui_box_flow_eo.inc}                                  // io.
{$include elementary-1/efl_ui_box_stack_eo.inc}                                 // io.
{$include elementary-1/efl_ui_button_eo.inc}                                    // io.
{$include elementary-1/efl_ui_button_legacy_eo_legacy.inc}                      // io.
{$include elementary-1/efl_ui_button_legacy_part_eo.inc}                        // io.
{$include elementary-1/efl_ui_button_private.inc}                               // io.
{$include elementary-1/efl_ui_check_eo.inc}                                     // io.
{$include elementary-1/efl_ui_check_eo_legacy.inc}                              // io.
{$include elementary-1/efl_ui_check_legacy_eo_legacy.inc}                       // io.
{$include elementary-1/efl_ui_check_legacy_part_eo.inc}                         // io.
{$include elementary-1/efl_ui_check_private.inc}                                // io.
{$include elementary-1/efl_ui_calendar_item_eo.inc}                             // io.
{$include elementary-1/efl_ui_calendar_private.inc}                             // io.
{$include elementary-1/efl_ui_clock_legacy_eo.inc}                              // io.
{$include elementary-1/efl_ui_collection_view_focus_manager_eo.inc}             // io.
{$include elementary-1/efl_ui_datepicker_private.inc}                           // io.
{$include elementary-1/efl_ui_default_item_eo.inc}                              // io.
{$include elementary-1/efl_ui_frame_eo.inc}                                     // io.
{$include elementary-1/efl_ui_frame_eo_legacy.inc}                              // io.
{$include elementary-1/efl_ui_frame_legacy.inc}                                 // io.
{$include elementary-1/efl_ui_frame_legacy_eo_legacy.inc}                       // io.
{$include elementary-1/efl_ui_grid_default_item_eo.inc}                         // io.
{$include elementary-1/efl_ui_grid_eo.inc}                                      // io.
{$include elementary-1/efl_ui_grid_view_eo.inc}                                 // io.
{$include elementary-1/efl_ui_group_item_eo.inc}                                // io.
{$include elementary-1/efl_ui_image_factory_eo.inc}                             // io.
{$include elementary-1/efl_ui_image_legacy_eo_legacy.inc}                       // io.
{$include elementary-1/efl_ui_image_zoomable_eo_legacy.inc}                     // io.
{$include elementary-1/efl_ui_image_zoomable_legacy_eo_legacy.inc}              // io.
{$include elementary-1/efl_ui_image_zoomable_pan_eo.inc}                        // io.
{$include elementary-1/efl_ui_item_private.inc}                                 // io.
{$include elementary-1/efl_ui_l10n_eo.inc}                                      // io.
{$include elementary-1/efl_ui_layout_eo.inc}                                    // io.
{$include elementary-1/efl_ui_layout_factory_eo.inc}                            // io.
{$include elementary-1/efl_ui_layout_legacy_eo_legacy.inc}                      // io.
{$include elementary-1/efl_ui_layout_part_bg_eo.inc}                            // io.
{$include elementary-1/efl_ui_layout_part_box_eo.inc}                           // io.
{$include elementary-1/efl_ui_layout_part_content_eo.inc}                       // io.
{$include elementary-1/efl_ui_layout_part_eo.inc}                               // io.
{$include elementary-1/efl_ui_layout_part_legacy_eo.inc}                        // io.
{$include elementary-1/efl_ui_layout_part_table_eo.inc}                         // io.
{$include elementary-1/efl_ui_layout_part_text_eo.inc}                          // io.
{$include elementary-1/efl_ui_legacy_eo.inc}                                    // io.
{$include elementary-1/efl_ui_list_default_item_eo.inc}                         // io.
{$include elementary-1/efl_ui_list_eo.inc}                                      // io.
{$include elementary-1/efl_ui_list_placeholder_item_eo.inc}                     // io.
{$include elementary-1/efl_ui_list_view_eo.inc}                                 // io.
{$include elementary-1/efl_ui_multi_selectable_eo.inc}                          // io.
{$include elementary-1/efl_ui_navigation_bar_eo.inc}                            // io.
{$include elementary-1/efl_ui_navigation_bar_part_back_button_eo.inc}           // io.
{$include elementary-1/efl_ui_navigation_bar_part_eo.inc}                       // io.
{$include elementary-1/efl_ui_navigation_bar_private.inc}                       // io.
{$include elementary-1/efl_ui_navigation_layout_eo.inc}                         // io.
{$include elementary-1/efl_ui_navigation_layout_private.inc}                    // io. -> efl_ui_layout_eo
{$include elementary-1/efl_ui_pager_eo.inc}                                     // io.
{$include elementary-1/efl_ui_panel_private.inc}                                // io.
{$include elementary-1/efl_ui_panes_eo_legacy.inc}                              // io.
{$include elementary-1/efl_ui_panes_legacy_eo_legacy.inc}                       // io.
{$include elementary-1/efl_ui_panes_part_eo.inc}                                // io.
{$include elementary-1/efl_ui_panes_private.inc}                                // io.
{$include elementary-1/efl_ui_popup_part_backwall_eo.inc}                       // io.
{$include elementary-1/efl_ui_popup_private.inc}                                // io.
{$include elementary-1/efl_ui_progressbar_legacy_eo_legacy.inc}                 // io.
{$include elementary-1/efl_ui_progressbar_legacy_part_eo.inc}                   // io.
{$include elementary-1/efl_ui_progressbar_part_eo.inc}                          // io.
{$include elementary-1/efl_ui_progressbar_private.inc}                          // io.
{$include elementary-1/efl_ui_property_bind_part_eo.inc}                        // io.
{$include elementary-1/efl_ui_scroller_eo.inc}                                  // io.
{$include elementary-1/efl_ui_scroll_manager_eo.inc}                            // io.
{$include elementary-1/efl_ui_slider_eo.inc}                                    // io.
{$include elementary-1/efl_ui_slider_interval_eo.inc}                           // io.
{$include elementary-1/efl_ui_slider_interval_private.inc}                      // io.
{$include elementary-1/efl_ui_slider_private.inc}                               // io.
{$include elementary-1/efl_ui_spin_button_private.inc}                          // io.
{$include elementary-1/efl_ui_spin_eo.inc}                                      // io.
{$include elementary-1/efl_ui_spin_private.inc}                                 // io.
{$include elementary-1/efl_ui_stack_eo.inc}                                     // io.
{$include elementary-1/efl_ui_tab_bar_private.inc}                              // io.
{$include elementary-1/efl_ui_tab_bar_default_item_eo.inc}                      // io.
{$include elementary-1/efl_ui_tab_page_eo.inc}                                  // io. -> efl_ui_tab_bar_default_item_eo
{$include elementary-1/efl_ui_tab_page_private.inc}                             // io.
{$include elementary-1/efl_ui_tab_bar_eo.inc}                                   // io.
{$include elementary-1/efl_ui_tab_pager_eo.inc}                                 // io. -> efl_ui_tab_bar_eo
{$include elementary-1/efl_ui_tab_pager_private.inc}                            // io.
{$include elementary-1/efl_ui_table_eo.inc}                                     // io.
{$include elementary-1/efl_ui_table_static_eo.inc}                              // io.
{$include elementary-1/efl_ui_tags_private.inc}                                 // io.
{$include elementary-1/efl_ui_textbox_async_eo.inc}                             // io.
{$include elementary-1/efl_ui_textbox_part_eo.inc}                              // io.
{$include elementary-1/efl_ui_text_factory_emoticons_eo.inc}                    // io.
{$include elementary-1/efl_ui_text_factory_fallback_eo.inc}                     // io.
{$include elementary-1/efl_ui_textpath_eo.inc}                                  // io.
{$include elementary-1/efl_ui_textpath_legacy_eo_legacy.inc}                    // io.
{$include elementary-1/efl_ui_textpath_part_eo.inc}                             // io.
{$include elementary-1/efl_ui_timepicker_eo.inc}                                // io.
{$include elementary-1/efl_ui_timepicker_private.inc}                           // io.
{$include elementary-1/efl_ui_vg_animation_eo_legacy.inc}                       // io.
{$include elementary-1/efl_ui_vg_animation_legacy.inc}                          // io.
{$include elementary-1/efl_ui_vg_animation_private.inc}                         // io.
{$include elementary-1/efl_ui_video_eo.inc}                                     // io.
{$include elementary-1/efl_ui_video_eo_legacy.inc}                              // io.
{$include elementary-1/efl_ui_video_legacy_eo_legacy.inc}                       // io.
{$include elementary-1/efl_ui_video_private.inc}                                // io.
{$include elementary-1/efl_ui_widget_common.inc}                                // io.
{$include elementary-1/efl_ui_widget_factory_eo.inc}                            // io.
{$include elementary-1/efl_ui_widget_focus_manager_eo.inc}                      // io.
{$include elementary-1/efl_ui_widget_frame.inc}                                 // io.
{$include elementary-1/efl_ui_widget_pan.inc}                                   // io.
{$include elementary-1/efl_ui_widget_part_bg_eo.inc}                            // io.
{$include elementary-1/efl_ui_widget_part_eo.inc}                               // io.
{$include elementary-1/efl_ui_widget_part_shadow_eo.inc}                        // io.
{$include elementary-1/efl_ui_widget_scroller.inc}                              // io.
{$include elementary-1/efl_ui_win_inlined_eo.inc}                               // io.
{$include elementary-1/efl_ui_win_inlined_legacy_eo_legacy.inc}                 // io.
{$include elementary-1/efl_ui_win_legacy_eo_legacy.inc}                         // io.
{$include elementary-1/efl_ui_win_part_eo.inc}                                  // io.
{$include elementary-1/efl_ui_win_socket_eo.inc}                                // io.
{$include elementary-1/efl_ui_win_socket_legacy_eo_legacy.inc}                  // io.
{$include elementary-1/Efl_Ui.inc}                                              // io. -> efl_ui_focus_manager_eo, efl_ui_win_eo
{$include elementary-1/elm_widget.inc}                                          // io. -> elm_widget_item_eo_legacy, elm_theme, efl_ui_widget_eo_legacy, efl_ui_focus_object_eo, elm_access, efl_ui_eot
{$include elementary-1/elm_widget_toolbar.inc}                                  // io. -> elm_general, elm_widget_item_eo_legacy, elm_toolbar_eo_legacy, elm_widget, elm_transit
{$include elementary-1/elm_gen_common.inc}                                      // io. -> elm_tooltip, elm_widget, elm_widget_genlist, elm_gen
{$include elementary-1/efl_access_object_eo.inc}                                // io.
{$include elementary-1/elm_calendar_item_eo_legacy.inc}                         // io.
{$include elementary-1/elm_calendar_common.inc}                                 // io.
{$include elementary-1/elm_calendar_eo_legacy.inc}                              // io. -> elm_calendar_common
{$include elementary-1/elm_calendar_legacy.inc}                                 // io. -> elm_calendar_eo_legacy
{$include elementary-1/elm_clock_eo_legacy.inc}                                 // io.
{$include elementary-1/elm_clock_legacy.inc}                                    // io.
{$include elementary-1/elm_clock_eo.inc}                                        // io.
{$include elementary-1/elm_datetime.inc}                                        // io. -> elm_clock_eo
{$include elementary-1/elm_interface_fileselector.inc}                          // io.
{$include elementary-1/elm_interface_fileselector_eo_legacy.inc}                // io.
{$include elementary-1/elm_fileselector_button_eo_legacy.inc}                   // io.
{$include elementary-1/elm_fileselector_entry_eo_legacy.inc}                    // io.
{$include elementary-1/elm_fileselector_entry_part_eo.inc}                      // io.
{$include elementary-1/elm_fileselector_eo_legacy.inc}                          // io.
{$include elementary-1/elm_fileselector_part_eo.inc}                            // io.
{$include elementary-1/elc_fileselector_common.inc}                             // io.
{$include elementary-1/elc_fileselector_legacy.inc}                             // io. -> elm_interface_fileselector_eo_legacy, elc_fileselector_common
{$include elementary-1/elc_fileselector_button_legacy.inc}                      // io. -> elm_fileselector_button_eo_legacy
{$include elementary-1/elc_fileselector_entry_legacy.inc}                       // io. -> elm_fileselector_entry_eo_legacy
{$include elementary-1/elm_focus.inc}                                           // io. -> elm_general
{$include elementary-1/elm_gengrid_eo_legacy.inc}                               // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen
{$include elementary-1/elm_gengrid_common.inc}                                  // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen, elm_tooltip
{$include elementary-1/elm_gengrid_item_eo_legacy.inc}                          // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen
{$include elementary-1/elm_gengrid_legacy.inc}                                  // io. -> elm_widget_item_eo_legacy, elm_scroller_legacy
{$include elementary-1/elm_gengrid_pan_eo_legacy.inc}                           // io.
{$include elementary-1/elm_widget_gengrid.inc}                                  // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen, elm_gengrid_eo_legacy
{$include elementary-1/elm_slideshow_common.inc}                                // io.
{$include elementary-1/elm_slideshow_eo_legacy.inc}                             // io. -> elm_widget_item_eo_legacy, elm_slideshow_common
{$include elementary-1/elm_slideshow_item_eo_legacy.inc}                        // io.
{$include elementary-1/elm_slideshow_legacy.inc}                                // io.
{$include elementary-1/elm_slider_common.inc}                                   // io.
{$include elementary-1/elm_slider_legacy.inc}                                   // io. -> elm_general, elm_slider_common
{$include elementary-1/elm_slider_part_indicator_eo_legacy.inc}                 // io.
{$include elementary-1/efl_access_text_eo.inc}                                  // io.
{$include elementary-1/elm_genlist_common.inc}                                  // io. -> elm_widget_item_eo_legacy, elm_gen, elm_tooltip
{$include elementary-1/elm_prefs_data.inc}                                      // io.
{$include elementary-1/elm_prefs_common.inc}                                    // io. -> elm_prefs_data
{$include elementary-1/elm_gesture_layer_common.inc}                            // io.
{$include elementary-1/elm_index_eo_legacy.inc}                                 // io. -> elm_widget_item_eo_legacy
{$include elementary-1/elm_index_item_eo_legacy.inc}                            // io.
{$include elementary-1/elm_index_legacy.inc}                                    // io.
{$include elementary-1/elm_prefs_eo_legacy.inc}                                 // io. -> elm_prefs_data
{$include elementary-1/elm_prefs_legacy.inc}                                    // io.
{$include elementary-1/elm_progressbar_common.inc}                              // io.
{$include elementary-1/elm_progressbar_legacy.inc}                              // io. -> elm_progressbar_common
{$include elementary-1/elm_deprecated.inc}                                      // io. -> elm_general, elm_scroller_legacy, elm_map_common, elm_win_legacy, efl_ui_textpath_eo_legacy, elm_widget_item_eo_legacy
{$include elementary-1/elc_multibuttonentry_common.inc}                         // io.
{$include elementary-1/elm_multibuttonentry_item_eo_legacy.inc}                 // io.
{$include elementary-1/elm_multibuttonentry_part_eo.inc}                        // io.
{$include elementary-1/elm_multibuttonentry_eo_legacy.inc}                      // io. -> elc_multibuttonentry_common
{$include elementary-1/elc_multibuttonentry_legacy.inc}                         // io. -> elc_multibuttonentry_common
{$include elementary-1/elm_app.inc}                                             // io.
{$include elementary-1/elm_ctxpopup_item_eo_legacy.inc}                         // io.
{$include elementary-1/elm_ctxpopup_part_eo.inc}                                // io.
{$include elementary-1/elm_ctxpopup_eo_legacy.inc}                              // io.
{$include elementary-1/elm_glview_eo_legacy.inc}                                // io.
{$include elementary-1/elm_part_helper.inc}                                     // io.
{$include elementary-1/elm_spinner_eo_legacy.inc}                               // io.
{$include elementary-1/elm_spinner_legacy.inc}                                  // io.
{$include elementary-1/elm_label_eo_legacy.inc}                                 // io.
{$include elementary-1/elm_naviframe_eo_legacy.inc}                             // io.
{$include elementary-1/elc_naviframe_common.inc}                                // io.
{$include elementary-1/elm_naviframe_part_eo.inc}                               // io.
{$include elementary-1/elm_naviframe_item_eo_legacy.inc}                        // io.
{$include elementary-1/elm_photocam_legacy.inc}                                 // io.
{$include elementary-1/elm_thumb_legacy.inc}                                    // io.
{$include elementary-1/elm_diskselector_eo_legacy.inc}                          // io.
{$include elementary-1/elm_panes_legacy.inc}                                    // io.
{$include elementary-1/elm_popup_eo_legacy.inc}                                 // io.
{$include elementary-1/efl_text_interactive_eo.inc}                             // io.
{$include elementary-1/elm_bg_legacy.inc}                                       // io.
{$include elementary-1/elm_flipselector_eo_legacy.inc}                          // io.
{$include elementary-1/elm_gesture_layer_eo_legacy.inc}                         // io.
{$include elementary-1/elm_segment_control_eo_legacy.inc}                       // io.
{$include elementary-1/efl_config_global_eo.inc}                                // io.
{$include elementary-1/elm_dayselector_eo_legacy.inc}                           // io.
{$include elementary-1/elm_mapbuf_eo_legacy.inc}                                // io.
{$include elementary-1/elm_systray_eo_legacy.inc}                               // io.
{$include elementary-1/elm_hoversel_eo_legacy.inc}                              // io.
{$include elementary-1/elm_scroll.inc}                                          // io.
{$include elementary-1/elm_box_common.inc}                                      // io.
{$include elementary-1/elm_color_class.inc}                                     // io.
{$include elementary-1/elm_color_item_eo_legacy.inc}                            // io.
{$include elementary-1/elm_colorselector_legacy.inc}                            // io.
{$include elementary-1/elm_colorselector_eo_legacy.inc}                         // io.
{$include elementary-1/elm_colorselector_common.inc}                            // io.
{$include elementary-1/elm_widget_colorselector.inc}                            // io. -> elm_colorselector_common
{$include elementary-1/elm_widget_multibuttonentry.inc}                         // io.
{$include elementary-1/elm_widget_naviframe.inc}                                // io.
{$include elementary-1/elm_widget_diskselector.inc}                             // io.
{$include elementary-1/elm_widget_prefs.inc}                                    // io.
{$include elementary-1/elm_widget_layout.inc}                                   // io.
{$include elementary-1/elm_widget_fileselector.inc}                             // io.
{$include elementary-1/elm_widget_list.inc}                                     // io.
{$include elementary-1/elm_widget_entry.inc}                                    // io.
{$include elementary-1/elm_widget_index.inc}                                    // io.
{$include elementary-1/elm_widget_popup.inc}                                    // io.
{$include elementary-1/elm_widget_conform.inc}                                  // io.
{$include elementary-1/elm_widget_flipselector.inc}                             // io.
{$include elementary-1/elm_widget_spinner.inc}                                  // io.
{$include elementary-1/elm_widget_ctxpopup.inc}                                 // io.
{$include elementary-1/elm_widget_hoversel.inc}                                 // io.
{$include elementary-1/elm_widget_menu.inc}                                     // io.
{$include elementary-1/elm_widget_slideshow.inc}                                // io.
{$include elementary-1/elm_widget_fileselector_button.inc}                      // io.
{$include elementary-1/elm_widget_segment_control.inc}                          // io.
{$include elementary-1/elm_widget_thumb.inc}                                    // io.
{$include elementary-1/elm_menu_item_eo_legacy.inc}                             // io.
{$include elementary-1/elm_cursor.inc}                                          // io.
{$include elementary-1/elm_table_eo_legacy.inc}                                 // io.
{$include elementary-1/elm_web_legacy.inc}                                      // io.
{$include elementary-1/elm_list_item_eo_legacy.inc}                             // io.
{$include elementary-1/elm_win_common.inc}                                      // io.
{$include elementary-1/efl_access_component_eo.inc}                             // io.
{$include elementary-1/efl_access_selection_eo.inc}                             // io.
{$include elementary-1/efl_access_action_eo.inc}                                // io.
{$include elementary-1/efl_access_editable_text_eo.inc}                         // io.
{$include elementary-1/efl_access_object.inc}                                   // io.
{$include elementary-1/elm_photocam.inc}                                        // io.
{$include elementary-1/elm_sys_notify_eo_legacy.inc}                            // io.
{$include elementary-1/elm_notify_eo_legacy.inc}                                // io.
{$include elementary-1/elm_photo_legacy.inc}                                    // io.
{$include elementary-1/elm_actionslider_eo_legacy.inc}                          // io.
{$include elementary-1/elm_diskselector_item_eo_legacy.inc}                     // io.
{$include elementary-1/efl_access_text.inc}                                     // io.
{$include elementary-1/efl_access_value_eo.inc}                                 // io.
{$include elementary-1/efl_access_widget_action.inc}                            // io.
{$include elementary-1/efl_access_widget_action_eo.inc}                         // io. -> efl_access_widget_action
{$include elementary-1/efl_access_window.inc}                                   // io.
{$include elementary-1/efl_access_window_eo.inc}                                // io.
{$include elementary-1/elc_combobox_legacy.inc}                                 // io.
{$include elementary-1/elm_access_eo_legacy.inc}                                // io.
{$include elementary-1/elc_popup_legacy.inc}                                    // io.
{$include elementary-1/elc_naviframe_legacy.inc}                                // io.
{$include elementary-1/elc_hoversel_legacy.inc}                                 // io.
{$include elementary-1/elc_ctxpopup_legacy.inc}                                 // io.
{$include elementary-1/elm_actionslider_legacy.inc}                             // io.
{$include elementary-1/elm_actionslider_part_eo.inc}                            // io.
{$include elementary-1/elm_atspi_app_object_eo_legacy.inc}                      // io.
{$include elementary-1/elm_atspi_bridge_eo_legacy.inc}                          // io.
{$include elementary-1/elm_bubble_eo_legacy.inc}                                // io.
{$include elementary-1/elm_bubble_legacy.inc}                                   // io.
{$include elementary-1/elm_bubble_part_eo.inc}                                  // io.
{$include elementary-1/elm_cache.inc}                                           // io.
{$include elementary-1/elm_check_legacy.inc}                                    // io.
{$include elementary-1/elm_conformant_eo_legacy.inc}                            // io.
{$include elementary-1/elm_conform_legacy.inc}                                  // io.
{$include elementary-1/elm_dayselector_item_eo_legacy.inc}                      // io.
{$include elementary-1/elm_dayselector_legacy.inc}                              // io.
{$include elementary-1/elm_dayselector_part_eo.inc}                             // io.
{$include elementary-1/elm_debug.inc}                                           // io.
{$include elementary-1/elm_diskselector_common.inc}                             // io.
{$include elementary-1/elm_diskselector_legacy.inc}                             // io.
{$include elementary-1/elm_entry_part_eo.inc}                                   // io.
{$include elementary-1/elm_finger.inc}                                          // io.
{$include elementary-1/elm_flip_part_eo.inc}                                    // io.
{$include elementary-1/elm_flipselector_item_eo_legacy.inc}                     // io.
{$include elementary-1/elm_flipselector_legacy.inc}                             // io.
{$include elementary-1/elm_focus_item.inc}                                      // io.
{$include elementary-1/elm_font.inc}                                            // io.
{$include elementary-1/elm_genlist_legacy.inc}                                  // io.
{$include elementary-1/elm_genlist_pan_eo_legacy.inc}                           // io.
{$include elementary-1/elm_gesture_layer_legacy.inc}                            // io.
{$include elementary-1/elm_glview_common.inc}                                   // io.
{$include elementary-1/elm_glview_legacy.inc}                                   // io. -> elm_glview_common
{$include elementary-1/elm_grid_eo_legacy.inc}                                  // io.
{$include elementary-1/elm_grid_legacy.inc}                                     // io.
{$include elementary-1/elm_helper.inc}                                          // io.
{$include elementary-1/elm_hover_eo_legacy.inc}                                 // io.
{$include elementary-1/elm_hover_legacy.inc}                                    // io.
{$include elementary-1/elm_hover_part_eo.inc}                                   // io.
{$include elementary-1/elm_hoversel_item_eo_legacy.inc}                         // io.
{$include elementary-1/elm_inwin_eo_legacy.inc}                                 // io.
{$include elementary-1/elm_inwin_legacy.inc}                                    // io.
{$include elementary-1/elm_label_legacy.inc}                                    // io.
{$include elementary-1/elm_label_part_eo.inc}                                   // io.
{$include elementary-1/elm_layout_common.inc}                                   // io.
{$include elementary-1/elm_list_legacy.inc}                                     // io.
{$include elementary-1/elm_macros.inc}                                          // io.
{$include elementary-1/elm_mapbuf_legacy.inc}                                   // io.
{$include elementary-1/elm_mapbuf_part_eo.inc}                                  // io.
{$include elementary-1/elm_map_pan_eo_legacy.inc}                               // io.
{$include elementary-1/elm_menu_eo_legacy.inc}                                  // io.
{$include elementary-1/elm_menu_legacy.inc}                                     // io.
{$include elementary-1/elm_mirroring.inc}                                       // io.
{$include elementary-1/elm_need.inc}                                            // io.
{$include elementary-1/elm_notify_common.inc}                                   // io.
{$include elementary-1/elm_notify_legacy.inc}                                   // io.
{$include elementary-1/elm_notify_part_eo.inc}                                  // io.
{$include elementary-1/elm_panel_common.inc}                                    // io.
{$include elementary-1/elm_panel_eo_legacy.inc}                                 // io.
{$include elementary-1/elm_panel_legacy.inc}                                    // io.
{$include elementary-1/elm_panel_part_eo.inc}                                   // io.
{$include elementary-1/elm_photo_eo_legacy.inc}                                 // io.
{$include elementary-1/elm_player_eo_legacy.inc}                                // io.
{$include elementary-1/elm_player_part_eo.inc}                                  // io.
{$include elementary-1/elm_plug_eo_legacy.inc}                                  // io.
{$include elementary-1/elm_plug_legacy.inc}                                     // io.
{$include elementary-1/elm_popup_item_eo_legacy.inc}                            // io.
{$include elementary-1/elm_popup_part_eo.inc}                                   // io.
{$include elementary-1/elm_radio_legacy.inc}                                    // io.
{$include elementary-1/elm_route_eo_legacy.inc}                                 // io.
{$include elementary-1/elm_route_legacy.inc}                                    // io.
{$include elementary-1/elm_scale.inc}                                           // io.
{$include elementary-1/elm_scroller_eo_legacy.inc}                              // io.
{$include elementary-1/elm_scroller_part_eo.inc}                                // io.
{$include elementary-1/elm_segment_control_item_eo_legacy.inc}                  // io.
{$include elementary-1/elm_segment_control_legacy.inc}                          // io.
{$include elementary-1/elm_separator_eo_legacy.inc}                             // io.
{$include elementary-1/elm_separator_legacy.inc}                                // io.
{$include elementary-1/elm_sys_notify.inc}                                      // io.
{$include elementary-1/elm_sys_notify_interface_eo_legacy.inc}                  // io. -> elm_sys_notify
{$include elementary-1/elm_systray.inc}                                         // io. -> elm_sys_notify
{$include elementary-1/elm_sys_notify_dbus_eo_legacy.inc}                       // io.
{$include elementary-1/elm_systray_common.inc}                                  // io.
{$include elementary-1/elm_systray_watcher.inc}                                 // io.
{$include elementary-1/elm_table_legacy.inc}                                    // io.
{$include elementary-1/elm_textpath_legacy.inc}                                 // io.
{$include elementary-1/elm_thumb_common.inc}                                    // io.
{$include elementary-1/elm_thumb_eo_legacy.inc}                                 // io.
{$include elementary-1/elm_view_form_eo.inc}                                    // io.
{$include elementary-1/elm_view_list_eo.inc}                                    // io.
{$include elementary-1/elm_widget_actionslider.inc}                             // io.
{$include elementary-1/elm_widget_box.inc}                                      // io.
{$include elementary-1/elm_widget_bubble.inc}                                   // io. -> elm_bubble_eo_legacy
{$include elementary-1/elm_widget_calendar.inc}                                 // io.
{$include elementary-1/elm_widget_clock.inc}                                    // io.
{$include elementary-1/elm_widget_combobox.inc}                                 // io.
{$include elementary-1/elm_widget_dayselector.inc}                              // io.
{$include elementary-1/elm_widget_fileselector_entry.inc}                       // io.
{$include elementary-1/elm_widget_glview.inc}                                   // io.
{$include elementary-1/elm_widget_hover.inc}                                    // io.
{$include elementary-1/elm_widget_icon.inc}                                     // io.
{$include elementary-1/elm_widget_inwin.inc}                                    // io.
{$include elementary-1/elm_widget_item_container_eo.inc}                        // io.
{$include elementary-1/elm_widget_item_static_focus_eo_legacy.inc}              // io.
{$include elementary-1/elm_widget_label.inc}                                    // io.
{$include elementary-1/elm_widget_mapbuf.inc}                                   // io.
{$include elementary-1/elm_widget_notify.inc}                                   // io.
{$include elementary-1/elm_widget_panel.inc}                                    // io.
{$include elementary-1/elm_widget_photo.inc}                                    // io.
{$include elementary-1/elm_widget_player.inc}                                   // io.
{$include elementary-1/elm_widget_route.inc}                                    // io.
{$include elementary-1/elm_widget_scroller.inc}                                 // io.
{$include elementary-1/elm_widget_separator.inc}                                // io.
{$include elementary-1/elm_widget_slider.inc}                                   // io.
{$include elementary-1/elm_widget_web.inc}                                      // io.

{$include elementary-1/Elementary.inc}                                          // io.
{$include elementary-1/Elementary_Cursor.inc}                                   // io.
{$include elementary-1/Elementary_Options.inc}                                  // io.




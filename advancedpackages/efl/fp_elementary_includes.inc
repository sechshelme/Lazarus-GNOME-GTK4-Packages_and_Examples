



{$include evas-1/canvas/efl_canvas_vg_node_eo_legacy}                       // io.
{$include evas-1/canvas/efl_canvas_vg_node_eo}                              // io.
{$include evas-1/canvas/efl_canvas_vg_container_eo_legacy}                  // io. -> efl_canvas_vg_node_eo_legacy


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
{$include elementary-1/Efl_Ui.inc}                                              // io. -> efl_ui_focus_manager_eo, efl_ui_win_eo
{$include elementary-1/elm_widget.inc}                                          // io. -> elm_widget_item_eo_legacy, elm_theme, efl_ui_widget_eo_legacy, efl_ui_focus_object_eo, elm_access, efl_ui_eot
{$include elementary-1/elm_widget_toolbar.inc}                                  // io. -> elm_general, elm_widget_item_eo_legacy, elm_toolbar_eo_legacy, elm_widget, elm_transit
{$include elementary-1/elm_gen_common.inc}                                      // io. -> elm_tooltip, elm_widget, elm_widget_genlist, elm_gen
{$include elementary-1/efl_access_object_eo.inc}                                // io.
{$include elementary-1/efl_ui_vg_animation_eo_legacy.inc}                       // io.
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
{$include elementary-1/Elementary.inc}                                          // io.
{$include elementary-1/Elementary_Cursor.inc}                                   // io.







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


program project1;

//{$define EFL_BETA_API_SUPPORT}


// pcregrep -Mn 'static inline.*\n(.+\n)?\s*{' *.h
// pcregrep -Mn 'static inline.*\n(.+\n){0,2}\s*{' *.h  ??????????
// https://www.perplexity.ai/search/ich-will-die-mit-grep-dateien-aw7Pr2mpROKi9qznTFxhUQ
// rename 's/\.eo/_eo/' *.h

// array of const !!

// Bei eina *.x behandeln

// __in_list


uses
  efl,
  fp_eina,
  fp_eo,
  fp_efl,
  fp_emile,
  fp_evas,
  fp_ecore,
  fp_ethumb,
  fp_ecore_evas,
  fp_edje,
  fp_ecore_file,
  fp_eet,
  fp_elementary,

  // =======================================


  // =======================================


  //elm_general,                                         // io.     ( makro ELM_MAIN entfernt )
  //elm_win_legacy,                                      // io.     ( Doppelt Methoden evtl. Bug in C-Hedader )
  //elm_box_legacy,                                      // io.
  //elm_box_eo_legacy,                                   // io.
  //elm_button_legacy,                                   // io.
  //elm_entry_common,                                    // io. -> elm_general
  //elm_entry_eo_legacy,                                 // io. -> elm_general, elm_entry_common
  //elm_entry_legacy,                                    // io. -> elm_general
  //elm_object,                                          // io. -> elm_general
  //elm_config,                                          // io. -> elm_general
  //elm_scroller_legacy,                                 // io.
  //elm_map_common,                                      // io.
  //elm_map_eo_legacy,                                   // io. -> elm_map_common
  //elm_map_legacy,                                      // io.
  //elm_widget_map,                                      // io. -> elm_map_common, elm_map_eo_legacy
  //elm_tooltip,                                         // io.
  //elm_widget_item_eo_legacy,                           // io. -> elm_general, elm_tooltip
  //elm_object_item,                                     // io. -> elm_widget_item_eo_legacy
  //elm_access,                                          // io. -> elm_object_item, elm_widget_item_eo_legacy
  //elm_entry_eo,                                        // io. -> elm_general, elm_entry_common
  //elm_pan_eo_legacy,                                   // io.
  //elm_interface_scrollable,                            // io. -> elm_scroller_legacy, elm_pan_eo_legacy
  //elm_interface_scrollable_eo,                         // io. -> elm_interface_scrollable
  //elm_transit,                                         // io.
  //elm_theme,                                           // io.
  //elm_gen,                                             // io. -> elm_general
  //elm_genlist_eo_legacy,                               // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen
  //elm_layout_legacy,                                   // io.
  //elm_cnp,                                             // io. -> elm_widget_item_eo_legacy
  //elm_code_common,                                     // io.
  //elm_code_line,                                       // io. -> elm_code_common
  //elm_code,                                            // io. -> elm_code_common
  //elm_code_diff_widget,                                // io. -> elm_code_common
  //elm_code_widget_legacy,                              // io. -> elm_code_common
  //elm_code_text,                                       // io. -> elm_code_line
  //elm_code_indent,                                     // io. -> elm_code_line
  //elm_code_widget_eo,                                  // io. -> elm_code_common, elm_code_line
  //elm_code_file,                                       // io. -> elm_code_common, elm_code_line
  //elm_code_parse,                                      // io. -> elm_code_common, elm_code_line
  //elm_code_syntax,                                     // io. -> elm_code_common, elm_code_line
  //elm_code_widget_eo_legacy,                           // io. -> elm_code_common, elm_code_line, elm_scroller_legacy
  //elm_code_widget_selection,                           // io.
  //elm_code_widget_legacy_eo_legacy,                    // io.
  //elm_genlist_item_eo_legacy,                          // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen
  //elm_widget_genlist,                                  // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen
  //elm_list_eo_legacy,                                  // io. -> elm_general, elm_widget_item_eo_legacy
  //elm_image_legacy,                                    // io.
  //elm_icon_eo_legacy,                                  // io.
  //elm_icon_legacy,                                     // io.
  //elm_store,                                           // io. -> elm_widget_item_eo_legacy, elm_icon_legacy, elm_gen
  //elm_toolbar_eo,                                      // io. -> elm_general, elm_widget_item_eo_legacy
  //elm_toolbar_eo_legacy,                               // io. -> elm_general, elm_widget_item_eo_legacy
  //elm_toolbar_common,                                  // io. -> elm_widget_item_eo_legacy
  //elm_toolbar_item_eo_legacy,                          // io. -> elm_widget_item_eo_legacy
  //elm_toolbar_legacy,                                  // io. -> elm_icon_legacy
  //elm_web_common,                                      // io.
  //elm_web_eo,                                          // io. -> elm_web_common
  //elm_web_eo_legacy,                                   // io. -> elm_web_common
  //efl_ui_textpath_eo_legacy,                           // io.
  //efl_ui_win_eo,                                       // io.
  //efl_ui_eot,                                          // io.
  //efl_ui_focus_object_eo,                              // io.
  //efl_ui_widget_eo,                                    // io. -> efl_ui_focus_object_eo, efl_ui_eot
  //efl_ui_widget_eo_legacy,                             // io. -> efl_ui_focus_object_eo
  //efl_ui_focus_composition_eo,                         // io.
  //efl_ui_focus_layer_eo,                               // io.
  //efl_ui_focus_manager_calc_eo,                        // io. -> efl_ui_focus_object_eo
  //efl_ui_focus_manager_root_focus_eo,                  // io.
  //efl_ui_focus_manager_sub_eo,                         // io.
  //efl_ui_focus_manager_window_root_eo,                 // io.
  //efl_ui_focus_util_eo,                                // io. -> efl_ui_focus_object_eo, efl_ui_eot
  //efl_ui_focus_manager_eo,                             // io. -> efl_ui_focus_object_eo, efl_ui_eot
  //efl_ui_flip_eo,                                      // io.
  //efl_ui_clock_eo,                                     // io.
  //efl_ui_spotlight_animation_manager_eo,               // io.
  //efl_ui_spotlight_fade_manager_eo,                    // io.
  //efl_ui_spotlight_icon_indicator_eo,                  // io.
  //efl_ui_spotlight_manager_eo,                         // io.
  //efl_ui_spotlight_indicator_eo,                       // io. -> efl_ui_spotlight_manager_eo
  //efl_ui_spotlight_container_eo,                       // io. -> efl_ui_widget_eo, efl_ui_spotlight_manager_eo, efl_ui_spotlight_indicator_eo
  //efl_ui_spotlight_scroll_manager_eo,                  // io.
  //efl_ui_spotlight_util_eo,                            // io. -> efl_ui_widget_eo, efl_ui_spotlight_manager_eo
  //efl_ui_format_eo,                                    // io.
  //efl_ui_popup_eo,                                     // io.
  //Efl_Ui,                                              // io. -> efl_ui_focus_manager_eo, efl_ui_win_eo
  //elm_widget,                                          // io. -> elm_widget_item_eo_legacy, elm_theme, efl_ui_widget_eo_legacy, efl_ui_focus_object_eo, elm_access, efl_ui_eot
  //elm_widget_toolbar,                                  // io. -> elm_general, elm_widget_item_eo_legacy, elm_toolbar_eo_legacy, elm_widget, elm_transit
  //elm_gen_common,                                      // io. -> elm_tooltip, elm_widget, elm_widget_genlist, elm_gen
  //efl_access_object_eo,                                // io.
  //efl_ui_vg_animation_eo_legacy,                       // io.
  //elm_calendar_item_eo_legacy,                         // io.
  //elm_calendar_common,                                 // io.
  //elm_calendar_eo_legacy,                              // io. -> elm_calendar_common
  //elm_calendar_legacy,                                 // io. -> elm_calendar_eo_legacy
  //elm_clock_eo_legacy,                                 // io.
  //elm_clock_legacy,                                    // io.
  //elm_clock_eo,                                        // io.
  //elm_datetime,                                        // io. -> elm_clock_eo
  //elm_interface_fileselector,                          // io.
  //elm_interface_fileselector_eo_legacy,                // io.
  //elm_fileselector_button_eo_legacy,                   // io.
  //elm_fileselector_entry_eo_legacy,                    // io.
  //elm_fileselector_entry_part_eo,                      // io.
  //elm_fileselector_eo_legacy,                          // io.
  //elm_fileselector_part_eo,                            // io.
  //elc_fileselector_common,                             // io.
  //elc_fileselector_legacy,                             // io. -> elm_interface_fileselector_eo_legacy, elc_fileselector_common
  //elc_fileselector_button_legacy,                      // io. -> elm_fileselector_button_eo_legacy
  //elc_fileselector_entry_legacy,                       // io. -> elm_fileselector_entry_eo_legacy
  //elm_focus,                                           // io. -> elm_general
  //elm_gengrid_eo_legacy,                               // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen
  //elm_gengrid_common,                                  // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen, elm_tooltip
  //elm_gengrid_item_eo_legacy,                          // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen
  //elm_gengrid_legacy,                                  // io. -> elm_widget_item_eo_legacy, elm_scroller_legacy
  //elm_gengrid_pan_eo_legacy,                           // io.
  //elm_widget_gengrid,                                  // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen, elm_gengrid_eo_legacy
  //elm_slideshow_common,                                // io.
  //elm_slideshow_eo_legacy,                             // io. -> elm_widget_item_eo_legacy, elm_slideshow_common
  //elm_slideshow_item_eo_legacy,                        // io.
  //elm_slideshow_legacy,                                // io.
  //elm_slider_common,                                   // io.
  //elm_slider_legacy,                                   // io. -> elm_general, elm_slider_common
  //elm_slider_part_indicator_eo_legacy,                 // io.
  //efl_access_text_eo,                                  // io.
  //elm_genlist_common,                                  // io. -> elm_widget_item_eo_legacy, elm_gen, elm_tooltip
  //elm_prefs_data,                                      // io.
  //elm_prefs_common,                                    // io. -> elm_prefs_data
  //elm_gesture_layer_common,                            // io.
  //elm_index_eo_legacy,                                 // io. -> elm_widget_item_eo_legacy
  //elm_index_item_eo_legacy,                            // io.
  //elm_index_legacy,                                    // io.
  //elm_prefs_eo_legacy,                                 // io. -> elm_prefs_data
  //elm_prefs_legacy,                                    // io.
  //elm_progressbar_common,                              // io.
  //elm_progressbar_legacy,                              // io. -> elm_progressbar_common
  //elm_deprecated,                                      // io. -> elm_general, elm_scroller_legacy, elm_map_common, elm_win_legacy, efl_ui_textpath_eo_legacy, elm_widget_item_eo_legacy

  elc_multibuttonentry_common,                           // io.
  elm_multibuttonentry_item_eo_legacy,                   // io.
  elm_multibuttonentry_part_eo,                          // io.
  elm_multibuttonentry_eo_legacy,                        // io. -> elc_multibuttonentry_common
  elc_multibuttonentry_legacy,                           // io. -> elc_multibuttonentry_common
  efl_ui_relative_container_eo,                          // io.
  efl_ui_vg_animation_eo,                                // io.
  efl_ui_layout_base_eo,                                 // io.
  efl_ui_textbox_eo,                                     // io.
  efl_ui_view_model_eo,                                  // io.
  efl_ui_dnd_eo,                                         // io.
  efl_ui_flip_legacy,                                    // io.
  efl_ui_flip_legacy_eo_legacy,                          // io.
  efl_ui_flip_part_eo,                                   // io.
  efl_ui_flip_eo_legacy,                                 // io. -> efl_ui_flip_legacy
  efl_ui_image_zoomable_private,                         // io.
  efl_ui_relative_container_private,                     // io.
  efl_ui_calendar_eo,                                    // io.
  efl_ui_image_zoomable_eo,                              // io.
  efl_ui_selection_eo,                                   // io.
  efl_ui_spin_button_eo,                                 // io.
  efl_ui_tags_eo,                                        // io.
  efl_ui_widget_image,                                   // io.
  efl_ui_widget_scroll_manager,                          // io.
  efl_ui_widget_scrollable_content_eo,                   // io.
  efl_ui_widget_flip,                                    // io.
  efl_ui_datepicker_eo,                                  // io.
  efl_ui_video_legacy,                                   // io.
  efl_ui_item_eo,                                        // io.
  efl_ui_item_clickable_eo,                              // io. -> efl_ui_item_eo
  efl_ui_position_manager_data_access_v1_eo,             // io. -> efl_ui_item_eo
  efl_ui_position_manager_entity_eo,                     // io.
  efl_ui_position_manager_grid_eo,                       // io.
  efl_ui_position_manager_list_eo,                       // io.
  efl_ui_collection_view_eo,                             // io. -> efl_ui_position_manager_entity_eo
  efl_ui_collection_eo,                                  // io. -> efl_ui_item_eo, efl_ui_position_manager_entity_eo
  efl_ui_image_eo,                                       // io.
  efl_ui_pan_eo,                                         // io.
  efl_ui_multi_selectable_index_range_eo,                // io.
  efl_ui_panel_eo,                                       // io.
  efl_ui_progressbar_eo,                                 // io.
  efl_ui_radio_box_eo,                                   // io.
  efl_ui_radio_eo,                                       // io.
  efl_ui_radio_group_impl_eo,                            // io.
  efl_ui_radio_legacy_eo_legacy,                         // io.
  efl_ui_radio_legacy_part_eo,                           // io.
  efl_ui_radio_private,                                  // io.
  efl_ui_radio_eo_legacy,                                // io.
  efl_ui_radio_group_eo,                                 // io. -> efl_ui_radio_eo_legacy
  efl_ui_select_model_eo,                                // io.
  efl_ui_separator_eo,                                   // io.
  efl_ui_selectable_eo,                                  // io.
  efl_ui_multi_selectable_object_range_eo,               // io. -> efl_ui_selectable_eo
  efl_ui_single_selectable_eo,                           // io. -> efl_ui_selectable_eo
  efl_ui_alert_popup_eo,                                 // io.
  efl_ui_caching_factory_eo,                             // io.
  efl_ui_text_factory_images_eo,                         // io.
  efl_ui_panes_eo,                                       // io.
  efl_ui_theme_eo,                                       // io.
  elm_app,                                               // io.
  elm_ctxpopup_item_eo_legacy,                           // io.
  elm_ctxpopup_part_eo,                                  // io.
  elm_ctxpopup_eo_legacy,                                // io.
  elm_glview_eo_legacy,                                  // io.
  elm_part_helper,                                       // io.
  elm_spinner_eo_legacy,                                 // io.
  elm_spinner_legacy,                                    // io.
  elm_label_eo_legacy,                                   // io.
  elm_naviframe_eo_legacy,                               // io.
  elc_naviframe_common,                                  // io.
  elm_naviframe_part_eo,                                 // io.
  elm_naviframe_item_eo_legacy,                          // io.
  elm_photocam_legacy,                                   // io.
  elm_thumb_legacy,                                      // io.
  elm_diskselector_eo_legacy,                            // io.
  elm_panes_legacy,                                      // io.
  elm_popup_eo_legacy,                                   // io.
  efl_text_interactive_eo,                               // io.
  elm_bg_legacy,                                         // io.
  elm_flipselector_eo_legacy,                            // io.
  elm_gesture_layer_eo_legacy,                           // io.
  elm_segment_control_eo_legacy,                         // io.
  efl_config_global_eo,                                  // io.
  elm_dayselector_eo_legacy,                             // io.
  elm_mapbuf_eo_legacy,                                  // io.
  elm_systray_eo_legacy,                                 // io.
  elm_hoversel_eo_legacy,                                // io.
  elm_scroll,                                            // io.
  elm_box_common,                                        // io.
  elm_color_class,                                       // io.
  elm_color_item_eo_legacy,                              // io.
  elm_colorselector_legacy,                              // io.
  elm_colorselector_eo_legacy,                           // io.
  elm_colorselector_common,                              // io.
  elm_widget_colorselector,                              // io. -> elm_colorselector_common
  elm_widget_multibuttonentry,                           // io.
  elm_widget_naviframe,                                  // io.
  elm_widget_diskselector,                               // io.
  elm_widget_prefs,                                      // io.
  elm_widget_layout,                                     // io.
  elm_widget_fileselector,                               // io.
  elm_widget_list,                                       // io.
  elm_widget_entry,                                      // io.
  elm_widget_index,                                      // io.
  elm_widget_popup,                                      // io.
  elm_widget_conform,                                    // io.
  elm_widget_flipselector,                               // io.
  elm_widget_spinner,                                    // io.
  elm_widget_ctxpopup,                                   // io.
  elm_widget_hoversel,                                   // io.
  elm_widget_menu,                                       // io.
  elm_widget_slideshow,                                  // io.
  elm_widget_fileselector_button,                        // io.
  elm_widget_segment_control,                            // io.
  elm_widget_thumb,                                      // io.
  elm_menu_item_eo_legacy,                               // io.
  elm_cursor,                                            // io.
  elm_table_eo_legacy,                                   // io.
  elm_web_legacy,                                        // io.
  elm_list_item_eo_legacy,                               // io.
  elm_win_common,                                        // io.
  efl_access_component_eo,                               // io.
  efl_access_selection_eo,                               // io.
  efl_access_action_eo,                                  // io.
  efl_access_editable_text_eo,                           // io.
  efl_access_object,                                     // io.
  elm_photocam,                                          // io.
  elm_sys_notify_eo_legacy,                              // io.
  elm_notify_eo_legacy,                                  // io.
  elm_photo_legacy,                                      // io.
  elm_actionslider_eo_legacy,                            // io.
  elm_diskselector_item_eo_legacy,                       // io.




  Elementary,                                            // io.
  Elementary_Cursor,                                     // io.
  Math;

  procedure on_win_del(data: pointer; obj: PEvas_Object; event_info: pointer); cdecl;
  begin
    elm_exit;
  end;

  procedure on_button_click(data: pointer; obj: PEvas_Object; event_info: pointer); cdecl;
  begin
    elm_object_text_set(obj, 'Geklickt !');
  end;

  procedure on_exit_button_click(data: pointer; obj: PEvas_Object; event_info: pointer); cdecl;
  begin
    elm_exit;
  end;

  function main(argc: integer; argv: PPChar): integer;
  var
    box, win, btn1, btn2, entry: PEvas_Object;
  begin
    elm_init(argc, argv);

    // Fenster erstellen
    win := elm_win_util_standard_add('EFL Beispiel', 'EFL Beispiel');
    elm_win_autodel_set(win, EINA_TRUE);

    // Callback für das Schließen des Fensters hinzufügen
    evas_object_smart_callback_add(win, 'delete,request', @on_win_del, nil);

    // Box als Container für die Buttons
    box := elm_box_add(win);
    evas_object_size_hint_weight_set(box, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND);
    elm_win_resize_object_add(win, box);
    evas_object_show(box);

    // Erster Button
    btn1 := elm_button_add(win);
    elm_object_text_set(btn1, 'Klick mich!');
    evas_object_smart_callback_add(btn1, 'clicked', @on_button_click, nil);
    evas_object_size_hint_weight_set(btn1, EVAS_HINT_EXPAND, 0.0);
    elm_box_pack_end(box, btn1);
    evas_object_show(btn1);

    // Zweiter Button (Beenden)
    btn2 := elm_button_add(win);
    elm_object_text_set(btn2, 'Beenden');
    evas_object_smart_callback_add(btn2, 'clicked', @on_exit_button_click, nil);
    evas_object_size_hint_weight_set(btn2, EVAS_HINT_EXPAND, 0.0);
    elm_box_pack_end(box, btn2);
    evas_object_show(btn2);

    // Entry (Textfeld) hinzufügen
    entry := elm_entry_add(win);
    elm_entry_single_line_set(entry, EINA_TRUE); // Einzelne Zeile
    elm_object_text_set(entry, 'Hier Text eingeben...');
    evas_object_size_hint_weight_set(entry, EVAS_HINT_EXPAND, 0.0);
    evas_object_size_hint_align_set(entry, EVAS_HINT_FILL, 0.0);
    elm_box_pack_end(box, entry);
    evas_object_show(entry);


    evas_object_resize(win, 240, 120);
    evas_object_show(win);

    elm_run;
    elm_shutdown;

    Result := 0;
  end;

begin
  main(argc, argv);
end.

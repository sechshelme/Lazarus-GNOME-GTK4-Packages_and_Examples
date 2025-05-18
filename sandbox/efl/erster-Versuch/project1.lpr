program project1;

//{$define EFL_BETA_API_SUPPORT}


// pcregrep -Mn 'static inline.*\n(.+\n)?\s*{' *.h
// pcregrep -Mn 'static inline.*\n(.+\n){0,2}\s*{' *.h  ??????????

// https://www.perplexity.ai/search/ich-will-die-mit-grep-dateien-aw7Pr2mpROKi9qznTFxhUQ

// array of const !!


uses
  efl,
  fp_eina,
  fp_eo,


  // === efl-1/interfaces

  efl_gfx_types_eot,                                   // io.
  efl_model_eo,                                        // io.
  efl_observable_eo,                                   // io.
  efl_config_eo,                                       // io.

  // === efl-1

  Efl_xxx,                                             // io. -> efl_gfx_types_eot, efl_observable_eo, efl_config_eo     ( Name ändern )
  Efl_MVVM_Common,                                     // io. -> efl_model_eo

  // === efl-1/interfaces

  efl_gfx_image_eo,                                    // io.
  efl_input_text_entity_eo,                            // io.
  efl_text_style_eo,                                   // io.
  efl_gfx_hint_eo,                                     // io. -> efl_gfx_types_eot
  efl_text_font_properties_eo,                         // io. -> efl_gfx_types_eot
  efl_text_format_eo,                                  // io.
  efl_ui_layout_orientable_eo,                         // io.
  efl_ui_scrollable_eo,                                // io. -> efl_ui_layout_orientable_eo


  // =======================================

  // evas-1/canvas
  efl_canvas_vg_node_eo_legacy,                       // io.
  efl_canvas_vg_node_eo,                              // io.
  efl_canvas_vg_container_eo_legacy,                  // io. -> efl_canvas_vg_node_eo_legacy
  efl_canvas_vg_shape_eo_legacy,                      // io. -> efl_canvas_vg_node_eo_legacy
  efl_canvas_vg_shape_eo,                             // io. -> efl_canvas_vg_node_eo
  efl_canvas_vg_gradient_eo_legacy,                   // io.

  // evas-1
  Efl_Canvas,                                         // io.  ( evtl. löschen )
  Evas,                                               // io.  ( evtl. löschen )
  Evas_Loader,                                        // io.
  Evas_Common,                                        // io. -> Evas_Loader
  Evas_Legacy,                                        // io. -> Evas_Common, Evas_Loader, efl_canvas_vg_container_eo_legacy, efl_canvas_vg_shape_eo_legacy, efl_canvas_vg_node_eo_legacy,efl_canvas_vg_gradient_eo_legacy;
  Evas_GL,                                            // io. -> Evas_Common, Evas_Legacy ( Viele doppelte Conste entfernt )

  // evas-1/canvas
  Evas_Engine_Buffer,                                 // io.
  Evas_Eo,                                            // io.
  efl_canvas_vg_object_eo_legacy,                     // io. -> Evas_Common, efl_canvas_vg_node_eo_legacy
  efl_canvas_vg_object_eo,                            // io. -> efl_canvas_vg_node_eo
  efl_canvas_vg_container_eo,                         // io. -> efl_canvas_vg_node_eo
  efl_canvas_vg_image_eo,                             // io.
  efl_canvas_vg_gradient_eo,                          // io.
  efl_canvas_vg_gradient_linear_eo,                   // io.
  efl_canvas_vg_gradient_radial_eo,                   // io.
  efl_gfx_vg_value_provider_eo,                       // io.
  efl_input_types_eot,                                // io.
  efl_input_pointer_eo,                               // io. -> efl_input_types_eot
  efl_input_event_eo,                                 // io. -> Evas_Common, efl_input_types_eot
  efl_input_state_eo,                                 // io. -> Evas_Common, efl_input_types_eot
  efl_input_interface_eo,                             // io.
  efl_input_key_eo,                                   // io.
  efl_input_clickable_eo,                             // io.
  efl_input_device_eo,                                // io.
  efl_input_focus_eo,                                 // io.
  efl_input_hold_eo,                                  // io.
  efl_gfx_mapping_eo,                                 // io.
  efl_text_cursor_object_eo,                          // io. -> Evas_Common
  efl_text_formatter_eo,                              // io. -> efl_text_cursor_object_eo
  efl_canvas_textblock_eo_legacy,                     // io. -> Evas_Common
  efl_canvas_textblock_eo,                            // io. -> Evas_Common, efl_text_cursor_object_eo
  efl_canvas_textblock_factory_eo,                    // io. -> Evas_Common
  efl_canvas_animation_types_eot,                     // io.
  efl_canvas_animation_eo,                            // io. -> Evas_Common, efl_canvas_animation_types_eot
  efl_canvas_group_animation_eo,                      // io. -> efl_canvas_animation_eo
  efl_canvas_object_animation_eo,                     // io. -> efl_canvas_animation_eo
  efl_canvas_scene_eo,                                // io. -> Evas_Common
  efl_canvas_object_eo,                               // io. -> Evas_Common, efl_input_types_eot
  efl_canvas_object_eo_legacy,                        // io. -> Evas_Common
  efl_canvas_group_eo_legacy,                         // io.
  efl_canvas_group_eo,                                // io. -> Evas_Common
  efl_canvas_filter_internal_eo,                      // io.
  efl_canvas_proxy_eo,                                // io. -> Evas_Common
  efl_canvas_rotate_animation_eo,                     // io. -> Evas_Common
  efl_canvas_scale_animation_eo,                      // io. -> Evas_Common
  efl_canvas_alpha_animation_eo,                      // io.
  efl_canvas_event_grabber_eo_legacy,                 // io.
  efl_canvas_event_grabber_eo,                        // io.
  efl_canvas_pointer_eo,                              // io. -> Evas_Common
  efl_canvas_translate_animation_eo,                  // io.
  efl_canvas_parallel_group_animation_eo,             // io.
  efl_canvas_polygon_eo,                              // io.
  efl_canvas_sequential_group_animation_eo,           // io.
  efl_canvas_snapshot_eo,                             // io.
  efl_canvas_image_eo,                                // io.
  efl_canvas_image_internal_eo,                       // io.
  efl_canvas_rectangle_eo,                            // io.
  evas_canvas_eo_legacy,                              // io. -> Evas_Common
  evas_ector_software_buffer_eo,                      // io.        ( record zerkleinert )
  evas_text_eo_legacy,                                // io. -> Evas_Legacy
  evas_textblock_legacy,                              // io. -> Evas_Common
  evas_textgrid_eo_legacy,                            // io. -> Evas_Common
  evas_box_eo_legacy,                                 // io. -> Evas_Common
  evas_table_eo_legacy,                               // io. -> Evas_Common
  evas_grid_eo_legacy,                                // io. -> Evas_Common
  evas_image_eo_legacy,                               // io.
  evas_line_eo_legacy,                                // io.

  // evas-1/gesture
  efl_canvas_gesture_types_eot,                       // io. -> efl_input_types_eot
  efl_canvas_gesture_custom_eo,                       // io.
  efl_canvas_gesture_eo,                              // io. -> efl_canvas_gesture_types_eot
  efl_canvas_gesture_events_eo,                       // io.
  efl_canvas_gesture_flick_eo,                        // io.
  efl_canvas_gesture_recognizer_custom_eo,            // io.
  efl_canvas_gesture_touch_eo,                        // io. -> efl_input_pointer_eo, efl_canvas_gesture_types_eot
  efl_canvas_gesture_recognizer_eo,                   // io. -> efl_canvas_gesture_eo, efl_canvas_gesture_touch_eo, efl_canvas_gesture_types_eot, efl_canvas_gesture_recognizer_custom_eo
  efl_canvas_gesture_manager_eo,                      // io. -> Evas_Common, efl_canvas_gesture_recognizer_eo
  efl_canvas_gesture_momentum_eo,                     // io.
  efl_canvas_gesture_rotate_eo,                       // io.
  efl_canvas_gesture_zoom_eo,                         // io.

  efl_canvas_gesture_double_tap_eo,                   // io.
  efl_canvas_gesture_long_press_eo,                   // io.
  efl_canvas_gesture_recognizer_double_tap_eo,        // io.
  efl_canvas_gesture_recognizer_flick_eo,             // io.
  efl_canvas_gesture_recognizer_long_press_eo,        // io.
  efl_canvas_gesture_recognizer_momentum_eo,          // io.
  efl_canvas_gesture_recognizer_rotate_eo,            // io.
  efl_canvas_gesture_recognizer_tap_eo,               // io.
  efl_canvas_gesture_recognizer_triple_tap_eo,        // io.
  efl_canvas_gesture_recognizer_zoom_eo,              // io.
  efl_canvas_gesture_tap_eo,                          // io.
  efl_canvas_gesture_triple_tap_eo,                   // io.

  // =======================================


  // elementary-1        -> Evas
  elm_general,                                         // io.     ( makro ELM_MAIN entfernt )
  elm_win_legacy,                                      // io.     ( Doppelt Methoden evtl. Bug in C-Hedader )
  elm_box_legacy,                                      // io.
  elm_box_eo_legacy,                                   // io.
  elm_button_legacy,                                   // io.
  elm_entry_common,                                    // io. -> elm_general
  elm_entry_eo_legacy,                                 // io. -> elm_general, elm_entry_common
  elm_entry_legacy,                                    // io. -> elm_general
  elm_object,                                          // io. -> elm_general


  Math;

  procedure on_win_del(data: pointer; obj: PEvas_Object; event_info: pointer); cdecl;
  begin
    elm_exit;
  end;

  procedure on_button_click(data: pointer; obj: PEvas_Object; event_info: pointer); cdecl;
  begin
    elm_object_text_set(obj, 'Geklickt!');
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

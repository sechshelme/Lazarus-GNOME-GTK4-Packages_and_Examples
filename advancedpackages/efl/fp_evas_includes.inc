



// evas-1/canvas
{$include evas-1/canvas/efl_canvas_vg_node_eo_legacy}                       // io.
{$include evas-1/canvas/efl_canvas_vg_node_eo}                              // io.
{$include evas-1/canvas/efl_canvas_vg_container_eo_legacy}                  // io. -> efl_canvas_vg_node_eo_legacy
{$include evas-1/canvas/efl_canvas_vg_shape_eo_legacy}                      // io. -> efl_canvas_vg_node_eo_legacy
{$include evas-1/canvas/efl_canvas_vg_shape_eo}                             // io. -> efl_canvas_vg_node_eo
{$include evas-1/canvas/efl_canvas_vg_gradient_eo_legacy}                   // io.

// evas-1
{$include evas-1/Evas_Loader.inc}                                        // io.
{$include evas-1/Evas_Common.inc}                                        // io. -> Evas_Loader
{$include evas-1/Evas_Legacy.inc}                                        // io. -> Evas_Common, Evas_Loader, efl_canvas_vg_container_eo_legacy, efl_canvas_vg_shape_eo_legacy, efl_canvas_vg_node_eo_legacy,efl_canvas_vg_gradient_eo_legacy;
{$include evas-1/Evas_GL.inc}                                            // io. -> Evas_Common, Evas_Legacy ( Viele doppelte Conste entfernt )
{$include evas-1/Evas_Engine_Buffer.inc}                                 // io.
{$include evas-1/Evas_Eo.inc}                                            // io.
{$include evas-1/evas_ector_software_buffer_eo.inc}                      // io.        ( record zerkleinert )

// evas-1/canvas
{$include evas-1/canvas/efl_canvas_vg_object_eo_legacy.inc}                     // io. -> Evas_Common, efl_canvas_vg_node_eo_legacy
{$include evas-1/canvas/efl_canvas_vg_object_eo.inc}                            // io. -> efl_canvas_vg_node_eo
{$include evas-1/canvas/efl_canvas_vg_container_eo.inc}                         // io. -> efl_canvas_vg_node_eo
{$include evas-1/canvas/efl_canvas_vg_image_eo.inc}                             // io.
{$include evas-1/canvas/efl_canvas_vg_gradient_eo.inc}                          // io.
{$include evas-1/canvas/efl_canvas_vg_gradient_linear_eo.inc}                   // io.
{$include evas-1/canvas/efl_canvas_vg_gradient_radial_eo.inc}                   // io.
{$include evas-1/canvas/efl_gfx_vg_value_provider_eo.inc}                       // io.
{$include evas-1/canvas/efl_input_types_eot.inc}                                // io.
{$include evas-1/canvas/efl_input_pointer_eo.inc}                               // io. -> efl_input_types_eot
{$include evas-1/canvas/efl_input_event_eo.inc}                                 // io. -> Evas_Common, efl_input_types_eot
{$include evas-1/canvas/efl_input_state_eo.inc}                                 // io. -> Evas_Common, efl_input_types_eot
{$include evas-1/canvas/efl_input_interface_eo.inc}                             // io.
{$include evas-1/canvas/efl_input_key_eo.inc}                                   // io.
{$include evas-1/canvas/efl_input_clickable_eo.inc}                             // io.
{$include evas-1/canvas/efl_input_device_eo.inc}                                // io.
{$include evas-1/canvas/efl_input_focus_eo.inc}                                 // io.
{$include evas-1/canvas/efl_input_hold_eo.inc}                                  // io.
{$include evas-1/canvas/efl_gfx_mapping_eo.inc}                                 // io.
{$include evas-1/canvas/efl_text_cursor_object_eo.inc}                          // io. -> Evas_Common
{$include evas-1/canvas/efl_text_formatter_eo.inc}                              // io. -> efl_text_cursor_object_eo
{$include evas-1/canvas/efl_canvas_textblock_eo_legacy.inc}                     // io. -> Evas_Common
{$include evas-1/canvas/efl_canvas_textblock_eo.inc}                            // io. -> Evas_Common, efl_text_cursor_object_eo
{$include evas-1/canvas/efl_canvas_textblock_factory_eo.inc}                    // io. -> Evas_Common
{$include evas-1/canvas/efl_canvas_animation_types_eot.inc}                     // io.
{$include evas-1/canvas/efl_canvas_animation_eo.inc}                            // io. -> Evas_Common, efl_canvas_animation_types_eot
{$include evas-1/canvas/efl_canvas_group_animation_eo.inc}                      // io. -> efl_canvas_animation_eo
{$include evas-1/canvas/efl_canvas_object_animation_eo.inc}                     // io. -> efl_canvas_animation_eo
{$include evas-1/canvas/efl_canvas_scene_eo.inc}                                // io. -> Evas_Common
{$include evas-1/canvas/efl_canvas_object_eo.inc}                               // io. -> Evas_Common, efl_input_types_eot
{$include evas-1/canvas/efl_canvas_object_eo_legacy.inc}                        // io. -> Evas_Common
{$include evas-1/canvas/efl_canvas_group_eo_legacy.inc}                         // io.
{$include evas-1/canvas/efl_canvas_group_eo.inc}                                // io. -> Evas_Common
{$include evas-1/canvas/efl_canvas_filter_internal_eo.inc}                      // io.
{$include evas-1/canvas/efl_canvas_proxy_eo.inc}                                // io. -> Evas_Common
{$include evas-1/canvas/efl_canvas_rotate_animation_eo.inc}                     // io. -> Evas_Common
{$include evas-1/canvas/efl_canvas_scale_animation_eo.inc}                      // io. -> Evas_Common
{$include evas-1/canvas/efl_canvas_alpha_animation_eo.inc}                      // io.
{$include evas-1/canvas/efl_canvas_event_grabber_eo_legacy.inc}                 // io.
{$include evas-1/canvas/efl_canvas_event_grabber_eo.inc}                        // io.
{$include evas-1/canvas/efl_canvas_pointer_eo.inc}                              // io. -> Evas_Common
{$include evas-1/canvas/efl_canvas_translate_animation_eo.inc}                  // io.
{$include evas-1/canvas/efl_canvas_parallel_group_animation_eo.inc}             // io.
{$include evas-1/canvas/efl_canvas_polygon_eo.inc}                              // io.
{$include evas-1/canvas/efl_canvas_sequential_group_animation_eo.inc}           // io.
{$include evas-1/canvas/efl_canvas_snapshot_eo.inc}                             // io.
{$include evas-1/canvas/efl_canvas_image_eo.inc}                                // io.
{$include evas-1/canvas/efl_canvas_image_internal_eo.inc}                       // io.
{$include evas-1/canvas/efl_canvas_rectangle_eo.inc}                            // io.
{$include evas-1/canvas/evas_canvas_eo_legacy.inc}                              // io. -> Evas_Common
{$include evas-1/canvas/evas_text_eo_legacy.inc}                                // io. -> Evas_Legacy
{$include evas-1/canvas/evas_textblock_legacy.inc}                              // io. -> Evas_Common
{$include evas-1/canvas/evas_textgrid_eo_legacy.inc}                            // io. -> Evas_Common
{$include evas-1/canvas/evas_box_eo_legacy.inc}                                 // io. -> Evas_Common
{$include evas-1/canvas/evas_table_eo_legacy.inc}                               // io. -> Evas_Common
{$include evas-1/canvas/evas_grid_eo_legacy.inc}                                // io. -> Evas_Common
{$include evas-1/canvas/evas_image_eo_legacy.inc}                               // io.
{$include evas-1/canvas/evas_line_eo_legacy.inc}                                // io.

// evas-1/gesture
{$include evas-1/gesture/efl_canvas_gesture_types_eot.inc}                       // io. -> efl_input_types_eot
{$include evas-1/gesture/efl_canvas_gesture_custom_eo.inc}                       // io.
{$include evas-1/gesture/efl_canvas_gesture_eo.inc}                              // io. -> efl_canvas_gesture_types_eot
{$include evas-1/gesture/efl_canvas_gesture_events_eo.inc}                       // io.
{$include evas-1/gesture/efl_canvas_gesture_flick_eo.inc}                        // io.
{$include evas-1/gesture/efl_canvas_gesture_recognizer_custom_eo.inc}            // io.
{$include evas-1/gesture/efl_canvas_gesture_touch_eo.inc}                        // io. -> efl_input_pointer_eo, efl_canvas_gesture_types_eot
{$include evas-1/gesture/efl_canvas_gesture_recognizer_eo.inc}                   // io. -> efl_canvas_gesture_eo, efl_canvas_gesture_touch_eo, efl_canvas_gesture_types_eot, efl_canvas_gesture_recognizer_custom_eo
{$include evas-1/gesture/efl_canvas_gesture_manager_eo.inc}                      // io. -> Evas_Common, efl_canvas_gesture_recognizer_eo
{$include evas-1/gesture/efl_canvas_gesture_momentum_eo.inc}                     // io.
{$include evas-1/gesture/efl_canvas_gesture_rotate_eo.inc}                       // io.
{$include evas-1/gesture/efl_canvas_gesture_zoom_eo.inc}                         // io.
{$include evas-1/gesture/efl_canvas_gesture_double_tap_eo.inc}                   // io.
{$include evas-1/gesture/efl_canvas_gesture_long_press_eo.inc}                   // io.
{$include evas-1/gesture/efl_canvas_gesture_recognizer_double_tap_eo.inc}        // io.
{$include evas-1/gesture/efl_canvas_gesture_recognizer_flick_eo.inc}             // io.
{$include evas-1/gesture/efl_canvas_gesture_recognizer_long_press_eo.inc}        // io.
{$include evas-1/gesture/efl_canvas_gesture_recognizer_momentum_eo.inc}          // io.
{$include evas-1/gesture/efl_canvas_gesture_recognizer_rotate_eo.inc}            // io.
{$include evas-1/gesture/efl_canvas_gesture_recognizer_tap_eo.inc}               // io.
{$include evas-1/gesture/efl_canvas_gesture_recognizer_triple_tap_eo.inc}        // io.
{$include evas-1/gesture/efl_canvas_gesture_recognizer_zoom_eo.inc}              // io.
{$include evas-1/gesture/efl_canvas_gesture_tap_eo.inc}                          // io.
{$include evas-1/gesture/efl_canvas_gesture_triple_tap_eo.inc}                   // io.


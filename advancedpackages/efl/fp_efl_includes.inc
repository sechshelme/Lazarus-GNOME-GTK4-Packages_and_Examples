
// === efl-1/interfaces

{$include efl-1/interfaces/efl_gfx_types_eot.inc}                                   // io.
{$include efl-1/interfaces/efl_model_eo.inc}                                        // io.
{$include efl-1/interfaces/efl_observable_eo.inc}                                   // io.
{$include efl-1/interfaces/efl_config_eo.inc}                                       // io.

// === efl-1

{$include efl-1/Efl.inc}                                                 // io. -> efl_gfx_types_eot, efl_observable_eo, efl_config_eo     ( Name ändern )
{$include efl-1/Efl_MVVM_Common.inc}                                     // io. -> efl_model_eo

// === efl-1/interfaces

{$include efl-1/interfaces/efl_gfx_image_eo.inc}                                     // io.
{$include efl-1/interfaces/efl_gfx_entity_eo.inc}                                    // io.
{$include efl-1/interfaces/efl_gfx_hint_eo.inc}                                      // io. -> efl_gfx_types_eot
{$include efl-1/interfaces/efl_gfx_buffer_eo.inc}                                    // io. -> efl_gfx_types_eot
{$include efl-1/interfaces/efl_gfx_path_eo.inc}                                      // io. -> efl_gfx_types_eot
{$include efl-1/interfaces/efl_gfx_color_class_eo.inc}                               // io. -> efl_gfx_types_eot
{$include efl-1/interfaces/efl_gfx_shape_eo.inc}                                     // io. -> efl_gfx_types_eot
{$include efl-1/interfaces/efl_gfx_arrangement_eo.inc}                               // io. -> efl_gfx_types_eot
{$include efl-1/interfaces/efl_gfx_filter_eo.inc}                                    // io. -> efl_gfx_entity_eo
{$include efl-1/interfaces/efl_gfx_image_load_controller_eo.inc}                     // io.
{$include efl-1/interfaces/efl_gfx_stack_eo.inc}                                     // io.
{$include efl-1/interfaces/efl_gfx_frame_controller_eo.inc}                          // io.
{$include efl-1/interfaces/efl_gfx_image_orientable_eo.inc}                          // io.
{$include efl-1/interfaces/efl_gfx_blur_eo.inc}                                      // io.
{$include efl-1/interfaces/efl_gfx_color_eo.inc}                                     // io.
{$include efl-1/interfaces/efl_gfx_fill_eo.inc}                                      // io.
{$include efl-1/interfaces/efl_gfx_gradient_radial_eo.inc}                           // io.
{$include efl-1/interfaces/efl_gfx_size_class_eo.inc}                                // io.
{$include efl-1/interfaces/efl_gfx_text_class_eo.inc}                                // io. -> efl_gfx_types_eot
{$include efl-1/interfaces/efl_gfx_view_eo.inc}                                      // io.
{$include efl-1/interfaces/efl_gfx_gradient_eo.inc}                                  // io. -> efl_gfx_types_eot
{$include efl-1/interfaces/efl_gfx_gradient_linear_eo.inc}                           // io.
{$include efl-1/interfaces/efl_text_font_properties_eo.inc}                          // io. -> efl_gfx_types_eot
{$include efl-1/interfaces/efl_text_eo.inc}                                          // io.
{$include efl-1/interfaces/efl_text_style_eo.inc}                                    // io.
{$include efl-1/interfaces/efl_text_types_eot.inc}                                   // io.
{$include efl-1/interfaces/efl_text_format_eo.inc}                                   // io.
{$include efl-1/interfaces/efl_text_markup_eo.inc}                                   // io.
{$include efl-1/interfaces/efl_text_markup_util_eo.inc}                              // io.
{$include efl-1/interfaces/efl_input_text_entity_eo.inc}                             // io.
{$include efl-1/interfaces/efl_ui_drag_types_eot.inc}                                // io.
{$include efl-1/interfaces/efl_ui_drag_eo.inc}                                       // io. -> efl_ui_drag_types_eot
{$include efl-1/interfaces/efl_ui_scrollbar_eo.inc}                                  // io.
{$include efl-1/interfaces/efl_ui_layout_orientable_eo.inc}                          // io.
{$include efl-1/interfaces/efl_ui_scrollable_eo.inc}                                 // io. -> efl_ui_layout_orientable_eo
{$include efl-1/interfaces/efl_ui_zoom_eo.inc}                                       // io.
{$include efl-1/interfaces/efl_ui_autorepeat_eo.inc}                                 // io.
{$include efl-1/interfaces/efl_ui_factory_eo.inc}                                    // io. -> efl_gfx_entity_eo, efl_model_eo
{$include efl-1/interfaces/efl_ui_range_display_eo.inc}                              // io.
{$include efl-1/interfaces/efl_ui_i18n_eo.inc}                                       // io.
{$include efl-1/interfaces/efl_ui_property_bind_eo.inc}                              // io.
{$include efl-1/interfaces/efl_ui_range_interactive_eo.inc}                          // io.
{$include efl-1/interfaces/efl_ui_draggable_eo.inc}                                  // io.
{$include efl-1/interfaces/efl_ui_factory_bind_eo.inc}                               // io.
{$include efl-1/interfaces/efl_ui_container_selectable_eo.inc}                       // io.
{$include efl-1/interfaces/efl_ui_layout_orientable_readonly_eo.inc}                 // io.
{$include efl-1/interfaces/efl_ui_view_eo.inc}                                       // io. -> efl_model_eo
{$include efl-1/interfaces/efl_ui_view_factory_eo.inc}                               // io. -> efl_ui_factory_eo
{$include efl-1/interfaces/efl_pack_linear_eo.inc}                                   // io. -> efl_gfx_entity_eo
{$include efl-1/interfaces/efl_pack_table_eo.inc}                                    // io. -> efl_gfx_entity_eo
{$include efl-1/interfaces/efl_pack_eo.inc}                                          // io. -> efl_gfx_entity_eo
{$include efl-1/interfaces/efl_pack_layout_eo.inc}                                   // io.
{$include efl-1/interfaces/efl_content_eo.inc}                                       // io. -> efl_gfx_entity_eo
{$include efl-1/interfaces/efl_io_buffer_eo.inc}                                     // io.
{$include efl-1/interfaces/efl_io_queue_eo.inc}                                      // io.
{$include efl-1/interfaces/efl_io_closer_eo.inc}                                     // io.
{$include efl-1/interfaces/efl_io_reader_eo.inc}                                     // io.
{$include efl-1/interfaces/efl_io_writer_eo.inc}                                     // io.
{$include efl-1/interfaces/efl_io_sizer_eo.inc}                                      // io.
{$include efl-1/interfaces/efl_io_positioner_eo.inc}                                 // io.
{$include efl-1/interfaces/efl_player_eo.inc}                                        // io.
{$include efl-1/interfaces/efl_file.inc}                                             // io.
{$include efl-1/interfaces/efl_file_eo.inc}                                          // io.
{$include efl-1/interfaces/efl_file_save_eo.inc}                                     // io.
{$include efl-1/interfaces/efl_audio_control_eo.inc}                                 // io.
{$include efl-1/interfaces/efl_screen_eo.inc}                                        // io.
{$include efl-1/interfaces/efl_container_eo.inc}                                     // io.
{$include efl-1/interfaces/efl_control_eo.inc}                                       // io.
{$include efl-1/interfaces/efl_interpolator_eo.inc}                                  // io.
{$include efl-1/interfaces/efl_part_eo.inc}                                          // io.
{$include efl-1/interfaces/efl_cached_item_eo.inc}                                   // io.
{$include efl-1/interfaces/efl_duplicate_eo.inc}                                     // io.
{$include efl-1/interfaces/efl_model_provider_eo.inc}                                // io.
{$include efl-1/interfaces/efl_observer_eo.inc}                                      // io.
{$include efl-1/interfaces/efl_playable_eo.inc}                                      // io.
{$include efl-1/interfaces/efl_types_eot.inc}                                        // io.


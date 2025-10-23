

{$include ges/ges.inc}                                  // io.
{$include ges/ges_enums.inc}                            // io.
{$include ges/ges_types.inc}                            // io.
{$include ges/ges_version.inc}                          // io.
{$include ges/ges_utils.inc}                            // io.
{$include ges/ges_timeline_element.inc}                 // io.
{$include ges/ges_extractable_.inc}                     // io.
{$include ges/ges_asset.inc}                            // io.
{$include ges/ges_track_element_asset.inc}              // io.
{$include ges/ges_discoverer_manager.inc}               // io.
{$include ges/ges_frame_composition_meta.inc}           // io.
{$include ges/ges_gerror.inc}                           // io.
{$include ges/ges_screenshot.inc}                       // io.
{$include ges/ges_pipeline.inc}                         // io.
{$include ges/ges_container.inc}                        // io. -> ges_timeline_element
{$include ges/ges_group.inc}                            // io. -> ges_container
{$include ges/ges_timeline.inc}                         // io. -> ges_group, ges_timeline_element, ges_project_, ges_extractable_
{$include ges/ges_formatter.inc}                        // io.
{$include ges/ges_command_line_formatter.inc}           // io. -> ges_formatter
{$include ges/ges_project_.inc}                         // io. -> ges_formatter
{$include ges/ges_track_element.inc}                    // io. -> ges_timeline_element
{$include ges/ges_operation.inc}                        // io. -> ges_track_element
{$include ges/ges_track.inc}                            // io. -> ges_track_element
{$include ges/ges_track_element_deprecated.inc}         // io. -> ges_track_element
{$include ges/ges_base_effect.inc}                      // io. -> ges_operation
{$include ges/ges_clip.inc}                             // io. -> ges_track_element, ges_container, ges_base_effect
{$include ges/ges_layer.inc}                            // io. -> ges_clip
{$include ges/ges_source_clip.inc}                      // io. -> ges_clip
{$include ges/ges_title_clip.inc}                       // io. -> ges_source_clip
{$include ges/ges_test_clip.inc}                        // io. -> ges_source_clip
{$include ges/ges_time_overlay_clip.inc}                // io. -> ges_source_clip
{$include ges/ges_uri_clip.inc}                         // io. -> ges_source_clip
{$include ges/ges_marker_list.inc}                      // io.
{$include ges/ges_meta_container.inc}                   // io. -> ges_marker_list
{$include ges/ges_clip_asset.inc}                       // io.
{$include ges/ges_source_clip_asset.inc}                // io. -> ges_clip_asset
{$include ges/ges_uri_asset.inc}                        // io. -> ges_source_clip_asset, ges_track_element_asset
{$include ges/ges_operation_clip.inc}                   // io. -> ges_clip
{$include ges/ges_overlay_clip.inc}                     // io. -> ges_operation_clip
{$include ges/ges_text_overlay.inc}                     // io. -> ges_operation
{$include ges/ges_text_overlay_clip.inc}                // io. -> ges_overlay_clip
{$include ges/ges_source.inc}                           // io. -> ges_track_element
{$include ges/ges_transition.inc}                       // io. -> ges_operation
{$include ges/ges_audio_transition.inc}                 // io. -> ges_transition
{$include ges/ges_audio_track.inc}                      // io. -> ges_track
{$include ges/ges_audio_source.inc}                     // io. -> ges_source, ges_track_element
{$include ges/ges_audio_test_source.inc}                // io. -> ges_audio_source
{$include ges/ges_audio_uri_source.inc}                 // io. -> ges_audio_source
{$include ges/ges_video_track.inc}                      // io. -> ges_track
{$include ges/ges_video_transition.inc}                 // io. -> ges_transition
{$include ges/ges_video_source.inc}                     // io. -> ges_source, ges_track_element
{$include ges/ges_video_uri_source.inc}                 // io. -> ges_video_source, ges_audio_uri_source
{$include ges/ges_video_test_source.inc}                // io. -> ges_video_source
{$include ges/ges_title_source.inc}                     // io. -> ges_video_source
{$include ges/ges_base_effect_clip.inc}                 // io. -> ges_operation_clip
{$include ges/ges_base_transition_clip.inc}             // io. -> ges_operation_clip
{$include ges/ges_transition_clip.inc}                  // io. -> ges_base_transition_clip
{$include ges/ges_base_xml_formatter.inc}               // io. -> ges_formatter
{$include ges/ges_xml_formatter.inc}                    // io. -> ges_base_xml_formatter
{$include ges/ges_effect.inc}                           // io. -> ges_base_effect
{$include ges/ges_effect_asset.inc}                     // io. -> ges_track_element, ges_track_element_asset
{$include ges/ges_effect_clip.inc}                      // io. -> ges_base_effect_clip
{$include ges/ges_image_source.inc}                     // io. -> ges_video_source
{$include ges/ges_multi_file_source.inc}                // io. -> ges_video_source
{$include ges/ges_pitivi_formatter.inc}                 // io. -> ges_formatter




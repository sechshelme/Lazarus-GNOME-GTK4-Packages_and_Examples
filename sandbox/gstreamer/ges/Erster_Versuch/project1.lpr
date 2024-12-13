program project1;

uses
  ges,                                  // io.
  ges_enums,                            // io.
  ges_types,                            // io.
  ges_utils,                            // io.
  ges_timeline_element,                 // io.
  ges_extractable_,                     // io.
  ges_asset,                            // io.
  ges_track_element_asset,              // io.
  ges_container,                        // io. -> ges_timeline_element
  ges_group,                            // io. -> ges_container
  ges_timeline,                         // io. -> ges_group, ges_timeline_element, ges_project_, ges_extractable_
  ges_formatter,                        // io.
  ges_project_,                         // io. -> ges_formatter
  ges_track_element,                    // io. -> ges_timeline_element
  ges_operation,                        // io. -> ges_track_element
  ges_track,                            // io. -> ges_track_element
  ges_track_element_deprecated,         // io. -> ges_track_element
  ges_base_effect,                      // io. -> ges_operation
  ges_clip,                             // io. -> ges_track_element, ges_container, ges_base_effect
  ges_layer,                            // io. -> ges_clip
  ges_source_clip,                      // io. -> ges_clip
  ges_title_clip,                       // io. -> ges_source_clip
  ges_marker_list,                      // io.
  ges_meta_container,                   // io. -> ges_marker_list
  ges_clip_asset,                       // io.
  ges_source_clip_asset,                // io. -> ges_clip_asset
  ges_uri_asset,                        // io. -> ges_source_clip_asset, ges_track_element_asset
  ges_operation_clip,                   // io. -> ges_clip
  ges_overlay_clip,                     // io. -> ges_operation_clip
  ges_text_overlay,                     // io. -> ges_operation
  ges_text_overlay_clip,                // io. -> ges_overlay_clip
  ges_source,                           // io. -> ges_track_element
  ges_transition,                       // io. -> ges_operation
  ges_audio_transition,                 // io. -> ges_transition
  ges_audio_track,                      // io. -> ges_track
  ges_audio_source,                     // io. -> ges_source, ges_track_element
  ges_audio_test_source,                // io. -> ges_audio_source
  ges_audio_uri_source,                 // io. -> ges_audio_source
  ges_video_track,                      // io. -> ges_track
  ges_video_transition,                 // io. -> ges_transition
  ges_video_source,                     // io. -> ges_source, ges_track_element
  ges_video_uri_source,                 // io. -> ges_video_source, ges_audio_uri_source
  ges_video_test_source,                // io. -> ges_video_source
  ges_title_source,                     // io. -> ges_video_source
  ges_base_effect_clip,                 // io. -> ges_operation_clip
  ges_base_transition_clip,             // io. -> ges_operation_clip
  ges_base_xml_formatter,               // io. -> ges_formatter



  ctypes,
  fp_glib2,
  fp_gst;

  procedure main(argc: cint; argv: PPChar);
  var
    pipeline: PGstElement;
    bus: PGstBus;
    msg: PGstMessage;
    timeline: PGESTimeline;
  begin
    gst_init(@argc, @argv);
    ges_init;

    timeline := ges_timeline_new;
  end;


begin
  main(argc, argv);
end.

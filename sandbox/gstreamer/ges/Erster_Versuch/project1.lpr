program project1;

uses
  fp_ges,

  //ges,                                  // io.
  //ges_enums,                            // io.
  //ges_types,                            // io.
  //ges_version,                          // io.
  //ges_utils,                            // io.
  //ges_timeline_element,                 // io.
  //ges_extractable_,                     // io.
  //ges_asset,                            // io.
  //ges_track_element_asset,              // io.
  //ges_discoverer_manager,               // io.
  //ges_frame_composition_meta,           // io.
  //ges_gerror,                           // io.
  //ges_screenshot,                       // io.
  //ges_container,                        // io. -> ges_timeline_element
  //ges_group,                            // io. -> ges_container
  //ges_timeline,                         // io. -> ges_group, ges_timeline_element, ges_project_, ges_extractable_
  //ges_formatter,                        // io.
  //ges_command_line_formatter,           // io. -> ges_formatter
  //ges_project_,                         // io. -> ges_formatter
  //ges_track_element,                    // io. -> ges_timeline_element
  //ges_operation,                        // io. -> ges_track_element
  //ges_track,                            // io. -> ges_track_element
  //ges_track_element_deprecated,         // io. -> ges_track_element
  //ges_base_effect,                      // io. -> ges_operation
  //ges_clip,                             // io. -> ges_track_element, ges_container, ges_base_effect
  //ges_layer,                            // io. -> ges_clip
  //ges_source_clip,                      // io. -> ges_clip
  //ges_title_clip,                       // io. -> ges_source_clip
  //ges_test_clip,                        // io. -> ges_source_clip
  //ges_time_overlay_clip,                // io. -> ges_source_clip
  //ges_uri_clip,                         // io. -> ges_source_clip
  //ges_marker_list,                      // io.
  //ges_meta_container,                   // io. -> ges_marker_list
  //ges_clip_asset,                       // io.
  //ges_source_clip_asset,                // io. -> ges_clip_asset
  //ges_uri_asset,                        // io. -> ges_source_clip_asset, ges_track_element_asset
  //ges_operation_clip,                   // io. -> ges_clip
  //ges_overlay_clip,                     // io. -> ges_operation_clip
  //ges_text_overlay,                     // io. -> ges_operation
  //ges_text_overlay_clip,                // io. -> ges_overlay_clip
  //ges_source,                           // io. -> ges_track_element
  //ges_transition,                       // io. -> ges_operation
  //ges_audio_transition,                 // io. -> ges_transition
  //ges_audio_track,                      // io. -> ges_track
  //ges_audio_source,                     // io. -> ges_source, ges_track_element
  //ges_audio_test_source,                // io. -> ges_audio_source
  //ges_audio_uri_source,                 // io. -> ges_audio_source
  //ges_video_track,                      // io. -> ges_track
  //ges_video_transition,                 // io. -> ges_transition
  //ges_video_source,                     // io. -> ges_source, ges_track_element
  //ges_video_uri_source,                 // io. -> ges_video_source, ges_audio_uri_source
  //ges_video_test_source,                // io. -> ges_video_source
  //ges_title_source,                     // io. -> ges_video_source
  //ges_base_effect_clip,                 // io. -> ges_operation_clip
  //ges_base_transition_clip,             // io. -> ges_operation_clip
  //ges_transition_clip,                  // io. -> ges_base_transition_clip
  //ges_base_xml_formatter,               // io. -> ges_formatter
  //ges_xml_formatter,                    // io. -> ges_base_xml_formatter
  //ges_effect,                           // io. -> ges_base_effect
  //ges_effect_asset,                     // io. -> ges_track_element, ges_track_element_asset
  //ges_effect_clip,                      // io. -> ges_base_effect_clip
  //ges_image_source,                     // io. -> ges_video_source
  //ges_multi_file_source,                // io. -> ges_video_source
  //ges_pipeline,                         // io.
  //ges_pitivi_formatter,                 // io. -> ges_formatter


  ctypes,
  fp_glib2,
  fp_gst;

// https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gst-uKnhFfVmS0.DxtSmhlKVYQ

  procedure main(argc: cint; argv: PPChar);
  var
    timeline: PGESTimeline;
    audio_track: PGESTrack;
    uri: Pgchar;
    asset: PGESUriClipAsset;
    layer: PGESLayer;
    clip: PGESClip;
    pipeline: PGstPipeline;
    bus: PGstBus;
  begin
    gst_init(@argc, @argv);
    ges_init;

    timeline := ges_timeline_new;
    audio_track := ges_track_new(GES_TRACK_TYPE_AUDIO, gst_caps_new_empty_simple('audio/x-raw'));
    ges_timeline_add_track(timeline, audio_track);

    layer:=ges_layer_new;
    ges_timeline_add_layer(timeline, layer);

    uri := gst_filename_to_uri('/home/tux/Schreibtisch/sound/test.mp3', nil);
    asset := ges_uri_clip_asset_request_sync(uri, nil);
    if asset = nil then begin
      g_printerr('Konnte MP3 nicht laden'#10);
      g_free(uri);
    end;

    clip:=ges_layer_add_asset(layer, GES_ASSET(asset),0,0,GST_CLOCK_TIME_NONE,GES_TRACK_TYPE_AUDIO);
    if clip = nil then begin
      g_printerr('Konnte clip nicht erstellen'#10);
      g_free(clip);
    end;
    g_free(uri);

    pipeline:=GST_PIPELINE(ges_pipeline_new);
    if not ges_pipeline_set_timeline(GES_PIPELINE( pipeline),timeline) then       g_printerr('Konnte Timeline nicht erstellen'#10);

//    bus:=gst_element_get_bus(GST_ELEMENT(pipeline));
//    gst_bus_add_signal_watch(bus);

gst_element_set_state(GST_ELEMENT(pipeline), GST_STATE_PLAYING);

ReadLn;

  end;


begin
  main(argc, argv);
end.

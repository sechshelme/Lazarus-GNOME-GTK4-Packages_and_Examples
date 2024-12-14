program project1;

uses
  ctypes,
  fp_glib2,
  fp_gst,
  fp_ges,
  fp_gstTools;

  // gst-editing-services

  procedure main(argc: cint; argv: PPChar);
  var
    timeline: PGESTimeline;
    audio_track: PGESTrack;
    uri: Pgchar;
    asset: PGESUriClipAsset;
    layer: PGESLayer;
    clip: PGESClip;
    pipeline: PGstPipeline;
  begin
    gst_init(@argc, @argv);
    ges_init;

    timeline := ges_timeline_new;
    audio_track := ges_track_new(GES_TRACK_TYPE_AUDIO, gst_caps_new_empty_simple('audio/x-raw'));
    ges_timeline_add_track(timeline, audio_track);

    layer := ges_layer_new;
    ges_timeline_add_layer(timeline, layer);

    uri := gst_filename_to_uri('/home/tux/Schreibtisch/sound/test.mp3', nil);
    asset := ges_uri_clip_asset_request_sync(uri, nil);
    g_free(uri);

    clip := ges_layer_add_asset(layer, GES_ASSET(asset), 0, 0, GST_CLOCK_TIME_NONE, GES_TRACK_TYPE_AUDIO);

    pipeline := GST_PIPELINE(ges_pipeline_new);
    if not ges_pipeline_set_timeline(GES_PIPELINE(pipeline), timeline) then  begin
      g_printerr('Konnte Timeline nicht erstellen'#10);
    end;

    gst_element_set_state(GST_ELEMENT(pipeline), GST_STATE_PLAYING);

    ReadLn;

    gst_element_set_state(GST_ELEMENT(pipeline), GST_STATE_NULL);
    gst_object_unref(pipeline);
  end;


begin
  main(argc, argv);
end.

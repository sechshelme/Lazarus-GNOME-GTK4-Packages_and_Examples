program project1;

uses
  ctypes,
  fp_glib2,
  fp_gst,
  fp_ges,
  fp_gstTools;

// gst-editing-services

  // https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gst-uKnhFfVmS0.DxtSmhlKVYQ

  procedure main(argc: cint; argv: PPChar);
  var
    timeline: PGESTimeline;
    uri: Pgchar;
    layer: PGESLayer;
    pipeline: PGstPipeline;
    clip: PGESUriClip;
    dur: TGstClockTime;
  begin
    gst_init(@argc, @argv);
    ges_init;

    timeline := ges_timeline_new_audio_video;

    layer := ges_layer_new;
    ges_timeline_add_layer(timeline, layer);

    uri := gst_filename_to_uri('/home/tux/Schreibtisch/sound/test.mp3', nil);
    clip := ges_uri_clip_new(uri);
    if clip = nil then begin
      g_printerr('Konnte clip nicht erstellen'#10);
      g_free(clip);
    end;
    g_free(uri);

    ges_layer_add_clip(layer, GES_CLIP(clip));


    pipeline := GST_PIPELINE(ges_pipeline_new);
    if not ges_pipeline_set_timeline(GES_PIPELINE(pipeline), timeline) then  begin
      g_printerr('Konnte Timeline nicht erstellen'#10);
    end;

    //    bus:=gst_element_get_bus(GST_ELEMENT(pipeline));
    //    gst_bus_add_signal_watch(bus);

    gst_element_set_state(GST_ELEMENT(pipeline), GST_STATE_PLAYING);


    ReadLn;

    gst_element_set_state(GST_ELEMENT(pipeline), GST_STATE_NULL);
    gst_object_unref(pipeline);
  end;


begin
  main(argc, argv);
end.

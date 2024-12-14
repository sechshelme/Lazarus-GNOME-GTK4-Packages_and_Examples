program project1;

uses
  ctypes,
  fp_glib2,
  fp_gst,
  fp_ges,
  fp_gstTools;

  // gst-editing-services

  // https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gst-uKnhFfVmS0.DxtSmhlKVYQ
  // https://www.perplexity.ai/search/ist-sowas-mit-g-signal-connect-MwGLHIYTSfa7xp7xQlqP5Q

var
  mainloop: PGMainLoop;


  procedure message_cb({%H-}bus: PGstBus; msg: PGstMessage; {%H-}Data: Pointer); cdecl;
  begin
    //    WriteLn('Message: ', gst_message_type_get_name(msg^._type));
    case GST_MESSAGE_TYPE(msg) of
      GST_MESSAGE_EOS: begin
        g_printf('Stream Ende'#10);
        g_main_loop_quit(mainloop);
      end;
      GST_MESSAGE_ERROR: begin
        g_printf('Error'#10);
      end;
    end;
  end;

  procedure main(argc: cint; argv: PPChar);
  var
    timeline: PGESTimeline;
    layer: PGESLayer;
    pipeline: PGstPipeline;
    bus: PGstBus;
    track_video: PGESTrack;
    clip: PGESTestClip;
  begin
    gst_init(@argc, @argv);
    ges_init;

    timeline := ges_timeline_new;
    track_video := ges_track_new(GES_TRACK_TYPE_VIDEO, gst_caps_new_empty_simple('video/x-raw'));

    ges_timeline_add_track(timeline, track_video);

    layer := ges_layer_new;
    ges_timeline_add_layer(timeline, layer);

    clip := g_object_new(GES_TYPE_TEST_CLIP,
      'duration', GST_SECOND * 5,
      'start', 0,
      'vpattern', GES_VIDEO_TEST_PATTERN_SMPTE,
      nil);
    ges_layer_add_clip(layer, GES_CLIP(clip));

    pipeline := GST_PIPELINE(ges_pipeline_new);
    ges_pipeline_set_timeline(GES_PIPELINE(pipeline), timeline);

    bus := gst_element_get_bus(GST_ELEMENT(pipeline));
    if bus = nil then begin
      g_printerr('Konnte bus nicht erstellen'#10);
      g_free(clip);
    end;
    gst_bus_add_signal_watch(bus);
    g_signal_connect(G_OBJECT(bus), 'message', G_CALLBACK(@message_cb), nil);
    gst_object_unref(bus);

    gst_element_set_state(GST_ELEMENT(pipeline), GST_STATE_PLAYING);
    g_printf('Start'#10);

    mainloop := g_main_loop_new(nil, False);
    g_main_loop_run(mainloop);

    gst_element_set_state(GST_ELEMENT(pipeline), GST_STATE_NULL);
    g_printf('End'#10);
    gst_object_unref(pipeline);
  end;


begin
  main(argc, argv);
end.

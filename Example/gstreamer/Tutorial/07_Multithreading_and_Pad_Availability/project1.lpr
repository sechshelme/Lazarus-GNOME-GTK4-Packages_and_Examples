program project1;

uses
  ctypes,
  glib280,
  gst124;

  // https://gstreamer.freedesktop.org/documentation/tutorials/basic/multithreading-and-pad-availability.html?gi-language=c

  function main(argc: cint; argv: PPChar): cint;
  var
    audio_source, tee, audio_queue, audio_convert, audio_resample,
    audio_sink, video_queue, video_convert, visual, video_sink,
    pipeline: PGstElement;
    tee_audio_pad, queue_audio_pad, tee_video_pad, queue_video_pad: PGstPad;
    bus: PGstBus;
    msg: PGstMessage;
  begin
    gst_init(@argc, @argv);

    audio_source := gst_element_factory_make('audiotestsrc', 'audio_source');
    tee := gst_element_factory_make('tee', 'tee');
    audio_queue := gst_element_factory_make('queue', 'audio_queue');
    audio_convert := gst_element_factory_make('audioconvert', 'audio_convert');
    audio_resample := gst_element_factory_make('audioresample', 'audio_resample');
    audio_sink := gst_element_factory_make('autoaudiosink', 'audio_sink');
    video_queue := gst_element_factory_make('queue', 'video_queue');
    visual := gst_element_factory_make('wavescope', 'visual');
    video_convert := gst_element_factory_make('videoconvert', 'csp');
    video_sink := gst_element_factory_make('autovideosink', 'video_sink');

    pipeline := gst_pipeline_new('test-pipeline');

    if (pipeline = nil) or (audio_source = nil) or (tee = nil) or (audio_queue = nil) or (audio_convert = nil) or (audio_resample = nil) or (audio_sink = nil) or (video_queue = nil) or (visual = nil) or
      (video_convert = nil) or (video_sink = nil) then begin
      g_printerr('"Not all elements could be created.'#10);
      Exit(-1);
    end;

    g_object_set(audio_source, 'freq', 215.0, nil);
    g_object_set(visual, 'shader', 0, 'style', 1, nil);

    gst_bin_add_many(GST_BIN(pipeline), audio_source, tee, audio_queue, audio_convert, audio_resample, audio_sink, video_queue, visual, video_convert, video_sink, nil);

    if not gst_element_link_many(audio_source, tee, nil) or
      not gst_element_link_many(audio_queue, audio_convert, audio_resample, audio_sink, nil) or
      not gst_element_link_many(video_queue, visual, video_convert, video_sink, nil)
    then begin
      g_printerr('Elements could not be linked.'#10);
      gst_object_unref(pipeline);
      Exit(-1);
    end;

    tee_audio_pad := gst_element_request_pad_simple(tee, 'src_%u');
    g_print('Obtained request pad %s for audio branch.'#10, gst_pad_get_name(tee_audio_pad));
    queue_audio_pad := gst_element_get_static_pad(audio_queue, 'sink');

    tee_video_pad := gst_element_request_pad_simple(tee, 'src_%u');
    g_print('Obtained request pad %s for video branch.'#10, gst_pad_get_name(tee_video_pad));
    queue_video_pad := gst_element_get_static_pad(video_queue, 'sink');

    if (gst_pad_link(tee_audio_pad, queue_audio_pad) <> GST_PAD_LINK_OK) or (gst_pad_link(tee_video_pad, queue_video_pad) <> GST_PAD_LINK_OK) then  begin
      g_printerr('Tee could not be linked.'#10);
      gst_object_unref(pipeline);
      Exit(-1);
    end;

    gst_object_unref(queue_audio_pad);
    gst_object_unref(queue_video_pad);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    bus := gst_element_get_bus(pipeline);
    msg := gst_bus_timed_pop_filtered(bus, GST_CLOCK_TIME_NONE, GST_MESSAGE_ERROR or GST_MESSAGE_EOS);

    gst_element_release_request_pad(tee, tee_audio_pad);
    gst_element_release_request_pad(tee, tee_video_pad);
    gst_object_unref(tee_audio_pad);
    gst_object_unref(tee_video_pad);

    if msg <> nil then begin
      gst_message_unref(msg);
    end;
    gst_object_unref(bus);
    gst_element_set_state(pipeline, GST_STATE_NULL);

    gst_object_unref(pipeline);
  end;

begin
  main(argc, argv);
  WriteLn('ende');
end.

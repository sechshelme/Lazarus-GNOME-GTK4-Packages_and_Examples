program project1;

uses
  ctypes,
  fp_glib2,
  fp_gst;

  procedure message_cb({%H-}bus: PGstBus; msg: PGstMessage; {%H-}Data: Pointer); cdecl;
  var
    mainloop: PPGMainLoop absolute Data;
  begin
    //    WriteLn('Message: ', gst_message_type_get_name(msg^._type));
    case GST_MESSAGE_TYPE(msg) of
      GST_MESSAGE_EOS: begin
        g_printf('Stream Ende'#10);
        g_main_loop_quit(mainloop^);
      end;
      GST_MESSAGE_ERROR: begin
        g_printf('Error'#10);
      end;
    end;
  end;

  procedure tutorial_main(argc: cint; argv: PPChar);
  var
    pipeline, nlecomposition, videosrc1, videosrc2, videosink,
    nlesrc1, nlesrc2: PGstElement;
    mainloop: PGMainLoop=nil;
    bus: PGstBus;
  begin
    gst_init(@argc, @argv);

    pipeline := gst_pipeline_new('non-linear-editing');
    nlecomposition := gst_element_factory_make('nlecomposition', 'composition');
    videosrc1 := gst_element_factory_make('videotestsrc', 'source1');
    videosrc2 := gst_element_factory_make('videotestsrc', 'source2');
    videosink := gst_element_factory_make('autovideosink', 'sink');
    nlesrc1 := gst_element_factory_make('nlesource', 'nlesrc1');
    nlesrc2 := gst_element_factory_make('nlesource', 'nlesrc2');

    if (pipeline = nil) or (nlecomposition = nil) or (videosrc1 = nil) or (videosrc2 = nil) or (videosink = nil) or (nlesrc1 = nil) or (nlesrc2 = nil) then begin
      g_printerr('Not all elements could be created.'#10);
      exit;
    end;

    gst_bin_add_many(GST_BIN(pipeline), nlecomposition, videosink, nil);
    gst_bin_add(GST_BIN(nlesrc1), videosrc1);
    gst_bin_add(GST_BIN(nlesrc2), videosrc2);
    gst_bin_add_many(GST_BIN(nlecomposition), nlesrc1, nlesrc2, nil);

    if (not gst_element_link(nlecomposition, videosink)) then begin
      g_printerr('Elements could not be linked.'#10);
      gst_object_unref(pipeline);
      exit;
    end;

    g_object_set(G_OBJECT(videosrc1), 'pattern', 0, nil);
    g_object_set(G_OBJECT(videosrc2), 'pattern', 1, nil);

    g_object_set(G_OBJECT(nlesrc1), 'start', 0, 'duration', 2 * GST_SECOND, nil);
    g_object_set(G_OBJECT(nlesrc2), 'start', 2 * GST_SECOND, 'duration', 2 * GST_SECOND, nil);

    bus := gst_element_get_bus(GST_ELEMENT(pipeline));
    gst_bus_add_signal_watch(bus);
    g_signal_connect(G_OBJECT(bus), 'message', G_CALLBACK(@message_cb), @mainloop);
    gst_object_unref(bus);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    mainloop := g_main_loop_new(nil, False);
    g_main_loop_run(mainloop);

    gst_element_set_state(pipeline, GST_STATE_NULL);

    g_main_loop_unref(mainloop);
    gst_object_unref(pipeline);
  end;

begin
  tutorial_main(argc, argv);
end.

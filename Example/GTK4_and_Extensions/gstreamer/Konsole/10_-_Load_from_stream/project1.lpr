
program project1;

uses
  fp_glib2,
  fp_gst_app,
  fp_gst;

type
  TAudioBuffer = record
    name: Pgchar;
    Data: Pgchar;
    len: SizeInt;
    ofs: SizeInt;
  end;
  PAudioBuffer = ^TAudioBuffer;

const
  audiopath = '/home/tux/Schreibtisch/sound/test.wav';

  procedure push_buffer(appsrc: PGstAppSrc; length_: Tguint; user_data: Tgpointer) cdecl;
  var
    audioBuffer: PAudioBuffer absolute user_data;
    buffer: PGstBuffer;
    bytes_read: SizeInt;
  begin
    if audioBuffer^.ofs < audioBuffer^.len - length_ then begin
      bytes_read := length_;
    end else begin
      bytes_read := audioBuffer^.len - audioBuffer^.ofs;
    end;
    WriteLn('len: ', audioBuffer^.len, '  ofs:', audioBuffer^.ofs, '  bytes_read: ', bytes_read);
    if bytes_read > 0 then  begin
      buffer := gst_buffer_new_allocate(nil, bytes_read, nil);
      gst_buffer_fill(buffer, 0, @audioBuffer^.Data[audioBuffer^.ofs], bytes_read);
      gst_app_src_push_buffer(appsrc, buffer);
    end;
    Inc(audioBuffer^.ofs, length_);
  end;

  function LoadAudioBuffer: TAudioBuffer;
  var
    err: PGError = nil;
  begin
    Result.name := 'Mein Buffer';
    Result.len := 0;
    Result.ofs := 0;
    if not g_file_get_contents(audiopath, @Result.Data, @Result.len, @err) then begin
      g_printerr('Datei Fehler: ', err^.message);
      g_error_free(err);
      Result.len := 0;
    end;
  end;

  procedure main;
  var
    pipeline, appsrc, wavparse, convert, sink: PGstElement;
    loop: PGMainLoop;
    bus: PGstBus;
    msg: PGstMessage;
    err: PGError = nil;
    dbg: Pgchar;
    audioBuffer: TAudioBuffer;

  begin
    audioBuffer := LoadAudioBuffer;

    gst_init(@argc, @argv);

    pipeline := gst_pipeline_new('player');
    appsrc := gst_element_factory_make('appsrc', 'source');
    wavparse := gst_element_factory_make('wavparse', 'parser');
    convert := gst_element_factory_make('audioconvert', 'convert');
    sink := gst_element_factory_make('autoaudiosink', 'sink');

    if (pipeline = nil) or (appsrc = nil) or (wavparse = nil) or (convert = nil) or (sink = nil) then begin
      g_printerr('Fehlende Elemente'#10);
      Exit;
    end;

    g_signal_connect(appsrc, 'need-data', G_CALLBACK(@push_buffer), @audioBuffer);

    gst_bin_add_many(GST_BIN(pipeline), appsrc, wavparse, convert, sink, nil);
    gst_element_link_many(appsrc, wavparse, convert, sink, nil);

    loop := g_main_loop_new(nil, False);
    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    bus := gst_element_get_bus(pipeline);
    msg := gst_bus_timed_pop_filtered(bus, GST_CLOCK_TIME_NONE, GST_MESSAGE_ERROR or GST_MESSAGE_EOS);

    if msg <> nil then begin
      if GST_MESSAGE_TYPE(msg) = GST_MESSAGE_ERROR then begin
        gst_message_parse_error(msg, @err, @dbg);
        g_printerr('Fehler: %s'#10, err^.message);
        g_clear_error(@err);
        g_free(dbg);
      end;
      gst_message_unref(msg);
    end;

    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(bus);
    gst_object_unref(pipeline);
    g_main_loop_unref(loop);

    g_free(audioBuffer.Data);
  end;

begin
  main;
end.

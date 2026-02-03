
program project1;

uses
  fp_glib2,
  fp_gst_app,
  fp_gst;

const
  FREQ_HZ = 1000.0;
  SAMPLE_RATE = 44100;
  CANNELS = 2;

type
  Tctx = record
    phase: array[0..CANNELS - 1] of Tgdouble;
    frequency: Tgdouble;
    sample_rate: Tgint;
  end;
  Pctx = ^Tctx;

  procedure push_buffer(appsrc: PGstAppSrc; length_: Tguint; user_data: Tgpointer) cdecl;
  var
    ctx: Pctx absolute user_data;
    num_samples, i, j: integer;
    buffer: PGstBuffer;
    map: TGstMapInfo;
    raw_samples: Pgint16;
    ret: TGstFlowReturn;
  begin
    num_samples := length_ div (CANNELS * sizeof(Tgint16));
    buffer := gst_buffer_new_allocate(nil, length_, nil);

    gst_buffer_map(buffer, @map, GST_MAP_WRITE);
    raw_samples := Pgint16(map.data);

    for  i := 0 to num_samples - 1 do begin
      for j := 0 to CANNELS - 1 do begin
        raw_samples[i * CANNELS + j] := Trunc(30000.0 * sin(2.0 * PI * ctx^.phase[j]));

        ctx^.phase[j] += ctx^.frequency / ctx^.sample_rate * (1 + j * 0.1);
        if ctx^.phase[j] >= 1.0 then begin
          ctx^.phase[j] -= 1.0;
        end;
      end;
    end;

    gst_buffer_unmap(buffer, @map);

    g_signal_emit_by_name(appsrc, 'push-buffer', buffer, @ret);
    gst_buffer_unref(buffer);
  end;

  procedure main;
  var
    pipeline, appsrc, convert, sink: PGstElement;
    loop: PGMainLoop;
    bus: PGstBus;
    msg: PGstMessage;
    err: PGError = nil;
    dbg: Pgchar;
    ctx: Tctx;
    caps: PGstCaps;
    j: integer;

  begin
    gst_init(@argc, @argv);

    for j := 0 to CANNELS - 1 do begin
      ctx.phase[j] := 0.0;
    end;
    ctx.frequency := FREQ_HZ;
    ctx.sample_rate := SAMPLE_RATE;

    pipeline := gst_pipeline_new('custom-sine-player');
    appsrc := gst_element_factory_make('appsrc', 'source');
    convert := gst_element_factory_make('audioconvert', 'convert');
    sink := gst_element_factory_make('autoaudiosink', 'sink');

    if (pipeline = nil) or (appsrc = nil) or (convert = nil) or (sink = nil) then begin
      g_printerr('Fehlende Elemente'#10);
      Exit;
    end;

    caps := gst_caps_new_simple('audio/x-raw',
      'format', G_TYPE_STRING, 'S16LE',
      'rate', G_TYPE_INT, SAMPLE_RATE,
      'channels', G_TYPE_INT, CANNELS,
      'channel-mask', GST_TYPE_BITMASK, $F003,
      'layout', G_TYPE_STRING, 'interleaved',
      nil);

    g_object_set(appsrc, 'caps', caps, nil);
    gst_caps_unref(caps);

    g_object_set(appsrc, 'format', GST_FORMAT_TIME, nil);
    g_signal_connect(appsrc, 'need-data', G_CALLBACK(@push_buffer), @ctx);

    gst_bin_add_many(GST_BIN(pipeline), appsrc, convert, sink, nil);
    gst_element_link_many(appsrc, convert, sink, nil);

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
  end;

begin
  main;
end.

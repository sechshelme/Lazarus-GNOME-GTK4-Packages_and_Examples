
program project1;

uses
  crt,
  Strings,
  glib2,
  ctypes,
  gst;

  // https://forums.developer.nvidia.com/t/pipeline-ends-after-4-seconds-with-gst-message-eos/253486

const
  GST_CLOCK_TIME_NONE = TGstClockTime(-1);
  G_USEC_PER_SEC = 1000000;

  function dB_to_Prozent(db: Tgdouble): Tguint32;
  begin
    Result := 300 - abs(Round(db) * 10);
  end;


  function message_handler(bus: PGstBus; message: PGstMessage; user_data: Tgpointer): Tgboolean; cdecl;
  var
    s: PGstStructure;
    Name: Pgchar;
    endtime: TGstClockTime;
    array_val: PGValue;
    rms_arr: PGValueArray;
    channels: guint;
    i: integer;
    Value: glib2.PGValue;
    rms_dB: gdouble;
    db: Tguint32;
  begin
    if message^._type = GST_MESSAGE_ELEMENT then begin
      s := gst_message_get_structure(message);
      Name := gst_structure_get_name(s);
      if strcomp(Name, 'level') = 0 then begin
        if not gst_structure_get_clock_time(s, 'endtime', @endtime) then begin
          WriteLn('endtime warning');
        end;

        array_val := gst_structure_get_value(s, 'decay');
        if array_val = nil then begin
          WriteLn('rms error');
        end;
        rms_arr := PGValueArray(g_value_get_boxed(array_val));

        channels := rms_arr^.n_values;

        ClrScr;
        WriteLn('channels: ', channels);
        for i := 0 to channels - 1 do begin

          Value := g_value_array_get_nth(rms_arr, i);
          rms_dB := g_value_get_double(Value);
          GotoXY(1, i + 1);
          WriteLn('pegel: ', rms_dB: 8: 4);
          db:=dB_to_Prozent(rms_dB);
          GotoXY(20 + db, i + 1);
          Write('X');
          Write(db);
        end;
      end;
    end;

  end;

  procedure tutorial_main(argc: cint; argv: PPChar);
  var
    pipeline, volume, level, sink: PGstElement;
    bus: PGstBus;
    watch_id: TGUINT;
    quit: boolean = False;
    ch: ansichar;
    vol: Tgdouble = 0.5;
  const
//    path='/home/tux/Schreibtisch/sound/test.mp3';
    path='/n4800/Multimedia/SACD/diverse/Mythos - Mysteria/CD 1/01 - Karakuri.flac';
  begin
    gst_init(@argc, @argv);

    pipeline := gst_parse_launch('filesrc location="'+path+'" ! decodebin ! audioconvert ! audioresample ! volume name=volume ! level name=level ! autoaudiosink name=sink', nil);

    volume := gst_bin_get_by_name(GST_BIN(pipeline), 'volume');
    if volume = nil then begin
      WriteLn('Volume error !');
    end;
    //    g_object_set(G_OBJECT(volume), 'volume', 0.1, nil);

    sink := gst_bin_get_by_name(GST_BIN(pipeline), 'sink');
    if sink = nil then begin
      WriteLn('Sink error !');
    end;
    g_object_set(G_OBJECT(sink), 'sync', True, nil);

    level := gst_bin_get_by_name(GST_BIN(pipeline), 'level');
    if level = nil then begin
      WriteLn('Level error !');
    end;
    g_object_set(G_OBJECT(level), 'post-messages', True, nil);

    bus := gst_element_get_bus(pipeline);
    watch_id := gst_bus_add_watch(bus, @message_handler, nil);
    gst_object_unref(bus);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    repeat
      g_main_iteration(False);
      g_object_set(volume, 'volume', vol, nil);
      if KeyPressed then begin
        ch := ReadKey;
        case ch of
          #27: begin
            quit := True;
          end;
          '+': begin
            vol += 0.1;
            if vol >= 1.0 then begin
              vol := 1.0;
            end;
          end;
          '-': begin
            vol -= 0.1;
            if vol <= 0.0 then begin
              vol := 0.0;
            end;
          end;
        end;
      end;

    until quit;
    gst_element_set_state(pipeline, GST_STATE_NULL);

    g_source_remove(watch_id);

    gst_object_unref(pipeline);
  end;

begin
  tutorial_main(argc, argv);
end.

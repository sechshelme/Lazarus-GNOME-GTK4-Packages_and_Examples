program playmp3;
{$mode objfpc}
{$h+}

uses
  crt,
  SysUtils,
  glib280,
  GLIBTools,
  gst124,
  gst124_tag,
  gst124_audio;


  // https://github.com/GStreamer/gst-plugins-good/blob/master/tests/check/elements/id3demux.c
  // id3v2
  // sudo apt install kid3


const
  path = '/home/tux/Schreibtisch/sound/test2.mp3';

  procedure fail_unless(null: boolean; s: Pgchar);
  begin
    if not null then begin
      WriteLn('error: ', s);
      Halt;
    end;
  end;

  function error_cb(bus: PGstBus; message: PGstMessage; user_data: Tgpointer): TGstBusSyncReply; cdecl;
  var
    dbg, file_: Pgchar;
    err: PGError;
  begin
    if GST_MESSAGE_TYPE(message) = GST_MESSAGE_ERROR then begin
      file_ := Pgchar(user_data);
      gst_message_parse_error(message, @err, @dbg);
      gst_print('ERROR for %s: %s\n%s'#10, file_, err^.message, dbg);
    end;
    Result := GST_BUS_PASS;
  end;

  procedure printtag(list: PGstTagList; tag: Pgchar; user_data: Tgpointer); cdecl;
  var
    tag_value: Pgchar;
  begin
//    gst_tag_list_get_string(list, tag, @tag_value);
//    WriteLn(tag, ': ', tag_value);

  end;

  function read_tags_from_file(file_: Pgchar; push_mode: Tgboolean): PGstTagList;
  var
    pipeline, src, sep, id3demux, sink: PGstElement;
    bus: PGstBus;
    path_, Name, tag_value: Pgchar;
    state_ret: TGstStateChangeReturn;
    msg: PGstMessage;
    tags: PGstTagList;
    Count: Tgint;
    i: integer;
    valueType: PGValue;
  begin
    pipeline := gst_pipeline_new('pipeline');
    fail_unless(pipeline <> nil, 'Failed to create pipeline!');

    bus := gst_element_get_bus(pipeline);

    gst_bus_set_sync_handler(bus, @error_cb, Tgpointer(file_), nil);

    src := gst_element_factory_make('filesrc', 'filesrc');
    fail_unless(src <> nil, 'Failed to create filesrc');

    if push_mode then begin
      sep := gst_element_factory_make('queue', 'queue');
      fail_unless(sep <> nil, 'Failed to create queue');
    end else begin
      sep := gst_element_factory_make('identity', 'identity');
      fail_unless(sep <> nil, 'Failed to create identity');
    end;

    id3demux := gst_element_factory_make('id3demux', 'id3demux');
    fail_unless(sep <> nil, 'Failed to create id3demux');

    sink := gst_element_factory_make('fakesink', 'fakesink');
    fail_unless(sep <> nil, 'Failed to create fakesink');

    gst_bin_add_many(GST_BIN(pipeline), src, sep, id3demux, sink, nil);
    fail_unless(gst_element_link(src, sep), 'src-sep');
    fail_unless(gst_element_link(sep, id3demux), 'sep-id3demux');
    fail_unless(gst_element_link(id3demux, sink), 'id3demux-sink');

    path_ := g_build_filename(file_, nil);

    WriteLn('reading file ', path_);
    g_object_set(src, 'location', path_, nil);

    state_ret := gst_element_set_state(pipeline, GST_STATE_PAUSED);
    fail_unless(state_ret <> GST_STATE_CHANGE_FAILURE, 'state_ret error');

    if state_ret = GST_STATE_CHANGE_ASYNC then begin
      WriteLn('waiting for pipeline to reach PAUSED state');
      state_ret := gst_element_get_state(pipeline, nil, nil, -1);
    end;

    WriteLn('PAUSED, let''s retrieve our tags');

    msg := gst_bus_poll(bus, GST_MESSAGE_TAG, -1);
    fail_unless(msg <> nil, 'Tag Message');

    gst_message_parse_tag(msg, @tags);
    fail_unless(tags <> nil, 'Tags');

    gst_message_unref(msg);
    gst_object_unref(bus);

    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);
    g_free(path_);

    gst_print('%s: tags = %+' + GST_PTR_FORMAT, file_, tags);

    gst_tag_list_foreach(tags, @printtag, nil);
    //    WriteLn(gst_tag_list_get_boolean(tags, 'artist', nil));

    Count := gst_tag_list_n_tags(tags);
    WriteLn('Count: ', Count);
    for i := 0 to Count - 1 do begin
      Name := gst_tag_list_nth_tag_name(tags, i);
//      valueType := gst_tag_list_get_value_index(tags, Name, 0);
      valueType := gst_tag_list_get_value_index(tags, Name, 0);
      Write('name: ', Name, 'Typ: ', valueType^.g_type, '    ');
      if valueType^.g_type = G_TYPE_STRING then begin
        gst_tag_list_get_string(tags, name, @tag_value);
        WriteLn(tag_value);
      end else begin
        WriteLn();
      end;

    end;

    //    WriteLn(gst_tag_list_to_string(tags));

    Result := tags;
    WriteLn(#10);
  end;

  procedure main;
  var
    pipeline: PGstElement = nil;
    volume, equalizer, demux: PGstElement;

    quit: boolean = False;
    vol: Tgdouble = 0.5;
    mute: Tgboolean = False;
    equ: array [0..2] of Tgdouble = (0.0, 0.0, 0.0);
    ch: ansichar;
  begin
    gst_init(@argc, @argv);

    read_tags_from_file(path, True);
    read_tags_from_file(path, False);

    pipeline := gst_parse_launch(PChar('filesrc location="' + path + '" ! id3demux name=demux ! decodebin ! audioconvert ! audioresample ! equalizer-3bands name=equ ! volume name=vol ! autoaudiosink'), nil);

    volume := gst_bin_get_by_interface(GST_BIN(pipeline), gst_stream_volume_get_type());

    // volume := gst_bin_get_by_name(GST_BIN(pipeline), 'vol');
    if volume = nil then begin
      WriteLn('Volume Error');
    end;

    equalizer := gst_bin_get_by_name(GST_BIN(pipeline), 'equ');
    if equalizer = nil then begin
      WriteLn('Equalizer Error');
    end;

    demux := gst_bin_get_by_name(GST_BIN(pipeline), 'demux');
    if demux = nil then begin
      WriteLn('Demux Error');
    end;

    GObjectShowProperty(demux);


    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    repeat
      g_object_set(volume, 'volume', vol, 'mute', mute, nil);
      g_object_set(equalizer, 'band0', equ[0], 'band1', equ[1], 'band2', equ[2], nil);
      if KeyPressed then begin
        ch := ReadKey;
        case ch of
          #27: begin
            quit := True;
          end;
          #32: begin
            mute := not mute;
            WriteLn('Mute: ', mute);
          end;
          '+': begin
            vol += 0.1;
            if vol >= 1.0 then begin
              vol := 1.0;
            end;
            WriteLn('volume: ', vol: 4: 2);
          end;
          '-': begin
            vol -= 0.1;
            if vol <= 0.0 then begin
              vol := 0.0;
            end;
            WriteLn('volume: ', vol: 4: 2);
          end;
          't': begin
            equ[2] -= 1.0;
            if equ[2] <= -24.0 then begin
              equ[2] := -24.0;
            end;
            WriteLn('Treble: ', equ[2]: 4: 2);
          end;
          'T': begin
            equ[2] += 1.0;
            if equ[2] >= 12.0 then begin
              equ[2] := 12.0;
            end;
            WriteLn('Treble: ', equ[2]: 4: 2);
          end;
          'm': begin
            equ[1] -= 1.0;
            if equ[1] <= -24.0 then begin
              equ[1] := -24.0;
            end;
            WriteLn('Middle: ', equ[1]: 4: 2);
          end;
          'M': begin
            equ[1] += 1.0;
            if equ[1] >= 12.0 then begin
              equ[1] := 12.0;
            end;
            WriteLn('Middle: ', equ[1]: 4: 2);
          end;
          'b': begin
            equ[0] -= 1.0;
            if equ[0] <= -24.0 then begin
              equ[0] := -24.0;
            end;
            WriteLn('Bass: ', equ[0]: 4: 2);
          end;
          'B': begin
            equ[0] += 1.0;
            if equ[0] >= 12.0 then begin
              equ[0] := 12.0;
            end;
            WriteLn('Bass: ', equ[0]: 4: 2);
          end;

        end;
      end;
    until quit;

    gst_object_unref(pipeline);
  end;

begin
  main;
end.

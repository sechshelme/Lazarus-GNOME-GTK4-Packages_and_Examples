program playmp3;
{$mode objfpc}
{$h+}

uses
  crt,
  SysUtils,
  glib280,
  GLIBTools,
  gst124,
  gstTools,
  gst124_tag,
  gst124_audio;


  // https://github.com/GStreamer/gst-plugins-good/blob/master/tests/check/elements/id3demux.c


const
  src_path = '/home/tux/Schreibtisch/sound/test.mp3';
  des_path = '/home/tux/Schreibtisch/sound/test2.mp3';

type
  TTagInfo = record
    ready: boolean;
    duration: int64;
    title,
    artist,
    album: string;
  end;
  PTagInfo = ^TTagInfo;

  // ==== Write Tag

  procedure SetTag(src_path, dest_path: pchar);
  var
    pipeline, demux, mux, filesrc, filesink: PGstElement;
    pad: PGstPad;
    tags: PGstTagList;
    bus: PGstBus;
    msg: PGstMessage;
  begin
    pipeline := gst_pipeline_new('tag_pipeline');

    filesrc := gst_element_factory_make('filesrc', 'src');
    demux := gst_element_factory_make('id3demux', 'demux');
    filesink := gst_element_factory_make('filesink', 'sink');
    mux := gst_element_factory_make('id3mux', 'mux');

    g_object_set(G_OBJECT(filesrc), 'location', src_path, nil);
    g_object_set(G_OBJECT(filesink), 'location', des_path, nil);

    gst_bin_add_many(GST_BIN(pipeline), filesrc, demux, mux, filesink, nil);
    gst_element_link(filesrc, demux);
    gst_element_link(mux, filesink);

    pad := gst_element_get_static_pad(demux, 'src');
    gst_pad_link(pad, gst_element_get_static_pad(mux, 'sink'));
    g_object_unref(pad);

    tags := gst_tag_list_new_empty;
    gst_tag_list_add(tags, GST_TAG_MERGE_REPLACE,
      GST_TAG_TITLE, 'Mein Titel 1234',
      GST_TAG_ARTIST, 'Mein Artist 1234',
      GST_TAG_ALBUM, 'Mein Album',
      nil);
    //    tags:=gst_tag_list_new_from_string('taglist, title=(string)"Taglisttitle1234", album=(string)"blublu";');


    gst_tag_setter_merge_tags(GST_TAG_SETTER(mux), tags, GST_TAG_MERGE_APPEND);
    gst_tag_list_unref(tags);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    bus := gst_element_get_bus(pipeline);
    msg := gst_bus_timed_pop_filtered(bus, GST_CLOCK_TIME_NONE, GST_MESSAGE_ERROR or GST_MESSAGE_EOS);

    if msg <> nil then begin
      gst_message_unref(msg);
    end;

    gst_element_set_state(pipeline, GST_STATE_NULL);

    gst_object_unref(pipeline);
  end;


  // ==== Read Tag

  procedure tag_message_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer); cdecl;
  var
    tags: PGstTagList;
    Count: Tgint;
    i: integer;
    Name, tag_value, Value: Pgchar;
    valueType: PGValue;
    TagInfo: PTagInfo absolute Data;
  begin
    gst_message_parse_tag(msg, @tags);
    if tags <> nil then begin
      WriteLn('Tags io.');
    end;

    TagInfo^.ready := True;

    WriteLn('Tag List: ', gst_tag_list_to_string(tags));

    Count := gst_tag_list_n_tags(tags);
    WriteLn('Count: ', Count);
    for i := 0 to Count - 1 do begin
      Name := gst_tag_list_nth_tag_name(tags, i);
      valueType := gst_tag_list_get_value_index(tags, Name, 0);
      Write('name: ', Name, 'Typ: ', valueType^.g_type, '    ');
      if valueType^.g_type = G_TYPE_STRING then begin
        gst_tag_list_get_string(tags, Name, @tag_value);
        WriteLn(tag_value);
      end else begin
        WriteLn();
      end;
    end;

    gst_tag_list_unref(tags);

    gst_tag_list_get_string(tags, 'album', @Value);
    TagInfo^.album := Value;

    WriteLn(#10);
  end;


  function GetTagAndDuration(const path: string): TTagInfo;
  var
    pipeline: PGstElement;
    bus: PGstBus;
    duration: int64;
  begin
    Result.ready := False;

    pipeline := gst_parse_launch(PChar('filesrc location="' + path + '" ! queue ! id3demux name=demux ! decodebin ! audioconvert ! audioresample ! fakesink'), nil);

    bus := gst_element_get_bus(pipeline);
    if bus = nil then begin
      WriteLn('bus error');
    end;
    gst_bus_add_signal_watch(bus);

    g_signal_connect(G_OBJECT(bus), 'message::tag', TGCallback(@tag_message_cb), @Result);
    gst_object_unref(bus);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);
    duration := 0;
    repeat
      gst_element_query_duration(pipeline, GST_FORMAT_TIME, @duration);
    until duration > 0;

    duration := duration div G_USEC_PER_SEC;
    WriteLn('duration: 0', GstClockToStr(duration));
    Result.duration := duration;

    repeat
      g_main_iteration(False);
    until Result.ready;

    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);
  end;

  // ===========================================

  procedure main;
  var
    pipeline: PGstElement = nil;
    volume, demux: PGstElement;

    quit: boolean = False;
    vol: Tgdouble = 0.5;
    mute: Tgboolean = False;
    ch: ansichar;
    bus: PGstBus;
    taglist: TTagInfo;
  begin
    gst_init(@argc, @argv);

    SetTag(src_path, des_path);

    taglist := GetTagAndDuration(des_path);
    WriteLn('=======================');
    WriteLn('Album: ', taglist.album);
    WriteLn('Dauer: ', GstClockToStr(taglist.duration));
    WriteLn('=======================');


    pipeline := gst_parse_launch(PChar('filesrc location="' + src_path + '" ! queue ! id3demux name=demux ! decodebin ! audioconvert ! audioresample ! volume name=vol ! autoaudiosink'), nil);

    volume := gst_bin_get_by_interface(GST_BIN(pipeline), gst_stream_volume_get_type());
    // volume := gst_bin_get_by_name(GST_BIN(pipeline), 'vol');
    if volume = nil then begin
      WriteLn('Volume Error');
    end;

    demux := gst_bin_get_by_name(GST_BIN(pipeline), 'demux');
    if demux = nil then begin
      WriteLn('Demux Error');
    end;
    GObjectShowProperty(demux);

    bus := gst_element_get_bus(pipeline);
    if bus = nil then begin
      WriteLn('bus error');
    end;
    gst_bus_add_signal_watch(bus);
    gst_object_unref(bus);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    repeat
      g_main_iteration(False);
      g_object_set(volume, 'volume', vol, 'mute', mute, nil);
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
        end;
      end;
    until quit;

    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);
  end;

begin
  main;
end.
